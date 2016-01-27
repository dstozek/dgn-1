--PIODeserializer.vhd

--PIODeserializer acts as a simple parallel-read serial-write shift buffer. In effect it stores the last several audio signal samples so that
--the analyzer module can operate in bursts of several samples at a time, effectively increasing its the resolution.
--It also allows for decreasing the resolution of the samples (since the current graphical representation is limited to ~120x120px. we won't be able to display
--all 16 bits of available information anyway).
--The data in inserted into the shift buffer at 500 system clock cycles from the sample clock rising edge. This means that the new sample has 500 system clock ticks
--to propagate through the system before getting sampled by the output PIODeserializer. The current effect chain has ~20 clock ticks of delay so there's still a huge
--margin. 

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PIODeserializer is
	generic (
		OUTPUT_WIDTH: integer range 0 to 128 := 64;
		SAMPLE_TOP : integer range 0 to 15 := 15; --The topmost bit number to copy to the output, generally set to 15
		SAMPLE_BOTTOM : integer range 0 to 15 := 0; --The lowest bit number to copy to the output, setting to 8 results in 8 topmost bits to copy per sample
		SAMPLE_WIDTH : integer range 0 to 16 := 16; --Should be SAMPLE_TOP - SAMPLE_BOTTOM
		SCALING_SHIFT : integer range 0 to 16 := 0 --The number of bits by which to shift the input to the left. Prescales the input for better representation - in the default setup the Xs are prescaled by 2.
	);
	port(
		reset	:in std_logic;
		clk :in std_logic;
		lrclk	:in std_logic; -- ADC Left/Right (Word) clock
		sample_in : in std_logic_vector(15 downto 0); -- Sample
		pio_out : out std_logic_vector(OUTPUT_WIDTH-1 downto 0)
	);
end PIODeserializer;

architecture rtl of PIODeserializer is
	signal pio_out_reg : std_logic_vector(OUTPUT_WIDTH-1 downto 0);
	signal last_lrclk : std_logic;
	signal sample_changed : std_logic;
	signal wait_to_sample_counter : std_logic_vector(9 downto 0); --1000 system clocks per sample, sample at 500 ticks
begin
	pio_out <= pio_out_reg;

	deserialize: process(clk, lrclk, reset)
	variable in_scaled : std_logic_vector(15 downto 0);
	begin
		if(reset = '0') then
			pio_out_reg <= (others => '0');
			last_lrclk <= '0';
			wait_to_sample_counter <= (others => '0');
		elsif rising_edge(clk) then
			in_scaled := (others => sample_in(15)); --copy sign bit
			in_scaled(14 downto SCALING_SHIFT) := sample_in(14-SCALING_SHIFT downto 0); --prescale value
			if(lrclk = '1' and last_lrclk = '0') then --register sample change. Start counting 500 system clock ticks starting now before actually sampling.
				sample_changed <= '1';
				pio_out_reg <= pio_out_reg; 
			elsif (sample_changed = '1') then
				if(wait_to_sample_counter = 500) then --sample
					pio_out_reg(OUTPUT_WIDTH-1-SAMPLE_WIDTH downto 0) <= pio_out_reg(OUTPUT_WIDTH-1 downto SAMPLE_WIDTH); --shift old samples
					pio_out_reg(OUTPUT_WIDTH-1 downto OUTPUT_WIDTH-SAMPLE_WIDTH) <= in_scaled(SAMPLE_TOP downto SAMPLE_BOTTOM); --shift in new bits
					wait_to_sample_counter <= (others => '0');
					sample_changed <= '0';
				else
					pio_out_reg <= pio_out_reg;
					wait_to_sample_counter <= wait_to_sample_counter + 1;
				end if;
			end if;
			last_lrclk <= lrclk;
		end if;
	end process;
	

end rtl;