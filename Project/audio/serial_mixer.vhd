--serial_mixer.vhd
--The mixer module takes two input signals and outputs a mix of them in ratios defined by the mix parameter.
--Strictly speaking, it realizes the function (assuming tone from 0 to 1): y = mix*a + (1 - mix)*b

--A different implementation of the same principle can be seen in tonemixer.vhd
--The main difference from the naive implementation shown in tonemixer.vhd is in the pipelining of the calculations.
--Instead of performing two multiplications and two summations per channel per clock cycle, we're performing 
--only a single multiplication and summation on any given clock tick but strech the calculations over several cycles.
--This takes care of both the possible timing violations and of the need for excessive numbers of hardware multipliers.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity serial_mixer is

	port (
		
		clk: in std_logic;
		lrclk: in std_logic;
		reset: in std_logic;
		
		-- data
		chan_a_in_right: in std_logic_vector(15 downto 0);
		chan_a_in_left: in std_logic_vector(15 downto 0);
		chan_b_in_right: in std_logic_vector(15 downto 0);
		chan_b_in_left: in std_logic_vector(15 downto 0);
		
		sample_out_right: out std_logic_vector(15 downto 0);
		sample_out_left: out std_logic_vector(15 downto 0);
		
		-- params 
		mix: in std_logic_vector(15 downto 0)
	);
end entity serial_mixer;

architecture beh of serial_mixer is
	signal last_lrclk: std_logic;
		
	signal mix_inv: std_logic_vector(16 downto 0);
	signal a_left_reg: std_logic_vector(15 downto 0);
	signal a_right_reg: std_logic_vector(15 downto 0);
	signal b_left_reg: std_logic_vector(15 downto 0);
	signal b_right_reg: std_logic_vector(15 downto 0);
	signal out_left_reg, next_out_left: std_logic_vector(15 downto 0);
	signal out_right_reg, next_out_right: std_logic_vector(15 downto 0);
	
	signal alu_a, alu_c, alu_d: std_logic_vector(15 downto 0);
	signal alu_b: std_logic_vector(16 downto 0);
	
	type mixer_states is (S_IDLE, S_A_LEFT, S_B_LEFT, S_A_RIGHT, S_B_RIGHT);
	signal state, next_state: mixer_states;
	
begin
	--Calculate the complement of the mix parameter
	mix_inv <= "01111111111111111" - ("0"&mix);
	
	
	push_pipeline: process(lrclk, reset)
	begin
		if (reset = '0') then
			a_left_reg <= (others => '0');
			a_right_reg <= (others => '0');
			b_left_reg <= (others => '0');
			b_right_reg <= (others => '0');
			sample_out_left <= (others => '0');
			sample_out_right <= (others => '0');
		elsif rising_edge(lrclk) then
			a_left_reg <= chan_a_in_left;
			a_right_reg <= chan_a_in_right;
			b_left_reg <= chan_b_in_left;
			b_right_reg <= chan_b_in_right;
			sample_out_left <= out_left_reg;
			sample_out_right <= out_right_reg;
			
		end if;
	end process;
	
	state_advance: process(clk, reset)
	begin
		if (reset = '0') then
			last_lrclk <= '0';
			state <= S_IDLE;
			out_left_reg <= (others => '0');
			out_right_reg <= (others => '0');
			
		elsif rising_edge(clk) then
			last_lrclk <= lrclk;
			state <= next_state;
			out_left_reg <= next_out_left;
			out_right_reg <= next_out_right;
		end if;
	end process;
	
	processor: process(	state, lrclk, last_lrclk, alu_d, out_left_reg, out_right_reg, 
						a_left_reg, a_right_reg, b_left_reg, b_right_reg, mix, mix_inv)
	begin
			
		case state is
			when S_IDLE =>
				if (lrclk = '1' and last_lrclk = '0') then
					next_state <= S_A_LEFT; --Start processing the data on rising edge of the left-right clock
				else
					next_state <= S_IDLE;
				end if;
				
				next_out_left <= out_left_reg;
				next_out_right <= out_right_reg;
				
				--The alu consists of a single multiplier and a summer and performs the operation d = a*b + c
				alu_a <= (others => 'X');
				alu_b <= (others => 'X');
				alu_c <= (others => 'X');
								
			when S_A_LEFT =>
				next_state <= S_A_RIGHT;
				
				next_out_left <= alu_d;
				next_out_right <= out_right_reg;
				
				--y = a*mix + ...
				alu_a <= a_left_reg;
				alu_b <= '0'&mix;
				alu_c <= (others => '0');
				
			when S_A_RIGHT =>
				next_state <= S_B_LEFT;
				
				next_out_left <= out_left_reg;
				next_out_right <= alu_d;
				
				--y = a*mix + ...
				alu_a <= a_right_reg;
				alu_b <= '0'&mix;
				alu_c <= (others => '0');
				
			when S_B_LEFT =>
				next_state <= S_B_RIGHT;
				
				next_out_left <= alu_d;
				next_out_right <= out_right_reg;
				
				--y = a*mix + b*(1-mix)
				alu_a <= b_left_reg;
				alu_b <= mix_inv;
				alu_c <= out_left_reg;

			when S_B_RIGHT =>
				next_state <= S_IDLE;
				
				next_out_left <= out_left_reg;
				next_out_right <= alu_d;
				
				--y = a*mix + b*(1-mix)
				alu_a <= b_right_reg;
				alu_b <= mix_inv;
				alu_c <= out_right_reg;
								
			when others =>
				next_state <= S_IDLE;
									
				next_out_left <= out_left_reg;
				next_out_right <= out_right_reg;
									
				alu_a <= (others => 'X');
				alu_b <= (others => 'X');
				alu_c <= (others => 'X');
		end case;
			
	end process;
	
	alu: process(alu_a, alu_b, alu_c)
		variable mul: std_logic_vector(32 downto 0);
	begin
		mul := alu_a * alu_b;
		alu_d <= mul(31 downto 16) + alu_c;
	end process;
	
end architecture beh; 
