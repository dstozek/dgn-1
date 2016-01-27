FUNCTION stratix_mac_out	(
							dataa[DATAA_WIDTH - 1..0],
							datab[((!((OPERATION_MODE == "TWO_LEVEL_ADDER") # (OPERATION_MODE == "36_BIT_MULTIPLY") # (OPERATION_MODE == "ONE_LEVEL_ADDER"))) ? 1 : DATAB_WIDTH) - 1..0],
							datac[((OPERATION_MODE == "TWO_LEVEL_ADDER") !# (OPERATION_MODE == "36_BIT_MULTIPLY")) ? 1 : DATAC_WIDTH - 1..0],
							datad[((OPERATION_MODE == "TWO_LEVEL_ADDER") !# (OPERATION_MODE == "36_BIT_MULTIPLY")) ? 1 : DATAD_WIDTH - 1..0],
							zeroacc,
							addnsub0,
							addnsub1,
							signa,
							signb,
							clk[3..0],
							aclr[3..0],
							ena[3..0]
						)
						WITH
						(
							OPERATION_MODE,
							DATAA_WIDTH,
							DATAB_WIDTH,
							DATAC_WIDTH,
							DATAD_WIDTH,
							ADDNSUB0_CLOCK,
							ADDNSUB1_CLOCK,
							ZEROACC_CLOCK,
							SIGNA_CLOCK,
							SIGNB_CLOCK,
							OUTPUT_CLOCK,
							ADDNSUB0_CLEAR,
							ADDNSUB1_CLEAR,
							ZEROACC_CLEAR,
							SIGNA_CLEAR,
							SIGNB_CLEAR,
							OUTPUT_CLEAR,
							ADDNSUB0_PIPELINE_CLOCK,
							ADDNSUB1_PIPELINE_CLOCK,
							ZEROACC_PIPELINE_CLOCK,
							SIGNA_PIPELINE_CLOCK,
							SIGNB_PIPELINE_CLOCK,
							ADDNSUB0_PIPELINE_CLEAR,
							ADDNSUB1_PIPELINE_CLEAR,
							ZEROACC_PIPELINE_CLEAR,
							SIGNA_PIPELINE_CLEAR,
							SIGNB_PIPELINE_CLEAR
						)
						RETURNS
						(
							dataout[	((OPERATION_MODE == "OUTPUT_ONLY")		?	DATAA_WIDTH :
										(OPERATION_MODE == "ACCUMULATOR")		?	DATAA_WIDTH + 16 :
										(OPERATION_MODE == "ONE_LEVEL_ADDER")	?	DATAA_WIDTH + 1 :
										(OPERATION_MODE == "TWO_LEVEL_ADDER")	?	DATAA_WIDTH + 2	:
										%OTHERWISE%									DATAA_WIDTH + DATAB_WIDTH)
										- 1..0],
							accoverflow
						);
										
