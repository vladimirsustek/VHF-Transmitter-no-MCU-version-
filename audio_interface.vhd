----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:41:53 06/10/2021 
-- Design Name: 
-- Module Name:    dual_audio_interface - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dual_audio_interface is
    Port ( clk_i : in  STD_LOGIC;
           clk_sampling_i : in  STD_LOGIC;
           reset_i : in  STD_LOGIC;
			  adc0_ncs_o : out std_logic;
			  adc0_sdi_o : in std_logic;
			  adc0_sclk_o : out std_logic;
			  adc1_ncs_o : out std_logic;
			  adc1_sdi_o : in std_logic;
			  adc1_sclk_o : out std_logic;
           sum_o : out  STD_LOGIC_VECTOR (12 downto 0);
           diff_o : out  STD_LOGIC_VECTOR (12 downto 0));
end dual_audio_interface;

architecture Behavioral of dual_audio_interface is
	COMPONENT adc_interface
	PORT(
		clk_i : IN std_logic;
		reset_i : IN std_logic;
		clk_en_i : IN std_logic;
		clk_lfc_i : IN std_logic;
		miso_i : IN std_logic;          
		mosi_o : OUT std_logic;
		sclk_o : OUT std_logic;
		ncs_o : OUT std_logic;
		voltage_o : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
begin


end Behavioral;

