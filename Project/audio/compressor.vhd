--compressor.vhd
--This implementation of the compressor acts as a dynamic-gain amplifier.
--It amplifies weak inputs, but starts decreasing the linearly as the input volume exceeds a certain threshold.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity compressor is

	port (
				
		-- data
		sample_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		signal_volume: in std_logic_vector(15 downto 0);
		overThreshold : out std_logic;
		-- params
		gain: std_logic_vector(7 downto 0);
		threshold: std_logic_vector(15 downto 0)
	);
end entity compressor;

architecture beh of compressor is
	signal increment: std_logic_vector(42 downto 0);
	signal diff: std_logic_vector(15 downto 0);
begin
	diff <= signal_volume-threshold; --Amount of volume over the threshold
	
	--Calculate the value to amplify the signal by
	increment <= sample_in * ('0'&gain) * "000001000000000000" when ('0'&signal_volume) < ('0'&threshold) --If we're under the threshold just amplify everything as usual
			else sample_in * ('0'&gain) *("000001000000000000"-('0'&diff&'0')); --Decrease the gain linearly when we exceed the threshold.
	
	overThreshold <= '1' when ('0'&signal_volume) < ('0'&threshold)
					else '0';


	compress: process(sample_in)
		variable signal_unnormalized: std_logic_vector(16 downto 0);		
	begin
	
		--Take care of rounding
		if(increment(19)='0') then
			signal_unnormalized := sample_in+increment(36 downto 20);
		else 
			signal_unnormalized := sample_in+increment(36 downto 20)+1; --Round up
		end if;
		
		if (signal_unnormalized(16) = '1') then -- result negative
			if (signal_unnormalized(15) = '1') then -- no overflow
					sample_out <= '1' & signal_unnormalized(14 downto 0);
				else -- overflow negative
					sample_out <= "1000000000000000";	
			end if;
			
		else -- result positive
			if (signal_unnormalized(15) = '0') then -- no overflow
					sample_out <= '0' & signal_unnormalized(14 downto 0);
				else -- overflow positive
					sample_out <= "0111111111111111";	
			end if;
		end if;
		

	end process;
end architecture beh; 
