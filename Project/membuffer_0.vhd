-- membuffer_0.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity membuffer_0 is
	port (
		clk              : in  std_logic                     := '0';             --   clock_reset.clk
		reset            : in  std_logic                     := '0';             --              .reset_n
		sample_clk       : in  std_logic                     := '0';             --    audio_port.export
		delay_time       : in  std_logic_vector(15 downto 0) := (others => '0'); --              .export
		sample_left_in   : in  std_logic_vector(15 downto 0) := (others => '0'); --              .export
		sample_right_in  : in  std_logic_vector(15 downto 0) := (others => '0'); --              .export
		sample_left_out  : out std_logic_vector(15 downto 0);                    --              .export
		sample_right_out : out std_logic_vector(15 downto 0);                    --              .export
		address          : out std_logic_vector(31 downto 0);                    -- avalon_master.address
		read             : out std_logic;                                        --              .read
		readdata         : in  std_logic_vector(31 downto 0) := (others => '0'); --              .readdata
		waitrequest      : in  std_logic                     := '0';             --              .waitrequest
		write            : out std_logic;                                        --              .write
		writedata        : out std_logic_vector(31 downto 0)                     --              .writedata
	);
end entity membuffer_0;

architecture rtl of membuffer_0 is
	component membuffer is
		generic (
			BASE_ADDR : integer := 0
		);
		port (
			clk              : in  std_logic                     := 'X';             --   clock_reset.clk
			reset            : in  std_logic                     := 'X';             --              .reset_n
			sample_clk       : in  std_logic                     := 'X';             --    audio_port.export
			delay_time       : in  std_logic_vector(15 downto 0) := (others => 'X'); --              .export
			sample_left_in   : in  std_logic_vector(15 downto 0) := (others => 'X'); --              .export
			sample_right_in  : in  std_logic_vector(15 downto 0) := (others => 'X'); --              .export
			sample_left_out  : out std_logic_vector(15 downto 0);                    --              .export
			sample_right_out : out std_logic_vector(15 downto 0);                    --              .export
			address          : out std_logic_vector(31 downto 0);                    -- avalon_master.address
			read             : out std_logic;                                        --              .read
			readdata         : in  std_logic_vector(31 downto 0) := (others => 'X'); --              .readdata
			waitrequest      : in  std_logic                     := 'X';             --              .waitrequest
			write            : out std_logic;                                        --              .write
			writedata        : out std_logic_vector(31 downto 0)                     --              .writedata
		);
	end component membuffer;

begin

	membuffer_0 : component membuffer
		generic map (
			BASE_ADDR => 1228800
		)
		port map (
			clk              => clk,              --   clock_reset.clk
			reset            => reset,            --              .reset_n
			sample_clk       => sample_clk,       --    audio_port.export
			delay_time       => delay_time,       --              .export
			sample_left_in   => sample_left_in,   --              .export
			sample_right_in  => sample_right_in,  --              .export
			sample_left_out  => sample_left_out,  --              .export
			sample_right_out => sample_right_out, --              .export
			address          => address,          -- avalon_master.address
			read             => read,             --              .read
			readdata         => readdata,         --              .readdata
			waitrequest      => waitrequest,      --              .waitrequest
			write            => write,            --              .write
			writedata        => writedata         --              .writedata
		);

end architecture rtl; -- of membuffer_0
