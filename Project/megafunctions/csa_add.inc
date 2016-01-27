DEFINE  L_EVEL(n)   = ((n < 4) ? 0 : 1 + L_EVEL(2*FLOOR(n DIV 3) + (n MOD 3)));

FUNCTION csa_add (data[(width) - (1)..0][(size) - (1)..0])
    WITH (size, width, END_ADDER)
    RETURNS (result[((width == 1) ? (size) : (((size) + (l_evel(width))) + (end_adder))) - (1)..0], carry_out[((width == 1) ? (size) : (((size) + (l_evel(width))) + (end_adder))) - (1)..0]);
