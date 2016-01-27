FUNCTION comptree (dataa[(lpm_width) - (1)..0], datab[(lpm_width) - (1)..0], clk, aset, clken)
    WITH (lpm_width, CHAIN_LENGTH, ONE_INPUT_CONSTANT, OUTPUTS_CLOCKED, BURRIED_CLOCKED, MODE)
    RETURNS (aeb, agb);
