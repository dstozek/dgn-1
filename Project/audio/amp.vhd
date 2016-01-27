--amp.vhd
--A simple digital amplifier with overflow control. It multiplies the input signal by volume/512. Overflows are caught and result in the saturation of the amplifier.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity amp is

	port (
				
		-- data
		sample_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		
		-- params
		volume: in std_logic_vector(15 downto 0)
	);
end entity amp;

architecture beh of amp is
	signal signal_unnormalized: std_logic_vector(31 downto 0);
begin


	signal_unnormalized <= sample_in * volume;
	
	
	normalize_saturate: process(signal_unnormalized)
	begin
	
		if (signal_unnormalized(31) = '1') then -- result negative
			if (signal_unnormalized(30 downto 23) = "11111111") then -- no overflow
					sample_out <= '1' & signal_unnormalized(22 downto 8);
				else -- overflow negative
					sample_out <= "1000000000000000";	
			end if;
			
		else -- result positive
			if (signal_unnormalized(30 downto 23) = "00000000") then -- no overflow
					sample_out <= '0' & signal_unnormalized(22 downto 8);
				else -- overflow positive
					sample_out <= "0111111111111111";	
			end if;
		end if;
		

	end process;
end architecture beh; 
