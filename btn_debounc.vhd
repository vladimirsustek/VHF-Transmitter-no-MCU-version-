----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:23 10/04/2020 
-- Design Name: 
-- Module Name:    btn_debounc - Behavioral 
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

entity btn_debounc is
    Port ( clk_i : in  STD_LOGIC;
			  reset_i : in STD_LOGIC;
           clk_en_i : in  STD_LOGIC;
           btn_i : in  STD_LOGIC;
           sig_o : out  STD_LOGIC);
end btn_debounc;

architecture Behavioral of btn_debounc is

signal sigDebouncCNT_q : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
signal sigDebouncCNT_d : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');

signal sigForceZero_d : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal sigForceZero_q : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

signal sigOutput : STD_LOGIC := '0';

signal sigElse : STD_LOGIC := '0';
begin
	
	debounc : process(clk_i, btn_i, reset_i)
	begin
		if rising_edge(clk_i) and clk_en_i = '1' then
			if btn_i = '1' then
				if unsigned(sigDebouncCNT_q) = 1500 then
					sigOutput <= '1';
					sigForceZero_d <= (others => '0');
				else
					sigDebouncCNT_d <= std_logic_vector(unsigned(sigDebouncCNT_q) + 1);
				end if;
			else
				if unsigned(sigDebouncCNT_d) > 0 and unsigned(sigForceZero_q) < 250 then
					sigForceZero_d <= std_logic_vector(unsigned(sigForceZero_q) + 1);
					sigDebouncCNT_d <= std_logic_vector(unsigned(sigDebouncCNT_q) - 1);	
				else
					sigDebouncCNT_d <= (others => '0');
					sigForceZero_d <= (others => '0');
					sigOutput <= '0';
				end if;		
			end if;
		end if;
		sigDebouncCNT_q <= sigDebouncCNT_d;
		sigForceZero_q <= sigForceZero_d;
		sig_o <= sigOutput;
	end process;

end Behavioral;

