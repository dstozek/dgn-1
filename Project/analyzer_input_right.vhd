-- analyzer_input_right.vhd

-- This file was auto-generated as part of a SOPC Builder generate operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity analyzer_input_right is
	port (
		clk      : in  std_logic                      := '0';             --        clock.clk
		reset    : in  std_logic                      := '0';             --             .reset_n
		read     : in  std_logic                      := '0';             -- avalon_slave.read
		readdata : out std_logic_vector(127 downto 0);                    --             .readdata
		x_in     : in  std_logic_vector(63 downto 0)  := (others => '0'); --     audio_in.export
		y_in     : in  std_logic_vector(63 downto 0)  := (others => '0')  --             .export
	);
end entity analyzer_input_right;

architecture rtl of analyzer_input_right is
	component analyzer_input is
		port (
			clk      : in  std_logic                      := 'X';             --        clock.clk
			reset    : in  std_logic                      := 'X';             --             .reset_n
			read     : in  std_logic                      := 'X';             -- avalon_slave.read
			readdata : out std_logic_vector(127 downto 0);                    --             .readdata
			x_in     : in  std_logic_vector(63 downto 0)  := (others => 'X'); --     audio_in.export
			y_in     : in  std_logic_vector(63 downto 0)  := (others => 'X')  --             .export
		);
	end component analyzer_input;

begin

	analyzer_input_right : component analyzer_input
		port map (
			clk      => clk,      --        clock.clk
			reset    => reset,    --             .reset_n
			read     => read,     -- avalon_slave.read
			readdata => readdata, --             .readdata
			x_in     => x_in,     --     audio_in.export
			y_in     => y_in      --             .export
		);

end architecture rtl; -- of analyzer_input_right
