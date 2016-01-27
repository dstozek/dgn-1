-- Altera_UP_Flash_Memory_IP_Core_Avalon_Interface_0.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Altera_UP_Flash_Memory_IP_Core_Avalon_Interface_0 is
	port (
		i_avalon_chip_select       : in    std_logic                     := '0';             --          flash_data.chipselect
		i_avalon_write             : in    std_logic                     := '0';             --                    .write
		i_avalon_read              : in    std_logic                     := '0';             --                    .read
		i_avalon_address           : in    std_logic_vector(19 downto 0) := (others => '0'); --                    .address
		i_avalon_byteenable        : in    std_logic_vector(3 downto 0)  := (others => '0'); --                    .byteenable
		i_avalon_writedata         : in    std_logic_vector(31 downto 0) := (others => '0'); --                    .writedata
		o_avalon_readdata          : out   std_logic_vector(31 downto 0);                    --                    .readdata
		o_avalon_waitrequest       : out   std_logic;                                        --                    .waitrequest
		i_clock                    : in    std_logic                     := '0';             --          clock_sink.clk
		i_reset_n                  : in    std_logic                     := '0';             --                    .reset_n
		FL_ADDR                    : out   std_logic_vector(21 downto 0);                    --         conduit_end.export
		FL_CE_N                    : out   std_logic;                                        --                    .export
		FL_OE_N                    : out   std_logic;                                        --                    .export
		FL_WE_N                    : out   std_logic;                                        --                    .export
		FL_RST_N                   : out   std_logic;                                        --                    .export
		FL_DQ                      : inout std_logic_vector(7 downto 0)  := (others => '0'); --                    .export
		i_avalon_erase_write       : in    std_logic                     := '0';             -- flash_erase_control.write
		i_avalon_erase_read        : in    std_logic                     := '0';             --                    .read
		i_avalon_erase_byteenable  : in    std_logic_vector(3 downto 0)  := (others => '0'); --                    .byteenable
		i_avalon_erase_writedata   : in    std_logic_vector(31 downto 0) := (others => '0'); --                    .writedata
		i_avalon_erase_chip_select : in    std_logic                     := '0';             --                    .chipselect
		o_avalon_erase_readdata    : out   std_logic_vector(31 downto 0);                    --                    .readdata
		o_avalon_erase_waitrequest : out   std_logic                                         --                    .waitrequest
	);
end entity Altera_UP_Flash_Memory_IP_Core_Avalon_Interface_0;

architecture rtl of Altera_UP_Flash_Memory_IP_Core_Avalon_Interface_0 is
	component Altera_UP_Flash_Memory_IP_Core_Avalon_Interface is
		generic (
			FLASH_MEMORY_ADDRESS_WIDTH : integer := 22
		);
		port (
			i_avalon_chip_select       : in    std_logic                     := 'X';             --          flash_data.chipselect
			i_avalon_write             : in    std_logic                     := 'X';             --                    .write
			i_avalon_read              : in    std_logic                     := 'X';             --                    .read
			i_avalon_address           : in    std_logic_vector(19 downto 0) := (others => 'X'); --                    .address
			i_avalon_byteenable        : in    std_logic_vector(3 downto 0)  := (others => 'X'); --                    .byteenable
			i_avalon_writedata         : in    std_logic_vector(31 downto 0) := (others => 'X'); --                    .writedata
			o_avalon_readdata          : out   std_logic_vector(31 downto 0);                    --                    .readdata
			o_avalon_waitrequest       : out   std_logic;                                        --                    .waitrequest
			i_clock                    : in    std_logic                     := 'X';             --          clock_sink.clk
			i_reset_n                  : in    std_logic                     := 'X';             --                    .reset_n
			FL_ADDR                    : out   std_logic_vector(21 downto 0);                    --         conduit_end.export
			FL_CE_N                    : out   std_logic;                                        --                    .export
			FL_OE_N                    : out   std_logic;                                        --                    .export
			FL_WE_N                    : out   std_logic;                                        --                    .export
			FL_RST_N                   : out   std_logic;                                        --                    .export
			FL_DQ                      : inout std_logic_vector(7 downto 0)  := (others => 'X'); --                    .export
			i_avalon_erase_write       : in    std_logic                     := 'X';             -- flash_erase_control.write
			i_avalon_erase_read        : in    std_logic                     := 'X';             --                    .read
			i_avalon_erase_byteenable  : in    std_logic_vector(3 downto 0)  := (others => 'X'); --                    .byteenable
			i_avalon_erase_writedata   : in    std_logic_vector(31 downto 0) := (others => 'X'); --                    .writedata
			i_avalon_erase_chip_select : in    std_logic                     := 'X';             --                    .chipselect
			o_avalon_erase_readdata    : out   std_logic_vector(31 downto 0);                    --                    .readdata
			o_avalon_erase_waitrequest : out   std_logic                                         --                    .waitrequest
		);
	end component Altera_UP_Flash_Memory_IP_Core_Avalon_Interface;

begin

	altera_up_flash_memory_ip_core_avalon_interface_0 : component Altera_UP_Flash_Memory_IP_Core_Avalon_Interface
		generic map (
			FLASH_MEMORY_ADDRESS_WIDTH => 22
		)
		port map (
			i_avalon_chip_select       => i_avalon_chip_select,       --          flash_data.chipselect
			i_avalon_write             => i_avalon_write,             --                    .write
			i_avalon_read              => i_avalon_read,              --                    .read
			i_avalon_address           => i_avalon_address,           --                    .address
			i_avalon_byteenable        => i_avalon_byteenable,        --                    .byteenable
			i_avalon_writedata         => i_avalon_writedata,         --                    .writedata
			o_avalon_readdata          => o_avalon_readdata,          --                    .readdata
			o_avalon_waitrequest       => o_avalon_waitrequest,       --                    .waitrequest
			i_clock                    => i_clock,                    --          clock_sink.clk
			i_reset_n                  => i_reset_n,                  --                    .reset_n
			FL_ADDR                    => FL_ADDR,                    --         conduit_end.export
			FL_CE_N                    => FL_CE_N,                    --                    .export
			FL_OE_N                    => FL_OE_N,                    --                    .export
			FL_WE_N                    => FL_WE_N,                    --                    .export
			FL_RST_N                   => FL_RST_N,                   --                    .export
			FL_DQ                      => FL_DQ,                      --                    .export
			i_avalon_erase_write       => i_avalon_erase_write,       -- flash_erase_control.write
			i_avalon_erase_read        => i_avalon_erase_read,        --                    .read
			i_avalon_erase_byteenable  => i_avalon_erase_byteenable,  --                    .byteenable
			i_avalon_erase_writedata   => i_avalon_erase_writedata,   --                    .writedata
			i_avalon_erase_chip_select => i_avalon_erase_chip_select, --                    .chipselect
			o_avalon_erase_readdata    => o_avalon_erase_readdata,    --                    .readdata
			o_avalon_erase_waitrequest => o_avalon_erase_waitrequest  --                    .waitrequest
		);

end architecture rtl; -- of Altera_UP_Flash_Memory_IP_Core_Avalon_Interface_0
