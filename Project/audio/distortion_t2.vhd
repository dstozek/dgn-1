--distortion_t2.vhd
--The distortion effect is in fact a nonlinear gain amplifier.
--It mimicks the way an analog vacuum tube amplifier would saturate (go into overdrive) for higher amplitudes of the input signal.
--This implementation uses two precalculated lookup tables to approximate the desired nonlinear characteristic with a piecewise linear representation.

--The details regarding the algorithm can be found in the technical docs.

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity distortion_t2 is
	port (

		sample_in: in std_logic_vector(15 downto 0);
		sample_out: out std_logic_vector(15 downto 0);
		
		-- params
		asymetric: in std_logic
		
	);
end entity distortion_t2;

architecture beh of distortion_t2 is
	signal abs_sample: std_logic_vector(15 downto 0);
begin
	
	-- avoid overflow on -2^15
	abs_sample <= "1111111111111111" when sample_in = "1000000000000000" else abs(sample_in);

	table_lookup: process(sample_in)
		variable lookup_index: integer range 0 to 2**6-1;
		variable table_y: integer range 0 to 2**15-1;
		variable table_d: integer range 0 to 2**8-1;
		variable ipl_x: integer range 0 to 2**9-1;
		variable abs_out: integer range 0 to 2**15-1;
		variable multied: std_logic_vector(15 downto 0);
		variable neg_out: std_logic_vector(15 downto 0);
	begin
		
		--The desired nonlinear shape has been sampled in 64 equidistant points
		--The lookup index decides which point we should use
		lookup_index := conv_integer('0' & abs_sample(14 downto 9));
		--The remainder (distance from the last sampling point) is used to interpolate the values between
		--sampling points
		ipl_x := conv_integer('0' & abs_sample(8 downto 0));
		
		--Establish the base value and slope for interpolation
		case lookup_index is
			when 0 => table_y := 0; table_d := 127; -- t2(0.000000) = 0.000000, slope = 9.187500
			when 1 => table_y := 4768; table_d := 123; -- t2(0.015873) = 0.145522, slope = 7.687500
			when 2 => table_y := 8766; table_d := 103; -- t2(0.031746) = 0.267519, slope = 6.437500
			when 3 => table_y := 12117; table_d := 86; -- t2(0.047619) = 0.369800, slope = 5.375000
			when 4 => table_y := 14927; table_d := 72; -- t2(0.063492) = 0.455555, slope = 4.500000
			when 5 => table_y := 17283; table_d := 61; -- t2(0.079365) = 0.527461, slope = 3.812500
			when 6 => table_y := 19259; table_d := 51; -- t2(0.095238) = 0.587760, slope = 3.187500
			when 7 => table_y := 20916; table_d := 43; -- t2(0.111111) = 0.638330, slope = 2.687500
			when 8 => table_y := 22306; table_d := 36; -- t2(0.126984) = 0.680747, slope = 2.250000
			when 9 => table_y := 23472; table_d := 30; -- t2(0.142857) = 0.716331, slope = 1.875000
			when 10 => table_y := 24451; table_d := 25; -- t2(0.158730) = 0.746189, slope = 1.562500
			when 11 => table_y := 25272; table_d := 21; -- t2(0.174603) = 0.771249, slope = 1.312500
			when 12 => table_y := 25961; table_d := 18; -- t2(0.190476) = 0.792288, slope = 1.125000
			when 13 => table_y := 26540; table_d := 15; -- t2(0.206349) = 0.809959, slope = 0.937500
			when 14 => table_y := 27027; table_d := 13; -- t2(0.222222) = 0.824807, slope = 0.812500
			when 15 => table_y := 27436; table_d := 11; -- t2(0.238095) = 0.837290, slope = 0.687500
			when 16 => table_y := 27780; table_d := 9; -- t2(0.253968) = 0.847793, slope = 0.562500
			when 17 => table_y := 28070; table_d := 8; -- t2(0.269841) = 0.856638, slope = 0.500000
			when 18 => table_y := 28314; table_d := 6; -- t2(0.285714) = 0.864093, slope = 0.375000
			when 19 => table_y := 28520; table_d := 5; -- t2(0.301587) = 0.870385, slope = 0.312500
			when 20 => table_y := 28695; table_d := 5; -- t2(0.317460) = 0.875705, slope = 0.312500
			when 21 => table_y := 28842; table_d := 4; -- t2(0.333333) = 0.880210, slope = 0.250000
			when 22 => table_y := 28968; table_d := 3; -- t2(0.349206) = 0.884034, slope = 0.187500
			when 23 => table_y := 29074; table_d := 3; -- t2(0.365079) = 0.887288, slope = 0.187500
			when 24 => table_y := 29165; table_d := 2; -- t2(0.380952) = 0.890067, slope = 0.125000
			when 25 => table_y := 29243; table_d := 2; -- t2(0.396825) = 0.892448, slope = 0.125000
			when 26 => table_y := 29310; table_d := 2; -- t2(0.412698) = 0.894498, slope = 0.125000
			when 27 => table_y := 29369; table_d := 2; -- t2(0.428571) = 0.896271, slope = 0.125000
			when 28 => table_y := 29419; table_d := 1; -- t2(0.444444) = 0.897814, slope = 0.062500
			when 29 => table_y := 29463; table_d := 1; -- t2(0.460317) = 0.899165, slope = 0.062500
			when 30 => table_y := 29502; table_d := 1; -- t2(0.476190) = 0.900356, slope = 0.062500
			when 31 => table_y := 29537; table_d := 1; -- t2(0.492063) = 0.901416, slope = 0.062500
			when 32 => table_y := 29568; table_d := 1; -- t2(0.507937) = 0.902367, slope = 0.062500
			when 33 => table_y := 29596; table_d := 1; -- t2(0.523810) = 0.903227, slope = 0.062500
			when 34 => table_y := 29622; table_d := 1; -- t2(0.539683) = 0.904013, slope = 0.062500
			when 35 => table_y := 29646; table_d := 1; -- t2(0.555556) = 0.904738, slope = 0.062500
			when 36 => table_y := 29668; table_d := 1; -- t2(0.571429) = 0.905414, slope = 0.062500
			when 37 => table_y := 29689; table_d := 1; -- t2(0.587302) = 0.906049, slope = 0.062500
			when 38 => table_y := 29709; table_d := 1; -- t2(0.603175) = 0.906651, slope = 0.062500
			when 39 => table_y := 29728; table_d := 1; -- t2(0.619048) = 0.907228, slope = 0.062500
			when 40 => table_y := 29746; table_d := 1; -- t2(0.634921) = 0.907784, slope = 0.062500
			when 41 => table_y := 29763; table_d := 1; -- t2(0.650794) = 0.908325, slope = 0.062500
			when 42 => table_y := 29781; table_d := 1; -- t2(0.666667) = 0.908853, slope = 0.062500
			when 43 => table_y := 29798; table_d := 1; -- t2(0.682540) = 0.909372, slope = 0.062500
			when 44 => table_y := 29815; table_d := 1; -- t2(0.698413) = 0.909885, slope = 0.062500
			when 45 => table_y := 29831; table_d := 1; -- t2(0.714286) = 0.910393, slope = 0.062500
			when 46 => table_y := 29848; table_d := 1; -- t2(0.730159) = 0.910899, slope = 0.062500
			when 47 => table_y := 29864; table_d := 1; -- t2(0.746032) = 0.911405, slope = 0.062500
			when 48 => table_y := 29881; table_d := 1; -- t2(0.761905) = 0.911911, slope = 0.062500
			when 49 => table_y := 29898; table_d := 1; -- t2(0.777778) = 0.912418, slope = 0.062500
			when 50 => table_y := 29914; table_d := 1; -- t2(0.793651) = 0.912927, slope = 0.062500
			when 51 => table_y := 29931; table_d := 1; -- t2(0.809524) = 0.913439, slope = 0.062500
			when 52 => table_y := 29948; table_d := 1; -- t2(0.825397) = 0.913954, slope = 0.062500
			when 53 => table_y := 29965; table_d := 1; -- t2(0.841270) = 0.914473, slope = 0.062500
			when 54 => table_y := 29982; table_d := 1; -- t2(0.857143) = 0.914997, slope = 0.062500
			when 55 => table_y := 29999; table_d := 1; -- t2(0.873016) = 0.915524, slope = 0.062500
			when 56 => table_y := 30017; table_d := 1; -- t2(0.888889) = 0.916056, slope = 0.062500
			when 57 => table_y := 30034; table_d := 1; -- t2(0.904762) = 0.916593, slope = 0.062500
			when 58 => table_y := 30052; table_d := 1; -- t2(0.920635) = 0.917134, slope = 0.062500
			when 59 => table_y := 30070; table_d := 1; -- t2(0.936508) = 0.917680, slope = 0.062500
			when 60 => table_y := 30088; table_d := 1; -- t2(0.952381) = 0.918231, slope = 0.062500
			when 61 => table_y := 30106; table_d := 1; -- t2(0.968254) = 0.918787, slope = 0.062500
			when 62 => table_y := 30125; table_d := 1; -- t2(0.984127) = 0.919347, slope = 0.062500
			when 63 => table_y := 30143; table_d := 0; -- t2(1.000000) = 0.919913, slope = 0.000000
		end case;
		
		--Calculate the interpolation using the distance from the last sampling point and the slope
		multied := conv_std_logic_vector(table_d*ipl_x, 16);
		--Establish the final output by the base value from the last sampling point and the interpolation
		abs_out := table_y + conv_integer('0' & multied(15 downto 4));
		
		--Recover the sign of the sample
		if (sample_in(15) = '0') then -- input positive
			sample_out <= conv_std_logic_vector(abs_out, 16);
		else -- input negative
			neg_out := conv_std_logic_vector(-abs_out, 16);
			--If we want an asymmetric curve, halve the amplitudes below zero
			if (asymetric = '1') then
				sample_out <= "11" & neg_out(14 downto 1);
			else
				sample_out <= neg_out;
			end if;
		end if;
		
	end process;


end architecture beh; 
