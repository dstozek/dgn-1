////////////////////////////////////////////////////////////////////
//
//   SLD_VIRTUAL_JTAG_BASIC Parameterized Megafunction
//
//  (C) Altera   
//  Your use of Altera Corporation's design tools, logic functions  
//  and other software and tools, and its AMPP partner logic  
//  functions, and any output files from any of the foregoing  
//  (including device programming or simulation files), and any  
//  associated documentation or information are expressly subject  
//  to the terms and conditions of the Altera Program License  
//  Subscription Agreement, Altera MegaCore Function License  
//  Agreement, or other applicable license agreement, including,  
//  without limitation, that your use is for the sole purpose of  
//  programming logic devices manufactured by Altera and sold by  
//  Altera or its authorized distributors.  Please refer to the  
//  applicable agreement for further details. 
//  
//  9.1 Build 350  10/07/2009   
//
//	Version 1.0

//************************************************************
// Description:
//
// This module contains sld_virtual_jtag_basic megafunction
//************************************************************

// synthesis VERILOG_INPUT_VERSION VERILOG_2001

module sld_virtual_jtag_basic
(
	tck,					// output	JTAG test clock  (shared among all instances)
	tdi,					// output	JTAG test data input (shared among all instances)
	ir_in,					// output	Virtual IR

	tdo,					// input	Virtual JTAG test data out
	ir_out,					// input	Virtual IR capture port	

	virtual_state_cdr,		// output	Signals that this instance is in the virtual Capture_DR state
	virtual_state_sdr,		// output	Signals that this instance is in the virtual Shift_DR state
	virtual_state_e1dr,		// output	Signals that this instance is in the virtual Exit1_DR state
	virtual_state_pdr,		// output	Signals that this instance is in the virtual Pause_DR state
	virtual_state_e2dr,		// output	Signals that this instance is in the virtual Exit2_DR state
	virtual_state_udr,		// output	Signals that this instance is in the virtual Update_DR state
	virtual_state_cir,		// output	Signals that this instance is in the virtual Capture_IR state
	virtual_state_uir,		// output	Signals that this instance is in the virtual Update_IR state

	// Low-level JTAG signals
	tms,					// output	JTAG test mode select signal (shared among all instances)
	jtag_state_tlr,			// output	Signals that the JSM is in the Test_Logic_Reset state (shared among all instances)
	jtag_state_rti,			// output	Signals that the JSM is in the Run_Test/Idle state (shared among all instances)
	jtag_state_sdrs,		// output	Signals that the JSM is in the Select_DR_Scan state (shared among all instances)
	jtag_state_cdr,			// output	Signals that the JSM is in the Capture_DR state (shared among all instances)
	jtag_state_sdr,			// output	Signals that the JSM is in the Shift_DR state (shared among all instances)
	jtag_state_e1dr,		// output	Signals that the JSM is in the Exit1_DR state (shared among all instances)
	jtag_state_pdr,			// output	Signals that the JSM is in the Pause_DR state (shared among all instances)
	jtag_state_e2dr,		// output	Signals that the JSM is in the Exit2_DR state (shared among all instances)
	jtag_state_udr,			// output	Signals that the JSM is in the Update_DR state (shared among all instances)
	jtag_state_sirs,		// output	Signals that the JSM is in the Select_IR_Scan state (shared among all instances)
	jtag_state_cir,			// output	Signals that the JSM is in the Capture_IR state (shared among all instances)
	jtag_state_sir,			// output	Signals that the JSM is in the Shift_IR state (shared among all instances)
	jtag_state_e1ir,		// output	Signals that the JSM is in the Exit1_IR state (shared among all instances)
	jtag_state_pir,			// output	Signals that the JSM is in the Pause_IR state (shared among all instances)
	jtag_state_e2ir,		// output	Signals that the JSM is in the Exit2_IR state (shared among all instances)
	jtag_state_uir			// output	Signals that the JSM is in the Update_IR state (shared among all instances)
);

	parameter	sld_mfg_id = 0;						// Manufacture ID code assigned by JEDEC standard body or Altera. Valid range: 0 - 2047
	parameter	sld_type_id = 0;					// Type identifier within one manufacture used to separate the function. Valid range: 0 - 255
	parameter	sld_version = 0;					// IP version numbering for the specified type. Valid range: 0 - 31
	parameter	sld_instance_index = 0;				// Instance id; it must be unique for each instance in a project. Valid range: 0 - 255
	parameter	sld_auto_instance_index = "NO";
	parameter	sld_ir_width = 1;
	parameter	sld_sim_n_scan = 0;
	parameter	sld_sim_action = "UNUSED";
	parameter	sld_sim_total_length = 0;

	parameter	lpm_type = "sld_virtual_jtag_basic";
	parameter	lpm_hint = "UNUSED";

	// High-level Virtual JTAG signals
	output	tck;					// JTAG test clock  (shared among all instances)
	output	tdi;					// JTAG test data input (shared among all instances)
	output	[sld_ir_width - 1 : 0 ] ir_in;					// Virtual IR

	input	tdo;					// Virtual JTAG test data out
	input	[sld_ir_width - 1 : 0 ] ir_out;				// Virtual IR capture port	

	output	virtual_state_cdr;		// Signals that this instance is in the virtual Capture_DR state (shared among all instances)
	output	virtual_state_sdr;		// Signals that this instance is in the virtual Shift_DR state (shared among all instances)
	output	virtual_state_e1dr;		// Signals that this instance is in the virtual Exit1_DR state (shared among all instances)
	output	virtual_state_pdr;		// Signals that this instance is in the virtual Pause_DR state (shared among all instances)
	output	virtual_state_e2dr;		// Signals that this instance is in the virtual Exit2_DR state (shared among all instances)
	output	virtual_state_udr;		// Signals that this instance is in the virtual Update_DR state (shared among all instances)
	output	virtual_state_cir;		// Signals that this instance is in the virtual Capture_IR state (shared among all instances)
	output	virtual_state_uir;		// Signals that this instance is in the virtual Update_IR state (shared among all instances)

	// Low-level JTAG signals
	output	tms;					// JTAG test mode select signal (shared among all instances)
	output	jtag_state_tlr;			// Signals that the JSM is in the Test_Logic_Reset state (shared among all instances)
	output	jtag_state_rti;			// Signals that the JSM is in the Run_Test/Idle state (shared among all instances)
	output	jtag_state_sdrs;		// Signals that the JSM is in the Select_DR_Scan state (shared among all instances)
	output	jtag_state_cdr;			// Signals that the JSM is in the Capture_DR state (shared among all instances)
	output	jtag_state_sdr;			// Signals that the JSM is in the Shift_DR state (shared among all instances)
	output	jtag_state_e1dr;		// Signals that the JSM is in the Exit1_DR state (shared among all instances)
	output	jtag_state_pdr;			// Signals that the JSM is in the Pause_DR state (shared among all instances)
	output	jtag_state_e2dr;		// Signals that the JSM is in the Exit2_DR state (shared among all instances)
	output	jtag_state_udr;			// Signals that the JSM is in the Update_DR state (shared among all instances)
	output	jtag_state_sirs;		// Signals that the JSM is in the Select_IR_Scan state (shared among all instances)
	output	jtag_state_cir;			// Signals that the JSM is in the Capture_IR state (shared among all instances)
	output	jtag_state_sir;			// Signals that the JSM is in the Shift_IR state (shared among all instances)
	output	jtag_state_e1ir;		// Signals that the JSM is in the Exit1_IR state (shared among all instances)
	output	jtag_state_pir;			// Signals that the JSM is in the Pause_IR state (shared among all instances)
	output	jtag_state_e2ir;		// Signals that the JSM is in the Exit2_IR state (shared among all instances)
	output	jtag_state_uir;			// Signals that the JSM is in the Update_IR state (shared among all instances)

	
	sld_virtual_jtag_impl sld_virtual_jtag_impl_inst
	(
		.usr_tck(tck),
		.usr_tdi(tdi),
		.usr_ir_in(ir_in),
		.usr_tdo(tdo),
		.usr_ir_out(ir_out),
		.usr_virtual_state_cdr(virtual_state_cdr),
		.usr_virtual_state_sdr(virtual_state_sdr),
		.usr_virtual_state_e1dr(virtual_state_e1dr),
		.usr_virtual_state_pdr(virtual_state_pdr),
		.usr_virtual_state_e2dr(virtual_state_e2dr),
		.usr_virtual_state_udr(virtual_state_udr),
		.usr_virtual_state_cir(virtual_state_cir),
		.usr_virtual_state_uir(virtual_state_uir),
		.usr_tms(tms),
		.usr_jtag_state_tlr(jtag_state_tlr),
		.usr_jtag_state_rti(jtag_state_rti),
		.usr_jtag_state_sdrs(jtag_state_sdrs),
		.usr_jtag_state_cdr(jtag_state_cdr),
		.usr_jtag_state_sdr(jtag_state_sdr),
		.usr_jtag_state_e1dr(jtag_state_e1dr),
		.usr_jtag_state_pdr(jtag_state_pdr),
		.usr_jtag_state_e2dr(jtag_state_e2dr),
		.usr_jtag_state_udr(jtag_state_udr),
		.usr_jtag_state_sirs(jtag_state_sirs),
		.usr_jtag_state_cir(jtag_state_cir),
		.usr_jtag_state_sir(jtag_state_sir),
		.usr_jtag_state_e1ir(jtag_state_e1ir),
		.usr_jtag_state_pir(jtag_state_pir),
		.usr_jtag_state_e2ir(jtag_state_e2ir),
		.usr_jtag_state_uir(jtag_state_uir)
	);
	defparam sld_virtual_jtag_impl_inst.sld_mfg_id = sld_mfg_id;
	defparam sld_virtual_jtag_impl_inst.sld_type_id = sld_type_id;
	defparam sld_virtual_jtag_impl_inst.sld_version = sld_version;
	defparam sld_virtual_jtag_impl_inst.sld_instance_index = sld_instance_index;
	defparam sld_virtual_jtag_impl_inst.sld_auto_instance_index = sld_auto_instance_index;
	defparam sld_virtual_jtag_impl_inst.sld_ir_width = sld_ir_width;
