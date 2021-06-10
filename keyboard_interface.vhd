----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:25:37 10/25/2020 
-- Design Name: 
-- Module Name:    keyboard_interface - Behavioral 
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

entity keyboard_interface is
    Port ( clk_i : in  STD_LOGIC;
           clk_lfc_i : in  STD_LOGIC;
			  clk_22kHz : in STD_LOGIC;
			  clk_10Hz : in STD_LOGIC;
           btn_0_i : in  STD_LOGIC;
           btn_1_i : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
           num_0_o : out  STD_LOGIC_VECTOR (24 downto 0);
           num_1_o : out  STD_LOGIC_VECTOR (15 downto 0);
           state_o : out  STD_LOGIC_VECTOR (1 downto 0));
end keyboard_interface;

architecture Behavioral of keyboard_interface is

	COMPONENT button_interface
	PORT(
		clk_i : IN std_logic;
		clk_en_i : IN std_logic;
		btn0_i : IN std_logic;
		btn1_i : IN std_logic;
		reset_i : IN std_logic;          
		sig0_o : OUT std_logic;
		sig1_o : OUT std_logic
		);
	END COMPONENT;
	
	
type adjust_type is (NONE, NUM_0, NUM_1, ADCDAC);
signal sigSelectedMode : adjust_type := ADCDAC;

signal sigBtn_0_BeingPressed : std_logic := '0';
signal sigBtn_1_BeingPressed : std_logic := '0';

signal sigModeIsBeingSet : std_logic := '0';

signal sigBtn_0_dbc : std_logic := '0';
signal sigBtn_1_dbc : std_logic := '0';

signal sigPrevCLK_LFC : std_logic := '0';


-- default phase increment equal to 21.10MHz when 120MHz clock and 25 phase (3.57Hz/LSB)
signal sigNum_0 : std_logic_vector(24 downto 0) := "0010110100000011010110101";
signal sigNum_1 : std_logic_vector(15 downto 0) := X"1FFF";

signal sigChangeStCnt : std_logic_vector(3 downto 0) := (others => '0');

signal sigState : std_logic_vector(1 downto 0) := "11";

begin
	
	counter_LFC : process(clk_i)
	begin
		if rising_edge(clk_i) then
			if sigBtn_0_dbc = '1' and sigBtn_1_dbc = '1' and clk_10Hz = '1' and sigModeIsBeingSet = '0' then	
				case sigSelectedMode is		
					when  NONE =>
						if sigChangeStCnt = X"A" then
							sigChangeStCnt <= X"0";
							sigSelectedMode <= NUM_0;
							sigState <= "01";
							sigModeIsBeingSet <= '1';
						else
							sigChangeStCnt <= std_logic_vector(unsigned(sigChangeStCnt) + 1);
						end if;
					when NUM_0 =>
						if sigChangeStCnt = X"A" then
							sigChangeStCnt <= X"0";
							sigSelectedMode <= NUM_1;	
							sigState <= "10";
							sigModeIsBeingSet <= '1';
						else
							sigChangeStCnt <= std_logic_vector(unsigned(sigChangeStCnt) + 1);
						end if;
					when NUM_1 =>
						if sigChangeStCnt = X"A" then
							sigChangeStCnt <= X"0";
							sigSelectedMode <= NONE;
							sigState <= "11";
							sigModeIsBeingSet <= '1';
						else
							sigChangeStCnt <= std_logic_vector(unsigned(sigChangeStCnt) + 1);
						end if;
--					when ADCDAC =>
--						if sigChangeStCnt = X"A" then
--							sigChangeStCnt <= X"0";
--							sigSelectedMode <= NONE;
--							sigState <= "00";
--							sigModeIsBeingSet <= '1';
--						else
--							sigChangeStCnt <= std_logic_vector(unsigned(sigChangeStCnt) + 1);
--						end if;
					when others =>
						sigChangeStCnt <= X"0";
						sigSelectedMode <= NONE;
						sigState <= "00";				
				end case;
	
			elsif sigBtn_0_dbc = '1' and sigBtn_0_BeingPressed = '0' then
				if sigSelectedMode = NUM_0 then
					sigNum_0 <= std_logic_vector(unsigned(sigNum_0) + 13966);
				elsif sigSelectedMode = NUM_1 then
					sigNum_1 <= std_logic_vector(unsigned(sigNum_1) + 327);
				else
					sigNum_0 <= sigNum_0;
					sigNum_1 <= sigNum_1;
				end if;
				sigBtn_0_BeingPressed <= '1';
			elsif sigBtn_1_dbc = '1' and sigBtn_1_BeingPressed = '0' then
				if sigSelectedMode = NUM_0 then
					sigNum_0 <= std_logic_vector(unsigned(sigNum_0) - 13966);
				elsif sigSelectedMode = NUM_1 then
					sigNum_1 <= std_logic_vector(unsigned(sigNum_1) - 327);
				else
					sigNum_0 <= sigNum_0;
					sigNum_1 <= sigNum_1;
				end if;
				sigBtn_1_BeingPressed <= '1';
			elsif sigBtn_0_dbc = '0' and sigBtn_1_dbc = '0' then
				sigBtn_0_BeingPressed <= '0';
				sigBtn_1_BeingPressed <= '0';
				sigModeIsBeingSet <= '0';
				sigChangeStCnt <= X"0";
			else
				sigNum_0 <= sigNum_0;
				sigNum_1 <= sigNum_1;
			end if;
		end if;
		num_0_o <= sigNum_0;
		num_1_o <= sigNum_1;
		state_o <= sigState;
		
		
	end process;
	
	Inst_button_interface: button_interface PORT MAP(
		clk_i => clk_i,
		clk_en_i => clk_22kHz,
		btn0_i => btn_0_i,
		btn1_i => btn_1_i,
		reset_i => '0',
		sig0_o => sigBtn_0_dbc,
		sig1_o => sigBtn_1_dbc 
	);
	
end Behavioral;

