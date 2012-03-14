--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:40:10 03/14/2012
-- Design Name:   
-- Module Name:   /home/angelstam/courses/D2K2/vhdl/test_d2k2.vhd
-- Project Name:  D2K2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: d2k2
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
 
ENTITY test_d2k2 IS
END test_d2k2;
 
ARCHITECTURE behavior OF test_d2k2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT d2k2
    PORT(
         clk : IN  std_logic;
         adr : OUT  std_logic_vector(1 downto 0);
         data : OUT  std_logic_vector(3 downto 0);
         reset : IN  std_logic;
         incr : IN  std_logic;
         mode : IN  std_logic;
         alarm : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal incr : std_logic := '0';
   signal mode : std_logic := '0';

 	--Outputs
   signal adr : std_logic_vector(1 downto 0);
   signal data : std_logic_vector(3 downto 0);
   signal alarm : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: d2k2 PORT MAP (
          clk => clk,
          adr => adr,
          data => data,
          reset => reset,
          incr => incr,
          mode => mode,
          alarm => alarm
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
