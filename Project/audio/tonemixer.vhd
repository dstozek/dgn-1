--tonemixer.vhd
--The mixer module takes two input signals and outputs a mix of them in ratios defined by the tone parameter.
--Strictly speaking, it realizes the function (assuming tone from 0 to 1): y = tone*a + (1 - tone)*b

--A different implementation of the same principle can be seen in serial_mixer.vhd
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity tonemixer is

	port (
		
		clk: in std_logic;
		reset: in std_logic;
		
		-- data
		sample_in: in std_logic_vector(15 downto 0);
		filtered_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		
		-- params
		tone: in std_logic_vector(15 downto 0)
	);
end entity tonemixer;

architecture beh of tonemixer is
	signal signal_unnormalized: std_logic_vector(32 downto 0);
	signal filtered_unnormalized: std_logic_vector(32 downto 0);
	signal notone: std_logic_vector(16 downto 0);
	
begin
	notone <= "01111111111111111" - ("0"&tone); --Calculate the complement (1-tone)
	
	
	process(clk, reset)
	begin

		if (reset = '0') then
			signal_unnormalized <= (others => '0');
			filtered_unnormalized <= (others => '0');
			sample_out <= (others => '0');
		elsif rising_edge(clk) then
			signal_unnormalized <= sample_in * notone;
			filtered_unnormalized <= filtered_in * ('0' & tone);
			sample_out <= signal_unnormalized(31 downto 16) + filtered_unnormalized(31 downto 16);
		end if;
	
	end process;	
	
end architecture beh; 
