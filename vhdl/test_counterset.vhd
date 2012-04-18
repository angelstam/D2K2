--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:39:41 03/14/2012
-- Design Name:   
-- Module Name:   /home/angelstam/courses/D2K2/vhdl/test_counterset.vhd
-- Project Name:  D2K2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counterset
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
 
ENTITY test_counterset IS
END test_counterset;
 
ARCHITECTURE behavior OF test_counterset IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counterset
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         step : IN  std_logic;
         hour_h : INOUT  std_logic_vector(3 downto 0);
         hour_l : INOUT  std_logic_vector(3 downto 0);
         min_h : INOUT  std_logic_vector(3 downto 0);
         min_l : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal step : std_logic := '0';

	--BiDirs
   signal hour_h : std_logic_vector(3 downto 0);
   signal hour_l : std_logic_vector(3 downto 0);
   signal min_h : std_logic_vector(3 downto 0);
   signal min_l : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counterset PORT MAP (
          clk => clk,
          reset => reset,
          step => '1', --step,
          hour_h => hour_h,
          hour_l => hour_l,
          min_h => min_h,
          min_l => min_l
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;

   -- Clock process definitions
   step_process :process
   begin
		step <= '1';
		wait for clk_period*5;
		step <= '1';
		wait for clk_period*5;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*1000;

      -- insert stimulus here 

      wait;
   end process;

END;