endmodule 


module sld_virtual_jtag_impl
(
	//
	// Design Interface
	//
	
	usr_tck,					// output	JTAG test clock  (shared among all instances)
	usr_tdi,					// output	JTAG test data input (shared among all instances)
	usr_ir_in,					// output	Virtual IR

	usr_tdo,					// input	JTAG test data out
	usr_ir_out,					// input	Virtual IR capture port	

	usr_virtual_state_cdr,		// output	Signals that this instance is in the virtual Capture_DR state
	usr_virtual_state_sdr,		// output	Signals that this instance is in the virtual Shift_DR state
	usr_virtual_state_e1dr,		// output	Signals that this instance is in the virtual Exit1_DR state
	usr_virtual_state_pdr,		// output	Signals that this instance is in the virtual Pause_DR state
	usr_virtual_state_e2dr,		// output	Signals that this instance is in the virtual Exit2_DR state
	usr_virtual_state_udr,		// output	Signals that this instance is in the virtual Update_DR state
	usr_virtual_state_cir,		// output	Signals that this instance is in the virtual Capture_IR state
	usr_virtual_state_uir,		// output	Signals that this instance is in the virtual Update_IR state

	// Low-level JTAG signals
	usr_tms,					// output	JTAG test mode select signal (shared among all instances)
	usr_jtag_state_tlr,			// output	Signals that the JSM is in the Test_Logic_Reset state (shared among all instances)
	usr_jtag_state_rti,			// output	Signals that the JSM is in the Run_Test/Idle state (shared among all instances)
	usr_jtag_state_sdrs,		// output	Signals that the JSM is in the Select_DR_Scan state (shared among all instances)
	usr_jtag_state_cdr,			// output	Signals that the JSM is in the Capture_DR state (shared among all instances)
	usr_jtag_state_sdr,			// output	Signals that the JSM is in the Shift_DR state (shared among all instances)
	usr_jtag_state_e1dr,		// output	Signals that the JSM is in the Exit1_DR state (shared among all instances)
	usr_jtag_state_pdr,			// output	Signals that the JSM is in the Pause_DR state (shared among all instances)
	usr_jtag_state_e2dr,		// output	Signals that the JSM is in the Exit2_DR state (shared among all instances)
	usr_jtag_state_udr,			// output	Signals that the JSM is in the Update_DR state (shared among all instances)
	usr_jtag_state_sirs,		// output	Signals that the JSM is in the Select_IR_Scan state (shared among all instances)
	usr_jtag_state_cir,			// output	Signals that the JSM is in the Capture_IR state (shared among all instances)
	usr_jtag_state_sir,			// output	Signals that the JSM is in the Shift_IR state (shared among all instances)
	usr_jtag_state_e1ir,		// output	Signals that the JSM is in the Exit1_IR state (shared among all instances)
	usr_jtag_state_pir,			// output	Signals that the JSM is in the Pause_IR state (shared among all instances)
	usr_jtag_state_e2ir,		// output	Signals that the JSM is in the Exit2_IR state (shared among all instances)
	usr_jtag_state_uir,			// output	Signals that the JSM is in the Update_IR state (shared among all instances)	

	//
	// SLD_HUB Interface
	//
	//  DO NOT TOUCH AND CHANGE THE FOLLOWING PORTS
	// 
	raw_tck,			// Input	JTAG test clock  (shared among all instances)
	raw_tms,			// Input	JTAG test mode select signal (shared among all instances)
	tdi,				// Input	JTAG test data input (shared among all instances)
	jtag_state_tlr,		// Input	Signals that the JSM  is in the Test_Logic_Reset state (shared among all instances)
	jtag_state_rti,		// Input	Signals that the JSM is in the Run_Test/Idle state (shared among all instances)
	jtag_state_sdrs,	// Input	Signals that the JSM is in the Select_DR_Scan state (shared among all instances)
	jtag_state_cdr,		// Input	Signals that the JSM is in the Capture_DR state (shared among all instances)
	jtag_state_sdr,		// Input	Signals that the JSM is in the Shift_DR state (shared among all instances)
	jtag_state_e1dr,	// Input	Signals that the JSM is in the Exit1_DR state (shared among all instances)
	jtag_state_pdr,		// Input	Signals that the JSM is in the Pause_DR state (shared among all instances)
	jtag_state_e2dr,	// Input	Signals that the JSM is in the Exit2_DR state (shared among all instances)
	jtag_state_udr,		// Input	Signals that the JSM is in the Update_DR state (shared among all instances)
	jtag_state_sirs,	// Input	Signals that the JSM is in the Select_IR_Scan state (shared among all instances)
	jtag_state_cir,		// Input	Signals that the JSM is in the Capture_IR state (shared among all instances)
	jtag_state_sir,		// Input	Signals that the JSM is in the Shift_IR state (shared among all instances)
	jtag_state_e1ir,	// Input	Signals that the JSM is in the Exit1_IR state (shared among all instances)
	jtag_state_pir,		// Input	Signals that the JSM is in the Pause_IR state (shared among all instances)
	jtag_state_e2ir,	// Input	Signals that the JSM is in the Exit2_IR state (shared among all instances)
	jtag_state_uir,		// Input	Signals that the JSM is in the Update_IR state (shared among all instances)
	usr1,				// Input	Signals that the current instruction in the JSM is the USER1 instruction (shared among all instances)
	clr,				// Input	Asynchronous clear (shared among all instances) 
	ena,				// Input	Indicates that the current instruction in the Hub is for this instance  
	ir_in,				// Input	Virtual IR

	tdo,				// Output	JTAG test data out
	ir_out				// Output	Virtual IR capture port	
);
	parameter	sld_mfg_id = 0;						// Manufacture ID code assigned by JEDEC standard body or Altera. Valid range: 0 - 2047
	parameter	sld_type_id = 0;					// Type identifier within one manufacture used to separate the function. Valid range: 0 - 255
	parameter	sld_version = 0;					// IP version numbering for the specified type. Valid range: 0 - 31
	parameter	sld_instance_index = 0;				// Instance id; it must be unique for each instance in a project. Valid range: 0 - 255
	parameter	sld_auto_instance_index = "NO";
	parameter	sld_ir_width = 1;

	`define 	MASK_11_BITS 2047
	`define		MASK_8_BITS 255
	`define		MASK_5_BITS 31

	`define		INST_BIT_INDEX 0
	`define		MFG_BIT_INDEX 8
	`define		TYPE_BIT_INDEX 19
	`define		VERION_BIT_INDEX 27
	
	parameter	SLD_NODE_INFO = 
		(sld_instance_index & `MASK_8_BITS ) << `INST_BIT_INDEX |
		(sld_mfg_id & `MASK_11_BITS) << `MFG_BIT_INDEX |
		(sld_type_id & `MASK_8_BITS ) << `TYPE_BIT_INDEX |
		(sld_version & `MASK_5_BITS ) << `VERION_BIT_INDEX;

	// High-level Virtual JTAG signals
	output	usr_tck;					// JTAG test clock  (shared among all instances)
	output	usr_tdi;					// JTAG test data input (shared among all instances)
	output	[sld_ir_width - 1 : 0 ] usr_ir_in;					// Virtual IR

	input	usr_tdo;					// Virtual JTAG test data out
	input	[sld_ir_width - 1 : 0 ] usr_ir_out;				// Virtual IR capture port	

	output	usr_virtual_state_cdr;		// Signals that this instance is in the virtual Capture_DR state (shared among all instances)
	output	usr_virtual_state_sdr;		// Signals that this instance is in the virtual Shift_DR state (shared among all instances)
	output	usr_virtual_state_e1dr;		// Signals that this instance is in the virtual Exit1_DR state (shared among all instances)
	output	usr_virtual_state_pdr;		// Signals that this instance is in the virtual Pause_DR state (shared among all instances)
	output	usr_virtual_state_e2dr;		// Signals that this instance is in the virtual Exit2_DR state (shared among all instances)
	output	usr_virtual_state_udr;		// Signals that this instance is in the virtual Update_DR state (shared among all instances)
	output	usr_virtual_state_cir;		// Signals that this instance is in the virtual Capture_IR state (shared among all instances)
	output	usr_virtual_state_uir;		// Signals that this instance is in the virtual Update_IR state (shared among all instances)

	// Low-level JTAG signals
	output	usr_tms;					// JTAG test mode select signal (shared among all instances)
	output	usr_jtag_state_tlr;			// Signals that the JSM is in the Test_Logic_Reset state (shared among all instances)
	output	usr_jtag_state_rti;			// Signals that the JSM is in the Run_Test/Idle state (shared among all instances)
	output	usr_jtag_state_sdrs;		// Signals that the JSM is in the Select_DR_Scan state (shared among all instances)
	output	usr_jtag_state_cdr;			// Signals that the JSM is in the Capture_DR state (shared among all instances)
	output	usr_jtag_state_sdr;			// Signals that the JSM is in the Shift_DR state (shared among all instances)
	output	usr_jtag_state_e1dr;		// Signals that the JSM is in the Exit1_DR state (shared among all instances)
	output	usr_jtag_state_pdr;			// Signals that the JSM is in the Pause_DR state (shared among all instances)
	output	usr_jtag_state_e2dr;		// Signals that the JSM is in the Exit2_DR state (shared among all instances)
	output	usr_jtag_state_udr;			// Signals that the JSM is in the Update_DR state (shared among all instances)
	output	usr_jtag_state_sirs;		// Signals that the JSM is in the Select_IR_Scan state (shared among all instances)
	output	usr_jtag_state_cir;			// Signals that the JSM is in the Capture_IR state (shared among all instances)
	output	usr_jtag_state_sir;			// Signals that the JSM is in the Shift_IR state (shared among all instances)
	output	usr_jtag_state_e1ir;		// Signals that the JSM is in the Exit1_IR state (shared among all instances)
	output	usr_jtag_state_pir;			// Signals that the JSM is in the Pause_IR state (shared among all instances)
	output	usr_jtag_state_e2ir;		// Signals that the JSM is in the Exit2_IR state (shared among all instances)
	output	usr_jtag_state_uir;			// Signals that the JSM is in the Update_IR state (shared among all instances)

	//
	// SLD_HUB Signal Interface
	// 
	input	raw_tck;			// JTAG test clock  (shared)
	input	raw_tms;			// JTAG test mode select signal (shared)
	input	tdi;				// JTAG test data input (shared)
	input	jtag_state_tlr;		// Signals that the JSM  is in the Test_Logic_Reset state (shared)
	input	jtag_state_rti;		// Signals that the JSM is in the Run_Test/Idle state (shared)
	input	jtag_state_sdrs;	// Signals that the JSM is in the Select_DR_Scan state (shared)
	input	jtag_state_cdr;		// Signals that the JSM is in the Capture_DR state (shared)
	input	jtag_state_sdr;		// Signals that the JSM is in the Shift_DR state (shared)
	input	jtag_state_e1dr;	// Signals that the JSM is in the Exit1_DR state (shared)
	input	jtag_state_pdr;		// Signals that the JSM is in the Pause_DR state (shared)
	input	jtag_state_e2dr;	// Signals that the JSM is in the Exit2_DR state (shared)
	input	jtag_state_udr;		// Signals that the JSM is in the Update_DR state (shared)
	input	jtag_state_sirs;	// Signals that the JSM is in the Select_IR_Scan state (shared)
	input	jtag_state_cir;		// Signals that the JSM is in the Capture_IR state (shared)
	input	jtag_state_sir;		// Signals that the JSM is in the Shift_IR state (shared)
	input	jtag_state_e1ir;	// Signals that the JSM is in the Exit1_IR state (shared)
	input	jtag_state_pir;		// Signals that the JSM is in the Pause_IR state (shared)
	input	jtag_state_e2ir;	// Signals that the JSM is in the Exit2_IR state (shared)
	input	jtag_state_uir;		// Signals that the JSM is in the Update_IR state (shared)
	input	usr1;				// Signals that the current instruction in the JSM is the USER1 instruction (shared)
	input	clr;				// Asynchronous clear (shared) 
	input	ena;				// Indicates that the current instruction in the Hub is for this instance  
	input	[sld_ir_width-1 : 0] ir_in;				// Virtual IR

	output	tdo;				// Virtual JTAG test data out
	output	[sld_ir_width-1 : 0] ir_out;			// Virtual IR capture port
	
	wire	tdo;
	wire	[sld_ir_width-1 : 0] ir_out;


	/* Internal Virtual JTAG Controller Signals */
	wire	tck;
	wire	tms;
	wire	usr0;
	wire	virtual_dr_scan;
	wire	virtual_ir_scan;
	wire	virtual_state_cdr;
	wire	virtual_state_sdr;
	wire	virtual_state_e1dr;
	wire	virtual_state_pdr;
	wire	virtual_state_e2dr;
	wire	virtual_state_udr;
	wire	virtual_state_cir;
	wire	virtual_state_uir;


	assign tck = raw_tck;
	assign tms = raw_tms;
	assign usr0 = !usr1;
	assign virtual_dr_scan = usr0 && ena;
	assign virtual_ir_scan = usr1 && ena;
	assign virtual_state_cdr  = virtual_dr_scan && jtag_state_cdr;
	assign virtual_state_sdr  = virtual_dr_scan && jtag_state_sdr;
	assign virtual_state_e1dr = virtual_dr_scan && jtag_state_e1dr;
	assign virtual_state_pdr  = virtual_dr_scan && jtag_state_pdr;
	assign virtual_state_e2dr = virtual_dr_scan && jtag_state_e2dr;
	assign virtual_state_udr  = virtual_dr_scan && jtag_state_udr;
	assign virtual_state_cir  = jtag_state_cdr;
	assign virtual_state_uir  = virtual_ir_scan && jtag_state_udr;


	// Interface port connections
	assign usr_tck = tck;
	assign usr_tdi = tdi;
	assign usr_ir_in = ir_in;

	assign tdo = usr_tdo;
	assign ir_out = usr_ir_out;

	assign usr_virtual_state_cdr = virtual_state_cdr;
	assign usr_virtual_state_sdr = virtual_state_sdr;
	assign usr_virtual_state_e1dr = virtual_state_e1dr;
	assign usr_virtual_state_pdr = virtual_state_pdr;
	assign usr_virtual_state_e2dr = virtual_state_e2dr;
	assign usr_virtual_state_udr = virtual_state_udr;
	assign usr_virtual_state_cir = virtual_state_cir;
	assign usr_virtual_state_uir = virtual_state_uir;

	assign usr_tms = tms;
	assign usr_jtag_state_tlr = jtag_state_tlr;
	assign usr_jtag_state_rti = jtag_state_rti;
	assign usr_jtag_state_sdrs = jtag_state_sdrs;
	assign usr_jtag_state_cdr = jtag_state_cdr;
	assign usr_jtag_state_sdr = jtag_state_sdr;
	assign usr_jtag_state_e1dr = jtag_state_e1dr;
	assign usr_jtag_state_pdr = jtag_state_pdr;
	assign usr_jtag_state_e2dr = jtag_state_e2dr;
	assign usr_jtag_state_udr = jtag_state_udr;
	assign usr_jtag_state_sirs = jtag_state_sirs;
	assign usr_jtag_state_cir = jtag_state_cir;
	assign usr_jtag_state_sir = jtag_state_sir;
	assign usr_jtag_state_e1ir = jtag_state_e1ir;
	assign usr_jtag_state_pir = jtag_state_pir;
	assign usr_jtag_state_e2ir = jtag_state_e2ir;
	assign usr_jtag_state_uir = jtag_state_uir;

endmodule
