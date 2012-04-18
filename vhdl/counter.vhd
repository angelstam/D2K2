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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    generic (width : natural := 3);
    Port ( clk : in  STD_LOGIC;
           reset : in STD_LOGIC;
           step : in  STD_LOGIC;
           stop : in STD_LOGIC_VECTOR(width downto 0);
           overflow : out STD_LOGIC;
           state : out STD_LOGIC_VECTOR(width downto 0));
end counter;

architecture Behavioral of counter is
   signal r : STD_LOGIC_VECTOR (width downto 0) := (others => '0');                
   signal f : STD_LOGIC := '0';
begin
    
  state <= r;
  overflow <= f;
  process(clk)
  begin
    
    if rising_edge(clk) then
        if reset = '1' then
            r <= (others => '0');
        else
            if step = '1' then	         
					if r < stop then
						 r <= STD_LOGIC_VECTOR(UNSIGNED(r) + 1);
					else
						 r <= (others => '0');
					end if;
				end if;
        end if;
    end if;
  end process;
  -- Overflow
  f <= '1' when (r = stop and step = '1') else '0';
    
end Behavioral;

