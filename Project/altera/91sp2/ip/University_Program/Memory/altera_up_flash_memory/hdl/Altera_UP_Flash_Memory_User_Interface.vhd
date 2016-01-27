---------------------------------------------------------------------------------------------
-- This module is a user interface to the Flash Memory controller. It allows read/write/erase
-- operations on the flash memory, by sending commands to the Flash Memory Controller.
--
-- Author: Tomasz Czajkowski
-- Date: February 17th, 2009
-- NOTES/REVISIONS:
-- February 17th, 2009 - Added protection to prevent writes to used memory locations.
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Altera_UP_Flash_Memory_User_Interface is
	generic (
		FLASH_MEMORY_ADDRESS_WIDTH : integer := 22;
		FLASH_MEMORY_DATA_WIDTH : integer := 8
	);
	port 
	(
		-- Signals to/from user 
		i_clock : in STD_LOGIC;
		i_reset_n : in STD_LOGIC;
		i_address : in STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
		i_data : in STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		i_read : in STD_LOGIC;
		i_write : in STD_LOGIC;
		i_erase : in STD_LOGIC;
		o_data : out STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		o_done : out STD_LOGIC;
		
		-- Signals to/from Flash Memory Controller
		i_flash_done : in STD_LOGIC;
		i_data_from_flash : in STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		o_address_to_flash : out STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
		o_data_to_flash : out STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		o_read_flash : out STD_LOGIC;
		o_write_flash : out STD_LOGIC
	);

end entity;


