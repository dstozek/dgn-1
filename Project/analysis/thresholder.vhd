--thresholder.vhd
--Outputs sixteen bits. The i-th bit is set to 1 if the input value exceeds 2^i.
--When pinned to the LEDs on the board results in a simple hardware-only signal strength visualizer.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity thresholder is
	port(
		input : in std_logic_vector(15 downto 0);
		output: out std_logic_vector(15 downto 0)
	);
end entity thresholder;

architecture beh of thresholder is
	signal absValue  : std_logic_vector(15 downto 0);
begin
	absValue <= input when input(15)='0' else
				not(input)+'1';
				
	output(0) <= '1' when absValue  > 2 else '0';
	output(1) <= '1' when absValue  > 2**2 else '0';
	output(2) <= '1' when absValue  > 2**3 else '0';
	output(3) <= '1' when absValue  > 2**4 else '0';
	output(4) <= '1' when absValue  > 2**5 else '0';
	output(5) <= '1' when absValue  > 2**6 else '0';
	output(6) <= '1' when absValue  > 2**7 else '0';
	output(7) <= '1' when absValue  > 2**8 else '0';
	output(8) <= '1' when absValue  > 2**9 else '0';
	output(9) <= '1' when absValue  > 2**10 else '0';
	output(10) <= '1' when absValue  > 2**11 else '0';
	output(11) <= '1' when absValue  > 2**12 else '0';
	output(12) <= '1' when absValue  > 2**13 else '0';
	output(13) <= '1' when absValue  > 2**14 else '0';
	output(14) <= '1' when absValue  > 2**15 else '0';
	output(15) <= '1' when absValue  > 2**16 else '0';
	--output(16) <= '1' when absValue  > 17*1820 else '0';
	--output(17) <= '1' when absValue  > 18*1820 else '0';
end architecture beh;