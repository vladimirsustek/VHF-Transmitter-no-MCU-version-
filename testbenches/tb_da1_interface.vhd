--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:26:59 06/08/2021
-- Design Name:   
-- Module Name:   C:/VHF-FM-Transmitter/testbenches/tb_da1_interface.vhd
-- Project Name:  VHF-FM-Transmitter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: da1_interface
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_da1_interface IS
END tb_da1_interface;
 
ARCHITECTURE behavior OF tb_da1_interface IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT da1_interface
    PORT(
         clk_i : IN  std_logic;
         reset_i : IN  std_logic;
         miso_i : IN  std_logic;
         voltage_i : IN  std_logic_vector(15 downto 0);
         mosi_o : OUT  std_logic;
         sclk_o : OUT  std_logic;
         ncs_o : OUT  std_logic;
         nldac_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal reset_i : std_logic := '0';
   signal miso_i : std_logic := '0';
   signal voltage_i : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal mosi_o : std_logic;
   signal sclk_o : std_logic;
   signal ncs_o : std_logic;
   signal nldac_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: da1_interface PORT MAP (
          clk_i => clk_i,
          reset_i => reset_i,
          miso_i => miso_i,
          voltage_i => voltage_i,
          mosi_o => mosi_o,
          sclk_o => sclk_o,
          ncs_o => ncs_o,
          nldac_o => nldac_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1500 ns;	
      reset_i <= '1';	
      wait for 10 ns;	
      reset_i <= '0';	
      wait for 1500 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
