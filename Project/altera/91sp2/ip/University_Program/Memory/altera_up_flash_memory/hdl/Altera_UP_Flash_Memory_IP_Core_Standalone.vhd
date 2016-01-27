----------------------------------------------------------------------------------------------
-- This is a stand-alone Altera University Program IP Core that interfaces with a Flash Memory
-- device on DE1/DE2 board.
--
-- Author: Tomasz Czajkowski
-- Date: February 17th, 2009
-- NOTES/REVISIONS:
----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Altera_UP_Flash_Memory_UP_Core_Standalone is
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

end entity;


architecture rtl of Altera_UP_Flash_Memory_UP_Core_Standalone is
	component Altera_UP_Flash_Memory_Controller is
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
	end component;

	component Altera_UP_Flash_Memory_User_Interface is
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
	end component;
	
	-- Local signals
	signal flash_done : std_logic;
	signal data_from_flash : STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
	signal address_to_flash : STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
	signal data_to_flash : STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
	signal read_flash : STD_LOGIC;
	signal write_flash : STD_LOGIC;
	
	-- Local registers.
	signal data_reg : STD_LOGIC_VECTOR(FLASH_MEMORY_DATA_WIDTH - 1 downto 0);
	signal address_reg : STD_LOGIC_VECTOR(FLASH_MEMORY_ADDRESS_WIDTH - 1 downto 0);
	signal read_reg : std_logic;
	signal write_reg : std_logic;
	signal erase_reg : std_logic;
		
begin
	-- Instantiate components
	process(i_clock, i_read, i_write, i_erase, i_data, i_address)
	begin
		if (rising_edge(i_clock)) then
			read_reg <= i_read;
			write_reg <= i_write;			
			erase_reg <= i_erase;
			data_reg <= i_data;
			address_reg <= i_address;			
		end if;
	end process;
	
	ui: Altera_UP_Flash_Memory_User_Interface
		generic map (
			FLASH_MEMORY_ADDRESS_WIDTH => FLASH_MEMORY_ADDRESS_WIDTH,
			FLASH_MEMORY_DATA_WIDTH => FLASH_MEMORY_DATA_WIDTH
		)
		port map (
			-- Signals to/from user 
			i_clock => i_clock,
			i_reset_n => i_reset_n,
			i_address => address_reg,
			i_data => data_reg,
			i_read => read_reg,
			i_write => write_reg,			
			i_erase => erase_reg,
			o_data => o_data,
			o_done => o_done,
			
			-- Signals to/from Flash Memory Controller
			i_flash_done => flash_done,
			i_data_from_flash => data_from_flash,
			o_address_to_flash => address_to_flash,
			o_data_to_flash => data_to_flash,
			o_read_flash => read_flash,
			o_write_flash => write_flash
		);	
		
	fm: Altera_UP_Flash_Memory_Controller
		generic map (
			FLASH_MEMORY_ADDRESS_WIDTH => FLASH_MEMORY_ADDRESS_WIDTH,
			FLASH_MEMORY_DATA_WIDTH => FLASH_MEMORY_DATA_WIDTH
		)
		port map (
			-- Signals to local circuit 
			i_clock => i_clock,
			i_reset_n => i_reset_n,
			i_address => address_to_flash,
			i_data => data_to_flash,
			i_read => read_flash,
			i_write => write_flash,
			o_data => data_from_flash,
			o_done => flash_done,
			
			-- Signals to be connected to Flash chip via proper I/O ports
			o_flash_ce_n => FL_CE_N,
			o_flash_oe_n => FL_OE_N,
			o_flash_we_n => FL_WE_N,
			o_flash_reset_n => FL_RST_N,
			o_flash_address => FL_ADDR,
			b_flash_data => FL_DQ
		);
end rtl;


