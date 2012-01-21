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
--     ML13 L14 N14 M14 U18 T18 T17  . g-a pinout
	segmask <=  "11000000" when data ="0000" else
                "11111001" when data ="0001" else
                "10100100" when data ="0010" else
                "10110000" when data ="0011" else
                "10011001" when data ="0100" else
                "10010010" when data ="0101" else
                "10000010" when data ="0110" else
                "11111000" when data ="0111" else
                "10000000" when data ="1000" else
                "10011000" when data ="1001" else
                "00000110";
                
 -- N16 N15 P18 P17 ->  (("00". hour_h) ("01". hour_l) 
 --                      ("10" . min_h) ("11" . min_l))				  
	colmask <=  "0001" when adr ="00" else
                "0010" when adr ="01" else
                "0100" when adr ="10" else
                "1000" when adr ="11" else
                "1111";
					

end Behavioral;