architecture rtl of Altera_UP_Flash_Memory_User_Interface is

	-- Build an enumerated type for the state machine
	type state_type is (s_WAIT_COMMAND, s_READ,
						s_READ_BEFORE_WRITE, s_CHECK_MEMORY_CONTENTS,
						s_WRITE_CYCLE, s_WRITE_CYCLE_DELAY,
						s_WAIT_UNTIL_WRITTEN, s_CHECK_WRITE_COMPLETE,
						s_ERASE_SECTOR, s_ERASE_CHIP,
						s_ERASE_CYCLE, s_ERASE_CYCLE_DELAY,
						s_ERASE_WAIT_COMPLETED, s_CHECK_ERASE_DONE,
						s_ACKNOWLEDGE);

	-- Register to hold the current state
	signal present_state   	: state_type;
	signal next_state   	: state_type;
	
	-- REGISTERED SIGNALS
	signal address_reg : STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
	signal data_reg : STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
	signal command_cycle : std_logic_vector( 2 downto 0 );
	signal last_erase_byte : std_logic_vector (7 downto 0 );
	signal last_erase_address : std_logic_vector(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
	
begin
	-- Define state transitions
	PROCESS(i_read, i_write, i_erase, i_address, present_state, i_flash_done, command_cycle, i_data_from_flash, data_reg)
	BEGIN
		case present_state is
			when s_WAIT_COMMAND =>
				if (i_read = '1') then
					next_state <= s_READ;
				elsif (i_write = '1') then
					next_state <= s_READ_BEFORE_WRITE;
				elsif (i_erase = '1') then
					if (i_address = CONV_STD_LOGIC_VECTOR(-1, FLASH_MEMORY_ADDRESS_WIDTH)) then
						next_state <= s_ERASE_CHIP;
					else
						next_state <= s_ERASE_SECTOR;
					end if;
				else
					next_state <= s_WAIT_COMMAND;
				end if;
			
			-- Read operation - read a byte from memory
			when s_READ =>
				if (i_flash_done = '1') then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_READ;
				end if;
			
			-- Memory protection
			when s_READ_BEFORE_WRITE =>
				if (i_flash_done = '1') then
					next_state <= s_CHECK_MEMORY_CONTENTS;
				else
					next_state <= s_READ_BEFORE_WRITE;
				end if;
			
			when s_CHECK_MEMORY_CONTENTS =>
				if ((i_data_from_flash = "11111111") and (not (data_reg = "11111111"))) then
					next_state <= s_WRITE_CYCLE;
				else
					next_state <= s_ACKNOWLEDGE;
				end if;
				
			-- Program operation - store a byte into memory
			when s_WRITE_CYCLE =>
				if (i_flash_done = '1') then
					next_state <= s_WRITE_CYCLE_DELAY;
				else
					next_state <= s_WRITE_CYCLE;
				end if;
			
			when s_WRITE_CYCLE_DELAY =>
				if (command_cycle = "011") then
					next_state <= s_WAIT_UNTIL_WRITTEN;
				else
					next_state <= s_WRITE_CYCLE;
				end if;				
			
			-- Keep reading data from the same address until the most significant bits match.
			when s_WAIT_UNTIL_WRITTEN =>
				if (i_flash_done = '1') then
					next_state <= s_CHECK_WRITE_COMPLETE;
				else
					next_state <= s_WAIT_UNTIL_WRITTEN;
				end if;
				
			when s_CHECK_WRITE_COMPLETE =>
				if (i_data_from_flash(7) = data_reg(7)) then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_WAIT_UNTIL_WRITTEN;
				end if;	
						
			-- Erase chip procedure. Set last byte to 0x10. Erase address is set to 0x000AAA.
			when s_ERASE_CHIP =>
				next_state <= s_ERASE_CYCLE;
				
			-- Erase sector procedure. Set last byte to 0x30. Also, erase address is taken from the user.
			when s_ERASE_SECTOR =>
				next_state <= s_ERASE_CYCLE;
				
			-- Erase procedure - common steps.
			when s_ERASE_CYCLE =>
				if (i_flash_done = '1') then
					if (command_cycle = "101") then
						next_state <= s_ERASE_WAIT_COMPLETED;
					else
						next_state <= s_ERASE_CYCLE_DELAY;
					end if;
				else
					next_state <= s_ERASE_CYCLE;
				end if;
							
			when s_ERASE_CYCLE_DELAY =>
				next_state <= s_ERASE_CYCLE;
			 
			-- Keep reading data from a valid sector until the erase operation completes. This means, address originally
			-- supplied by the user since that is the sector being erased. In case of chip erase, any address is valid.
			when s_ERASE_WAIT_COMPLETED =>
				if (i_flash_done = '1') then
					next_state <= s_CHECK_ERASE_DONE;
				else
					next_state <= s_ERASE_WAIT_COMPLETED;
				end if;			
			
			when s_CHECK_ERASE_DONE =>
				if (i_data_from_flash(7) = '1') then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_ERASE_WAIT_COMPLETED;
				end if;
				
			-- Wait for user to deassert request after every operation.
			when s_ACKNOWLEDGE =>
				if ((i_write = '1') or (i_read = '1') or (i_erase = '1')) then
					next_state <= s_ACKNOWLEDGE;		
				else
					next_state <= s_WAIT_COMMAND;		
				end if;
			
			-- Go to WAIT_COMMAND state if you ever lose your way.	
			when others =>
				next_state <= s_WAIT_COMMAND;
				
		end case;
	END PROCESS;
	
	-- Define state assignment
	PROCESS(i_clock, i_reset_n)
	BEGIN
		if (i_reset_n = '0') then
			present_state <= s_WAIT_COMMAND;
		elsif (rising_edge(i_clock)) then
			present_state <= next_state;
		end if;
	END PROCESS;
	
	-- Define Datapath
	PROCESS(i_clock, i_reset_n)
	BEGIN
		if (i_reset_n = '0') then
			address_reg <= (OTHERS => '0');
			data_reg <= (OTHERS => '0');
			command_cycle <= (OTHERS => '0');
			last_erase_byte <= (OTHERS => '0');
			last_erase_address <= (OTHERS => '0');
		elsif (rising_edge(i_clock)) then
			-- Store data and address in their respective registers.
			if (present_state = s_WAIT_COMMAND) then
				address_reg <= i_address;
				data_reg <= i_data;
			end if;
			
			-- Store last byte to send and last address to send during the erase cycle.
			if (present_state = s_ERASE_CHIP) then
				last_erase_byte <= "00010000";
				last_erase_address(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 12) <= (OTHERS => '0');
				last_erase_address(11 downto 0) <= "101010101010";
			elsif (present_state = s_ERASE_SECTOR) then
				last_erase_byte <= "00110000";
				last_erase_address <= address_reg;
			end if;			
			
			-- Command cycle determines which step in a given procedure is under way.
			if (present_state = s_WAIT_COMMAND) then
				command_cycle <= (OTHERS => '0');
			elsif ((present_state = s_ERASE_CYCLE_DELAY) or (present_state = s_WRITE_CYCLE_DELAY)) then
				command_cycle <= command_cycle + '1';
			end if;
			
		end if;
	END PROCESS;

	-- Circuit outputs
	o_done <= '1' when (present_state = s_ACKNOWLEDGE) else '0';
	o_data <= i_data_from_flash;
	
	o_address_to_flash(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 12) <=
			address_reg(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 12) when (((present_state = s_WRITE_CYCLE) and (command_cycle = "011")) or (present_state = s_READ) or
																		(present_state = s_WAIT_UNTIL_WRITTEN) or (present_state = s_ERASE_WAIT_COMPLETED) or (present_state = s_READ_BEFORE_WRITE)) else
			last_erase_address(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 12) when ((present_state = s_ERASE_CYCLE) and (command_cycle = "101")) else
			(OTHERS => '0');
										
	o_address_to_flash(11 downto 0) <= 
			"101010101010"	when ((present_state = s_WRITE_CYCLE) and ((command_cycle = "000") or (command_cycle = "010"))) else
			"010101010101"	when ((present_state = s_WRITE_CYCLE) and (command_cycle = "001")) else
			address_reg(11 downto 0) when (((present_state = s_WRITE_CYCLE) and (command_cycle = "011")) or (present_state = s_READ) or (present_state = s_WAIT_UNTIL_WRITTEN) or (present_state = s_ERASE_WAIT_COMPLETED) or (present_state = s_READ_BEFORE_WRITE)) else
			-- Erase cycle addresses
			"101010101010"	when ((present_state = s_ERASE_CYCLE) and ((command_cycle = "000") or (command_cycle = "010") or (command_cycle = "011"))) else
			"010101010101"	when ((present_state = s_ERASE_CYCLE) and ((command_cycle = "001") or (command_cycle = "100"))) else
			last_erase_address(11 downto 0)	when ((present_state = s_ERASE_CYCLE) and (command_cycle = "101")) else
			(OTHERS => '0');
										
	o_data_to_flash <= 
			"10101010"	when ((present_state = s_ERASE_CYCLE) and ((command_cycle = "000") or (command_cycle = "011"))) else
			"01010101"	when ((present_state = s_ERASE_CYCLE) and ((command_cycle = "001") or (command_cycle = "100"))) else
			"10000000"	when ((present_state = s_ERASE_CYCLE) and (command_cycle = "010")) else
			last_erase_byte	when ((present_state = s_ERASE_CYCLE) and (command_cycle = "101")) else
			"10101010"	when ((present_state = s_WRITE_CYCLE) and (command_cycle = "000")) else
			"01010101"	when ((present_state = s_WRITE_CYCLE) and (command_cycle = "001")) else
			"10100000"	when ((present_state = s_WRITE_CYCLE) and (command_cycle = "010")) else
			data_reg;
						
	o_write_flash <= '1' when ((present_state = s_WRITE_CYCLE) or (present_state = s_ERASE_CYCLE)) else
					 '0';
					 
	o_read_flash <= '1' when ((present_state = s_READ) or (present_state = s_WAIT_UNTIL_WRITTEN) or
							  (present_state = s_ERASE_WAIT_COMPLETED) or
							  (present_state = s_READ_BEFORE_WRITE)) else '0';
	
end rtl;


