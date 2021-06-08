----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:08:17 11/12/2020 
-- Design Name: 
-- Module Name:    da1_interface_v2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity da1_interface is
    Port ( clk_i : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
           miso_i : in  STD_LOGIC;
			  voltage_i : in STD_LOGIC_VECTOR(15 downto 0);
           mosi_o : out  STD_LOGIC;
           sclk_o : out  STD_LOGIC;
           ncs_o : out  STD_LOGIC;
			  nldac_o : out STD_LOGIC);
			  
end da1_interface;

architecture Behavioral of da1_interface is

type iterface_state is (IDLE, INIT_CMD_SETUP, INIT_VOLTAGE, CMD_VOLTAGE, NLDAC_ACTIVE, READY);

	COMPONENT spi_master_v1
	Generic ( 
		  width : integer range 0 to 64 := 24; -- data width
		  cpha : STD_LOGIC := '1';  -- 1st or 2nd clk edge MISO reading
		  cpol : STD_LOGIC := '1'); -- low or high default CLOCK level
				  
	PORT(
		clk_i : IN std_logic;
		clk_en_i : IN std_logic;
		reset_i : IN std_logic;
		data_i : IN std_logic_vector(23 downto 0);
		miso_i : IN std_logic;          
		mosi_o : OUT std_logic;
		sclk_o : OUT std_logic;
		ncs_o : OUT std_logic;
		data_o : OUT std_logic_vector(23 downto 0);
		rdy_o : OUT std_logic
		);
	END COMPONENT;

-- Init: 0-5V range, 0 default value, set no overrange
constant conSetupControl : std_logic_vector(23 downto 0) := X"040023";
constant conSetToZero : std_logic_vector(23 downto 0) := X"030000";

--constant conFullReset : std_logic_vector(23 downto 0) := X"0F0000";
--constant conSetToMax : std_logic_vector(23 downto 0) := X"03FFFF";
--constant conSetXXXX : std_logic_vector(23 downto 0) := X"030000";
--constant conDataReset : std_logic_vector(23 downto 0) := X"070000";

signal sigIFstate : iterface_state := IDLE;
signal sigTransactionDone : std_logic := '0';
signal sigCmd : std_logic_vector(23 downto 0) := (others => '0');
signal sigPrevVoltage : std_logic_vector(15 downto 0) := (others => '0');
signal sigInitialCondition : std_logic := '1';
signal sigRrdy : std_logic := '0';
signal sigWRrdy_q : std_logic := '0';
signal sigWRrdy_d : std_logic := '0';
signal sigRst_q : std_logic := '0';
signal sigRst_d : std_logic := '0';
signal sigNLDAC : std_logic := '1';
begin

	Inst_spi_master_v1_2: spi_master_v1
		GENERIC MAP(
		width => 24,
		cpha => '1',
		cpol => '1'
		)
		PORT MAP(
		clk_i => clk_i,
		clk_en_i => sigWRrdy_q,
		reset_i => sigRst_q,
		data_i => sigCmd,
		miso_i => miso_i,
		mosi_o => mosi_o,
		sclk_o => sclk_o,
		ncs_o => ncs_o,
		data_o => open,
		rdy_o => sigRrdy
	);
	
	command_selector : process(clk_i, reset_i)
	begin
		 if reset_i = '1' then
			sigCmd <= (others => '0');
			sigPrevVoltage <= (others => '0');
			sigIFstate <= IDLE;
			sigNLDAC <= '1';
	    elsif rising_edge(clk_i) and sigTransactionDone = '1' then
		     case sigIFstate is
			      when IDLE =>
						 sigCmd <= conSetupControl;
						 sigIFstate <= INIT_CMD_SETUP;
			      when INIT_CMD_SETUP =>
					    sigCmd <= conSetToZero;
						 sigIFstate <= INIT_VOLTAGE;
					when INIT_VOLTAGE =>
					   sigCmd <= std_logic_vector(unsigned(conSetToZero) + X"1FFF");
						sigIFstate <= NLDAC_ACTIVE;
			      when CMD_VOLTAGE =>
					    sigCmd <= std_logic_vector(unsigned(conSetToZero) + unsigned(voltage_i));
				       sigIFstate <= NLDAC_ACTIVE;
					when NLDAC_ACTIVE =>
					    sigIFstate <= READY;
						 sigNLDAC <= '0';
			      when READY =>
						  -- safety feature to do not exceed to X"9999", the 3V at 5V AD5761 range
				        if voltage_i /= sigPrevVoltage and unsigned(voltage_i) < X"9999" then
					         sigPrevVoltage <= voltage_i;
								sigIFstate <= CMD_VOLTAGE;
				        end if;
						  sigNLDAC <= '1';
					when others =>
					     sigIFstate <= sigIFstate;
			  end case;
		 end if;
	end process;

	spi_control : process(clk_i, reset_i)
	begin
		if reset_i = '1' then
			sigTransactionDone <= '0';
			sigWRrdy_d <= '0';
			sigRst_d <= '0';
			sigInitialCondition <= '1';
		elsif rising_edge(clk_i) then
			-- reseting the device
			if sigIFstate = READY then
				if sigPrevVoltage /= voltage_i then
					sigTransactionDone <= '1';
				end if;
			elsif sigRrdy = '1' or sigInitialCondition = '1' then
				sigRst_d <= '1';
				sigTransactionDone <= '1';
				sigInitialCondition <= '0';
			-- initiating the transmission
			elsif sigRst_q = '1' then
				sigRst_d <= '0';
				sigWRrdy_d <= '1';
				sigTransactionDone <= '0';
			end if;
		end if;
		sigWRrdy_q <= sigWRrdy_d;	
		sigRst_q <= sigRst_d;
	end process;
	
	nldac_o <= sigNLDAC;

end Behavioral;

