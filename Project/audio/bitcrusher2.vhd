--bitcrusher2.vhd
--The flavored bitcrusher effect works by decreasing the vertical resolution of the input signal. The outcame
--is a distinct chiptune-like (think 8-bit consoles) guitar sound.
--To acheive this, two algorithms(flavors) have been implemented.
--The first one arbitrarily shuffles and ORs the bits of the input signal discarding some information and 
--introducing distortions.
--The second one takes a more naive approach and simply discards a number of lowest bits dependant on the
--volume of the input signal.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bitcrusher2 is
	port (

		sample_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		
		clk: in std_logic;
		reset: in std_logic;

		flavor : in std_logic_vector(3 downto 0);
		signal_power : in std_logic_vector(15 downto 0)
	);
end entity bitcrusher2;

architecture beh of bitcrusher2 is
	signal s: std_logic_vector(15 downto 0);
begin
	s <= sample_in;

	process(s)
		variable signal_power_mask : std_logic_vector(15 downto 0);
	begin	
		case flavor is
			when "0000" => 
				--The bit shuffling flavor - some bits are ORed with their neighbores, some are shuffled around, some are not used at all.
				--The formula was chosen arbitrarily.
				sample_out <= s(15) & s(14) & s(12) & s(9) & (s(10) or s(11)) & (s(8) or s(7)) & s(5) & s(6) & s(15) & s(15) & s(15) & s(0) & s(15) & s(2) & s(15) & s(1);
			when others => 
				--This approach discards the lowest bits
				if(s(15) = '1') then
					--If the input is negative, we're just going to OR the input with a bitmask
					--based on the input signal power. This effectively erases the lowest bits.
					signal_power_mask := (others => '1');
					for i in 14 downto 0 loop
						exit when signal_power(i) = '1'; 
						signal_power_mask(i) := '0';
					end loop;
					--At this point the bitmask is "00...01...11" with the number of 1s and 0s depending on
					--the input power
					sample_out <= (others => '0');
					sample_out <= s or signal_power_mask;
				else
					--If we're handling a positive input, we're going to AND the mask with our input
					--FIXME : Shouldn't the bits in the bitmask be inverted?
					signal_power_mask := (others => '1');
					for i in 14 downto 0 loop
						signal_power_mask(i) := '0';
						exit when signal_power(i) = '1';
					end loop;
					sample_out <= (others => '0');
					sample_out <= s and signal_power_mask;
				end if;
		end case;
	end process;

end architecture beh; 
