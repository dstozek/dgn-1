--runningAverage.vhd

--The module calculates a weight running average of the incoming samples. The output is given as y(i) = [(l-1)*y(i-1) + w*x]/l;
--where l is (2^PERIOD_POWER) and w is an empirical constant equal to 1,3125
--The application of w to scale the input gives results closer to the reference RMS value while not overly complicating the calculation.
--See the documentation for simulation results confirming this fact.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity runningAverage is
	generic (
		PERIOD_POWER: integer range 0 to 32 := 11 --2048 samples by default. This parameter can be understood as the inertia of the average - the longer the period, the slower the reaction of the module on the changes of input.
	);
	port(
		clk: in std_logic;
		lrclk: in std_logic;
		reset: in std_logic;
		
		sample_in: in std_logic_vector(15 downto 0);
		average_out: out std_logic_vector(15 downto 0)
	);
end entity runningAverage;

architecture beh of runningAverage is
	signal average : std_logic_vector(127 downto 0); --using 128 bits is an overkill and is one of those workarounds that tend to linger on way after the project's finished
	signal nextAverage : std_logic_vector(127 downto 0);
	signal absValue : std_logic_vector(15 downto 0); 
	signal scaledValue : std_logic_vector(19 downto 0); --4 bits longer to accomodate for the cosmic_constant
	signal last_lrclk : std_logic;
	constant cosmic_constant : std_logic_vector(4 downto 0) := CONV_STD_LOGIC_VECTOR(21, 5); --magic * 16
	constant period_pad : std_logic_vector(PERIOD_POWER-1 downto 0) := CONV_STD_LOGIC_VECTOR(0, PERIOD_POWER); --zeros
	constant end_pad : std_logic_vector(127-PERIOD_POWER-16 downto 0) := CONV_STD_LOGIC_VECTOR(0, 128-PERIOD_POWER-16); --more zeros
begin
	absValue <= sample_in when sample_in(15)='0' else
				not(sample_in)+'1'; --take the absolute value.
	scaledValue <= cosmic_constant * absValue(14 downto 0); --discard the sign bit and multiply by the cosmic constant
	
	--perform calculations according to the formula presented above. Use padding and shifts instead of multiplications and divisions.
	nextAverage <= (average(127-PERIOD_POWER downto 0) & period_pad - average) + (period_pad & scaledValue(19 downto 4) & end_pad);
	
	average_out <= average(127-PERIOD_POWER downto 127-PERIOD_POWER-15); --Output the significant bits
	
	process(clk, reset)
	begin
		if (reset = '0') then
			average <= (others => '0');
		elsif rising_edge(clk) then
			if(lrclk = '1' and last_lrclk = '0') then
				average <= period_pad & nextAverage(127 downto PERIOD_POWER); --Prepare the average for the next round of calculation
			else 
				average <= average;
			end if;
			last_lrclk <= lrclk;
		end if;
	end process;	
end architecture beh;