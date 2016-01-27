-- analyzer_input.vhd

-- The analyzer_input SOPC builder module interleaves the incoming x and y data streams to a single register to allow for well-aligned reads
-- This means that the resultant register is guaranteed to have corresponding input and output samples on consequtive positions in the read register.
-- This would not be the case if two distinct PIOs were used - the amount of time elapsed between reading the X pio and the Y pio would occasionally be
-- enough for the Y sample to change, causing a misalignment and visible noise on the analyzer. 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity analyzer_input is
	port (
		clk      : in  std_logic                      := '0';             --        clock.clk
		reset    : in  std_logic                      := '0';             --             .reset_n
		read     : in  std_logic                      := '0';             -- avalon_slave.read
		readdata : out std_logic_vector(127 downto 0);                    --             .readdata
		x_in     : in  std_logic_vector(63 downto 0)  := (others => '0'); --     audio_in.export
		y_in     : in  std_logic_vector(63 downto 0)  := (others => '0')  --             .export
	);
end entity analyzer_input;

architecture rtl of analyzer_input is
	signal last_read: std_logic;
	
begin
	process (clk, reset)
	begin
		if(reset = '0') then --async reset
			readdata <= (others => '0');
			last_read <= '0';
		elsif rising_edge(clk) then
			last_read <= read;
			if (read = '1' and last_read <= '0') then -- read rising edge
				for i in 8 downto 1 loop
					readdata(i*16-1 downto (i-1)*16) <= x_in(i*8-1 downto (i-1)*8) & y_in(i*8-1 downto (i-1)*8); --Interleave 8 samples 
				end loop;
			end if;
		end if;
	end process;
	
end architecture rtl; -- of analyzer_input
