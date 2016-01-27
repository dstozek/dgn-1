---------------------------------------------------------------------------------------------
-- This is a top level module that functions as an interface between the Flash Memory
-- device and the Avalon Interconnect fabric. This is a top level module that should be used
-- in an SOPC Builder system-based design.
--
-- Note that the i_avalon_address input uses an additional address bit. This is to facilitate the
-- erase_command_register, located after the end of the Flash Memory space. Although only a 32-bit
-- word is used, the address requires an additional bit position.
--
-- Author: Tomasz Czajkowski
-- Date: February 18th, 2009
-- NOTES/REVISIONS:
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Altera_UP_Flash_Memory_IP_Core_Avalon_Interface is
	generic (
		FLASH_MEMORY_ADDRESS_WIDTH : integer := 22;
		FLASH_MEMORY_DATA_WIDTH : integer := 8
	);
	port 
	(
		-- Signals to/from Avalon Interface 
		i_clock : in STD_LOGIC;
		i_reset_n : in STD_LOGIC;
		
		-- Note that avalon interconnect is 32-bit word addressable, so it requires 2 fewer bits to represent address location.
		i_avalon_chip_select	: in STD_LOGIC;
		i_avalon_write			: in STD_LOGIC;
		i_avalon_read			: in STD_LOGIC;
		i_avalon_address 		: in STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH-3 downto 0);
		i_avalon_byteenable		: in STD_LOGIC_VECTOR(3 downto 0);
		i_avalon_writedata 		: in STD_LOGIC_VECTOR(31 downto 0);
		o_avalon_readdata 		: out STD_LOGIC_VECTOR(31 downto 0);
		o_avalon_waitrequest	: out STD_LOGIC;
		
		i_avalon_erase_chip_select	: in STD_LOGIC;
		i_avalon_erase_write		: in STD_LOGIC;
		i_avalon_erase_read			: in STD_LOGIC;
		i_avalon_erase_byteenable	: in STD_LOGIC_VECTOR(3 downto 0);
		i_avalon_erase_writedata 	: in STD_LOGIC_VECTOR(31 downto 0);
		o_avalon_erase_readdata 	: out STD_LOGIC_VECTOR(31 downto 0);
		o_avalon_erase_waitrequest	: out STD_LOGIC;		
		
		-- Signals to be connected to Flash chip via proper I/O ports
		FL_ADDR : out STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
		FL_DQ : inout STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
		FL_CE_N,
		FL_OE_N,
		FL_WE_N,
		FL_RST_N : out STD_LOGIC
	);

end entity;


architecture rtl of Altera_UP_Flash_Memory_IP_Core_Avalon_Interface is
	component Altera_UP_Flash_Memory_UP_Core_Standalone is
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
			i_read,
			i_write,
			i_erase : in STD_LOGIC;
			o_data : out STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
			o_done : out STD_LOGIC;
			
			-- Signals to be connected to Flash chip via proper I/O ports
			FL_ADDR : out STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
			FL_DQ : inout STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
			FL_CE_N,
			FL_OE_N,
			FL_WE_N,
			FL_RST_N : out STD_LOGIC
		);
	end component;
	
	-- FSM State Declaration
	type state_type is (s_WAIT, s_CHECK_READ, s_READ, s_READ_NEXT_BYTE, s_CHECK_WRITE, s_WRITE, s_WRITE_NEXT_BYTE, s_ERASE, s_ACKNOWLEDGE);

	-- State registers and next state variables
	signal present_state, next_state : state_type;
	
	-- Local signals
	signal flash_write, flash_read, flash_erase, flash_done : std_logic;
	signal flash_out : std_logic_vector(FLASH_MEMORY_DATA_WIDTH-1 downto 0);
	signal erase_reg_addr : std_logic;
	
	-- Local Registers
	signal read_data, write_data : std_logic_vector(31 downto 0);
	signal byteenable : std_logic_vector(3 downto 0);
	signal counter : std_logic_vector(1 downto 0);
	signal erase_register : std_logic_vector(31 downto 0);
	signal address : std_logic_vector(FLASH_MEMORY_ADDRESS_WIDTH-3 downto 0);
	signal address_lines : std_logic_vector(FLASH_MEMORY_ADDRESS_WIDTH-1 downto 0);
