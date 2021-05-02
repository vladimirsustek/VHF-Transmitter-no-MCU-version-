----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:01:04 10/11/2020 
-- Design Name: 
-- Module Name:    button_interface - Behavioral 
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

entity button_interface is
    Port ( clk_i : in  STD_LOGIC;
           clk_en_i : in  STD_LOGIC;
           btn0_i : in  STD_LOGIC;
           btn1_i : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
           sig0_o : out  STD_LOGIC;
           sig1_o : out  STD_LOGIC);
end button_interface;

architecture Behavioral of button_interface is

	COMPONENT btn_debounc
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		clk_en_i : IN std_logic;
		btn_i : IN std_logic;          
		sig_o : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT btn_pulser
	PORT(
		clk_i : IN std_logic;
		clk_en_i : IN std_logic;
		btn_dbc_i : IN std_logic;
		btn_pulse_i : IN std_logic;
		reset_i : IN std_logic;          
		btn_o : OUT std_logic
		);
	END COMPONENT;

begin

		Inst_btn_debounc0: btn_debounc PORT MAP(
		clk_i => clk_i,
		reset_i => reset_i,
		clk_en_i => clk_en_i,
		btn_i => btn0_i,
		sig_o => sig0_o
	);
	
		Inst_btn_debounc1: btn_debounc PORT MAP(
		clk_i => clk_i,
		reset_i => reset_i,
		clk_en_i => clk_en_i,
		btn_i => btn1_i,
		sig_o => sig1_o
	);
	

end Behavioral;

