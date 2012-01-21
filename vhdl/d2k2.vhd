----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:32:38 01/21/2012 
-- Design Name: 
-- Module Name:    d2k2 - Behavioral 
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

entity d2k2 is
    Port ( clk : in STD_LOGIC;
           adr : out  STD_LOGIC_VECTOR (1 downto 0);
           data : out  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC;
           incr : in  STD_LOGIC;
           mode : in  STD_LOGIC;
           alarm : out  STD_LOGIC);
end d2k2;

architecture Behavioral of d2k2 is

begin


end Behavioral;

