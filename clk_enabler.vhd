----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:30 10/11/2020 
-- Design Name: 
-- Module Name:    clk_enabler - Behavioral 
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

entity clk_enabler is
    Port ( clk_i : in  STD_LOGIC;
	        hf_clk_i : STD_LOGIC;
           reset_i : in  STD_LOGIC;
		     clk_en_10Hz_o : out  STD_LOGIC;
		     clk_en_230400Hz_o : out  STD_LOGIC;
           clk_en_22kHz_o : out  STD_LOGIC);
end clk_enabler;

architecture Behavioral of clk_enabler is

constant const4MHz_to_22kHz_div : integer := 131;
constant const120MHz_to_230_400kHz_div : integer := 520;
constant const4MHz_to_10Hz_div : integer := 399999;

signal sig230400Hz : STD_LOGIC := '0';
signal sig22kHz : STD_LOGIC := '0';
signal sig10Hz : STD_LOGIC := '0';

begin
	 
	en22KHz : process(clk_i, reset_i)
	
	variable sigCnt22kHz : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
	
	begin
		if falling_edge(clk_i) then
			if reset_i = '1' then
				sig22kHz <= '0';
				sigCnt22kHz := (others => '0');	
			elsif unsigned(sigCnt22kHz) = const4MHz_to_22kHz_div then
				sig22kHz <= '1';
				sigCnt22kHz := (others => '0');
			else
				sig22kHz <= '0';
				sigCnt22kHz := std_logic_vector(unsigned(sigCnt22kHz) + 1);
			end if;
		end if;
		clk_en_22kHz_o <= sig22kHz;
	end process;
	
	en10Hz : process(clk_i, reset_i)
	
	variable sigCnt10Hz : STD_LOGIC_VECTOR(20 downto 0) := (others => '0');

	begin
		if falling_edge(clk_i) then
			if reset_i = '1' then
				sig10Hz <= '0';
				sigCnt10Hz := (others => '0');			
			elsif unsigned(sigCnt10Hz) = const4MHz_to_10Hz_div then
				sig10Hz <= '1';
				sigCnt10Hz := (others => '0');
			else	
				sig10Hz <= '0';
				sigCnt10Hz := std_logic_vector(unsigned(sigCnt10Hz) + 1);
			end if;
		end if;
		clk_en_10Hz_o <= sig10Hz;
	end process;	
	
	en230400Hz : process(hf_clk_i, reset_i)
	
	variable sigCnt230400Hz : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
	
	begin
		if falling_edge(hf_clk_i) then
			if reset_i = '1' then
				sig230400Hz <= '0';
				sigCnt230400Hz := (others => '0');			
			elsif unsigned(sigCnt230400Hz) = const120MHz_to_230_400kHz_div then
				sig230400Hz <= '1';
				sigCnt230400Hz := (others => '0');
			else	
				sig230400Hz <= '0';
				sigCnt230400Hz := std_logic_vector(unsigned(sigCnt230400Hz) + 1);
			end if;
		end if;
		clk_en_230400Hz_o <= sig230400Hz;
	end process;	
	
end Behavioral;

