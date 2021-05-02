----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:49 11/11/2020 
-- Design Name: 
-- Module Name:    spi_master_v1 - Behavioral 
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

entity spi_master_v1 is
    Generic ( width : integer range 0 to 64 := 8; -- data width
	           cpha : STD_LOGIC := '0';  -- 1st or 2nd clk edge MISO reading
				  cpol : STD_LOGIC := '0'); -- low or high default CLOCK level
				  
    Port ( clk_i : in  STD_LOGIC;
           clk_en_i : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
           data_i : in  STD_LOGIC_VECTOR (width - 1 downto 0);
           miso_i : in  STD_LOGIC;
           mosi_o : out  STD_LOGIC;
           sclk_o : out  STD_LOGIC;
           ncs_o : out  STD_LOGIC;
           data_o : out  STD_LOGIC_VECTOR (width - 1 downto 0);
           rdy_o : out  STD_LOGIC);
end spi_master_v1;

architecture Behavioral of spi_master_v1 is

type spiST_t is (IDLE, TRX_START, TRX, TRX_END, FINISHED);

signal sigFirstEdgeCnt : integer range 0 to width := 0;
signal sigSecondEdgeCnt : integer range 0 to width := 0;
signal sigSPIst : spiST_t := IDLE;

signal sigEdge : std_logic := '0';
signal sigSCLK : std_logic := cpol;

signal sigNCS : std_logic := '1';
signal sigMOSI : std_logic := '0';
signal sigRDY : std_logic := '0';

begin

	spi_process : process(clk_i, clk_en_i, sigSPIst, sigFirstEdgeCnt, sigSecondEdgeCnt)
	
	begin
	
		if reset_i = '1' then
		
			 sigFirstEdgeCnt <= 0;
			 sigSecondEdgeCnt <= 0;
			 sigSPIst <= IDLE;

			 sigEdge <= '0';
			 sigSCLK <= cpol;

			 sigNCS <= '1';
			 sigMOSI <= '0';
			 sigRDY <= '0';
			 
		elsif rising_edge(clk_i) and clk_en_i = '1' then
		
			 case sigSPIst is
			 
				 when IDLE =>
				 
				     sigNCS <= '1';
                 sigSCLK <= cpol;
                 sigMOSI <= '0';
					  sigSPIst <= TRX_START;
					  
				 when TRX_START =>
				 
				     sigNCS <= '0';
					  if cpha = '0' then
					      sigMOSI <= data_i(width - sigSecondEdgeCnt - 1);
							sigSecondEdgeCnt <= sigSecondEdgeCnt + 1;
					  end if;
					  sigSPIst <= TRX;
					  
				 when TRX =>		     
					  if sigEdge = cpha then
					  		if sigFirstEdgeCnt < width then
					          sigFirstEdgeCnt <= sigFirstEdgeCnt + 1;
								 sigSCLK <= not(cpha);
								 data_o(width - sigFirstEdgeCnt - 1) <= miso_i;
							end if;
					  else 
					  		if sigSecondEdgeCnt < width then
					          sigSecondEdgeCnt <= sigSecondEdgeCnt + 1;
								 sigSCLK <= cpha;
								 sigMOSI <= data_i(width - sigSecondEdgeCnt - 1);
					      end if;
				     end if;
					  
					  if sigFirstEdgeCnt = width and sigSecondEdgeCnt = width then
					      sigSPIst <= TRX_END;
							sigSCLK <= cpol;
							sigMOSI <= '0';
					  end if;		  
					  sigEdge <= not(sigEdge);
					  
				 when TRX_END =>
				     sigSPIst <= FINISHED;
					  sigNCS <= '1';
					  
				 when FINISHED =>
					 sigEdge <= '0';
					 sigSCLK <= cpol;

					 sigNCS <= '1';
					 sigMOSI <= '0';
					 sigRDY <= '1';
				 when OTHERS =>
				     sigSPIst <= FINISHED;
			 end case;
		end if;
	ncs_o <= sigNCS;
	mosi_o <= sigMOSI;
	rdy_o <= sigRDY;
	sclk_o <= sigSCLK;
	end process;

end Behavioral;

