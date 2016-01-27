--audiodeserializer.vhd
--Since the input from ADC is serial, this module handles parallelizing it into neat 16 bit samples and feeding them to the left and rigth channels appropriatly.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity AudioDeserializer is
	port(
		clk		:in std_logic; -- system clock - 50Mhz
		reset	:in std_logic;
		bclk	:in std_logic; -- ADC bit clock
		lrclk	:in std_logic; -- ADC Left/Right (Word) clock
		adcin	:in std_logic; -- ADC input
		left_word : out std_logic_vector(15 downto 0); -- Left Channel sample
		right_word : out std_logic_vector(15 downto 0) -- Right Channel sample
	);
end AudioDeserializer;

architecture rtl of AudioDeserializer is
	signal bclk_p: std_logic; -- value of bclk at prev system clock rising edge
	signal lrclk_p: std_logic;-- value of lrclk at prev system clock rising edge
	
	signal left_word_reg: std_logic_vector(15 downto 0);
	signal right_word_reg: std_logic_vector(15 downto 0);
	signal word_reg: std_logic_vector(15 downto 0);
	signal word_regn: std_logic_vector(15 downto 0);
	signal bitcounter: std_logic_vector(4 downto 0);
begin
	left_word <= left_word_reg;
	right_word <= right_word_reg;


	deserialize: process(clk, reset)
		variable bclk_rising: boolean;
		variable bclk_falling: boolean;
		variable channel_switch: boolean; 
	begin
	
		bclk_rising := bclk = '1' and bclk_p = '0';
		bclk_falling := bclk = '0' and bclk_p = '1';
		
		channel_switch := not (lrclk_p = lrclk);
	
		if(reset = '0') then
			
			bclk_p <= '0';
			lrclk_p <= '0';
			
			left_word_reg <= (others => '0');
			right_word_reg <= (others => '0');
			
			word_reg <= (others => '0');
			bitcounter <= (others => '0');
			
		elsif rising_edge(clk) then
			bclk_p <= bclk;
			
	
			if (bclk_rising and bitcounter <= 15) then
				word_reg <= word_reg(14 downto 0) & adcin; --shift in the input bit on the rising edge of the bit clock
			end if;
			
			if (bclk_falling) then --on the falling edge of the bitclock increment our bitcounter and check if the decoding of the sample is finished
				bitcounter <= bitcounter + 1;
				lrclk_p <= lrclk;
				
				if (channel_switch) then
					bitcounter <= (others => '0');
				end if;
				
				if (channel_switch and lrclk_p = '1') then --if we're switching from a highstate on lrclk, we've just finished decoding the left channel
					left_word_reg <= word_reg; --feed left channel
				end if;	
			
				if (channel_switch and lrclk_p = '0') then --conversly, if the state was low, we've just finished decoding the right channel
					right_word_reg <= word_reg; --feed right channel
				end if;
				
			end if;
			
			
		end if;
	end process;
	

end rtl;