---------------------------------------------------------------------------------------------
-- This module is a control circuit that sends and receives data from the Flash Memory circuit.
-- It directly connects to the Flash Memory device. To store and retrieve data from Flash memory,
-- utilize this module to send command sequences to exchange data between the circuit and the
-- flash memory. Please note that while a data read is a single transaction operation, programming data
-- into the Flash memory requires a sequence of commands to be executed prior to writing the
-- data into the memory. Erasing data from flash memory also requires a set of commands to be
-- written to the Flash memory in order.
--
-- IMPORTANT: Flash memory devices only guarantee safe data storage if target memory location
-- is erased prior to writing data to it. Thus, the most effective way of writing data to flash
-- memory is in sector writes. Simply put, select a 64Kbyte sector to write to, erase it and then
-- sequentially fill all memory locations in the sector.
--
-- IMPORTANT: Flash memory devices have a limited lifetime (also called endurance). They can only be
-- written and erased a fixed number of times. The endurance of Flash Memory module on the DE2 board is listed to
-- be 1 million cycles (erase/write operations). Although the number is very high for flash
-- memory technology, improper use of flash memory can lead to its rapid degradation. For example,
-- if the flash memory is used to store intermediate data for an application, and the data changes
-- 1000 times over a single run of the program, this will effectively make the flash memory usable\
-- only 1000 times. Thus, limit the use of this memory to permanent data, that will be stored in
-- the flash memory for prolonged periods of time.
--
-- Author: Tomasz Czajkowski
-- Date: February 4th, 2009
-- NOTES/REVISIONS:
-- February 17, 2009 - This module assumes it is clocked by a 50MHz clock.
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Altera_UP_Flash_Memory_Controller is
	generic (
		FLASH_MEMORY_ADDRESS_WIDTH : integer := 22;
		FLASH_MEMORY_DATA_WIDTH : integer := 8
	);
	port 
	(
		-- Signals to local circuit 
		i_clock : in STD_LOGIC;
		i_reset_n : in STD_LOGIC;
		i_address : in STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
		i_data : in STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		i_read : in STD_LOGIC;
		i_write : in STD_LOGIC;
		o_data : out STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		o_done : out STD_LOGIC;
		
		-- Signals to be connected to Flash chip via proper I/O ports
		o_flash_ce_n : out STD_LOGIC;
		o_flash_oe_n : out STD_LOGIC;
		o_flash_we_n : out STD_LOGIC;
		o_flash_reset_n : out STD_LOGIC;
		o_flash_address : out STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
		b_flash_data : inout STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0)
	);

end entity;


architecture rtl of Altera_UP_Flash_Memory_Controller is

	-- Build an enumerated type for the state machine
	type state_type is (s_RESET, s_WAIT_COMMAND, s_READ, s_WRITE, s_ACKNOWLEDGE);

	-- Register to hold the current state
	signal present_state   	: state_type;
	signal next_state   	: state_type;
	
	-- REGISTERED SIGNALS
	signal data_from_flash 	: std_logic_vector(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
	signal data_to_flash	: std_logic_vector(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
	signal cycle_counter 	: std_logic_vector(4 downto 0);
	signal flash_ce_n, flash_oe_n, flash_we_n, flash_reset_n 	: std_logic;
	signal flash_address 	: STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
	
begin
	-- Define state transitions
	PROCESS(i_read, i_write, cycle_counter, i_address, present_state)
	BEGIN
		case present_state is
			when s_RESET =>
				if (cycle_counter = "11011") then
					next_state <= s_WAIT_COMMAND;
				else
					next_state <= s_RESET;
				end if;
				
			when s_WAIT_COMMAND => 
				if (i_write = '1') then
					next_state <= s_WRITE;
				elsif (i_read = '1') then
					next_state <= s_READ;
				else
					next_state <= s_WAIT_COMMAND;
				end if;
			
			when s_READ =>
				if (cycle_counter = "100") then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_READ;
				end if;
			
			when s_WRITE =>
				if (cycle_counter = "100") then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_WRITE;
				end if;
			
			when s_ACKNOWLEDGE =>
				if ((i_write = '1') or (i_read = '1')) then
					next_state <= s_ACKNOWLEDGE;		
				else
					next_state <= s_WAIT_COMMAND;		
				end if;
				
			when others =>
				next_state <= s_RESET;
				
		end case;
	END PROCESS;
	
	-- Define state assignment
	PROCESS(i_clock, i_reset_n)
	BEGIN
		if (i_reset_n = '0') then
			present_state <= s_RESET;
		elsif (rising_edge(i_clock)) then
			present_state <= next_state;
		end if;
	END PROCESS;
	
	-- Define Datapath
	PROCESS(i_clock, i_reset_n)
	BEGIN
		if (i_reset_n = '0') then
			cycle_counter <= (OTHERS => '0');
			flash_ce_n <= '1';
			flash_oe_n <= '1';
			flash_we_n <= '1';
			flash_reset_n <= '0';
			data_to_flash <= (OTHERS => '1');
			flash_address <= (OTHERS => '1');
		elsif (rising_edge(i_clock)) then
			-- Reset signal.
			if ((present_state = s_RESET) and (cycle_counter < "11001")) then
				flash_reset_n <= '0';
			else
				flash_reset_n <= '1';
			end if;
			
			-- Chip enable
			if ((present_state = s_RESET) or (present_state = s_WAIT_COMMAND) or (present_state = s_ACKNOWLEDGE)) then
				flash_ce_n <= '1';
			else
				flash_ce_n <= '0';
			end if;
			
			-- Cycle counter
			if (present_state = next_state) then
				cycle_counter <= cycle_counter + '1';
			else
				cycle_counter <= (OTHERS => '0');
			end if;
			
			-- Output enable, only after a read cycle.
			if ((present_state = s_READ) and (cycle_counter > "00000")) then
				flash_oe_n <= '0';
			else
				flash_oe_n <= '1';
			end if;
			
			-- Write enable for write operations
			if ((present_state = s_WRITE) and (cycle_counter > "00001")) then
				flash_we_n <= '0';
			else
				flash_we_n <= '1';
			end if;
			
			-- Store output data
			if (present_state = s_READ) then
				data_from_flash <= b_flash_data;
			end if;
			
			-- Store data to write into data_to_flash register.
			if (present_state = s_WAIT_COMMAND) then
				data_to_flash <= i_data;
			end if;
			
			-- Flash address assignment
			flash_address <= i_address;
		end if;
	END PROCESS;

	-- Circuit outputs
	o_done <= '1' when (present_state = s_ACKNOWLEDGE) else '0';
	o_data <= data_from_flash;
	o_flash_ce_n <= flash_ce_n;
	o_flash_oe_n <= flash_oe_n;
	o_flash_we_n <= flash_we_n;
	o_flash_reset_n <= flash_reset_n;
	o_flash_address <= flash_address;	
	b_flash_data <= data_to_flash when (present_state = s_WRITE) else (OTHERS => 'Z');
end rtl;


