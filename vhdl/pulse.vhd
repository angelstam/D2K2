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
signal delayed_input : STD_LOGIC;
begin
	output <= input and not delayed_input;
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				delayed_input <=  '0';
			else
				delayed_input <= input;
			end if;
		end if;
	end process;
end Behavioral;

