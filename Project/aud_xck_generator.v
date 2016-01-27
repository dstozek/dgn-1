/*
	This module is an extracted Altera UP SOPC module, as can be seen below.
	It was extracted to make it possible to change the SDRAM clock delay - 
	The SDRAM module requires a clock of the frequency equal to the system clock but shifted
	back by 3 nano seconds. The fitting of the elements on board already introduced some phase shift
	so a change of the PLL phase shift to 2 ns (empirical value) was necessary to eliminate memory flickering.
*/

 
/******************************************************************************
 *                                                                            *
 * Module:       Altera_UP_Avalon_DE_Boards                                   *
 * Description:                                                               *
 *      This module generates the clocks needed for the I/O devices on        *
 *   Altera's DE1 and DE2 Boards.                                             *
 *                                                                            *
 ******************************************************************************/

module aud_xck_generator (
	// inputs
	ext_clk,
	reset,

	clk,
//	address,

	// bidirectional

	// outputs
	DRAM_CLK,

//	vga_int_clk,
	VGA_CLK,

	AUD_XCK

);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter AUD_CLK_MULT	= 1;
parameter AUD_CLK_DIV	= 4;


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				ext_clk;
input				reset;

input				clk;
//input				address;


// Bidirectionals

// Outputs
output				DRAM_CLK;

//output				vga_int_clk;
output				VGA_CLK;

output				AUD_XCK;



/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire				sdram_clk_locked;
wire				vga_clk_locked;
wire				audio_clk_locked;
wire				clk_locked;





// Internal Registers
reg			[1:0]	aud_clk_select;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

always @(posedge ext_clk)
	if (reset == 1'b1)
		aud_clk_select <= 2'h0;

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altpll DE_Clock_Generator (
	.inclk			({1'b0, ext_clk}),
	.clk			({AUD_XCK, VGA_CLK, DRAM_CLK}),
	.locked			(clk_locked),
	.activeclock	(),
	.areset			(1'b0),
	.clkbad			(),
	.clkena			({6{1'b1}}),
	.clkloss		(),
	.clkswitch		(1'b0),
	.enable0		(),
	.enable1		(),
	.extclk			(),
	.extclkena		({4{1'b1}}),
	.fbin			(1'b1),
	.pfdena			(1'b1),
	.pllena			(1'b1),
	.scanaclr		(1'b0),
	.scanclk		(1'b0),
	.scandata		(1'b0),
	.scandataout	(),
	.scandone		(),
	.scanread		(1'b0),
	.scanwrite		(1'b0),
	.sclkout0		(),
	.sclkout1		()
);
defparam
	DE_Clock_Generator.clk0_divide_by			= 1,
	DE_Clock_Generator.clk0_duty_cycle			= 50,
	DE_Clock_Generator.clk0_multiply_by			= 1,
	DE_Clock_Generator.clk0_phase_shift			= "-2000",
	DE_Clock_Generator.clk1_divide_by			= 2,
	DE_Clock_Generator.clk1_duty_cycle			= 50,
	DE_Clock_Generator.clk1_multiply_by			= 1,
	DE_Clock_Generator.clk1_phase_shift			= "20000",
	DE_Clock_Generator.clk2_divide_by			= AUD_CLK_DIV,
	DE_Clock_Generator.clk2_duty_cycle			= 50,
	DE_Clock_Generator.clk2_multiply_by			= AUD_CLK_MULT,
	DE_Clock_Generator.clk2_phase_shift			= "20000",
	DE_Clock_Generator.compensate_clock			= "CLK0",
	DE_Clock_Generator.gate_lock_signal			= "NO",
	DE_Clock_Generator.inclk0_input_frequency	= 20000,
	DE_Clock_Generator.intended_device_family	= "Cyclone II",
	DE_Clock_Generator.invalid_lock_multiplier	= 5,
	DE_Clock_Generator.lpm_type					= "altpll",
	DE_Clock_Generator.operation_mode			= "NORMAL",
	DE_Clock_Generator.pll_type					= "FAST",
	DE_Clock_Generator.port_activeclock			= "PORT_UNUSED",
	DE_Clock_Generator.port_areset				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkbad0				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkbad1				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkloss				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkswitch			= "PORT_UNUSED",
	DE_Clock_Generator.port_fbin				= "PORT_UNUSED",
	DE_Clock_Generator.port_inclk0				= "PORT_USED",
	DE_Clock_Generator.port_inclk1				= "PORT_UNUSED",
	DE_Clock_Generator.port_locked				= "PORT_USED",
	DE_Clock_Generator.port_pfdena				= "PORT_UNUSED",
	DE_Clock_Generator.port_pllena				= "PORT_UNUSED",
	DE_Clock_Generator.port_scanaclr			= "PORT_UNUSED",
	DE_Clock_Generator.port_scanclk				= "PORT_UNUSED",
	DE_Clock_Generator.port_scandata			= "PORT_UNUSED",
	DE_Clock_Generator.port_scandataout			= "PORT_UNUSED",
	DE_Clock_Generator.port_scandone			= "PORT_UNUSED",
	DE_Clock_Generator.port_scanread			= "PORT_UNUSED",
	DE_Clock_Generator.port_scanwrite			= "PORT_UNUSED",
	DE_Clock_Generator.port_clk0				= "PORT_USED",
	DE_Clock_Generator.port_clk1				= "PORT_USED",
	DE_Clock_Generator.port_clk2				= "PORT_USED",
	DE_Clock_Generator.port_clk3				= "PORT_UNUSED",
	DE_Clock_Generator.port_clk4				= "PORT_UNUSED",
	DE_Clock_Generator.port_clk5				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkena0				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkena1				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkena2				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkena3				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkena4				= "PORT_UNUSED",
	DE_Clock_Generator.port_clkena5				= "PORT_UNUSED",
	DE_Clock_Generator.port_enable0				= "PORT_UNUSED",
	DE_Clock_Generator.port_enable1				= "PORT_UNUSED",
	DE_Clock_Generator.port_extclk0				= "PORT_UNUSED",
	DE_Clock_Generator.port_extclk1				= "PORT_UNUSED",
	DE_Clock_Generator.port_extclk2				= "PORT_UNUSED",
	DE_Clock_Generator.port_extclk3				= "PORT_UNUSED",
	DE_Clock_Generator.port_extclkena0			= "PORT_UNUSED",
	DE_Clock_Generator.port_extclkena1			= "PORT_UNUSED",
	DE_Clock_Generator.port_extclkena2			= "PORT_UNUSED",
	DE_Clock_Generator.port_extclkena3			= "PORT_UNUSED",
	DE_Clock_Generator.port_sclkout0			= "PORT_UNUSED",
	DE_Clock_Generator.port_sclkout1			= "PORT_UNUSED",
	DE_Clock_Generator.valid_lock_multiplier	= 1;




endmodule

