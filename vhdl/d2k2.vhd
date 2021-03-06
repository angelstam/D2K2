
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity d2k2 is
	Port (
		clk : in STD_LOGIC;
		colmask : out  STD_LOGIC_VECTOR (3 downto 0);
		segmask : out  STD_LOGIC_VECTOR (7 downto 0);
		reset : in  STD_LOGIC;
		incr : in  STD_LOGIC;
		incr_hour : in STD_LOGIC;
		mode : in  STD_LOGIC;
		alarm : out  STD_LOGIC);
end d2k2;

architecture Behavioral of d2k2 is
constant MODE_ALARM : STD_LOGIC := '1';
constant MODE_TIME : STD_LOGIC := '0';
constant CLK_PRESCALER : STD_LOGIC_VECTOR := "11000011010011111";
constant CLK_PRESCALER_WIDTH : natural := 16;
constant MINUTE_PRESCALER : STD_LOGIC_VECTOR := "101100100001111011101000110001"; -- This is shorter than a minute for testing.
constant MINUTE_PRESCALER_WIDTH : natural := 29;

signal ms_ticker : STD_LOGIC;
signal minute_ticker : STD_LOGIC;

signal adr : STD_LOGIC_VECTOR (1 downto 0);
signal data : STD_LOGIC_VECTOR (3 downto 0);

signal time_reg : STD_LOGIC_VECTOR (15 downto 0);
signal alarm_reg : STD_LOGIC_VECTOR (15 downto 0);

signal time_step : STD_LOGIC;
signal alarm_step : STD_LOGIC;

signal time_hour_step : STD_LOGIC;
signal alarm_hour_step : STD_LOGIC;

signal time_pulse : STD_LOGIC;
signal alarm_pulse : STD_LOGIC;

signal time_hour_pulse : STD_LOGIC;
signal alarm_hour_pulse : STD_LOGIC;

signal counter_r : unsigned(17 downto 0) := "000000000000000000";

begin
	alarm_pulser : entity work.pulse
		port map (
			clk,
			reset,
			input => alarm_step,
			output => alarm_pulse);
																
	time_pulser : entity work.pulse
		port map (
			clk,
			reset,
			input => time_step,
			output => time_pulse);
	
	alarm_hour_pulser : entity work.pulse
		port map (
			clk,
			reset,
			input => alarm_hour_step,
			output => alarm_hour_pulse);
																
	time_hour_pulser : entity work.pulse
		port map (
			clk,
			reset,
			input => time_hour_step,
			output => time_hour_pulse);
															 
	time_counter : entity work.counterset
		port map (
			clk,
			reset,
			step => time_pulse,
			step_hour => time_hour_pulse,
			hour_h => time_reg(15 downto 12),
			hour_l => time_reg(11 downto 8),
			min_h => time_reg(7 downto 4),
			min_l => time_reg(3 downto 0));
	
	alarm_counter : entity work.counterset 
		port map (
			clk,
			reset,
			step => alarm_pulse,
			step_hour => alarm_hour_pulse,
			hour_h => alarm_reg(15 downto 12),
			hour_l => alarm_reg(11 downto 8),
			min_h => alarm_reg(7 downto 4),
			min_l => alarm_reg(3 downto 0));
	
	display : entity work.disp 
		port map (
			adr,
			data,
			colmask,
			segmask);
														
	clk_prescaler_counter : entity work.counter 
		generic map (width => CLK_PRESCALER_WIDTH)
		port map (
			clk,
			reset,
			step => '1',
			stop => CLK_PRESCALER,
			overflow => ms_ticker);
														
	minute_prescaler_counter : entity work.counter 
		generic map (width => MINUTE_PRESCALER_WIDTH)
		port map (
			clk,
			reset,
			step => '1',
			stop => MINUTE_PRESCALER,
			overflow => minute_ticker);
														
--	adr_counter : entity work.counter 
--		generic map (width => 1)
--		port map (
--			ms_ticker,
--			reset,
--			step => '1',
--			stop => "11",
--			state => adr);
	
	alarm <= '1' when time_reg = alarm_reg else '0';
	
	data <= 
		time_reg(15 downto 12) when (adr = "11" and mode = MODE_TIME) else
		time_reg(11 downto 8) when (adr = "10" and mode = MODE_TIME) else
		time_reg(7 downto 4) when (adr = "01" and mode = MODE_TIME) else
		time_reg(3 downto 0) when (adr = "00" and mode = MODE_TIME) else
		alarm_reg(15 downto 12) when (adr = "11" and mode = MODE_ALARM) else
		alarm_reg(11 downto 8) when (adr = "10" and mode = MODE_ALARM) else
		alarm_reg(7 downto 4) when (adr = "01" and mode = MODE_ALARM) else
		alarm_reg(3 downto 0) when (adr = "00" and mode = MODE_ALARM) else
        "0000";
	
	time_step <= 
		'1' when (minute_ticker = '1' or (incr = '1' and mode = MODE_TIME)) else
		'0';
	
	alarm_step <= 
		'1' when (incr = '1' and mode = MODE_ALARM) else
		'0';
	
	time_hour_step <=
		'1' when (incr_hour = '1' and mode = MODE_TIME) else
		'0';
	
	alarm_hour_step <=
		'1' when (incr_hour = '1' and mode = MODE_ALARM) else
		'0';
		
	-- adr counter
   process(clk) begin
     if rising_edge(clk) then 
       counter_r <= counter_r + 1;
		
		 case counter_r(17 downto 16) is
         when "00" => adr <= "00";
         when "01" => adr <= "01";
         when "10" => adr <= "10";
         when others => adr <= "11";
       end case;
     end if;
   end process;
end Behavioral;

