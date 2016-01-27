--pipeline_buffer.vhd
--A simple pipeline buffer for two 16bit channels

library IEEE;
use IEEE.std_logic_1164.all;


entity pipeline_buffer is

	port (
		
		clk: in std_logic;
		lrclk: in std_logic;
		reset: in std_logic;
				
		-- data
		sample_in_left: in std_logic_vector(15 downto 0);
		sample_out_left: out std_logic_vector(15 downto 0);
		sample_in_right: in std_logic_vector(15 downto 0);
		sample_out_right: out std_logic_vector(15 downto 0)
		
	);
end entity pipeline_buffer;

architecture beh of pipeline_buffer is
	signal last_lrclk: std_logic;
begin

	process (clk, reset)
	begin
		if (reset='0') then
			sample_out_right <= (others => '0');
			sample_out_left <= (others => '0');
		elsif rising_edge(clk) then
			sample_out_right <= sample_in_right;
			sample_out_left <= sample_in_left;
		end if;
	end process;

end architecture beh; 
