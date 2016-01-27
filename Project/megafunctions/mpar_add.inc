FUNCTION mpar_add (data[(width) - (1)..0][(size) - (1)..0], cin, clk, aclr, clken)
    WITH (size, width, REPRESENTATION, LEVEL, TOT_LEVELS, INT_LATENCY, PREV_SING_SIZE, STAGE, TOT_STAGES, BOOTH_ADDER, CREATE_MS_BOOTH_ADDER, MPARADD_OP_MODE)
    RETURNS (result[((size) + (((2) ^ ((tot_levels) - (1))) - ((2) ^ ((level) - (1))))) - (1)..0], clk_out, aclr_out, clken_out);
