FUNCTION muleabz (dataa[(widtha) - (1)..0], datab[(widthb) - (1)..0], clock, aclr, clken)
    WITH (WIDTHA, WIDTHB, A_REPRESENTATION, B_REPRESENTATION, PIPELINE, INPUT_B_IS_CONSTANT, EXT_EAB_OUT_REG, USE_EAB, MAXIMIZE_SPEED)
    RETURNS (result[((widtha) + (widthb)) - (1)..0]);
