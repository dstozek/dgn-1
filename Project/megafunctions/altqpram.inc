---------------------------------------------------------------------------------
-- altqpram.inc
--
-- Altqpram functions header
--
-- (c) Altera Corporation, 2000
--
-- Version 1.0
---------------------------------------------------------------------------------
FUNCTION altqpram	(
						wren_a,
						wren_b,
						data_a[OPERATION_MODE != "ROM" ? WIDTH_WRITE_A - 1 : 1..0],
						data_b[(OPERATION_MODE == "BIDIR_DUAL_PORT" # OPERATION_MODE == "QUAD_PORT")
								? WIDTH_WRITE_B - 1 : 1..0],
						wraddress_a[OPERATION_MODE != "ROM" ? WIDTHAD_WRITE_A - 1 : 1..0],
						wraddress_b[(OPERATION_MODE == "BIDIR_DUAL_PORT" # OPERATION_MODE == "QUAD_PORT") ?
									WIDTHAD_WRITE_B - 1 : 1..0],
						inclock_a,
						inclock_b,
						inclocken_a,
						inclocken_b,
						rden_a,
						rden_b,
						rdaddress_a[(OPERATION_MODE != "BIDIR_DUAL_PORT" & OPERATION_MODE != "SINGLE_PORT") 
									? WIDTHAD_READ_A - 1 : 1..0],
						rdaddress_b[OPERATION_MODE == "QUAD_PORT"
									? WIDTHAD_READ_B - 1 : 1..0],
						outclock_a,
						outclock_b,
						outclocken_a,
						outclocken_b,
						inaclr_a,
						inaclr_b,
						outaclr_a,
						outaclr_b
					)
					WITH
					(
						OPERATION_MODE,
						WIDTH_WRITE_A,
						WIDTHAD_WRITE_A,
						NUMWORDS_WRITE_A,
						INDATA_REG_A,
						INDATA_ACLR_A,
						WRCONTROL_WRADDRESS_REG_A,
						WRCONTROL_ACLR_A,
						WRADDRESS_ACLR_A,
						WIDTH_WRITE_B,
						WIDTHAD_WRITE_B,
						NUMWORDS_WRITE_B,
						INDATA_REG_B,
						INDATA_ACLR_B,
						WRCONTROL_WRADDRESS_REG_B,
						WRCONTROL_ACLR_B,
						WRADDRESS_ACLR_B,
						WIDTH_READ_A,
						WIDTHAD_READ_A,
						NUMWORDS_READ_A,
						RDCONTROL_REG_A,
						RDCONTROL_ACLR_A,
						RDADDRESS_REG_A,
						RDADDRESS_ACLR_A,
						OUTDATA_REG_A,
						OUTDATA_ACLR_A,
						WIDTH_READ_B,
						WIDTHAD_READ_B,
						NUMWORDS_READ_B,
						RDCONTROL_REG_B,
						RDCONTROL_ACLR_B,
						RDADDRESS_REG_B,
						RDADDRESS_ACLR_B,
						OUTDATA_REG_B,
						OUTDATA_ACLR_B,
						INIT_FILE,
						MAXIMUM_DEPTH
					)
					RETURNS
					(
						q_a[(OPERATION_MODE != "SINGLE_PORT" & OPERATION_MODE != "BIDIR_DUAL_PORT") 
							? WIDTH_READ_A - 1 : WIDTH_WRITE_A - 1..0],
						q_b[(OPERATION_MODE == "QUAD_PORT") ?
						WIDTH_READ_B - 1 : (OPERATION_MODE == "BIDIR_DUAL_PORT") ? WIDTH_WRITE_B - 1:
						1..0]
					);
