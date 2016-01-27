/******************************************************************************
 * License Agreement                                                          *
 *                                                                            *
 * Copyright (c) 1991-2009 Altera Corporation, San Jose, California, USA.     *
 * All rights reserved.                                                       *
 *                                                                            *
 * Any megafunction design, and related net list (encrypted or decrypted),    *
 *  support information, device programming or simulation file, and any other *
 *  associated documentation or information provided by Altera or a partner   *
 *  under Altera's Megafunction Partnership Program may be used only to       *
 *  program PLD devices (but not masked PLD devices) from Altera.  Any other  *
 *  use of such megafunction design, net list, support information, device    *
 *  programming or simulation file, or any other related documentation or     *
 *  information is prohibited for any other purpose, including, but not       *
 *  limited to modification, reverse engineering, de-compiling, or use with   *
 *  any other silicon devices, unless such use is explicitly licensed under   *
 *  a separate agreement with Altera or a megafunction partner.  Title to     *
 *  the intellectual property, including patents, copyrights, trademarks,     *
 *  trade secrets, or maskworks, embodied in any such megafunction design,    *
 *  net list, support information, device programming or simulation file, or  *
 *  any other related documentation or information provided by Altera or a    *
 *  megafunction partner, remains with Altera, the megafunction partner, or   *
 *  their respective licensors.  No other licenses, including any licenses    *
 *  needed under any third party's intellectual property, are provided herein.*
 *  Copying or modifying any file, or portion thereof, to which this notice   *
 *  is attached violates this copyright.                                      *
 *                                                                            *
 * THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
 * FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  *
 * IN THIS FILE.                                                              *
 *                                                                            *
 * This agreement shall be governed in all respects by the laws of the State  *
 *  of California and by the laws of the United States of America.            *
 *                                                                            *
 ******************************************************************************/

/******************************************************************************
 *                                                                            *
 * This module constantly performs a DMA transfer from a memory device        *
 *  containing pixel data to the VGA Controller IP Core.                      *
 *                                                                            *
 ******************************************************************************/

