--panner.vhd
--The panner module trembles the volume of the input signal. Depending on the mode (counter-phase or join) it
--can tremble the channels separately (tremble the left channel first, then the right channel then repeat) or 
--together (both volumes go up or down at the same time and pace).
--The user sets up the value of the depth parameter (which decides the maximum change of volume in the effect)
--and of the rate parameter (which is the frequency of the trembling).
--The parameters are processed in software and this module is only fed the slope parameters and depth

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity panner is

	port (
			
		-- control signals
		clk : in std_logic;
		reset: in std_logic;
		lrclk: in std_logic;
				
		-- data
		sample_in_left: in std_logic_vector(15 downto 0);
		sample_in_right: in std_logic_vector(15 downto 0);
		
		sample_out_left: out std_logic_vector(15 downto 0);
		sample_out_right: out std_logic_vector(15 downto 0);
		
		-- params
		sweep_a: in std_logic_vector(3 downto 0);
		sweep_b: in std_logic_vector(3 downto 0);
		sweep_depth: in std_logic_vector(15 downto 0);
		mode: in std_logic
	);
end entity panner;

architecture beh of panner is
	signal level: signed(15 downto 0);
	signal isLeft: std_logic; -- 1 if operating on left channel; 0 if on right;
	signal desc: std_logic; -- descending?
	signal icounter: unsigned(3 downto 0); -- increment counter
begin

	--Perform the volume change
	pan:process(lrclk, reset)
		variable bigMulti: signed (31 downto 0);
		variable sample: signed (15 downto 0);
	begin
		if (reset = '0') then
			sample_out_left <= (others => '0');
			sample_out_right <= (others => '0');
		elsif rising_edge(lrclk) then
			--pick the channel which will be trembled. OBSOLETE
			if (isLeft = '1') then
				sample := signed(sample_in_left);
			else
				sample := signed(sample_in_right);
			end if;
			
			
			--If we're operating in join mode, tremble both the channels at the same time
			if (mode = '1') then
				bigMulti := signed(sample_in_left) * level;
				sample_out_left <= std_logic_vector(bigMulti(31) & bigMulti(29 downto 15));
				bigMulti := signed(sample_in_right) * level;
				sample_out_right <= std_logic_vector(bigMulti(31) & bigMulti(29 downto 15));
			else --Otherwise operate on only a single channel at a time
				if (isLeft = '1') then
					bigMulti := signed(sample_in_left) * level;
					sample_out_left <= std_logic_vector(bigMulti(31) & bigMulti(29 downto 15));
					sample_out_right <= sample_in_right;
				else
					bigMulti := signed(sample_in_right) * level; 
					sample_out_right <= std_logic_vector(bigMulti(31) & bigMulti(29 downto 15));
					sample_out_left <= sample_in_left;
				end if;
			end if;

		end if;
	end process;
	
	--Calculate the current volume change
	sweep: process(lrclk, reset)
	variable atTop, atBottom : boolean;
	begin
		if (reset = '0') then
			level <= (others => '0');
			isLeft <= '0';
			desc <= '0';
			icounter <= (others => '0');
		elsif rising_edge(lrclk) then
			--Every sweep_b samples change the gain by sweep_a
			icounter <= icounter + 1;
			if (icounter >= unsigned(sweep_b)) then
				icounter <= "0001";
				if (desc = '1') then --going down?
					level <= level - signed('0' & sweep_a);
				else
					level <= level + signed('0' & sweep_a);
				end if;
			end if;
			
			--If we're at the top or bottom of the tremble change the direction and (optionally) the channel
			atBottom := level <= signed(sweep_depth) + signed('0' & sweep_a) and desc = '1';
			atTop := level > "0111111111111110"-signed('0' & sweep_a) and desc = '0';
			
			if (atBottom or atTop) then
				level <= level;
				if(atBottom) then
					desc <= '0';
				else
					desc <= '1';	
				end if;
				if (atTop) then
					isLeft <= not isLeft;
				end if;
			end if;
			
			
		end if;
	end process;
end architecture beh; 