begin
	-- State transitions
	process(i_avalon_write, i_avalon_read, present_state, erase_reg_addr, flash_done, counter, byteenable, i_avalon_erase_chip_select, i_avalon_chip_select, i_avalon_erase_write, i_avalon_erase_read)
	begin
		case present_state is
			when s_WAIT =>
				if (i_avalon_chip_select = '1') then
					-- Check if the operation is read/write or erase
					if (i_avalon_write = '1') then
						next_state <= s_CHECK_WRITE;
					elsif (i_avalon_read = '1') then
						next_state <= s_CHECK_READ;
					else
						next_state <= s_WAIT;
					end if;
				elsif ((i_avalon_erase_chip_select = '1') and (i_avalon_erase_write = '1')) then
					next_state <= s_ERASE;
				else
					next_state <= s_WAIT;
				end if;
			
			when s_CHECK_READ =>
				if (byteenable(0) = '1') then
					next_state <= s_READ;
				else
					next_state <= s_READ_NEXT_BYTE;
				end if;
				
			when s_READ =>
				if (flash_done = '1') then
					next_state <= s_READ_NEXT_BYTE;
				else
					next_state <= s_READ;
				end if;
			
			when s_READ_NEXT_BYTE =>
				if (counter = "11") then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_CHECK_READ;
				end if;
			
			when s_CHECK_WRITE => 
				if (byteenable(0) = '1') then
					next_state <= s_WRITE;
				else
					next_state <= s_WRITE_NEXT_BYTE;
				end if;
							
			when s_WRITE =>
				if (flash_done = '1') then
					next_state <= s_WRITE_NEXT_BYTE;
				else
					next_state <= s_WRITE;
				end if;
							
			when s_WRITE_NEXT_BYTE =>
				if (counter = "11") then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_CHECK_WRITE;
				end if;
				
			when s_ERASE =>
				if (flash_done = '1') then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_ERASE;
				end if;			
			
			when s_ACKNOWLEDGE =>
				if ((i_avalon_write = '1') or (i_avalon_read = '1') or (i_avalon_erase_read = '1') or (i_avalon_erase_write = '1')) then
					next_state <= s_ACKNOWLEDGE;
				else
					next_state <= s_WAIT;
				end if;
				
			when OTHERS =>
				next_state <= s_WAIT;
		end case;
	end process;
	
	-- State Registers
	process(i_clock, i_reset_n)
	begin
		if (i_reset_n = '0') then
			present_state <= s_WAIT;
		elsif (rising_edge(i_clock)) then
			present_state <= next_state;
		end if;
	end process;
	
	flash_write <= '1' when (present_state = s_WRITE) else '0';
	flash_read <= '1'  when (present_state = s_READ) else '0';
	flash_erase <= '1' when (present_state = s_ERASE) else '0';
	
	-- Datapath
	process(i_clock, i_reset_n, present_state, i_avalon_erase_writedata)
	begin
		if (i_reset_n = '0') then
			read_data <= (OTHERS => '0');
			write_data <= (OTHERS => '0');
			byteenable <= (OTHERS => '0');
			counter <= (OTHERS => '0');
			erase_register <= (OTHERS => '0');
			address <= (OTHERS => '0');
		elsif (rising_edge(i_clock)) then
			if (present_state = s_WAIT) then
				address <= i_avalon_address(FLASH_MEMORY_ADDRESS_WIDTH-3 downto 0);
				counter <= (OTHERS => '0');
				byteenable <= i_avalon_byteenable;
				read_data <= (OTHERS => '0');
				write_data <= i_avalon_writedata;
				-- Erase register 
				if ((i_avalon_erase_write = '1') and (i_avalon_erase_chip_select = '1')) then
					if (i_avalon_erase_byteenable(0) = '1') then
						erase_register(7 downto 0) <= i_avalon_erase_writedata(7 downto 0);
					end if;
					if (i_avalon_erase_byteenable(1) = '1') then
						erase_register(15 downto 8) <= i_avalon_erase_writedata(15 downto 8);
					end if;
					if (i_avalon_erase_byteenable(2) = '1') then
						erase_register(23 downto 16) <= i_avalon_erase_writedata(23 downto 16);
					end if;
					if (i_avalon_erase_byteenable(3) = '1') then
						erase_register(31 downto 24) <= i_avalon_erase_writedata(31 downto 24);
					end if;
				end if;
			end if;
			if ((present_state = s_READ_NEXT_BYTE) or (present_state = s_WRITE_NEXT_BYTE)) then
				byteenable(2 downto 0) <= byteenable(3 downto 1);
				byteenable(3) <= '0';
				counter <= counter + '1';
				read_data(23 downto 0) <= read_data(31 downto 8);
				read_data(31 downto 24) <= flash_out;
				write_data(23 downto 0) <= write_data(31 downto 8);
				write_data(31 downto 24) <= (OTHERS => '0');
			end if;
		end if;
	end process;
	
	-- FSM Outputs
	o_avalon_waitrequest <= '0' when (	(present_state = s_ACKNOWLEDGE) or
										((present_state = s_WAIT) and (i_avalon_erase_chip_select = '1') and (i_avalon_read = '1')))
							else '1';
							
	o_avalon_erase_waitrequest <= '0' when ((present_state = s_ACKNOWLEDGE) or
											((present_state = s_WAIT) and (i_avalon_erase_chip_select = '1') and (i_avalon_read = '1')))
							else '1';
								
	o_avalon_readdata <= read_data;
	o_avalon_erase_readdata <= erase_register;
	
	address_lines <= 	(address & counter) when (i_avalon_chip_select = '1') else
						erase_register(FLASH_MEMORY_ADDRESS_WIDTH-1 downto 0);
						
	-- Instantiate components
	flash_mem_interface: Altera_UP_Flash_Memory_UP_Core_Standalone
		generic map (
			FLASH_MEMORY_ADDRESS_WIDTH => FLASH_MEMORY_ADDRESS_WIDTH,
			FLASH_MEMORY_DATA_WIDTH => FLASH_MEMORY_DATA_WIDTH
		)
		port map (
			-- Signals to/from user
			i_clock => i_clock,
			i_reset_n => i_reset_n,
			i_address => address_lines,
			i_data => write_data(FLASH_MEMORY_DATA_WIDTH - 1 downto 0),
			i_read => flash_read,
			i_write => flash_write,			
			i_erase => flash_erase,
			o_data => flash_out,
			o_done => flash_done, 
			
			-- Signals to be connected to Flash chip via proper I/O ports
			FL_ADDR => FL_ADDR,
			FL_DQ => FL_DQ,
			FL_CE_N => FL_CE_N,
			FL_OE_N => FL_OE_N,
			FL_WE_N => FL_WE_N,
			FL_RST_N => FL_RST_N
		);	

end rtl;
