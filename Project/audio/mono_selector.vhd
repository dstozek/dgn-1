--mono_selector.vhd
--Since guitar input is usually a mono signal with the right channel left silent, this module can be used to feed both channels from the left channel input.

library IEEE;
use IEEE.std_logic_1164.all;

entity mono_selector is

	port (
		
		-- data
		sample_in_left: in std_logic_vector(15 downto 0);
		sample_in_right: in std_logic_vector(15 downto 0);
		
		sample_out_left: out std_logic_vector(15 downto 0);
		sample_out_right: out std_logic_vector(15 downto 0);
				
		-- params
		mono: in std_logic
	);
end entity mono_selector;

architecture beh of mono_selector is
begin

	sample_out_right <= sample_in_right when mono = '0' else sample_in_left;
	sample_out_left <= sample_in_left;

end architecture beh; 
