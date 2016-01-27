--bypass.vhd
--A simple switch enabling to bypass an effect

library IEEE;
use IEEE.std_logic_1164.all;

entity bypass is

	port (
		sample_in_left: in std_logic_vector(15 downto 0); --signal not transformed by the effect
		sample_in_right: in std_logic_vector(15 downto 0);
				
		device_in_left: in std_logic_vector(15 downto 0); --signal transformed by the effect
		device_in_right: in std_logic_vector(15 downto 0);
		
		sample_out_left: out std_logic_vector(15 downto 0);
		sample_out_right: out std_logic_vector(15 downto 0);		
		
		bypass: in std_logic
	);
end entity bypass;

architecture beh of bypass is
begin

	sample_out_left <= sample_in_left when bypass = '1' else device_in_left;
	sample_out_right <= sample_in_right when bypass = '1' else device_in_right;

end architecture beh; 
