FUNCTION mul_boothc (b[(WIDTH-1)..0][2..0], cin[(WIDTH-1)..0], clock, aclr, clken)
    WITH (WIDTH, MS_BIT, OP_MODE)
    RETURNS (sel[(WIDTH-1)..0][2..0], cout[(WIDTH-1)..0], booth_cout[(WIDTH-1)..0]);
