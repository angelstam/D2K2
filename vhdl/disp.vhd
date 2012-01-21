----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:46 01/21/2012 
-- Design Name: 
-- Module Name:    disp - Behavioral 
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

entity disp is
    Port ( adr : in  STD_LOGIC_VECTOR (1 downto 0);
           data : in  STD_LOGIC_VECTOR (3 downto 0);
           colmask : out  STD_LOGIC_VECTOR (3 downto 0);
           segmask : out  STD_LOGIC_VECTOR (7 downto 0));
end disp;

architecture Behavioral of disp is

begin


end Behavioral;

