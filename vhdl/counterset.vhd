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

entity counterset is

    Port ( clk : in  STD_LOGIC;
           reset : in STD_LOGIC;
           step : in  STD_LOGIC;
           hour_h : inout  STD_LOGIC_VECTOR (3 downto 0);
           hour_l : inout  STD_LOGIC_VECTOR (3 downto 0);
           min_h : inout  STD_LOGIC_VECTOR (3 downto 0);
           min_l : inout  STD_LOGIC_VECTOR (3 downto 0));
end counterset;

architecture Behavioral of counterset is
signal tick10m : STD_LOGIC := '0';
signal tick1hm : STD_LOGIC := '0';
signal tick10h : STD_LOGIC := '0';
signal tick1h : STD_LOGIC := '0';
signal hour_reset : STD_LOGIC := '0';
begin
    hourh : entity work.counter port map (  clk => clk,
                                            reset => hour_reset,
                                            step => tick10h,
                                            stop => "0011",
                                            overflow => tick10h,
                                            state => hour_l);

    hourm : entity work.counter port map (  clk => clk,
                                            reset => hour_reset,
                                            step => tick1h,
                                            stop => "1001",
                                            overflow => tick10h,
                                            state => hour_l);
   
    minh : entity work.counter port map (   clk => clk,
                                            reset => reset,
                                            step => tick10m,
                                            stop => "0101",
                                            overflow => tick1h,
                                            state => min_h);
        
    minm : entity work.counter port map (   clk => clk,
                                            reset => reset,
                                            step => step,
                                            stop => "1001",
                                            overflow => tick10m,
                                            state => min_l);
    
    process(clk)
    begin
    
        if rising_edge(clk) then
            if reset = '1' or ( hour_h = "XX1X" 
                                and hour_l = "XX11" 
                                and tick1h = '1') then
                hour_reset <= '1';
            else 
                hour_reset <= '0';
            end if;
            
        end if;
    end process;
    
end Behavioral;

