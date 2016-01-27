FUNCTION alt_ded_mult_y	(
							dataa[WIDTH_A - 1..0],
							datab[WIDTH_B - 1..0],
							clock[3..0],
							ena[3..0],
							aclr[3..0],
							signa,
							signb
						)
						WITH
						(
							WIDTH_A,
							WIDTH_B,
							PIPELINE,
							LEVEL,
							LATENCY_REMAINING,
							REPRESENTATION_A,
							REPRESENTATION_B,
							INPUT_REG_A,
							INPUT_ACLR_A,
							INPUT_REG_B,
							INPUT_ACLR_B,
							OUTPUT_REG,
							OUTPUT_ACLR,
							SIGN_REG_A,
							SIGN_ACLR_A,
							SIGN_REG_B,
							SIGN_ACLR_B,
							EXTERNAL_STAGE_COUNTER,
							DEDICATED_MULTIPLIER_CIRCUITRY,
							SUB_DEDICATED_MULTIPLIER_CIRCUITRY,
							PIPELINE_REG,
							PIPELINE_CLEAR
						)
						RETURNS
						(
							result[WIDTH_A + WIDTH_B - 1..0],
							scanouta[WIDTH_A - 1..0],
							scanoutb[WIDTH_B - 1..0],
							signa_out,
							signb_out
						);
