FUNCTION alt_ded_mult	(
							dataa[PIPELINE..0][WIDTH_A - 1..0],
							datab[PIPELINE..0][WIDTH_B - 1..0],
							clock,
							clken,
							aclr
						)
						WITH
						(
							WIDTH_A,
							WIDTH_B,
							TERMINATION_LEVEL,
							LEVEL,
							REPRESENTATION,
							PIPELINE,
							LATENCY_REMAINING,
							LEFTMOST,
							RIGHTMOST,
							INDEX,
							PARENT_OVERHANG,
							SIGN_EXTENSION_SUPPRESSION,
							PIPE_INDEX,
							A_REP,
							B_REP
						)
						RETURNS
						(
							result[(WIDTH_A == 1 ? WIDTH_B : WIDTH_B == 1 ? WIDTH_A : WIDTH_A + WIDTH_B) - 1..0],
							msb,
							db_a,
							db_b
						);
