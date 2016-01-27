--octaver.vhd
--The octaver effect works by approximating the input signal with a square wave with half the frequency of the input.
--The algorithm used detects when the input signal passes through zero. On each second zero-crossing, the output square wave is reversed in polarity.
--The amplitude of the output square wave is reconstructed from the volume of the input signal.

--This approach results in a very low-fidelity effect, which however gives a pleasant, dark and metallic timbre of the guitar.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity octaver is

	port (
		clk : in std_logic;
		reset : in std_logic;
		-- data
		sample_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		
		-- params
		power_in: in std_logic_vector(15 downto 0) --current input volume
	);
end entity octaver;

architecture beh of octaver is
	signal previous_sample: std_logic_vector(15 downto 0);
	signal up_level: std_logic;
	signal output_signal: std_logic_vector(31 downto 0);
	signal last_up_level : std_logic;
begin

	process_one: process(clk, reset)
		variable static_signal: std_logic_vector(15 downto 0);
	begin
		if (reset='0') then
			output_signal <= (others=>'0');
			last_up_level <= '0';
		elsif rising_edge(clk) then
			previous_sample <= sample_in;
			
			--We detect zero-crossings using a threshold to avoid noise around zero
			if((previous_sample <= "01000") and (sample_in >= "01000")) then --rising edge
				up_level <= '1';
			elsif ((previous_sample >= "11000") and (sample_in <= "11000")) then --falling edge
				up_level <= '0';
			else
				up_level <= up_level;
			end if;
			
			--On zero crossing at the rising edge of the signal we flip the polarity of the output square wave
			if(last_up_level = '0' and up_level = '1')then
				if(static_signal = "0111111111111111") then
					static_signal := "1000000000000000";
				else static_signal := "0111111111111111";
				end if;
			end if;	
			
			--We use the volume to establish the appropriate amplitude for our output
			output_signal <= static_signal * power_in;
			
			last_up_level <= up_level;
		end if;	
	end process;
	
	sample_out <= output_signal(30 downto 15);
	
end architecture beh; 
