FUNCTION muxlut (data[(SIZE - 1)..0], select[((SIZE == 1) ? (1) : (CEIL(LOG2(SIZE)))) - (1)..0], clock, aclr, clken)
WITH (SIZE, LEVEL, TOT_LEVELS, LATENCY, REM_LATENCY, LOCAL)
RETURNS (result, clock_out, aclr_out, clken_out);
