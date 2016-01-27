-- membuffer.vhd

-- This file was auto-generated as a prototype implementation of a module
-- created in component editor.  It ties off all outputs to ground and
-- ignores all inputs.  It needs to be edited to make it do something
-- useful.
-- 
-- This file will not be automatically regenerated.  You should check it in
-- to your version control system if you want to keep it.

library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity membuffer is
	generic (
		BASE_ADDR: integer range 0 to 2**30 := 0
	);
	port (
		
		clk	: in std_logic;
		reset: in std_logic;
		sample_clk: in std_logic;
	
		address     : out std_logic_vector(31 downto 0);                    -- avalon_master.address
		read        : out std_logic;                                        --              .read
		readdata    : in  std_logic_vector(31 downto 0) := (others => '0'); --              .readdata
		waitrequest : in  std_logic                     := '0';             --              .waitrequest
		write       : out std_logic;                                        --              .write
		writedata   : out std_logic_vector(31 downto 0);                    --              .writedata
		
		delay_time  : in  std_logic_vector(15 downto 0);
		
		sample_left_in: in std_logic_vector(15 downto 0);
		sample_right_in: in std_logic_vector(15 downto 0);
		sample_left_out: out std_logic_vector(15 downto 0);
		sample_right_out: out std_logic_vector(15 downto 0)
		
		
	);
end entity membuffer;

architecture rtl of membuffer is

	type buffer_states is (S_IDLE, S_INC, S_READ, S_WRITE);
	signal state, nextstate: buffer_states;
	signal last_sample_clk: std_logic;
	signal read_pointer: std_logic_vector(31 downto 0);
	signal write_pointer: std_logic_vector(31 downto 0);
	
	signal read_word: std_logic_vector(31 downto 0);
	signal update_pointer: std_logic;
	signal update_read_word: std_logic;

begin
	sample_left_out <= read_word(31 downto 16);
	sample_right_out <= read_word(15 downto 0);
	
	readptr: process(write_pointer)
	begin
		if (read_pointer < BASE_ADDR+4) then
				write_pointer <= conv_std_logic_vector(BASE_ADDR-4, 32) + ("00000000" & delay_time & "00000000");
			else
				write_pointer <= read_pointer - 4;
		end if;
	end process;
	
	process (state)
	begin
			
		writedata <= (others => '0');
		read <= '0';
		write <= '0';
		update_pointer <= '0';
		update_read_word <= '0';

		if (state = S_READ or state = S_WRITE) then
				if (state = S_READ) then
					address <= read_pointer;
				else
					address <= write_pointer;	
				end if;
			else
				address <= (others => '0');
		end if;

		case state is
			when S_IDLE =>
							
				if (last_sample_clk = '0' and sample_clk = '1') then
					nextstate <= S_INC;
				else
					nextstate <= S_IDLE;
				end if;
			when S_INC =>
				update_pointer <= '1';
				nextstate <= S_READ;
			when S_READ =>
				read <= '1';
				if (waitrequest = '1') then
					nextstate <= S_READ;
				else
					update_read_word <= '1';
					nextstate <= S_WRITE;
					
				end if;
				
			when S_WRITE=>
				write <= '1';
				writedata <= sample_left_in & sample_right_in;
				
				if (waitrequest = '1') then
					nextstate <= S_WRITE;
				else
					nextstate <= S_IDLE;
				end if;
				
			when others =>				
				nextstate <= S_IDLE;
		end case;
	end process;
	
	process (clk, reset)
	begin
	
		if (reset = '0') then
			-- registers
			state <= S_IDLE;
			read_word <= (others=>'0');	
			read_pointer <= conv_std_logic_vector(BASE_ADDR, 32);
			last_sample_clk <= '0';

		elsif rising_edge(clk) then
			last_sample_clk <= sample_clk;
			state <= nextstate;
			
			if (update_read_word = '1') then
				read_word <= readdata;
			end if;
			if (update_pointer = '1') then
				if (read_pointer >= conv_std_logic_vector(BASE_ADDR-4, 32) + ("00000000" & delay_time & "00000000")) then
					read_pointer <= conv_std_logic_vector(BASE_ADDR, 32);
					else
					read_pointer <= read_pointer + 4;
				end if;
			end if;
		end if;
	end process;

end architecture rtl; -- of membuffer