module pixel_buffer (
	// Inputs
	clk,
	reset,

	slave_address,
	slave_byteenable,
	slave_read,
	slave_write,
	slave_writedata,

	master_readdata,
	master_readdatavalid,
	master_waitrequest,

	stream_ready,

	// Bi-Directional

	// Outputs
	slave_readdata,

	master_address,
	master_arbiterlock,
	master_read,

	stream_data,
	stream_startofpacket,
	stream_endofpacket,
	stream_empty,
	stream_valid
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

// Input Parameters
parameter DEFAULT_BUFFER_ADDRESS	= 32'h00000000;
parameter DEFAULT_BACK_BUF_ADDRESS	= 32'h00096000;

parameter AW						= 18; // Image In - Address Width
parameter WIW						= 9;  // Image In Width - Address Width
parameter HIW						= 8;  // Image In Height - Address Width

parameter DW						= 15; // Image In - Data Width

parameter PIXELS_IN					= 640;
parameter LINES_IN 					= 480;

// Output Parameters
parameter WOW						= 9;  // Image Out Width - Address Width
parameter HOW						= 8;  // Image Out Height - Address Width


parameter PIXELS_OUT 				= 640;
parameter LINES_OUT 				= 480;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				clk;
input				reset;

input		[ 1: 0]	slave_address;
input		[ 3: 0]	slave_byteenable;
input				slave_read;
input				slave_write;
input		[31: 0]	slave_writedata;

input		[DW: 0]	master_readdata;
input				master_readdatavalid;
input				master_waitrequest;

input				stream_ready;

// Bi-Directional

// Outputs
output	reg	[31: 0]	slave_readdata;

output		[31: 0]	master_address;
output				master_arbiterlock;
output				master_read;

output		[29: 0]	stream_data;
output				stream_startofpacket;
output				stream_endofpacket;
output		[ 1: 0]	stream_empty;
output				stream_valid;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/
// states
localparam	STATE_0_IDLE		= 1'b0,
			STATE_1_READ_BUFFER	= 1'b1;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire		[ 9: 0]	red;
wire		[ 9: 0]	green;
wire		[ 9: 0]	blue;

// Data from buffer fifo signals
wire		[DW: 0]	db_fifo_data_in;
wire				db_fifo_read;
wire				db_fifo_write;

wire		[DW: 0]	db_fifo_data_out;
wire				db_fifo_empty;
wire				db_fifo_full;
wire				db_fifo_almost_empty;
wire				db_fifo_almost_full;


// Internal Registers
reg			[31: 0]	buffer_start_address;
reg			[31: 0]	back_buf_start_address;

reg					buffer_swap;

//  Input Counters
reg			[AW: 0]	pixel_address_in;

//  Output Counters
reg			[WOW:0]	w_address_out;
reg			[HOW:0]	h_address_out;

// State Machine Registers
reg					present_state;
reg					next_state;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		present_state <= STATE_0_IDLE;
	else
		present_state <= next_state;
end

always @(*)
begin
    case (present_state)
	STATE_0_IDLE:
		begin
			if (db_fifo_almost_empty)
				next_state = STATE_1_READ_BUFFER;
			else
				next_state = STATE_0_IDLE;
		end
	STATE_1_READ_BUFFER:
		begin
			if (db_fifo_almost_full & ~master_waitrequest) 
				next_state = STATE_0_IDLE;
			else
				next_state = STATE_1_READ_BUFFER;
		end
	default:
		begin
			next_state = STATE_0_IDLE;
		end
	endcase
end

/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge clk)
begin
	if (reset)
		slave_readdata <= 32'h00000000;
   
	else if (slave_read & (slave_address == 2'h0))
		slave_readdata <= buffer_start_address;
   
	else if (slave_read & (slave_address == 2'h1))
		slave_readdata <= back_buf_start_address;
   
	else if (slave_read & (slave_address == 2'h2))
	begin
		slave_readdata[31:16] <= LINES_IN;
		slave_readdata[15: 0] <= PIXELS_IN;
	end
   
	else if (slave_read)
	begin
		slave_readdata[31:24] <= HIW + 'h1;
		slave_readdata[23:16] <= WIW + 'h1;
		slave_readdata[15: 8] <= 8'h00;
		slave_readdata[ 7: 4] <= 4'h2;
		slave_readdata[ 3: 2] <= 2'h0;
		slave_readdata[    1] <= 1'b1;
		slave_readdata[    0] <= buffer_swap;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset)
	begin
		buffer_start_address <= DEFAULT_BUFFER_ADDRESS;
		back_buf_start_address <= DEFAULT_BACK_BUF_ADDRESS;
	end
	else if (slave_write & (slave_address == 2'h1))
	begin
		if (slave_byteenable[0])
			back_buf_start_address[ 7: 0] <= slave_writedata[ 7: 0];
		if (slave_byteenable[1])
			back_buf_start_address[15: 8] <= slave_writedata[15: 8];
		if (slave_byteenable[2])
			back_buf_start_address[23:16] <= slave_writedata[23:16];
		if (slave_byteenable[3])
			back_buf_start_address[31:24] <= slave_writedata[31:24];
	end
	else if (buffer_swap & 
			(pixel_address_in == ((PIXELS_IN * LINES_IN)  - 1)))
	begin
		buffer_start_address <= back_buf_start_address;
		back_buf_start_address <= buffer_start_address;
	end
end

always @(posedge clk)
begin
	if (reset)
		buffer_swap <= 1'b0;
	else if (slave_write & (slave_address == 2'h0))
		buffer_swap <= 1'b1;
	else if (pixel_address_in == ((PIXELS_IN * LINES_IN)  - 1))
		buffer_swap <= 1'b0;
end

// Input Counters
always @(posedge clk)
begin
	if (reset)
		pixel_address_in <= 'h0;
	else if (master_read & ~master_waitrequest)
	begin
		if (pixel_address_in == ((PIXELS_IN * LINES_IN)  - 1))
			pixel_address_in <= 'h0;
		else
			pixel_address_in <= pixel_address_in + 'h1;
	end
end

// Output Counters
always @(posedge clk)
begin
	if (reset)
		w_address_out <= 'h0;
	else if (stream_valid & stream_ready)
	begin
		if (w_address_out == (PIXELS_OUT - 1))
			w_address_out <= 'h0;
		else
			w_address_out <= w_address_out + 'h1;
	end
end

always @(posedge clk)
begin
	if (reset)
		h_address_out <= 'h0;
	else if ((stream_valid & stream_ready) && 
			(w_address_out == (PIXELS_OUT - 1)))
	begin
		if (h_address_out == (LINES_OUT - 1))
			h_address_out <= 'h0;
		else
			h_address_out <= h_address_out + 'h1;
	end
end

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

// Output Assignments
assign master_address		= buffer_start_address + 
								{pixel_address_in, 1'b0};
assign master_arbiterlock	= (present_state == STATE_1_READ_BUFFER);
assign master_read			= (present_state == STATE_1_READ_BUFFER);

assign stream_data			= {red, green, blue};
assign stream_startofpacket	= 
	((w_address_out == 'h0) & (h_address_out == 'h0));
assign stream_endofpacket	= 
	((w_address_out == (PIXELS_OUT - 1)) & (h_address_out == (LINES_OUT - 1)));
assign stream_empty			= 2'h0;
assign stream_valid			= ~db_fifo_empty;

// Internal Assignments
assign red		= {2{db_fifo_data_out[15:11]}};
assign green	= {db_fifo_data_out[10:5], db_fifo_data_out[10:7]};
assign blue		= {2{db_fifo_data_out[4:0]}};

// Data from buffer fifo assignments
assign db_fifo_data_in	= master_readdata;
assign db_fifo_write	= master_readdatavalid & ~db_fifo_full;

assign db_fifo_read		= 
	stream_ready & stream_valid;


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

scfifo Data_from_Buffer_FIFO (
	// Inputs
	.clock			(clk),
	.sclr			(reset),
   
	.data			(db_fifo_data_in),
	.wrreq			(db_fifo_write),

	.rdreq			(db_fifo_read),

	// Outputs
	.q				(db_fifo_data_out),

	.empty			(db_fifo_empty),
	.full			(db_fifo_full),
	   
	.almost_empty	(db_fifo_almost_empty),
	.almost_full	(db_fifo_almost_full)
	// synopsys translate_off
	,
	.aclr			(),
	.usedw			()
	// synopsys translate_on
);
defparam
	Data_from_Buffer_FIFO.add_ram_output_register	= "OFF",
	Data_from_Buffer_FIFO.almost_empty_value		= 32,
	Data_from_Buffer_FIFO.almost_full_value			= 96,
	Data_from_Buffer_FIFO.intended_device_family	= "Cyclone II",
	Data_from_Buffer_FIFO.lpm_numwords				= 128,
	Data_from_Buffer_FIFO.lpm_showahead				= "ON",
	Data_from_Buffer_FIFO.lpm_type					= "scfifo",
	Data_from_Buffer_FIFO.lpm_width					= DW + 1,
	Data_from_Buffer_FIFO.lpm_widthu				= 7,
	Data_from_Buffer_FIFO.overflow_checking			= "OFF",
	Data_from_Buffer_FIFO.underflow_checking		= "OFF",
	Data_from_Buffer_FIFO.use_eab					= "ON";


endmodule

