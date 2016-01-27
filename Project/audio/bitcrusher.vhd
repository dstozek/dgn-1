library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bitcrusher is
	port (

		sample_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		
		clk: in std_logic;
		reset: in std_logic;
		bypass: in std_logic;
		
		-- params
		bitcrush: in std_logic_vector(3 downto 0) := X"4";
		freqcrush: in std_logic_vector(7 downto 0) := X"03"
		
	);
end entity bitcrusher;

architecture beh of bitcrusher is
	
	signal crushedBits: signed(15 downto 0);
	
begin
	
	crushBit: process(sample_in, bitcrush)
		variable midcrush: signed(16 downto 0);
		variable aftercrush: signed(15 downto 0);
		variable rounding: signed(1 downto 0);
	begin
		midcrush := shift_right(signed(sample_in) & '0', to_integer(unsigned(bitcrush)));
		rounding := midcrush(16) & midcrush(0);
		
		if (midcrush(16) = '1') then -- negative
			if (midcrush(0) = '1') then  -- round up
				rounding := "01";
			else -- round down
				rounding := "00";
			end if;
		else -- positive
			if (midcrush(0) = '1') then  -- round up
				rounding := "01";
			else -- round down
				rounding := "00";
			end if;
		end if;
		
		aftercrush := midcrush(16 downto 1) + rounding;
		
		crushedBits <= aftercrush(15) & shift_left(aftercrush(14 downto 0), to_integer(unsigned(bitcrush)));
		
	end process;
	
	sample_out <= std_logic_vector(crushedBits) when bypass = '0' else sample_in;
	
end architecture beh; 
