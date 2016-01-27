--delaymixer.vhd
--The delay effect stores a number of most recent samples in memory and mixes them with the current input
--after a specified amount of time. The signal for storing in memory is taken after the mixing occurs so
--the result is an infinitely decaying echo.

--The user can adjust the delay of the effect (the length of the buffered signal sample) which changes
--the distance in time between subsequent echos. He may also change the decay of the system, which decides
--how much is the echo attenuated at each replay.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity delaymixer is

	port (
		
		sample_left_in: in std_logic_vector(15 downto 0);
		sample_right_in: in std_logic_vector(15 downto 0);
		sample_left_out: out std_logic_vector(15 downto 0);
		sample_right_out: out std_logic_vector(15 downto 0);
		
		buffer_left_out: out std_logic_vector(15 downto 0);
		buffer_right_out: out std_logic_vector(15 downto 0);
		
		buffer_left_in: in std_logic_vector(15 downto 0);
		buffer_right_in: in std_logic_vector(15 downto 0);
		
		decay: in std_logic_vector(7 downto 0)
	);
end entity delaymixer;

architecture rtl of delaymixer is

	signal last_sample_clk: std_logic;
	signal output_left: std_logic_vector(15 downto 0);
	signal output_left_sat: std_logic_vector(16 downto 0);
	signal delay_multiplied_left: std_logic_vector(24 downto 0);
	signal dml: std_logic;
	signal output_right: std_logic_vector(15 downto 0);
	signal output_right_sat: std_logic_vector(16 downto 0);
	signal delay_multiplied_right: std_logic_vector(24 downto 0);
	signal dmr: std_logic;

begin
	--Calculate the echo after decay
	delay_multiplied_left <= buffer_left_in * ('0' & decay);
	--Duplicate the topmost bit to use for overflow detetction
	dml <= delay_multiplied_left(24);
	output_left_sat <= (dml & delay_multiplied_left(24 downto 9)) + (sample_left_in(15) & sample_left_in);
	output_left <= "0111111111111111" when output_left_sat(16 downto 15) = "01" else --positive overflow
				   "1000000000000000" when output_left_sat(16 downto 15) = "10" else --negative overflow
				   output_left_sat(15 downto 0); --all ok
	
	--Both the output to the next effect and to the memory buffer are the same in this implementation
	buffer_left_out <= output_left;
	sample_left_out <= output_left;
	
	--Do the same for the right channel
	delay_multiplied_right <= buffer_right_in * ('0' & decay);
	
	dmr <= delay_multiplied_right(24);
	output_right_sat <= (dmr & delay_multiplied_right(24 downto 9)) + (sample_right_in(15) & sample_right_in);
	output_right <= "0111111111111111" when output_right_sat(16 downto 15) = "01" else
				   "1000000000000000" when output_right_sat(16 downto 15) = "10" else
				   output_right_sat(15 downto 0);
	
	buffer_right_out <= output_right;
	sample_right_out <= output_right;
	

end architecture rtl; 
