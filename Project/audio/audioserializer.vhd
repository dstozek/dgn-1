--audioserializer.vhd
--Everything happens much like in the audiodeserializer module only backwards -
--we're taking the internal signals of 16 bits dual-channel parallel and serialize them to the
--format acceptable by the DAC.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity AudioSerializer is
	port(
		clk		:in std_logic; -- system clock - 50Mhz
		reset	:in std_logic;
		bclk	:in std_logic; -- DAC bit clock
		lrclk	:in std_logic; -- DAC Left/Right (Word) clock
		dacout	:out std_logic; -- DAC output
		left_word : in std_logic_vector(15 downto 0); -- Left Channel sample
		right_word : in std_logic_vector(15 downto 0); -- Right Channel sample
		enable : in std_logic --Master sound enable. If 0, no sound will be output whatsoever.
	);
end AudioSerializer;

architecture rtl of AudioSerializer is
	signal bclk_p: std_logic; -- value of bclk at prev system clock rising edge
	signal lrclk_p: std_logic;-- value of lrclk at prev system clock rising edge

	signal word_reg: std_logic_vector(15 downto 0);
	signal word_regn: std_logic_vector(15 downto 0);
	signal bitcounter: std_logic_vector(4 downto 0);
begin


	deserialize: process(clk, reset)
		variable bclk_falling: boolean;
		variable channel_switch: boolean; 
	begin
	
		bclk_falling := bclk = '0' and bclk_p = '1';
		channel_switch := not (lrclk_p = lrclk);
	
		if(reset = '0') then
			
			bclk_p <= '0';
			lrclk_p <= '0';
			
			dacout <= '0';
			word_reg <= (others => '0');
			
		elsif rising_edge(clk) then
			bclk_p <= bclk;
			
	
			if (bclk_falling) then
				lrclk_p <= lrclk;
			
				bitcounter <= bitcounter + 1;
				
				if (channel_switch) then
					bitcounter <= ("00001"); -- 0 is now so next time put 1
				end if;
				
				if (enable = '1') then
					if (bitcounter <= 15) then
						if (channel_switch) then
								if (lrclk = '1') then
									dacout <= left_word(15); -- MSB;
								else
									dacout <= right_word(15);
								end if;
							else
								dacout <= word_reg(15-conv_integer(bitcounter(3 downto 0)));
						end if;
					else
						dacout <= '0';
					end if;
				end if;
			end if;
			
			if (channel_switch) then
				if (lrclk = '1') then
					word_reg <= left_word;
				else
					word_reg <= right_word;
				end if;

			end if;	
			
			
		end if;
	end process;
	
	
end rtl;