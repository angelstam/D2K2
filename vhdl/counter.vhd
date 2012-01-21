----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:09 01/21/2012 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    Port ( clk : in  STD_LOGIC;
           in : in  STD_LOGIC;
           hour_h : out  STD_LOGIC_VECTOR (3 downto 0);
           hour_l : out  STD_LOGIC_VECTOR (3 downto 0);
           min_h : out  STD_LOGIC_VECTOR (3 downto 0);
           min_l : out  STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

begin


end Behavioral;

