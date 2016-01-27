------------------------------------------------------------------
-- alt_zaccum parameterized megafunction include file
-- Generated with 'clearbox' loader - do not edit
------------------------------------------------------------------
FUNCTION alt_zaccum (
	aclr,
	add_sub,
	cin,
	clken,
	clock,
	data[WIDTH_IN-1..0],
	load_data[WIDTH_OUT-1..0],
	round,
	saturate,
	sign_data,
	zero_accum
)
WITH (
	EXTRA_LATENCY,
	LPM_REPRESENTATION,
	ROUND_FRACTION_WIDTH,
	ROUNDING,
	SATURATION,
	SATURATION_FRACTION_WIDTH,
	WIDTH_FRACTION,
	WIDTH_IN,
	WIDTH_OUT
)
RETURNS (
	cout,
	overflow,
	result[WIDTH_OUT-1..0],
	saturate_overflow
);
