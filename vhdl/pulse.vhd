----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:47 05/03/2012 
-- Design Name: 
-- Module Name:    pulse - Behavioral 
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

entity pulse is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input : in  STD_LOGIC;
           output : out  STD_LOGIC);
end pulse;

architecture Behavioral of pulse is
signal x : STD_LOGIC;
signal y : STD_LOGIC;
begin
	process(clk)
	begin
		if reset = '1' then
			x <=  '0';
			y <= '0';
		elsif rising_edge(clk) then
			x <= input;
			y <= x;
		end if;
	end process;
	
	output <= x and not y;
	
end Behavioral;

