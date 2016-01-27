-- Copyright (C) 1991-2010 Altera Corporation
--  Your use of Altera Corporation's design tools, logic functions 
--  and other software and tools, and its AMPP partner logic 
--  functions, and any output files from any of the foregoing 
--  (including device programming or simulation files), and any 
--  associated documentation or information are expressly subject 
--  to the terms and conditions of the Altera Program License 
--  Subscription Agreement, Altera MegaCore Function License 
--  Agreement, or other applicable license agreement, including, 
--  without limitation, that your use is for the sole purpose of 
--  programming logic devices manufactured by Altera and sold by 
--  Altera or its authorized distributors.  Please refer to the 
--  applicable agreement for further details.



 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 4 lpm_mult 1 reg 254 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_mult_single IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clk_en	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC;
		 dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END cpu_fpoint_mult_single;

 ARCHITECTURE RTL OF cpu_fpoint_mult_single IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	 dataa_exp_all_one_ff_p1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_dataa_exp_all_one_ff_p1_w_lg_q296w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dataa_exp_all_one_ff_p1_w_lg_q291w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 dataa_exp_not_zero_ff_p1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dataa_man_not_zero_ff_p1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_dataa_man_not_zero_ff_p1_w_lg_w_lg_q290w295w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dataa_man_not_zero_ff_p1_w_lg_q290w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 dataa_man_not_zero_ff_p2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 datab_exp_all_one_ff_p1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_datab_exp_all_one_ff_p1_w_lg_q294w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_datab_exp_all_one_ff_p1_w_lg_q289w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 datab_exp_not_zero_ff_p1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 datab_man_not_zero_ff_p1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_datab_man_not_zero_ff_p1_w_lg_w_lg_q288w293w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_datab_man_not_zero_ff_p1_w_lg_q288w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 datab_man_not_zero_ff_p2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 delay_exp2_bias	:	STD_LOGIC_VECTOR(9 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 delay_exp3_bias	:	STD_LOGIC_VECTOR(9 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 delay_exp_bias	:	STD_LOGIC_VECTOR(9 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 delay_man_product_msb	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 delay_man_product_msb2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_delay_man_product_msb2_w_lg_q393w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_man_product_msb2_w_lg_q395w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 delay_man_product_msb_p0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 delay_round	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_delay_round_w485w	:	STD_LOGIC_VECTOR (21 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_lg_w_lg_w_lg_w_q_range480w481w482w483w484w	:	STD_LOGIC_VECTOR (21 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_lg_w_lg_w_lg_w_q_range470w471w472w473w474w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_lg_w_lg_w_q_range480w481w482w483w	:	STD_LOGIC_VECTOR (21 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_lg_w_lg_w_q_range470w471w472w473w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_lg_w_q_range480w481w482w	:	STD_LOGIC_VECTOR (21 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_lg_w_q_range470w471w472w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_q_range480w481w	:	STD_LOGIC_VECTOR (21 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w_q_range470w471w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_round_w475w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_lg_w475w476w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_q_range480w	:	STD_LOGIC_VECTOR (21 DOWNTO 0);
	 SIGNAL  wire_delay_round_w_q_range470w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 exp_add_p1	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_exp_add_p1_w_q_range63w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL	 exp_adj_p1	:	STD_LOGIC_VECTOR(9 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_adj_p2	:	STD_LOGIC_VECTOR(9 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_exp_adj_p2_w_lg_w_lg_w_q_range459w460w461w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_lg_w_q_range459w460w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_lg_w_q_range432w457w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range410w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range413w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range416w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range419w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range422w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range425w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range459w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range428w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range431w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_exp_adj_p2_w_q_range432w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 exp_bias_p1	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_bias_p2	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_result_ff	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_dffe_0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_dffe_1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_dffe_2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_dffe_3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_ff1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_ff2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_ff3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinity_ff4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_input_is_infinity_ff4_w_lg_q467w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_input_is_infinity_ff4_w_lg_q469w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 input_is_nan_dffe_0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe_1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe_2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe_3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_ff1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_ff2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_ff3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_ff4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_input_is_nan_ff4_w_lg_q479w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 input_not_zero_dffe_0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_dffe_1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_dffe_2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_dffe_3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_ff1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_ff2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_ff3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_not_zero_ff4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_input_not_zero_ff4_w_lg_q466w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 lsb_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_result_ff	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_round_carry_p0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_round_p	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_round_p0	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_round_p2	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_man_round_p2_w_lg_w_q_range404w405w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_round_p2_w_lg_w_q_range401w402w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_round_p2_w_lg_w_q_range391w403w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_round_p2_w_lg_w_lg_w_q_range404w405w406w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_round_p2_w_q_range404w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_round_p2_w_q_range401w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_round_p2_w_q_range391w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 round_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff5	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff6	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff7	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff8	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_node_ff9	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sticky_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_exp_add_adder_dataa	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_exp_add_adder_datab	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_exp_add_adder_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_exp_adj_adder_datab	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_exp_adj_adder_result	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_exp_bias_subtr_dataa	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_exp_bias_subtr_datab	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_exp_bias_subtr_result	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_man_round_adder_dataa	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_round_adder_datab	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_round_adder_result	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_lg_w_result_range302w303w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_lg_w_result_range299w300w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_lg_w_result_range298w373w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_lg_w_result_range298w301w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_dataa	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_datab	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_result	:	STD_LOGIC_VECTOR (47 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range335w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range338w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range341w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range344w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range347w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range350w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range353w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range356w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range359w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range362w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range308w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range365w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range368w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range371w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range311w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range314w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range302w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range299w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range298w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range317w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range320w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range323w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range326w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range329w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_product2_mult_w_result_range332w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_inf_num464w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range81w88w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range91w98w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range101w108w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range111w118w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range121w128w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range131w138w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range141w148w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range84w90w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range94w100w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range104w110w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range114w120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range124w130w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range134w140w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range144w150w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range408w412w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range411w415w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range414w418w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range417w421w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range420w424w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range423w427w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_all_one_range426w430w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_is_inf468w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_is_zero458w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range454w456w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_inf_num464w465w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_is_inf462w463w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_is_inf462w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range211w213w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range221w223w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range227w229w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range233w235w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range239w241w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range245w247w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range251w253w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range257w259w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range263w265w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range157w159w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range269w271w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range275w277w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range281w283w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range81w83w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range91w93w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range101w103w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range111w113w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range121w123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range131w133w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range163w165w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range141w143w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range169w171w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range175w177w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range181w183w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range187w189w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range193w195w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range199w201w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range205w207w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range214w216w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range224w226w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range230w232w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range236w238w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range242w244w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range248w250w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range254w256w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range260w262w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range266w268w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range160w162w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range272w274w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range278w280w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range284w286w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range84w86w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range94w96w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range104w106w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range114w116w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range124w126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range134w136w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range166w168w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range144w146w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range172w174w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range178w180w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range184w186w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range190w192w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range196w198w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range202w204w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range208w210w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range438w441w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range440w443w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range442w445w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range444w447w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range446w449w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range448w451w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range450w453w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_result_exp_not_zero_range452w455w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range306w310w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range336w340w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range339w343w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range342w346w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range345w349w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range348w352w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range351w355w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range354w358w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range357w361w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range360w364w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range363w367w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range309w313w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range366w370w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range369w374w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range312w316w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range315w319w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range318w322w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range321w325w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range324w328w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range327w331w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range330w334w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_range333w337w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  bias :	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  dataa_exp_all_one :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  dataa_exp_not_zero :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  dataa_man_not_zero :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  datab_exp_all_one :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  datab_exp_not_zero :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  datab_man_not_zero :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  exp_is_inf :	STD_LOGIC;
	 SIGNAL  exp_is_zero :	STD_LOGIC;
	 SIGNAL  expmod :	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  inf_num :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  lsb_bit :	STD_LOGIC;
	 SIGNAL  man_shift_full :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  result_exp_all_one :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  result_exp_not_zero :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  round_bit :	STD_LOGIC;
	 SIGNAL  round_carry :	STD_LOGIC;
	 SIGNAL  sticky_bit :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range211w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range221w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range227w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range233w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range239w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range245w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range251w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range257w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range263w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range157w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range269w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range275w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range281w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range81w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range91w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range101w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range111w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range121w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range131w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range163w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range141w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range169w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range175w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range181w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range187w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range193w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range199w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range205w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range77w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range87w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range97w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range107w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range117w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range127w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_all_one_range137w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range72w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range82w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range92w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range102w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range112w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range122w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_exp_not_zero_range132w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range152w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range218w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range222w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range228w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range234w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range240w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range246w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range252w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range258w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range264w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range158w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range270w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range276w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range164w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range170w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range176w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range182w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range188w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range194w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range200w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_man_not_zero_range206w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range214w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range224w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range230w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range236w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range242w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range248w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range254w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range260w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range266w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range160w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range272w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range278w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range284w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range84w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range94w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range104w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range114w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range124w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range134w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range166w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range172w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range178w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range184w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range190w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range196w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range202w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range208w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range79w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range89w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range99w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range109w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range119w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range129w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_all_one_range139w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range75w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range85w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range95w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range105w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range115w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range125w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_exp_not_zero_range135w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range155w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range220w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range225w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range231w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range237w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range243w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range249w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range255w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range261w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range267w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range161w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range273w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range279w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range167w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range173w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range179w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range185w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range191w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range197w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range203w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_man_not_zero_range209w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_shift_full_range379w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range408w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range411w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range414w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range417w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range420w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range423w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_all_one_range426w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range438w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range440w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range442w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range444w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range446w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range448w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range450w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range452w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_result_exp_not_zero_range454w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range306w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range336w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range339w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range342w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range345w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range348w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range351w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range354w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range357w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range360w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range363w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range309w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range366w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range369w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range312w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range315w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range318w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range321w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range324w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range327w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range330w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_range333w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  lpm_mult
	 GENERIC 
	 (
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "UNSIGNED";
		LPM_WIDTHA	:	NATURAL;
		LPM_WIDTHB	:	NATURAL;
		LPM_WIDTHP	:	NATURAL;
		LPM_WIDTHS	:	NATURAL := 1;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_mult"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTHA-1 DOWNTO 0);
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTHB-1 DOWNTO 0);
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTHP-1 DOWNTO 0);
		sum	:	IN STD_LOGIC_VECTOR(LPM_WIDTHS-1 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	loop0 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_inf_num464w(i) <= inf_num(i) AND wire_w_lg_w_lg_exp_is_inf462w463w(0);
	END GENERATE loop0;
	wire_w_lg_w_dataa_range81w88w(0) <= wire_w_dataa_range81w(0) AND wire_w_dataa_exp_all_one_range77w(0);
	wire_w_lg_w_dataa_range91w98w(0) <= wire_w_dataa_range91w(0) AND wire_w_dataa_exp_all_one_range87w(0);
	wire_w_lg_w_dataa_range101w108w(0) <= wire_w_dataa_range101w(0) AND wire_w_dataa_exp_all_one_range97w(0);
	wire_w_lg_w_dataa_range111w118w(0) <= wire_w_dataa_range111w(0) AND wire_w_dataa_exp_all_one_range107w(0);
	wire_w_lg_w_dataa_range121w128w(0) <= wire_w_dataa_range121w(0) AND wire_w_dataa_exp_all_one_range117w(0);
	wire_w_lg_w_dataa_range131w138w(0) <= wire_w_dataa_range131w(0) AND wire_w_dataa_exp_all_one_range127w(0);
	wire_w_lg_w_dataa_range141w148w(0) <= wire_w_dataa_range141w(0) AND wire_w_dataa_exp_all_one_range137w(0);
	wire_w_lg_w_datab_range84w90w(0) <= wire_w_datab_range84w(0) AND wire_w_datab_exp_all_one_range79w(0);
	wire_w_lg_w_datab_range94w100w(0) <= wire_w_datab_range94w(0) AND wire_w_datab_exp_all_one_range89w(0);
	wire_w_lg_w_datab_range104w110w(0) <= wire_w_datab_range104w(0) AND wire_w_datab_exp_all_one_range99w(0);
	wire_w_lg_w_datab_range114w120w(0) <= wire_w_datab_range114w(0) AND wire_w_datab_exp_all_one_range109w(0);
	wire_w_lg_w_datab_range124w130w(0) <= wire_w_datab_range124w(0) AND wire_w_datab_exp_all_one_range119w(0);
	wire_w_lg_w_datab_range134w140w(0) <= wire_w_datab_range134w(0) AND wire_w_datab_exp_all_one_range129w(0);
	wire_w_lg_w_datab_range144w150w(0) <= wire_w_datab_range144w(0) AND wire_w_datab_exp_all_one_range139w(0);
	wire_w_lg_w_result_exp_all_one_range408w412w(0) <= wire_w_result_exp_all_one_range408w(0) AND wire_exp_adj_p2_w_q_range410w(0);
	wire_w_lg_w_result_exp_all_one_range411w415w(0) <= wire_w_result_exp_all_one_range411w(0) AND wire_exp_adj_p2_w_q_range413w(0);
	wire_w_lg_w_result_exp_all_one_range414w418w(0) <= wire_w_result_exp_all_one_range414w(0) AND wire_exp_adj_p2_w_q_range416w(0);
	wire_w_lg_w_result_exp_all_one_range417w421w(0) <= wire_w_result_exp_all_one_range417w(0) AND wire_exp_adj_p2_w_q_range419w(0);
	wire_w_lg_w_result_exp_all_one_range420w424w(0) <= wire_w_result_exp_all_one_range420w(0) AND wire_exp_adj_p2_w_q_range422w(0);
	wire_w_lg_w_result_exp_all_one_range423w427w(0) <= wire_w_result_exp_all_one_range423w(0) AND wire_exp_adj_p2_w_q_range425w(0);
	wire_w_lg_w_result_exp_all_one_range426w430w(0) <= wire_w_result_exp_all_one_range426w(0) AND wire_exp_adj_p2_w_q_range428w(0);
	wire_w_lg_exp_is_inf468w(0) <= NOT exp_is_inf;
	wire_w_lg_exp_is_zero458w(0) <= NOT exp_is_zero;
	wire_w_lg_w_result_exp_not_zero_range454w456w(0) <= NOT wire_w_result_exp_not_zero_range454w(0);
	loop1 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_inf_num464w465w(i) <= wire_w_lg_inf_num464w(i) OR wire_exp_adj_p2_w_lg_w_lg_w_q_range459w460w461w(i);
	END GENERATE loop1;
	wire_w_lg_w_lg_exp_is_inf462w463w(0) <= wire_w_lg_exp_is_inf462w(0) OR input_is_nan_ff4;
	wire_w_lg_exp_is_inf462w(0) <= exp_is_inf OR input_is_infinity_ff4;
	wire_w_lg_w_dataa_range211w213w(0) <= wire_w_dataa_range211w(0) OR wire_w_dataa_man_not_zero_range206w(0);
	wire_w_lg_w_dataa_range221w223w(0) <= wire_w_dataa_range221w(0) OR wire_w_dataa_man_not_zero_range218w(0);
	wire_w_lg_w_dataa_range227w229w(0) <= wire_w_dataa_range227w(0) OR wire_w_dataa_man_not_zero_range222w(0);
	wire_w_lg_w_dataa_range233w235w(0) <= wire_w_dataa_range233w(0) OR wire_w_dataa_man_not_zero_range228w(0);
	wire_w_lg_w_dataa_range239w241w(0) <= wire_w_dataa_range239w(0) OR wire_w_dataa_man_not_zero_range234w(0);
	wire_w_lg_w_dataa_range245w247w(0) <= wire_w_dataa_range245w(0) OR wire_w_dataa_man_not_zero_range240w(0);
	wire_w_lg_w_dataa_range251w253w(0) <= wire_w_dataa_range251w(0) OR wire_w_dataa_man_not_zero_range246w(0);
	wire_w_lg_w_dataa_range257w259w(0) <= wire_w_dataa_range257w(0) OR wire_w_dataa_man_not_zero_range252w(0);
	wire_w_lg_w_dataa_range263w265w(0) <= wire_w_dataa_range263w(0) OR wire_w_dataa_man_not_zero_range258w(0);
	wire_w_lg_w_dataa_range157w159w(0) <= wire_w_dataa_range157w(0) OR wire_w_dataa_man_not_zero_range152w(0);
	wire_w_lg_w_dataa_range269w271w(0) <= wire_w_dataa_range269w(0) OR wire_w_dataa_man_not_zero_range264w(0);
	wire_w_lg_w_dataa_range275w277w(0) <= wire_w_dataa_range275w(0) OR wire_w_dataa_man_not_zero_range270w(0);
	wire_w_lg_w_dataa_range281w283w(0) <= wire_w_dataa_range281w(0) OR wire_w_dataa_man_not_zero_range276w(0);
	wire_w_lg_w_dataa_range81w83w(0) <= wire_w_dataa_range81w(0) OR wire_w_dataa_exp_not_zero_range72w(0);
	wire_w_lg_w_dataa_range91w93w(0) <= wire_w_dataa_range91w(0) OR wire_w_dataa_exp_not_zero_range82w(0);
	wire_w_lg_w_dataa_range101w103w(0) <= wire_w_dataa_range101w(0) OR wire_w_dataa_exp_not_zero_range92w(0);
	wire_w_lg_w_dataa_range111w113w(0) <= wire_w_dataa_range111w(0) OR wire_w_dataa_exp_not_zero_range102w(0);
	wire_w_lg_w_dataa_range121w123w(0) <= wire_w_dataa_range121w(0) OR wire_w_dataa_exp_not_zero_range112w(0);
	wire_w_lg_w_dataa_range131w133w(0) <= wire_w_dataa_range131w(0) OR wire_w_dataa_exp_not_zero_range122w(0);
	wire_w_lg_w_dataa_range163w165w(0) <= wire_w_dataa_range163w(0) OR wire_w_dataa_man_not_zero_range158w(0);
	wire_w_lg_w_dataa_range141w143w(0) <= wire_w_dataa_range141w(0) OR wire_w_dataa_exp_not_zero_range132w(0);
	wire_w_lg_w_dataa_range169w171w(0) <= wire_w_dataa_range169w(0) OR wire_w_dataa_man_not_zero_range164w(0);
	wire_w_lg_w_dataa_range175w177w(0) <= wire_w_dataa_range175w(0) OR wire_w_dataa_man_not_zero_range170w(0);
	wire_w_lg_w_dataa_range181w183w(0) <= wire_w_dataa_range181w(0) OR wire_w_dataa_man_not_zero_range176w(0);
	wire_w_lg_w_dataa_range187w189w(0) <= wire_w_dataa_range187w(0) OR wire_w_dataa_man_not_zero_range182w(0);
	wire_w_lg_w_dataa_range193w195w(0) <= wire_w_dataa_range193w(0) OR wire_w_dataa_man_not_zero_range188w(0);
	wire_w_lg_w_dataa_range199w201w(0) <= wire_w_dataa_range199w(0) OR wire_w_dataa_man_not_zero_range194w(0);
	wire_w_lg_w_dataa_range205w207w(0) <= wire_w_dataa_range205w(0) OR wire_w_dataa_man_not_zero_range200w(0);
	wire_w_lg_w_datab_range214w216w(0) <= wire_w_datab_range214w(0) OR wire_w_datab_man_not_zero_range209w(0);
	wire_w_lg_w_datab_range224w226w(0) <= wire_w_datab_range224w(0) OR wire_w_datab_man_not_zero_range220w(0);
	wire_w_lg_w_datab_range230w232w(0) <= wire_w_datab_range230w(0) OR wire_w_datab_man_not_zero_range225w(0);
	wire_w_lg_w_datab_range236w238w(0) <= wire_w_datab_range236w(0) OR wire_w_datab_man_not_zero_range231w(0);
	wire_w_lg_w_datab_range242w244w(0) <= wire_w_datab_range242w(0) OR wire_w_datab_man_not_zero_range237w(0);
	wire_w_lg_w_datab_range248w250w(0) <= wire_w_datab_range248w(0) OR wire_w_datab_man_not_zero_range243w(0);
	wire_w_lg_w_datab_range254w256w(0) <= wire_w_datab_range254w(0) OR wire_w_datab_man_not_zero_range249w(0);
	wire_w_lg_w_datab_range260w262w(0) <= wire_w_datab_range260w(0) OR wire_w_datab_man_not_zero_range255w(0);
	wire_w_lg_w_datab_range266w268w(0) <= wire_w_datab_range266w(0) OR wire_w_datab_man_not_zero_range261w(0);
	wire_w_lg_w_datab_range160w162w(0) <= wire_w_datab_range160w(0) OR wire_w_datab_man_not_zero_range155w(0);
	wire_w_lg_w_datab_range272w274w(0) <= wire_w_datab_range272w(0) OR wire_w_datab_man_not_zero_range267w(0);
	wire_w_lg_w_datab_range278w280w(0) <= wire_w_datab_range278w(0) OR wire_w_datab_man_not_zero_range273w(0);
	wire_w_lg_w_datab_range284w286w(0) <= wire_w_datab_range284w(0) OR wire_w_datab_man_not_zero_range279w(0);
	wire_w_lg_w_datab_range84w86w(0) <= wire_w_datab_range84w(0) OR wire_w_datab_exp_not_zero_range75w(0);
	wire_w_lg_w_datab_range94w96w(0) <= wire_w_datab_range94w(0) OR wire_w_datab_exp_not_zero_range85w(0);
	wire_w_lg_w_datab_range104w106w(0) <= wire_w_datab_range104w(0) OR wire_w_datab_exp_not_zero_range95w(0);
	wire_w_lg_w_datab_range114w116w(0) <= wire_w_datab_range114w(0) OR wire_w_datab_exp_not_zero_range105w(0);
	wire_w_lg_w_datab_range124w126w(0) <= wire_w_datab_range124w(0) OR wire_w_datab_exp_not_zero_range115w(0);
	wire_w_lg_w_datab_range134w136w(0) <= wire_w_datab_range134w(0) OR wire_w_datab_exp_not_zero_range125w(0);
	wire_w_lg_w_datab_range166w168w(0) <= wire_w_datab_range166w(0) OR wire_w_datab_man_not_zero_range161w(0);
	wire_w_lg_w_datab_range144w146w(0) <= wire_w_datab_range144w(0) OR wire_w_datab_exp_not_zero_range135w(0);
	wire_w_lg_w_datab_range172w174w(0) <= wire_w_datab_range172w(0) OR wire_w_datab_man_not_zero_range167w(0);
	wire_w_lg_w_datab_range178w180w(0) <= wire_w_datab_range178w(0) OR wire_w_datab_man_not_zero_range173w(0);
	wire_w_lg_w_datab_range184w186w(0) <= wire_w_datab_range184w(0) OR wire_w_datab_man_not_zero_range179w(0);
	wire_w_lg_w_datab_range190w192w(0) <= wire_w_datab_range190w(0) OR wire_w_datab_man_not_zero_range185w(0);
	wire_w_lg_w_datab_range196w198w(0) <= wire_w_datab_range196w(0) OR wire_w_datab_man_not_zero_range191w(0);
	wire_w_lg_w_datab_range202w204w(0) <= wire_w_datab_range202w(0) OR wire_w_datab_man_not_zero_range197w(0);
	wire_w_lg_w_datab_range208w210w(0) <= wire_w_datab_range208w(0) OR wire_w_datab_man_not_zero_range203w(0);
	wire_w_lg_w_result_exp_not_zero_range438w441w(0) <= wire_w_result_exp_not_zero_range438w(0) OR wire_exp_adj_p2_w_q_range410w(0);
	wire_w_lg_w_result_exp_not_zero_range440w443w(0) <= wire_w_result_exp_not_zero_range440w(0) OR wire_exp_adj_p2_w_q_range413w(0);
	wire_w_lg_w_result_exp_not_zero_range442w445w(0) <= wire_w_result_exp_not_zero_range442w(0) OR wire_exp_adj_p2_w_q_range416w(0);
	wire_w_lg_w_result_exp_not_zero_range444w447w(0) <= wire_w_result_exp_not_zero_range444w(0) OR wire_exp_adj_p2_w_q_range419w(0);
	wire_w_lg_w_result_exp_not_zero_range446w449w(0) <= wire_w_result_exp_not_zero_range446w(0) OR wire_exp_adj_p2_w_q_range422w(0);
	wire_w_lg_w_result_exp_not_zero_range448w451w(0) <= wire_w_result_exp_not_zero_range448w(0) OR wire_exp_adj_p2_w_q_range425w(0);
	wire_w_lg_w_result_exp_not_zero_range450w453w(0) <= wire_w_result_exp_not_zero_range450w(0) OR wire_exp_adj_p2_w_q_range428w(0);
	wire_w_lg_w_result_exp_not_zero_range452w455w(0) <= wire_w_result_exp_not_zero_range452w(0) OR wire_exp_adj_p2_w_q_range431w(0);
	wire_w_lg_w_sticky_bit_range306w310w(0) <= wire_w_sticky_bit_range306w(0) OR wire_man_product2_mult_w_result_range308w(0);
	wire_w_lg_w_sticky_bit_range336w340w(0) <= wire_w_sticky_bit_range336w(0) OR wire_man_product2_mult_w_result_range338w(0);
	wire_w_lg_w_sticky_bit_range339w343w(0) <= wire_w_sticky_bit_range339w(0) OR wire_man_product2_mult_w_result_range341w(0);
	wire_w_lg_w_sticky_bit_range342w346w(0) <= wire_w_sticky_bit_range342w(0) OR wire_man_product2_mult_w_result_range344w(0);
	wire_w_lg_w_sticky_bit_range345w349w(0) <= wire_w_sticky_bit_range345w(0) OR wire_man_product2_mult_w_result_range347w(0);
	wire_w_lg_w_sticky_bit_range348w352w(0) <= wire_w_sticky_bit_range348w(0) OR wire_man_product2_mult_w_result_range350w(0);
	wire_w_lg_w_sticky_bit_range351w355w(0) <= wire_w_sticky_bit_range351w(0) OR wire_man_product2_mult_w_result_range353w(0);
	wire_w_lg_w_sticky_bit_range354w358w(0) <= wire_w_sticky_bit_range354w(0) OR wire_man_product2_mult_w_result_range356w(0);
	wire_w_lg_w_sticky_bit_range357w361w(0) <= wire_w_sticky_bit_range357w(0) OR wire_man_product2_mult_w_result_range359w(0);
	wire_w_lg_w_sticky_bit_range360w364w(0) <= wire_w_sticky_bit_range360w(0) OR wire_man_product2_mult_w_result_range362w(0);
	wire_w_lg_w_sticky_bit_range363w367w(0) <= wire_w_sticky_bit_range363w(0) OR wire_man_product2_mult_w_result_range365w(0);
	wire_w_lg_w_sticky_bit_range309w313w(0) <= wire_w_sticky_bit_range309w(0) OR wire_man_product2_mult_w_result_range311w(0);
	wire_w_lg_w_sticky_bit_range366w370w(0) <= wire_w_sticky_bit_range366w(0) OR wire_man_product2_mult_w_result_range368w(0);
	wire_w_lg_w_sticky_bit_range369w374w(0) <= wire_w_sticky_bit_range369w(0) OR wire_man_product2_mult_w_lg_w_result_range298w373w(0);
	wire_w_lg_w_sticky_bit_range312w316w(0) <= wire_w_sticky_bit_range312w(0) OR wire_man_product2_mult_w_result_range314w(0);
	wire_w_lg_w_sticky_bit_range315w319w(0) <= wire_w_sticky_bit_range315w(0) OR wire_man_product2_mult_w_result_range317w(0);
	wire_w_lg_w_sticky_bit_range318w322w(0) <= wire_w_sticky_bit_range318w(0) OR wire_man_product2_mult_w_result_range320w(0);
	wire_w_lg_w_sticky_bit_range321w325w(0) <= wire_w_sticky_bit_range321w(0) OR wire_man_product2_mult_w_result_range323w(0);
	wire_w_lg_w_sticky_bit_range324w328w(0) <= wire_w_sticky_bit_range324w(0) OR wire_man_product2_mult_w_result_range326w(0);
	wire_w_lg_w_sticky_bit_range327w331w(0) <= wire_w_sticky_bit_range327w(0) OR wire_man_product2_mult_w_result_range329w(0);
	wire_w_lg_w_sticky_bit_range330w334w(0) <= wire_w_sticky_bit_range330w(0) OR wire_man_product2_mult_w_result_range332w(0);
	wire_w_lg_w_sticky_bit_range333w337w(0) <= wire_w_sticky_bit_range333w(0) OR wire_man_product2_mult_w_result_range335w(0);
	bias <= ( "0" & "0" & "0" & "1" & "1" & "1" & "1" & "1" & "1" & "1");
	dataa_exp_all_one <= ( wire_w_lg_w_dataa_range141w148w & wire_w_lg_w_dataa_range131w138w & wire_w_lg_w_dataa_range121w128w & wire_w_lg_w_dataa_range111w118w & wire_w_lg_w_dataa_range101w108w & wire_w_lg_w_dataa_range91w98w & wire_w_lg_w_dataa_range81w88w & dataa(23));
	dataa_exp_not_zero <= ( wire_w_lg_w_dataa_range141w143w & wire_w_lg_w_dataa_range131w133w & wire_w_lg_w_dataa_range121w123w & wire_w_lg_w_dataa_range111w113w & wire_w_lg_w_dataa_range101w103w & wire_w_lg_w_dataa_range91w93w & wire_w_lg_w_dataa_range81w83w & dataa(23));
	dataa_man_not_zero <= ( wire_w_lg_w_dataa_range281w283w & wire_w_lg_w_dataa_range275w277w & wire_w_lg_w_dataa_range269w271w & wire_w_lg_w_dataa_range263w265w & wire_w_lg_w_dataa_range257w259w & wire_w_lg_w_dataa_range251w253w & wire_w_lg_w_dataa_range245w247w & wire_w_lg_w_dataa_range239w241w & wire_w_lg_w_dataa_range233w235w & wire_w_lg_w_dataa_range227w229w & wire_w_lg_w_dataa_range221w223w & dataa(11) & wire_w_lg_w_dataa_range211w213w & wire_w_lg_w_dataa_range205w207w & wire_w_lg_w_dataa_range199w201w & wire_w_lg_w_dataa_range193w195w & wire_w_lg_w_dataa_range187w189w & wire_w_lg_w_dataa_range181w183w & wire_w_lg_w_dataa_range175w177w & wire_w_lg_w_dataa_range169w171w & wire_w_lg_w_dataa_range163w165w & wire_w_lg_w_dataa_range157w159w & dataa(0));
	datab_exp_all_one <= ( wire_w_lg_w_datab_range144w150w & wire_w_lg_w_datab_range134w140w & wire_w_lg_w_datab_range124w130w & wire_w_lg_w_datab_range114w120w & wire_w_lg_w_datab_range104w110w & wire_w_lg_w_datab_range94w100w & wire_w_lg_w_datab_range84w90w & datab(23));
	datab_exp_not_zero <= ( wire_w_lg_w_datab_range144w146w & wire_w_lg_w_datab_range134w136w & wire_w_lg_w_datab_range124w126w & wire_w_lg_w_datab_range114w116w & wire_w_lg_w_datab_range104w106w & wire_w_lg_w_datab_range94w96w & wire_w_lg_w_datab_range84w86w & datab(23));
	datab_man_not_zero <= ( wire_w_lg_w_datab_range284w286w & wire_w_lg_w_datab_range278w280w & wire_w_lg_w_datab_range272w274w & wire_w_lg_w_datab_range266w268w & wire_w_lg_w_datab_range260w262w & wire_w_lg_w_datab_range254w256w & wire_w_lg_w_datab_range248w250w & wire_w_lg_w_datab_range242w244w & wire_w_lg_w_datab_range236w238w & wire_w_lg_w_datab_range230w232w & wire_w_lg_w_datab_range224w226w & datab(11) & wire_w_lg_w_datab_range214w216w & wire_w_lg_w_datab_range208w210w & wire_w_lg_w_datab_range202w204w & wire_w_lg_w_datab_range196w198w & wire_w_lg_w_datab_range190w192w & wire_w_lg_w_datab_range184w186w & wire_w_lg_w_datab_range178w180w & wire_w_lg_w_datab_range172w174w & wire_w_lg_w_datab_range166w168w & wire_w_lg_w_datab_range160w162w & datab(0));
	exp_is_inf <= (((NOT exp_adj_p2(9)) AND exp_adj_p2(8)) OR ((NOT exp_adj_p2(8)) AND result_exp_all_one(7)));
	exp_is_zero <= wire_exp_adj_p2_w_lg_w_q_range432w457w(0);
	expmod <= ( "00000000" & wire_delay_man_product_msb2_w_lg_q393w & wire_delay_man_product_msb2_w_lg_q395w);
	inf_num <= ( "1" & "1" & "1" & "1" & "1" & "1" & "1" & "1");
	lsb_bit <= man_shift_full(1);
	man_shift_full <= (wire_man_product2_mult_w_lg_w_result_range302w303w OR wire_man_product2_mult_w_lg_w_result_range299w300w);
	result <= ( sign_node_ff9 & exp_result_ff(7 DOWNTO 0) & man_result_ff(22 DOWNTO 0));
	result_exp_all_one <= ( wire_w_lg_w_result_exp_all_one_range426w430w & wire_w_lg_w_result_exp_all_one_range423w427w & wire_w_lg_w_result_exp_all_one_range420w424w & wire_w_lg_w_result_exp_all_one_range417w421w & wire_w_lg_w_result_exp_all_one_range414w418w & wire_w_lg_w_result_exp_all_one_range411w415w & wire_w_lg_w_result_exp_all_one_range408w412w & exp_adj_p2(0));
	result_exp_not_zero <= ( wire_w_lg_w_result_exp_not_zero_range452w455w & wire_w_lg_w_result_exp_not_zero_range450w453w & wire_w_lg_w_result_exp_not_zero_range448w451w & wire_w_lg_w_result_exp_not_zero_range446w449w & wire_w_lg_w_result_exp_not_zero_range444w447w & wire_w_lg_w_result_exp_not_zero_range442w445w & wire_w_lg_w_result_exp_not_zero_range440w443w & wire_w_lg_w_result_exp_not_zero_range438w441w & exp_adj_p2(0));
	round_bit <= man_shift_full(0);
	round_carry <= (round_dffe AND (lsb_dffe OR sticky_dffe));
	sticky_bit <= ( wire_w_lg_w_sticky_bit_range369w374w & wire_w_lg_w_sticky_bit_range366w370w & wire_w_lg_w_sticky_bit_range363w367w & wire_w_lg_w_sticky_bit_range360w364w & wire_w_lg_w_sticky_bit_range357w361w & wire_w_lg_w_sticky_bit_range354w358w & wire_w_lg_w_sticky_bit_range351w355w & wire_w_lg_w_sticky_bit_range348w352w & wire_w_lg_w_sticky_bit_range345w349w & wire_w_lg_w_sticky_bit_range342w346w & wire_w_lg_w_sticky_bit_range339w343w & wire_w_lg_w_sticky_bit_range336w340w & wire_w_lg_w_sticky_bit_range333w337w & wire_w_lg_w_sticky_bit_range330w334w & wire_w_lg_w_sticky_bit_range327w331w & wire_w_lg_w_sticky_bit_range324w328w & wire_w_lg_w_sticky_bit_range321w325w & wire_w_lg_w_sticky_bit_range318w322w & wire_w_lg_w_sticky_bit_range315w319w & wire_w_lg_w_sticky_bit_range312w316w & wire_w_lg_w_sticky_bit_range309w313w & wire_w_lg_w_sticky_bit_range306w310w & wire_man_product2_mult_result(0));
	wire_w_dataa_range211w(0) <= dataa(10);
	wire_w_dataa_range221w(0) <= dataa(12);
	wire_w_dataa_range227w(0) <= dataa(13);
	wire_w_dataa_range233w(0) <= dataa(14);
	wire_w_dataa_range239w(0) <= dataa(15);
	wire_w_dataa_range245w(0) <= dataa(16);
	wire_w_dataa_range251w(0) <= dataa(17);
	wire_w_dataa_range257w(0) <= dataa(18);
	wire_w_dataa_range263w(0) <= dataa(19);
	wire_w_dataa_range157w(0) <= dataa(1);
	wire_w_dataa_range269w(0) <= dataa(20);
	wire_w_dataa_range275w(0) <= dataa(21);
	wire_w_dataa_range281w(0) <= dataa(22);
	wire_w_dataa_range81w(0) <= dataa(24);
	wire_w_dataa_range91w(0) <= dataa(25);
	wire_w_dataa_range101w(0) <= dataa(26);
	wire_w_dataa_range111w(0) <= dataa(27);
	wire_w_dataa_range121w(0) <= dataa(28);
	wire_w_dataa_range131w(0) <= dataa(29);
	wire_w_dataa_range163w(0) <= dataa(2);
	wire_w_dataa_range141w(0) <= dataa(30);
	wire_w_dataa_range169w(0) <= dataa(3);
	wire_w_dataa_range175w(0) <= dataa(4);
	wire_w_dataa_range181w(0) <= dataa(5);
	wire_w_dataa_range187w(0) <= dataa(6);
	wire_w_dataa_range193w(0) <= dataa(7);
	wire_w_dataa_range199w(0) <= dataa(8);
	wire_w_dataa_range205w(0) <= dataa(9);
	wire_w_dataa_exp_all_one_range77w(0) <= dataa_exp_all_one(0);
	wire_w_dataa_exp_all_one_range87w(0) <= dataa_exp_all_one(1);
	wire_w_dataa_exp_all_one_range97w(0) <= dataa_exp_all_one(2);
	wire_w_dataa_exp_all_one_range107w(0) <= dataa_exp_all_one(3);
	wire_w_dataa_exp_all_one_range117w(0) <= dataa_exp_all_one(4);
	wire_w_dataa_exp_all_one_range127w(0) <= dataa_exp_all_one(5);
	wire_w_dataa_exp_all_one_range137w(0) <= dataa_exp_all_one(6);
	wire_w_dataa_exp_not_zero_range72w(0) <= dataa_exp_not_zero(0);
	wire_w_dataa_exp_not_zero_range82w(0) <= dataa_exp_not_zero(1);
	wire_w_dataa_exp_not_zero_range92w(0) <= dataa_exp_not_zero(2);
	wire_w_dataa_exp_not_zero_range102w(0) <= dataa_exp_not_zero(3);
	wire_w_dataa_exp_not_zero_range112w(0) <= dataa_exp_not_zero(4);
	wire_w_dataa_exp_not_zero_range122w(0) <= dataa_exp_not_zero(5);
	wire_w_dataa_exp_not_zero_range132w(0) <= dataa_exp_not_zero(6);
	wire_w_dataa_man_not_zero_range152w(0) <= dataa_man_not_zero(0);
	wire_w_dataa_man_not_zero_range218w(0) <= dataa_man_not_zero(11);
	wire_w_dataa_man_not_zero_range222w(0) <= dataa_man_not_zero(12);
	wire_w_dataa_man_not_zero_range228w(0) <= dataa_man_not_zero(13);
	wire_w_dataa_man_not_zero_range234w(0) <= dataa_man_not_zero(14);
	wire_w_dataa_man_not_zero_range240w(0) <= dataa_man_not_zero(15);
	wire_w_dataa_man_not_zero_range246w(0) <= dataa_man_not_zero(16);
	wire_w_dataa_man_not_zero_range252w(0) <= dataa_man_not_zero(17);
	wire_w_dataa_man_not_zero_range258w(0) <= dataa_man_not_zero(18);
	wire_w_dataa_man_not_zero_range264w(0) <= dataa_man_not_zero(19);
	wire_w_dataa_man_not_zero_range158w(0) <= dataa_man_not_zero(1);
	wire_w_dataa_man_not_zero_range270w(0) <= dataa_man_not_zero(20);
	wire_w_dataa_man_not_zero_range276w(0) <= dataa_man_not_zero(21);
	wire_w_dataa_man_not_zero_range164w(0) <= dataa_man_not_zero(2);
	wire_w_dataa_man_not_zero_range170w(0) <= dataa_man_not_zero(3);
	wire_w_dataa_man_not_zero_range176w(0) <= dataa_man_not_zero(4);
	wire_w_dataa_man_not_zero_range182w(0) <= dataa_man_not_zero(5);
	wire_w_dataa_man_not_zero_range188w(0) <= dataa_man_not_zero(6);
	wire_w_dataa_man_not_zero_range194w(0) <= dataa_man_not_zero(7);
	wire_w_dataa_man_not_zero_range200w(0) <= dataa_man_not_zero(8);
	wire_w_dataa_man_not_zero_range206w(0) <= dataa_man_not_zero(9);
	wire_w_datab_range214w(0) <= datab(10);
	wire_w_datab_range224w(0) <= datab(12);
	wire_w_datab_range230w(0) <= datab(13);
	wire_w_datab_range236w(0) <= datab(14);
	wire_w_datab_range242w(0) <= datab(15);
	wire_w_datab_range248w(0) <= datab(16);
	wire_w_datab_range254w(0) <= datab(17);
	wire_w_datab_range260w(0) <= datab(18);
	wire_w_datab_range266w(0) <= datab(19);
	wire_w_datab_range160w(0) <= datab(1);
	wire_w_datab_range272w(0) <= datab(20);
	wire_w_datab_range278w(0) <= datab(21);
	wire_w_datab_range284w(0) <= datab(22);
	wire_w_datab_range84w(0) <= datab(24);
	wire_w_datab_range94w(0) <= datab(25);
	wire_w_datab_range104w(0) <= datab(26);
	wire_w_datab_range114w(0) <= datab(27);
	wire_w_datab_range124w(0) <= datab(28);
	wire_w_datab_range134w(0) <= datab(29);
	wire_w_datab_range166w(0) <= datab(2);
	wire_w_datab_range144w(0) <= datab(30);
	wire_w_datab_range172w(0) <= datab(3);
	wire_w_datab_range178w(0) <= datab(4);
	wire_w_datab_range184w(0) <= datab(5);
	wire_w_datab_range190w(0) <= datab(6);
	wire_w_datab_range196w(0) <= datab(7);
	wire_w_datab_range202w(0) <= datab(8);
	wire_w_datab_range208w(0) <= datab(9);
	wire_w_datab_exp_all_one_range79w(0) <= datab_exp_all_one(0);
	wire_w_datab_exp_all_one_range89w(0) <= datab_exp_all_one(1);
	wire_w_datab_exp_all_one_range99w(0) <= datab_exp_all_one(2);
	wire_w_datab_exp_all_one_range109w(0) <= datab_exp_all_one(3);
	wire_w_datab_exp_all_one_range119w(0) <= datab_exp_all_one(4);
	wire_w_datab_exp_all_one_range129w(0) <= datab_exp_all_one(5);
	wire_w_datab_exp_all_one_range139w(0) <= datab_exp_all_one(6);
	wire_w_datab_exp_not_zero_range75w(0) <= datab_exp_not_zero(0);
	wire_w_datab_exp_not_zero_range85w(0) <= datab_exp_not_zero(1);
	wire_w_datab_exp_not_zero_range95w(0) <= datab_exp_not_zero(2);
	wire_w_datab_exp_not_zero_range105w(0) <= datab_exp_not_zero(3);
	wire_w_datab_exp_not_zero_range115w(0) <= datab_exp_not_zero(4);
	wire_w_datab_exp_not_zero_range125w(0) <= datab_exp_not_zero(5);
	wire_w_datab_exp_not_zero_range135w(0) <= datab_exp_not_zero(6);
	wire_w_datab_man_not_zero_range155w(0) <= datab_man_not_zero(0);
	wire_w_datab_man_not_zero_range220w(0) <= datab_man_not_zero(11);
	wire_w_datab_man_not_zero_range225w(0) <= datab_man_not_zero(12);
	wire_w_datab_man_not_zero_range231w(0) <= datab_man_not_zero(13);
	wire_w_datab_man_not_zero_range237w(0) <= datab_man_not_zero(14);
	wire_w_datab_man_not_zero_range243w(0) <= datab_man_not_zero(15);
	wire_w_datab_man_not_zero_range249w(0) <= datab_man_not_zero(16);
	wire_w_datab_man_not_zero_range255w(0) <= datab_man_not_zero(17);
	wire_w_datab_man_not_zero_range261w(0) <= datab_man_not_zero(18);
	wire_w_datab_man_not_zero_range267w(0) <= datab_man_not_zero(19);
	wire_w_datab_man_not_zero_range161w(0) <= datab_man_not_zero(1);
	wire_w_datab_man_not_zero_range273w(0) <= datab_man_not_zero(20);
	wire_w_datab_man_not_zero_range279w(0) <= datab_man_not_zero(21);
	wire_w_datab_man_not_zero_range167w(0) <= datab_man_not_zero(2);
	wire_w_datab_man_not_zero_range173w(0) <= datab_man_not_zero(3);
	wire_w_datab_man_not_zero_range179w(0) <= datab_man_not_zero(4);
	wire_w_datab_man_not_zero_range185w(0) <= datab_man_not_zero(5);
	wire_w_datab_man_not_zero_range191w(0) <= datab_man_not_zero(6);
	wire_w_datab_man_not_zero_range197w(0) <= datab_man_not_zero(7);
	wire_w_datab_man_not_zero_range203w(0) <= datab_man_not_zero(8);
	wire_w_datab_man_not_zero_range209w(0) <= datab_man_not_zero(9);
	wire_w_man_shift_full_range379w <= man_shift_full(24 DOWNTO 1);
	wire_w_result_exp_all_one_range408w(0) <= result_exp_all_one(0);
	wire_w_result_exp_all_one_range411w(0) <= result_exp_all_one(1);
	wire_w_result_exp_all_one_range414w(0) <= result_exp_all_one(2);
	wire_w_result_exp_all_one_range417w(0) <= result_exp_all_one(3);
	wire_w_result_exp_all_one_range420w(0) <= result_exp_all_one(4);
	wire_w_result_exp_all_one_range423w(0) <= result_exp_all_one(5);
	wire_w_result_exp_all_one_range426w(0) <= result_exp_all_one(6);
	wire_w_result_exp_not_zero_range438w(0) <= result_exp_not_zero(0);
	wire_w_result_exp_not_zero_range440w(0) <= result_exp_not_zero(1);
	wire_w_result_exp_not_zero_range442w(0) <= result_exp_not_zero(2);
	wire_w_result_exp_not_zero_range444w(0) <= result_exp_not_zero(3);
	wire_w_result_exp_not_zero_range446w(0) <= result_exp_not_zero(4);
	wire_w_result_exp_not_zero_range448w(0) <= result_exp_not_zero(5);
	wire_w_result_exp_not_zero_range450w(0) <= result_exp_not_zero(6);
	wire_w_result_exp_not_zero_range452w(0) <= result_exp_not_zero(7);
	wire_w_result_exp_not_zero_range454w(0) <= result_exp_not_zero(8);
	wire_w_sticky_bit_range306w(0) <= sticky_bit(0);
	wire_w_sticky_bit_range336w(0) <= sticky_bit(10);
	wire_w_sticky_bit_range339w(0) <= sticky_bit(11);
	wire_w_sticky_bit_range342w(0) <= sticky_bit(12);
	wire_w_sticky_bit_range345w(0) <= sticky_bit(13);
	wire_w_sticky_bit_range348w(0) <= sticky_bit(14);
	wire_w_sticky_bit_range351w(0) <= sticky_bit(15);
	wire_w_sticky_bit_range354w(0) <= sticky_bit(16);
	wire_w_sticky_bit_range357w(0) <= sticky_bit(17);
	wire_w_sticky_bit_range360w(0) <= sticky_bit(18);
	wire_w_sticky_bit_range363w(0) <= sticky_bit(19);
	wire_w_sticky_bit_range309w(0) <= sticky_bit(1);
	wire_w_sticky_bit_range366w(0) <= sticky_bit(20);
	wire_w_sticky_bit_range369w(0) <= sticky_bit(21);
	wire_w_sticky_bit_range312w(0) <= sticky_bit(2);
	wire_w_sticky_bit_range315w(0) <= sticky_bit(3);
	wire_w_sticky_bit_range318w(0) <= sticky_bit(4);
	wire_w_sticky_bit_range321w(0) <= sticky_bit(5);
	wire_w_sticky_bit_range324w(0) <= sticky_bit(6);
	wire_w_sticky_bit_range327w(0) <= sticky_bit(7);
	wire_w_sticky_bit_range330w(0) <= sticky_bit(8);
	wire_w_sticky_bit_range333w(0) <= sticky_bit(9);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataa_exp_all_one_ff_p1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dataa_exp_all_one_ff_p1 <= dataa_exp_all_one(7);
			END IF;
		END IF;
	END PROCESS;
	wire_dataa_exp_all_one_ff_p1_w_lg_q296w(0) <= dataa_exp_all_one_ff_p1 AND wire_dataa_man_not_zero_ff_p1_w_lg_w_lg_q290w295w(0);
	wire_dataa_exp_all_one_ff_p1_w_lg_q291w(0) <= dataa_exp_all_one_ff_p1 AND wire_dataa_man_not_zero_ff_p1_w_lg_q290w(0);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataa_exp_not_zero_ff_p1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dataa_exp_not_zero_ff_p1 <= dataa_exp_not_zero(7);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataa_man_not_zero_ff_p1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dataa_man_not_zero_ff_p1 <= dataa_man_not_zero(10);
			END IF;
		END IF;
	END PROCESS;
	wire_dataa_man_not_zero_ff_p1_w_lg_w_lg_q290w295w(0) <= NOT wire_dataa_man_not_zero_ff_p1_w_lg_q290w(0);
	wire_dataa_man_not_zero_ff_p1_w_lg_q290w(0) <= dataa_man_not_zero_ff_p1 OR dataa_man_not_zero_ff_p2;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataa_man_not_zero_ff_p2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dataa_man_not_zero_ff_p2 <= dataa_man_not_zero(22);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN datab_exp_all_one_ff_p1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN datab_exp_all_one_ff_p1 <= datab_exp_all_one(7);
			END IF;
		END IF;
	END PROCESS;
	wire_datab_exp_all_one_ff_p1_w_lg_q294w(0) <= datab_exp_all_one_ff_p1 AND wire_datab_man_not_zero_ff_p1_w_lg_w_lg_q288w293w(0);
	wire_datab_exp_all_one_ff_p1_w_lg_q289w(0) <= datab_exp_all_one_ff_p1 AND wire_datab_man_not_zero_ff_p1_w_lg_q288w(0);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN datab_exp_not_zero_ff_p1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN datab_exp_not_zero_ff_p1 <= datab_exp_not_zero(7);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN datab_man_not_zero_ff_p1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN datab_man_not_zero_ff_p1 <= datab_man_not_zero(10);
			END IF;
		END IF;
	END PROCESS;
	wire_datab_man_not_zero_ff_p1_w_lg_w_lg_q288w293w(0) <= NOT wire_datab_man_not_zero_ff_p1_w_lg_q288w(0);
	wire_datab_man_not_zero_ff_p1_w_lg_q288w(0) <= datab_man_not_zero_ff_p1 OR datab_man_not_zero_ff_p2;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN datab_man_not_zero_ff_p2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN datab_man_not_zero_ff_p2 <= datab_man_not_zero(22);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_exp2_bias <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_exp2_bias <= delay_exp_bias;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_exp3_bias <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_exp3_bias <= delay_exp2_bias;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_exp_bias <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_exp_bias <= wire_exp_bias_subtr_result;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_man_product_msb <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_man_product_msb <= delay_man_product_msb_p0;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_man_product_msb2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_man_product_msb2 <= delay_man_product_msb;
			END IF;
		END IF;
	END PROCESS;
	wire_delay_man_product_msb2_w_lg_q393w(0) <= delay_man_product_msb2 AND wire_man_round_p2_w_q_range391w(0);
	wire_delay_man_product_msb2_w_lg_q395w(0) <= delay_man_product_msb2 XOR wire_man_round_p2_w_q_range391w(0);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_man_product_msb_p0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_man_product_msb_p0 <= wire_man_product2_mult_w_result_range298w(0);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN delay_round <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN delay_round <= wire_man_round_p2_w_lg_w_lg_w_q_range404w405w406w;
			END IF;
		END IF;
	END PROCESS;
	loop2 : FOR i IN 0 TO 21 GENERATE 
		wire_delay_round_w485w(i) <= wire_delay_round_w_lg_w_lg_w_lg_w_lg_w_q_range480w481w482w483w484w(i) AND wire_input_is_nan_ff4_w_lg_q479w(0);
	END GENERATE loop2;
	loop3 : FOR i IN 0 TO 21 GENERATE 
		wire_delay_round_w_lg_w_lg_w_lg_w_lg_w_q_range480w481w482w483w484w(i) <= wire_delay_round_w_lg_w_lg_w_lg_w_q_range480w481w482w483w(i) AND wire_w_lg_exp_is_zero458w(0);
	END GENERATE loop3;
	wire_delay_round_w_lg_w_lg_w_lg_w_lg_w_q_range470w471w472w473w474w(0) <= wire_delay_round_w_lg_w_lg_w_lg_w_q_range470w471w472w473w(0) AND wire_w_lg_exp_is_zero458w(0);
	loop4 : FOR i IN 0 TO 21 GENERATE 
		wire_delay_round_w_lg_w_lg_w_lg_w_q_range480w481w482w483w(i) <= wire_delay_round_w_lg_w_lg_w_q_range480w481w482w(i) AND wire_w_lg_exp_is_inf468w(0);
	END GENERATE loop4;
	wire_delay_round_w_lg_w_lg_w_lg_w_q_range470w471w472w473w(0) <= wire_delay_round_w_lg_w_lg_w_q_range470w471w472w(0) AND wire_w_lg_exp_is_inf468w(0);
	loop5 : FOR i IN 0 TO 21 GENERATE 
		wire_delay_round_w_lg_w_lg_w_q_range480w481w482w(i) <= wire_delay_round_w_lg_w_q_range480w481w(i) AND wire_input_is_infinity_ff4_w_lg_q469w(0);
	END GENERATE loop5;
	wire_delay_round_w_lg_w_lg_w_q_range470w471w472w(0) <= wire_delay_round_w_lg_w_q_range470w471w(0) AND wire_input_is_infinity_ff4_w_lg_q469w(0);
	loop6 : FOR i IN 0 TO 21 GENERATE 
		wire_delay_round_w_lg_w_q_range480w481w(i) <= wire_delay_round_w_q_range480w(i) AND input_not_zero_ff4;
	END GENERATE loop6;
	wire_delay_round_w_lg_w_q_range470w471w(0) <= wire_delay_round_w_q_range470w(0) AND input_not_zero_ff4;
	wire_delay_round_w475w(0) <= wire_delay_round_w_lg_w_lg_w_lg_w_lg_w_q_range470w471w472w473w474w(0) OR wire_input_is_infinity_ff4_w_lg_q467w(0);
	wire_delay_round_w_lg_w475w476w(0) <= wire_delay_round_w475w(0) OR input_is_nan_ff4;
	wire_delay_round_w_q_range480w <= delay_round(21 DOWNTO 0);
	wire_delay_round_w_q_range470w(0) <= delay_round(22);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_add_p1 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_add_p1 <= wire_exp_add_adder_result;
			END IF;
		END IF;
	END PROCESS;
	wire_exp_add_p1_w_q_range63w <= exp_add_p1(8 DOWNTO 0);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_adj_p1 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_adj_p1 <= delay_exp3_bias;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_adj_p2 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_adj_p2 <= wire_exp_adj_adder_result;
			END IF;
		END IF;
	END PROCESS;
	loop7 : FOR i IN 0 TO 7 GENERATE 
		wire_exp_adj_p2_w_lg_w_lg_w_q_range459w460w461w(i) <= wire_exp_adj_p2_w_lg_w_q_range459w460w(i) AND input_not_zero_ff4;
	END GENERATE loop7;
	loop8 : FOR i IN 0 TO 7 GENERATE 
		wire_exp_adj_p2_w_lg_w_q_range459w460w(i) <= wire_exp_adj_p2_w_q_range459w(i) AND wire_w_lg_exp_is_zero458w(0);
	END GENERATE loop8;
	wire_exp_adj_p2_w_lg_w_q_range432w457w(0) <= wire_exp_adj_p2_w_q_range432w(0) OR wire_w_lg_w_result_exp_not_zero_range454w456w(0);
	wire_exp_adj_p2_w_q_range410w(0) <= exp_adj_p2(1);
	wire_exp_adj_p2_w_q_range413w(0) <= exp_adj_p2(2);
	wire_exp_adj_p2_w_q_range416w(0) <= exp_adj_p2(3);
	wire_exp_adj_p2_w_q_range419w(0) <= exp_adj_p2(4);
	wire_exp_adj_p2_w_q_range422w(0) <= exp_adj_p2(5);
	wire_exp_adj_p2_w_q_range425w(0) <= exp_adj_p2(6);
	wire_exp_adj_p2_w_q_range459w <= exp_adj_p2(7 DOWNTO 0);
	wire_exp_adj_p2_w_q_range428w(0) <= exp_adj_p2(7);
	wire_exp_adj_p2_w_q_range431w(0) <= exp_adj_p2(8);
	wire_exp_adj_p2_w_q_range432w(0) <= exp_adj_p2(9);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_bias_p1 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_bias_p1 <= wire_exp_add_p1_w_q_range63w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_bias_p2 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_bias_p2 <= exp_bias_p1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_result_ff <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_result_ff <= wire_w_lg_w_lg_inf_num464w465w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_dffe_0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_dffe_0 <= (wire_dataa_exp_all_one_ff_p1_w_lg_q296w(0) OR wire_datab_exp_all_one_ff_p1_w_lg_q294w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_dffe_1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_dffe_1 <= input_is_infinity_dffe_0;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_dffe_2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_dffe_2 <= input_is_infinity_dffe_1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_dffe_3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_dffe_3 <= input_is_infinity_dffe_2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_ff1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_ff1 <= input_is_infinity_dffe_3;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_ff2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_ff2 <= input_is_infinity_ff1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_ff3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_ff3 <= input_is_infinity_ff2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinity_ff4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinity_ff4 <= input_is_infinity_ff3;
			END IF;
		END IF;
	END PROCESS;
	wire_input_is_infinity_ff4_w_lg_q467w(0) <= input_is_infinity_ff4 AND wire_input_not_zero_ff4_w_lg_q466w(0);
	wire_input_is_infinity_ff4_w_lg_q469w(0) <= NOT input_is_infinity_ff4;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe_0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe_0 <= (wire_dataa_exp_all_one_ff_p1_w_lg_q291w(0) OR wire_datab_exp_all_one_ff_p1_w_lg_q289w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe_1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe_1 <= input_is_nan_dffe_0;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe_2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe_2 <= input_is_nan_dffe_1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe_3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe_3 <= input_is_nan_dffe_2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_ff1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_ff1 <= input_is_nan_dffe_3;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_ff2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_ff2 <= input_is_nan_ff1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_ff3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_ff3 <= input_is_nan_ff2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_ff4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_ff4 <= input_is_nan_ff3;
			END IF;
		END IF;
	END PROCESS;
	wire_input_is_nan_ff4_w_lg_q479w(0) <= NOT input_is_nan_ff4;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_dffe_0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_dffe_0 <= (dataa_exp_not_zero_ff_p1 AND datab_exp_not_zero_ff_p1);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_dffe_1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_dffe_1 <= input_not_zero_dffe_0;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_dffe_2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_dffe_2 <= input_not_zero_dffe_1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_dffe_3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_dffe_3 <= input_not_zero_dffe_2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_ff1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_ff1 <= input_not_zero_dffe_3;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_ff2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_ff2 <= input_not_zero_ff1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_ff3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_ff3 <= input_not_zero_ff2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_not_zero_ff4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_not_zero_ff4 <= input_not_zero_ff3;
			END IF;
		END IF;
	END PROCESS;
	wire_input_not_zero_ff4_w_lg_q466w(0) <= NOT input_not_zero_ff4;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN lsb_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN lsb_dffe <= lsb_bit;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_result_ff <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_result_ff <= ( wire_delay_round_w_lg_w475w476w & wire_delay_round_w485w);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_round_carry_p0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_round_carry_p0 <= round_carry;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_round_p <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_round_p <= wire_w_man_shift_full_range379w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_round_p0 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_round_p0 <= man_round_p;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_round_p2 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_round_p2 <= wire_man_round_adder_result;
			END IF;
		END IF;
	END PROCESS;
	loop9 : FOR i IN 0 TO 23 GENERATE 
		wire_man_round_p2_w_lg_w_q_range404w405w(i) <= wire_man_round_p2_w_q_range404w(i) AND wire_man_round_p2_w_lg_w_q_range391w403w(0);
	END GENERATE loop9;
	loop10 : FOR i IN 0 TO 23 GENERATE 
		wire_man_round_p2_w_lg_w_q_range401w402w(i) <= wire_man_round_p2_w_q_range401w(i) AND wire_man_round_p2_w_q_range391w(0);
	END GENERATE loop10;
	wire_man_round_p2_w_lg_w_q_range391w403w(0) <= NOT wire_man_round_p2_w_q_range391w(0);
	loop11 : FOR i IN 0 TO 23 GENERATE 
		wire_man_round_p2_w_lg_w_lg_w_q_range404w405w406w(i) <= wire_man_round_p2_w_lg_w_q_range404w405w(i) OR wire_man_round_p2_w_lg_w_q_range401w402w(i);
	END GENERATE loop11;
	wire_man_round_p2_w_q_range404w <= man_round_p2(23 DOWNTO 0);
	wire_man_round_p2_w_q_range401w <= man_round_p2(24 DOWNTO 1);
	wire_man_round_p2_w_q_range391w(0) <= man_round_p2(24);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN round_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN round_dffe <= round_bit;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff0 <= (dataa(31) XOR datab(31));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff1 <= sign_node_ff0;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff2 <= sign_node_ff1;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff3 <= sign_node_ff2;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff4 <= sign_node_ff3;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff5 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff5 <= sign_node_ff4;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff6 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff6 <= sign_node_ff5;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff7 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff7 <= sign_node_ff6;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff8 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff8 <= sign_node_ff7;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_node_ff9 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_node_ff9 <= sign_node_ff8;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sticky_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sticky_dffe <= sticky_bit(22);
			END IF;
		END IF;
	END PROCESS;
	wire_exp_add_adder_dataa <= ( "0" & dataa(30 DOWNTO 23));
	wire_exp_add_adder_datab <= ( "0" & datab(30 DOWNTO 23));
	exp_add_adder :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aclr => aclr,
		cin => wire_gnd,
		clken => clk_en,
		clock => clock,
		dataa => wire_exp_add_adder_dataa,
		datab => wire_exp_add_adder_datab,
		result => wire_exp_add_adder_result
	  );
	wire_exp_adj_adder_datab <= ( expmod(9 DOWNTO 0));
	exp_adj_adder :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 0,
		LPM_WIDTH => 10
	  )
	  PORT MAP ( 
		cin => wire_gnd,
		dataa => exp_adj_p1,
		datab => wire_exp_adj_adder_datab,
		result => wire_exp_adj_adder_result
	  );
	wire_exp_bias_subtr_dataa <= ( "0" & exp_bias_p2);
	wire_exp_bias_subtr_datab <= ( bias(9 DOWNTO 0));
	exp_bias_subtr :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 0,
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 10
	  )
	  PORT MAP ( 
		dataa => wire_exp_bias_subtr_dataa,
		datab => wire_exp_bias_subtr_datab,
		result => wire_exp_bias_subtr_result
	  );
	wire_man_round_adder_dataa <= ( "0" & man_round_p0);
	wire_man_round_adder_datab <= ( "000000000000000000000000" & man_round_carry_p0);
	man_round_adder :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 0,
		LPM_WIDTH => 25
	  )
	  PORT MAP ( 
		dataa => wire_man_round_adder_dataa,
		datab => wire_man_round_adder_datab,
		result => wire_man_round_adder_result
	  );
	loop12 : FOR i IN 0 TO 24 GENERATE 
		wire_man_product2_mult_w_lg_w_result_range302w303w(i) <= wire_man_product2_mult_w_result_range302w(i) AND wire_man_product2_mult_w_lg_w_result_range298w301w(0);
	END GENERATE loop12;
	loop13 : FOR i IN 0 TO 24 GENERATE 
		wire_man_product2_mult_w_lg_w_result_range299w300w(i) <= wire_man_product2_mult_w_result_range299w(i) AND wire_man_product2_mult_w_result_range298w(0);
	END GENERATE loop13;
	wire_man_product2_mult_w_lg_w_result_range298w373w(0) <= wire_man_product2_mult_w_result_range298w(0) AND wire_man_product2_mult_w_result_range371w(0);
	wire_man_product2_mult_w_lg_w_result_range298w301w(0) <= NOT wire_man_product2_mult_w_result_range298w(0);
	wire_man_product2_mult_dataa <= ( "1" & dataa(22 DOWNTO 0));
	wire_man_product2_mult_datab <= ( "1" & datab(22 DOWNTO 0));
	wire_man_product2_mult_w_result_range335w(0) <= wire_man_product2_mult_result(10);
	wire_man_product2_mult_w_result_range338w(0) <= wire_man_product2_mult_result(11);
	wire_man_product2_mult_w_result_range341w(0) <= wire_man_product2_mult_result(12);
	wire_man_product2_mult_w_result_range344w(0) <= wire_man_product2_mult_result(13);
	wire_man_product2_mult_w_result_range347w(0) <= wire_man_product2_mult_result(14);
	wire_man_product2_mult_w_result_range350w(0) <= wire_man_product2_mult_result(15);
	wire_man_product2_mult_w_result_range353w(0) <= wire_man_product2_mult_result(16);
	wire_man_product2_mult_w_result_range356w(0) <= wire_man_product2_mult_result(17);
	wire_man_product2_mult_w_result_range359w(0) <= wire_man_product2_mult_result(18);
	wire_man_product2_mult_w_result_range362w(0) <= wire_man_product2_mult_result(19);
	wire_man_product2_mult_w_result_range308w(0) <= wire_man_product2_mult_result(1);
	wire_man_product2_mult_w_result_range365w(0) <= wire_man_product2_mult_result(20);
	wire_man_product2_mult_w_result_range368w(0) <= wire_man_product2_mult_result(21);
	wire_man_product2_mult_w_result_range371w(0) <= wire_man_product2_mult_result(22);
	wire_man_product2_mult_w_result_range311w(0) <= wire_man_product2_mult_result(2);
	wire_man_product2_mult_w_result_range314w(0) <= wire_man_product2_mult_result(3);
	wire_man_product2_mult_w_result_range302w <= wire_man_product2_mult_result(46 DOWNTO 22);
	wire_man_product2_mult_w_result_range299w <= wire_man_product2_mult_result(47 DOWNTO 23);
	wire_man_product2_mult_w_result_range298w(0) <= wire_man_product2_mult_result(47);
	wire_man_product2_mult_w_result_range317w(0) <= wire_man_product2_mult_result(4);
	wire_man_product2_mult_w_result_range320w(0) <= wire_man_product2_mult_result(5);
	wire_man_product2_mult_w_result_range323w(0) <= wire_man_product2_mult_result(6);
	wire_man_product2_mult_w_result_range326w(0) <= wire_man_product2_mult_result(7);
	wire_man_product2_mult_w_result_range329w(0) <= wire_man_product2_mult_result(8);
	wire_man_product2_mult_w_result_range332w(0) <= wire_man_product2_mult_result(9);
	man_product2_mult :  lpm_mult
	  GENERIC MAP (
		LPM_PIPELINE => 5,
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTHA => 24,
		LPM_WIDTHB => 24,
		LPM_WIDTHP => 48,
		LPM_WIDTHS => 1,
		lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES"
	  )
	  PORT MAP ( 
		aclr => aclr,
		clken => clk_en,
		clock => clock,
		dataa => wire_man_product2_mult_dataa,
		datab => wire_man_product2_mult_datab,
		result => wire_man_product2_mult_result
	  );

 END RTL; --cpu_fpoint_mult_single
--VALID FILE

--altfp_add_sub CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DENORMAL_SUPPORT="NO" DEVICE_FAMILY="CYCLONEII" DIRECTION="VARIABLE" EXCEPTION_HANDLING="NO" PIPELINE=8 REDUCED_FUNCTIONALITY="NO" SPEED_OPTIMIZED="YES" WIDTH_EXP=8 WIDTH_MAN=23 aclr add_sub clk_en clock dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_add_sub 2010:01:25:21:24:34:SJ cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ  VERSION_END


-- Copyright (C) 1991-2010 Altera Corporation
--  Your use of Altera Corporation's design tools, logic functions 
--  and other software and tools, and its AMPP partner logic 
--  functions, and any output files from any of the foregoing 
--  (including device programming or simulation files), and any 
--  associated documentation or information are expressly subject 
--  to the terms and conditions of the Altera Program License 
--  Subscription Agreement, Altera MegaCore Function License 
--  Agreement, or other applicable license agreement, including, 
--  without limitation, that your use is for the sole purpose of 
--  programming logic devices manufactured by Altera and sold by 
--  Altera or its authorized distributors.  Please refer to the 
--  applicable agreement for further details.




--altbarrel_shift CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="CYCLONEII" PIPELINE=1 SHIFTDIR="LEFT" WIDTH=26 WIDTHDIST=5 aclr clk_en clock data distance result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = reg 27 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altbarrel_shift_0ig IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clk_en	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 data	:	IN  STD_LOGIC_VECTOR (25 DOWNTO 0);
		 distance	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (25 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altbarrel_shift_0ig;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altbarrel_shift_0ig IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	 dir_pipe	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sbit_piper1d	:	STD_LOGIC_VECTOR(25 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w695w696w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w691w692w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w716w717w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w712w713w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w738w739w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w734w735w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w760w761w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w756w757w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w782w783w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w778w779w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w687w688w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w708w709w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w730w731w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w752w753w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w774w775w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range682w695w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range682w691w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range703w716w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range703w712w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range725w738w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range725w734w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range747w760w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range747w756w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range769w782w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range769w778w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_dir_w_range679w694w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_dir_w_range701w715w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_dir_w_range722w737w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_dir_w_range744w759w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_dir_w_range766w781w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range682w687w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range703w708w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range725w730w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range747w752w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_sel_w_range769w774w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range682w695w696w697w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range703w716w717w718w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range725w738w739w740w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range747w760w761w762w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range769w782w783w784w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w698w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w719w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w741w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w763w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w785w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  dir_w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  direction_w :	STD_LOGIC;
	 SIGNAL  pad_w :	STD_LOGIC_VECTOR (15 DOWNTO 0);
	 SIGNAL  sbit_w :	STD_LOGIC_VECTOR (155 DOWNTO 0);
	 SIGNAL  sel_w :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  smux_w :	STD_LOGIC_VECTOR (129 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w690w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w693w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w711w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w714w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w733w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w736w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w755w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w758w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w777w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w780w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_dir_w_range679w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_dir_w_range701w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_dir_w_range722w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_dir_w_range744w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_dir_w_range766w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sbit_w_range742w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sbit_w_range764w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sbit_w_range677w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sbit_w_range700w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sbit_w_range720w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sel_w_range682w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sel_w_range703w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sel_w_range725w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sel_w_range747w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_sel_w_range769w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_lbarrel_shift_w_smux_w_range773w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
 BEGIN

	loop0 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w695w696w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range682w695w(0) AND wire_lbarrel_shift_w693w(i);
	END GENERATE loop0;
	loop1 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w691w692w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range682w691w(0) AND wire_lbarrel_shift_w690w(i);
	END GENERATE loop1;
	loop2 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w716w717w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range703w716w(0) AND wire_lbarrel_shift_w714w(i);
	END GENERATE loop2;
	loop3 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w712w713w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range703w712w(0) AND wire_lbarrel_shift_w711w(i);
	END GENERATE loop3;
	loop4 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w738w739w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range725w738w(0) AND wire_lbarrel_shift_w736w(i);
	END GENERATE loop4;
	loop5 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w734w735w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range725w734w(0) AND wire_lbarrel_shift_w733w(i);
	END GENERATE loop5;
	loop6 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w760w761w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range747w760w(0) AND wire_lbarrel_shift_w758w(i);
	END GENERATE loop6;
	loop7 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w756w757w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range747w756w(0) AND wire_lbarrel_shift_w755w(i);
	END GENERATE loop7;
	loop8 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w782w783w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range769w782w(0) AND wire_lbarrel_shift_w780w(i);
	END GENERATE loop8;
	loop9 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w778w779w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range769w778w(0) AND wire_lbarrel_shift_w777w(i);
	END GENERATE loop9;
	loop10 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w687w688w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range682w687w(0) AND wire_lbarrel_shift_w_sbit_w_range677w(i);
	END GENERATE loop10;
	loop11 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w708w709w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range703w708w(0) AND wire_lbarrel_shift_w_sbit_w_range700w(i);
	END GENERATE loop11;
	loop12 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w730w731w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range725w730w(0) AND wire_lbarrel_shift_w_sbit_w_range720w(i);
	END GENERATE loop12;
	loop13 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w752w753w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range747w752w(0) AND wire_lbarrel_shift_w_sbit_w_range742w(i);
	END GENERATE loop13;
	loop14 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w774w775w(i) <= wire_lbarrel_shift_w_lg_w_sel_w_range769w774w(0) AND wire_lbarrel_shift_w_sbit_w_range764w(i);
	END GENERATE loop14;
	wire_lbarrel_shift_w_lg_w_sel_w_range682w695w(0) <= wire_lbarrel_shift_w_sel_w_range682w(0) AND wire_lbarrel_shift_w_lg_w_dir_w_range679w694w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range682w691w(0) <= wire_lbarrel_shift_w_sel_w_range682w(0) AND wire_lbarrel_shift_w_dir_w_range679w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range703w716w(0) <= wire_lbarrel_shift_w_sel_w_range703w(0) AND wire_lbarrel_shift_w_lg_w_dir_w_range701w715w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range703w712w(0) <= wire_lbarrel_shift_w_sel_w_range703w(0) AND wire_lbarrel_shift_w_dir_w_range701w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range725w738w(0) <= wire_lbarrel_shift_w_sel_w_range725w(0) AND wire_lbarrel_shift_w_lg_w_dir_w_range722w737w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range725w734w(0) <= wire_lbarrel_shift_w_sel_w_range725w(0) AND wire_lbarrel_shift_w_dir_w_range722w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range747w760w(0) <= wire_lbarrel_shift_w_sel_w_range747w(0) AND wire_lbarrel_shift_w_lg_w_dir_w_range744w759w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range747w756w(0) <= wire_lbarrel_shift_w_sel_w_range747w(0) AND wire_lbarrel_shift_w_dir_w_range744w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range769w782w(0) <= wire_lbarrel_shift_w_sel_w_range769w(0) AND wire_lbarrel_shift_w_lg_w_dir_w_range766w781w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range769w778w(0) <= wire_lbarrel_shift_w_sel_w_range769w(0) AND wire_lbarrel_shift_w_dir_w_range766w(0);
	wire_lbarrel_shift_w_lg_w_dir_w_range679w694w(0) <= NOT wire_lbarrel_shift_w_dir_w_range679w(0);
	wire_lbarrel_shift_w_lg_w_dir_w_range701w715w(0) <= NOT wire_lbarrel_shift_w_dir_w_range701w(0);
	wire_lbarrel_shift_w_lg_w_dir_w_range722w737w(0) <= NOT wire_lbarrel_shift_w_dir_w_range722w(0);
	wire_lbarrel_shift_w_lg_w_dir_w_range744w759w(0) <= NOT wire_lbarrel_shift_w_dir_w_range744w(0);
	wire_lbarrel_shift_w_lg_w_dir_w_range766w781w(0) <= NOT wire_lbarrel_shift_w_dir_w_range766w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range682w687w(0) <= NOT wire_lbarrel_shift_w_sel_w_range682w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range703w708w(0) <= NOT wire_lbarrel_shift_w_sel_w_range703w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range725w730w(0) <= NOT wire_lbarrel_shift_w_sel_w_range725w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range747w752w(0) <= NOT wire_lbarrel_shift_w_sel_w_range747w(0);
	wire_lbarrel_shift_w_lg_w_sel_w_range769w774w(0) <= NOT wire_lbarrel_shift_w_sel_w_range769w(0);
	loop15 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range682w695w696w697w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w695w696w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w691w692w(i);
	END GENERATE loop15;
	loop16 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range703w716w717w718w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w716w717w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w712w713w(i);
	END GENERATE loop16;
	loop17 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range725w738w739w740w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w738w739w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w734w735w(i);
	END GENERATE loop17;
	loop18 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range747w760w761w762w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w760w761w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w756w757w(i);
	END GENERATE loop18;
	loop19 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range769w782w783w784w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w782w783w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w778w779w(i);
	END GENERATE loop19;
	loop20 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w698w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range682w695w696w697w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range682w687w688w(i);
	END GENERATE loop20;
	loop21 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w719w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range703w716w717w718w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range703w708w709w(i);
	END GENERATE loop21;
	loop22 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w741w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range725w738w739w740w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range725w730w731w(i);
	END GENERATE loop22;
	loop23 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w763w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range747w760w761w762w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range747w752w753w(i);
	END GENERATE loop23;
	loop24 : FOR i IN 0 TO 25 GENERATE 
		wire_lbarrel_shift_w785w(i) <= wire_lbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range769w782w783w784w(i) OR wire_lbarrel_shift_w_lg_w_lg_w_sel_w_range769w774w775w(i);
	END GENERATE loop24;
	dir_w <= ( dir_pipe(0) & dir_w(3 DOWNTO 0) & direction_w);
	direction_w <= '0';
	pad_w <= (OTHERS => '0');
	result <= sbit_w(155 DOWNTO 130);
	sbit_w <= ( sbit_piper1d & smux_w(103 DOWNTO 0) & data);
	sel_w <= ( distance(4 DOWNTO 0));
	smux_w <= ( wire_lbarrel_shift_w785w & wire_lbarrel_shift_w763w & wire_lbarrel_shift_w741w & wire_lbarrel_shift_w719w & wire_lbarrel_shift_w698w);
	wire_lbarrel_shift_w690w <= ( pad_w(0) & sbit_w(25 DOWNTO 1));
	wire_lbarrel_shift_w693w <= ( sbit_w(24 DOWNTO 0) & pad_w(0));
	wire_lbarrel_shift_w711w <= ( pad_w(1 DOWNTO 0) & sbit_w(51 DOWNTO 28));
	wire_lbarrel_shift_w714w <= ( sbit_w(49 DOWNTO 26) & pad_w(1 DOWNTO 0));
	wire_lbarrel_shift_w733w <= ( pad_w(3 DOWNTO 0) & sbit_w(77 DOWNTO 56));
	wire_lbarrel_shift_w736w <= ( sbit_w(73 DOWNTO 52) & pad_w(3 DOWNTO 0));
	wire_lbarrel_shift_w755w <= ( pad_w(7 DOWNTO 0) & sbit_w(103 DOWNTO 86));
	wire_lbarrel_shift_w758w <= ( sbit_w(95 DOWNTO 78) & pad_w(7 DOWNTO 0));
	wire_lbarrel_shift_w777w <= ( pad_w(15 DOWNTO 0) & sbit_w(129 DOWNTO 120));
	wire_lbarrel_shift_w780w <= ( sbit_w(113 DOWNTO 104) & pad_w(15 DOWNTO 0));
	wire_lbarrel_shift_w_dir_w_range679w(0) <= dir_w(0);
	wire_lbarrel_shift_w_dir_w_range701w(0) <= dir_w(1);
	wire_lbarrel_shift_w_dir_w_range722w(0) <= dir_w(2);
	wire_lbarrel_shift_w_dir_w_range744w(0) <= dir_w(3);
	wire_lbarrel_shift_w_dir_w_range766w(0) <= dir_w(4);
	wire_lbarrel_shift_w_sbit_w_range742w <= sbit_w(103 DOWNTO 78);
	wire_lbarrel_shift_w_sbit_w_range764w <= sbit_w(129 DOWNTO 104);
	wire_lbarrel_shift_w_sbit_w_range677w <= sbit_w(25 DOWNTO 0);
	wire_lbarrel_shift_w_sbit_w_range700w <= sbit_w(51 DOWNTO 26);
	wire_lbarrel_shift_w_sbit_w_range720w <= sbit_w(77 DOWNTO 52);
	wire_lbarrel_shift_w_sel_w_range682w(0) <= sel_w(0);
	wire_lbarrel_shift_w_sel_w_range703w(0) <= sel_w(1);
	wire_lbarrel_shift_w_sel_w_range725w(0) <= sel_w(2);
	wire_lbarrel_shift_w_sel_w_range747w(0) <= sel_w(3);
	wire_lbarrel_shift_w_sel_w_range769w(0) <= sel_w(4);
	wire_lbarrel_shift_w_smux_w_range773w <= smux_w(129 DOWNTO 104);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dir_pipe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dir_pipe(0) <= ( dir_w(4));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sbit_piper1d <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sbit_piper1d <= wire_lbarrel_shift_w_smux_w_range773w;
			END IF;
		END IF;
	END PROCESS;

 END RTL; --cpu_fpoint_addsub_single_altbarrel_shift_0ig


--altbarrel_shift CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="CYCLONEII" SHIFTDIR="RIGHT" WIDTH=26 WIDTHDIST=5 data distance result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altbarrel_shift_l2e IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (25 DOWNTO 0);
		 distance	:	IN  STD_LOGIC_VECTOR (4 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (25 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altbarrel_shift_l2e;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altbarrel_shift_l2e IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w809w810w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w805w806w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w830w831w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w826w827w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w852w853w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w848w849w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w874w875w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w870w871w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w896w897w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w892w893w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w801w802w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w822w823w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w844w845w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w866w867w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w888w889w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range796w809w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range796w805w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range817w830w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range817w826w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range839w852w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range839w848w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range861w874w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range861w870w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range883w896w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range883w892w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_dir_w_range793w808w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_dir_w_range815w829w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_dir_w_range836w851w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_dir_w_range858w873w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_dir_w_range880w895w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range796w801w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range817w822w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range839w844w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range861w866w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_sel_w_range883w888w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range796w809w810w811w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range817w830w831w832w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range839w852w853w854w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range861w874w875w876w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range883w896w897w898w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w812w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w833w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w855w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w877w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w899w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  dir_w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  direction_w :	STD_LOGIC;
	 SIGNAL  pad_w :	STD_LOGIC_VECTOR (15 DOWNTO 0);
	 SIGNAL  sbit_w :	STD_LOGIC_VECTOR (155 DOWNTO 0);
	 SIGNAL  sel_w :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  smux_w :	STD_LOGIC_VECTOR (129 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w804w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w807w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w825w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w828w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w847w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w850w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w869w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w872w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w891w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w894w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_dir_w_range793w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_dir_w_range815w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_dir_w_range836w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_dir_w_range858w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_dir_w_range880w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sbit_w_range856w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sbit_w_range878w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sbit_w_range791w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sbit_w_range814w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sbit_w_range834w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sel_w_range796w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sel_w_range817w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sel_w_range839w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sel_w_range861w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_w_sel_w_range883w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	loop25 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w809w810w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range796w809w(0) AND wire_rbarrel_shift_w807w(i);
	END GENERATE loop25;
	loop26 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w805w806w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range796w805w(0) AND wire_rbarrel_shift_w804w(i);
	END GENERATE loop26;
	loop27 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w830w831w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range817w830w(0) AND wire_rbarrel_shift_w828w(i);
	END GENERATE loop27;
	loop28 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w826w827w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range817w826w(0) AND wire_rbarrel_shift_w825w(i);
	END GENERATE loop28;
	loop29 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w852w853w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range839w852w(0) AND wire_rbarrel_shift_w850w(i);
	END GENERATE loop29;
	loop30 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w848w849w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range839w848w(0) AND wire_rbarrel_shift_w847w(i);
	END GENERATE loop30;
	loop31 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w874w875w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range861w874w(0) AND wire_rbarrel_shift_w872w(i);
	END GENERATE loop31;
	loop32 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w870w871w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range861w870w(0) AND wire_rbarrel_shift_w869w(i);
	END GENERATE loop32;
	loop33 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w896w897w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range883w896w(0) AND wire_rbarrel_shift_w894w(i);
	END GENERATE loop33;
	loop34 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w892w893w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range883w892w(0) AND wire_rbarrel_shift_w891w(i);
	END GENERATE loop34;
	loop35 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w801w802w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range796w801w(0) AND wire_rbarrel_shift_w_sbit_w_range791w(i);
	END GENERATE loop35;
	loop36 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w822w823w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range817w822w(0) AND wire_rbarrel_shift_w_sbit_w_range814w(i);
	END GENERATE loop36;
	loop37 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w844w845w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range839w844w(0) AND wire_rbarrel_shift_w_sbit_w_range834w(i);
	END GENERATE loop37;
	loop38 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w866w867w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range861w866w(0) AND wire_rbarrel_shift_w_sbit_w_range856w(i);
	END GENERATE loop38;
	loop39 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w888w889w(i) <= wire_rbarrel_shift_w_lg_w_sel_w_range883w888w(0) AND wire_rbarrel_shift_w_sbit_w_range878w(i);
	END GENERATE loop39;
	wire_rbarrel_shift_w_lg_w_sel_w_range796w809w(0) <= wire_rbarrel_shift_w_sel_w_range796w(0) AND wire_rbarrel_shift_w_lg_w_dir_w_range793w808w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range796w805w(0) <= wire_rbarrel_shift_w_sel_w_range796w(0) AND wire_rbarrel_shift_w_dir_w_range793w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range817w830w(0) <= wire_rbarrel_shift_w_sel_w_range817w(0) AND wire_rbarrel_shift_w_lg_w_dir_w_range815w829w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range817w826w(0) <= wire_rbarrel_shift_w_sel_w_range817w(0) AND wire_rbarrel_shift_w_dir_w_range815w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range839w852w(0) <= wire_rbarrel_shift_w_sel_w_range839w(0) AND wire_rbarrel_shift_w_lg_w_dir_w_range836w851w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range839w848w(0) <= wire_rbarrel_shift_w_sel_w_range839w(0) AND wire_rbarrel_shift_w_dir_w_range836w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range861w874w(0) <= wire_rbarrel_shift_w_sel_w_range861w(0) AND wire_rbarrel_shift_w_lg_w_dir_w_range858w873w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range861w870w(0) <= wire_rbarrel_shift_w_sel_w_range861w(0) AND wire_rbarrel_shift_w_dir_w_range858w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range883w896w(0) <= wire_rbarrel_shift_w_sel_w_range883w(0) AND wire_rbarrel_shift_w_lg_w_dir_w_range880w895w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range883w892w(0) <= wire_rbarrel_shift_w_sel_w_range883w(0) AND wire_rbarrel_shift_w_dir_w_range880w(0);
	wire_rbarrel_shift_w_lg_w_dir_w_range793w808w(0) <= NOT wire_rbarrel_shift_w_dir_w_range793w(0);
	wire_rbarrel_shift_w_lg_w_dir_w_range815w829w(0) <= NOT wire_rbarrel_shift_w_dir_w_range815w(0);
	wire_rbarrel_shift_w_lg_w_dir_w_range836w851w(0) <= NOT wire_rbarrel_shift_w_dir_w_range836w(0);
	wire_rbarrel_shift_w_lg_w_dir_w_range858w873w(0) <= NOT wire_rbarrel_shift_w_dir_w_range858w(0);
	wire_rbarrel_shift_w_lg_w_dir_w_range880w895w(0) <= NOT wire_rbarrel_shift_w_dir_w_range880w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range796w801w(0) <= NOT wire_rbarrel_shift_w_sel_w_range796w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range817w822w(0) <= NOT wire_rbarrel_shift_w_sel_w_range817w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range839w844w(0) <= NOT wire_rbarrel_shift_w_sel_w_range839w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range861w866w(0) <= NOT wire_rbarrel_shift_w_sel_w_range861w(0);
	wire_rbarrel_shift_w_lg_w_sel_w_range883w888w(0) <= NOT wire_rbarrel_shift_w_sel_w_range883w(0);
	loop40 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range796w809w810w811w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w809w810w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w805w806w(i);
	END GENERATE loop40;
	loop41 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range817w830w831w832w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w830w831w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w826w827w(i);
	END GENERATE loop41;
	loop42 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range839w852w853w854w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w852w853w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w848w849w(i);
	END GENERATE loop42;
	loop43 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range861w874w875w876w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w874w875w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w870w871w(i);
	END GENERATE loop43;
	loop44 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range883w896w897w898w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w896w897w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w892w893w(i);
	END GENERATE loop44;
	loop45 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w812w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range796w809w810w811w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range796w801w802w(i);
	END GENERATE loop45;
	loop46 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w833w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range817w830w831w832w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range817w822w823w(i);
	END GENERATE loop46;
	loop47 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w855w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range839w852w853w854w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range839w844w845w(i);
	END GENERATE loop47;
	loop48 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w877w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range861w874w875w876w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range861w866w867w(i);
	END GENERATE loop48;
	loop49 : FOR i IN 0 TO 25 GENERATE 
		wire_rbarrel_shift_w899w(i) <= wire_rbarrel_shift_w_lg_w_lg_w_lg_w_sel_w_range883w896w897w898w(i) OR wire_rbarrel_shift_w_lg_w_lg_w_sel_w_range883w888w889w(i);
	END GENERATE loop49;
	dir_w <= ( dir_w(4 DOWNTO 0) & direction_w);
	direction_w <= '1';
	pad_w <= (OTHERS => '0');
	result <= sbit_w(155 DOWNTO 130);
	sbit_w <= ( smux_w(129 DOWNTO 0) & data);
	sel_w <= ( distance(4 DOWNTO 0));
	smux_w <= ( wire_rbarrel_shift_w899w & wire_rbarrel_shift_w877w & wire_rbarrel_shift_w855w & wire_rbarrel_shift_w833w & wire_rbarrel_shift_w812w);
	wire_rbarrel_shift_w804w <= ( pad_w(0) & sbit_w(25 DOWNTO 1));
	wire_rbarrel_shift_w807w <= ( sbit_w(24 DOWNTO 0) & pad_w(0));
	wire_rbarrel_shift_w825w <= ( pad_w(1 DOWNTO 0) & sbit_w(51 DOWNTO 28));
	wire_rbarrel_shift_w828w <= ( sbit_w(49 DOWNTO 26) & pad_w(1 DOWNTO 0));
	wire_rbarrel_shift_w847w <= ( pad_w(3 DOWNTO 0) & sbit_w(77 DOWNTO 56));
	wire_rbarrel_shift_w850w <= ( sbit_w(73 DOWNTO 52) & pad_w(3 DOWNTO 0));
	wire_rbarrel_shift_w869w <= ( pad_w(7 DOWNTO 0) & sbit_w(103 DOWNTO 86));
	wire_rbarrel_shift_w872w <= ( sbit_w(95 DOWNTO 78) & pad_w(7 DOWNTO 0));
	wire_rbarrel_shift_w891w <= ( pad_w(15 DOWNTO 0) & sbit_w(129 DOWNTO 120));
	wire_rbarrel_shift_w894w <= ( sbit_w(113 DOWNTO 104) & pad_w(15 DOWNTO 0));
	wire_rbarrel_shift_w_dir_w_range793w(0) <= dir_w(0);
	wire_rbarrel_shift_w_dir_w_range815w(0) <= dir_w(1);
	wire_rbarrel_shift_w_dir_w_range836w(0) <= dir_w(2);
	wire_rbarrel_shift_w_dir_w_range858w(0) <= dir_w(3);
	wire_rbarrel_shift_w_dir_w_range880w(0) <= dir_w(4);
	wire_rbarrel_shift_w_sbit_w_range856w <= sbit_w(103 DOWNTO 78);
	wire_rbarrel_shift_w_sbit_w_range878w <= sbit_w(129 DOWNTO 104);
	wire_rbarrel_shift_w_sbit_w_range791w <= sbit_w(25 DOWNTO 0);
	wire_rbarrel_shift_w_sbit_w_range814w <= sbit_w(51 DOWNTO 26);
	wire_rbarrel_shift_w_sbit_w_range834w <= sbit_w(77 DOWNTO 52);
	wire_rbarrel_shift_w_sel_w_range796w(0) <= sel_w(0);
	wire_rbarrel_shift_w_sel_w_range817w(0) <= sel_w(1);
	wire_rbarrel_shift_w_sel_w_range839w(0) <= sel_w(2);
	wire_rbarrel_shift_w_sel_w_range861w(0) <= sel_w(3);
	wire_rbarrel_shift_w_sel_w_range883w(0) <= sel_w(4);

 END RTL; --cpu_fpoint_addsub_single_altbarrel_shift_l2e


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" WIDTH=32 WIDTHAD=5 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=16 WIDTHAD=4 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=8 WIDTHAD=3 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=4 WIDTHAD=2 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=2 WIDTHAD=1 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_i0b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_i0b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_i0b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
 BEGIN

	q(0) <= ( data(1));
	zero <= (NOT (data(0) OR data(1)));

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_i0b

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_l0b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_l0b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_l0b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder13_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder13_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder14_w_lg_w_lg_zero934w935w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder14_w_lg_zero936w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder14_w_lg_zero934w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder14_w_lg_w_lg_zero936w937w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder14_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder14_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_i0b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder14_w_lg_zero934w & wire_altpriority_encoder14_w_lg_w_lg_zero936w937w);
	zero <= (wire_altpriority_encoder13_zero AND wire_altpriority_encoder14_zero);
	altpriority_encoder13 :  cpu_fpoint_addsub_single_altpriority_encoder_i0b
	  PORT MAP ( 
		data => data(1 DOWNTO 0),
		q => wire_altpriority_encoder13_q,
		zero => wire_altpriority_encoder13_zero
	  );
	wire_altpriority_encoder14_w_lg_w_lg_zero934w935w(0) <= wire_altpriority_encoder14_w_lg_zero934w(0) AND wire_altpriority_encoder14_q(0);
	wire_altpriority_encoder14_w_lg_zero936w(0) <= wire_altpriority_encoder14_zero AND wire_altpriority_encoder13_q(0);
	wire_altpriority_encoder14_w_lg_zero934w(0) <= NOT wire_altpriority_encoder14_zero;
	wire_altpriority_encoder14_w_lg_w_lg_zero936w937w(0) <= wire_altpriority_encoder14_w_lg_zero936w(0) OR wire_altpriority_encoder14_w_lg_w_lg_zero934w935w(0);
	altpriority_encoder14 :  cpu_fpoint_addsub_single_altpriority_encoder_i0b
	  PORT MAP ( 
		data => data(3 DOWNTO 2),
		q => wire_altpriority_encoder14_q,
		zero => wire_altpriority_encoder14_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_l0b

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_q0b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_q0b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_q0b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder11_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder11_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder12_w_lg_w_lg_zero924w925w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder12_w_lg_zero926w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder12_w_lg_zero924w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder12_w_lg_w_lg_zero926w927w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder12_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder12_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_l0b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder12_w_lg_zero924w & wire_altpriority_encoder12_w_lg_w_lg_zero926w927w);
	zero <= (wire_altpriority_encoder11_zero AND wire_altpriority_encoder12_zero);
	altpriority_encoder11 :  cpu_fpoint_addsub_single_altpriority_encoder_l0b
	  PORT MAP ( 
		data => data(3 DOWNTO 0),
		q => wire_altpriority_encoder11_q,
		zero => wire_altpriority_encoder11_zero
	  );
	loop50 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder12_w_lg_w_lg_zero924w925w(i) <= wire_altpriority_encoder12_w_lg_zero924w(0) AND wire_altpriority_encoder12_q(i);
	END GENERATE loop50;
	loop51 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder12_w_lg_zero926w(i) <= wire_altpriority_encoder12_zero AND wire_altpriority_encoder11_q(i);
	END GENERATE loop51;
	wire_altpriority_encoder12_w_lg_zero924w(0) <= NOT wire_altpriority_encoder12_zero;
	loop52 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder12_w_lg_w_lg_zero926w927w(i) <= wire_altpriority_encoder12_w_lg_zero926w(i) OR wire_altpriority_encoder12_w_lg_w_lg_zero924w925w(i);
	END GENERATE loop52;
	altpriority_encoder12 :  cpu_fpoint_addsub_single_altpriority_encoder_l0b
	  PORT MAP ( 
		data => data(7 DOWNTO 4),
		q => wire_altpriority_encoder12_q,
		zero => wire_altpriority_encoder12_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_q0b


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=8 WIDTHAD=3 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=4 WIDTHAD=2 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=2 WIDTHAD=1 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_iha IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_iha;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_iha IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
 BEGIN

	q(0) <= ( data(1));

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_iha

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_lha IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (1 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_lha;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_lha IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder17_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder18_w_lg_w_lg_zero959w960w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder18_w_lg_zero961w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder18_w_lg_zero959w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder18_w_lg_w_lg_zero961w962w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder18_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder18_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_iha
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_i0b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder18_w_lg_zero959w & wire_altpriority_encoder18_w_lg_w_lg_zero961w962w);
	altpriority_encoder17 :  cpu_fpoint_addsub_single_altpriority_encoder_iha
	  PORT MAP ( 
		data => data(1 DOWNTO 0),
		q => wire_altpriority_encoder17_q
	  );
	wire_altpriority_encoder18_w_lg_w_lg_zero959w960w(0) <= wire_altpriority_encoder18_w_lg_zero959w(0) AND wire_altpriority_encoder18_q(0);
	wire_altpriority_encoder18_w_lg_zero961w(0) <= wire_altpriority_encoder18_zero AND wire_altpriority_encoder17_q(0);
	wire_altpriority_encoder18_w_lg_zero959w(0) <= NOT wire_altpriority_encoder18_zero;
	wire_altpriority_encoder18_w_lg_w_lg_zero961w962w(0) <= wire_altpriority_encoder18_w_lg_zero961w(0) OR wire_altpriority_encoder18_w_lg_w_lg_zero959w960w(0);
	altpriority_encoder18 :  cpu_fpoint_addsub_single_altpriority_encoder_i0b
	  PORT MAP ( 
		data => data(3 DOWNTO 2),
		q => wire_altpriority_encoder18_q,
		zero => wire_altpriority_encoder18_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_lha

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_qha IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_qha;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_qha IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder15_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder16_w_lg_w_lg_zero950w951w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder16_w_lg_zero952w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder16_w_lg_zero950w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder16_w_lg_w_lg_zero952w953w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder16_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder16_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_lha
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_l0b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder16_w_lg_zero950w & wire_altpriority_encoder16_w_lg_w_lg_zero952w953w);
	altpriority_encoder15 :  cpu_fpoint_addsub_single_altpriority_encoder_lha
	  PORT MAP ( 
		data => data(3 DOWNTO 0),
		q => wire_altpriority_encoder15_q
	  );
	loop53 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder16_w_lg_w_lg_zero950w951w(i) <= wire_altpriority_encoder16_w_lg_zero950w(0) AND wire_altpriority_encoder16_q(i);
	END GENERATE loop53;
	loop54 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder16_w_lg_zero952w(i) <= wire_altpriority_encoder16_zero AND wire_altpriority_encoder15_q(i);
	END GENERATE loop54;
	wire_altpriority_encoder16_w_lg_zero950w(0) <= NOT wire_altpriority_encoder16_zero;
	loop55 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder16_w_lg_w_lg_zero952w953w(i) <= wire_altpriority_encoder16_w_lg_zero952w(i) OR wire_altpriority_encoder16_w_lg_w_lg_zero950w951w(i);
	END GENERATE loop55;
	altpriority_encoder16 :  cpu_fpoint_addsub_single_altpriority_encoder_l0b
	  PORT MAP ( 
		data => data(7 DOWNTO 4),
		q => wire_altpriority_encoder16_q,
		zero => wire_altpriority_encoder16_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_qha

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_aja IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (3 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_aja;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_aja IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder10_w_lg_w_lg_zero915w916w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder10_w_lg_zero917w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder10_w_lg_zero915w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder10_w_lg_w_lg_zero917w918w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder10_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder10_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder9_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_q0b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_qha
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder10_w_lg_zero915w & wire_altpriority_encoder10_w_lg_w_lg_zero917w918w);
	loop56 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder10_w_lg_w_lg_zero915w916w(i) <= wire_altpriority_encoder10_w_lg_zero915w(0) AND wire_altpriority_encoder10_q(i);
	END GENERATE loop56;
	loop57 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder10_w_lg_zero917w(i) <= wire_altpriority_encoder10_zero AND wire_altpriority_encoder9_q(i);
	END GENERATE loop57;
	wire_altpriority_encoder10_w_lg_zero915w(0) <= NOT wire_altpriority_encoder10_zero;
	loop58 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder10_w_lg_w_lg_zero917w918w(i) <= wire_altpriority_encoder10_w_lg_zero917w(i) OR wire_altpriority_encoder10_w_lg_w_lg_zero915w916w(i);
	END GENERATE loop58;
	altpriority_encoder10 :  cpu_fpoint_addsub_single_altpriority_encoder_q0b
	  PORT MAP ( 
		data => data(15 DOWNTO 8),
		q => wire_altpriority_encoder10_q,
		zero => wire_altpriority_encoder10_zero
	  );
	altpriority_encoder9 :  cpu_fpoint_addsub_single_altpriority_encoder_qha
	  PORT MAP ( 
		data => data(7 DOWNTO 0),
		q => wire_altpriority_encoder9_q
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_aja


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="NO" WIDTH=16 WIDTHAD=4 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_a2b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_a2b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_a2b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder19_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder19_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder20_w_lg_w_lg_zero971w972w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder20_w_lg_zero973w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder20_w_lg_zero971w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder20_w_lg_w_lg_zero973w974w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder20_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder20_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_q0b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder20_w_lg_zero971w & wire_altpriority_encoder20_w_lg_w_lg_zero973w974w);
	zero <= (wire_altpriority_encoder19_zero AND wire_altpriority_encoder20_zero);
	altpriority_encoder19 :  cpu_fpoint_addsub_single_altpriority_encoder_q0b
	  PORT MAP ( 
		data => data(7 DOWNTO 0),
		q => wire_altpriority_encoder19_q,
		zero => wire_altpriority_encoder19_zero
	  );
	loop59 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder20_w_lg_w_lg_zero971w972w(i) <= wire_altpriority_encoder20_w_lg_zero971w(0) AND wire_altpriority_encoder20_q(i);
	END GENERATE loop59;
	loop60 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder20_w_lg_zero973w(i) <= wire_altpriority_encoder20_zero AND wire_altpriority_encoder19_q(i);
	END GENERATE loop60;
	wire_altpriority_encoder20_w_lg_zero971w(0) <= NOT wire_altpriority_encoder20_zero;
	loop61 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder20_w_lg_w_lg_zero973w974w(i) <= wire_altpriority_encoder20_w_lg_zero973w(i) OR wire_altpriority_encoder20_w_lg_w_lg_zero971w972w(i);
	END GENERATE loop61;
	altpriority_encoder20 :  cpu_fpoint_addsub_single_altpriority_encoder_q0b
	  PORT MAP ( 
		data => data(15 DOWNTO 8),
		q => wire_altpriority_encoder20_q,
		zero => wire_altpriority_encoder20_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_a2b

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_9u8 IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_9u8;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_9u8 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder7_q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder8_w_lg_w_lg_zero906w907w	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder8_w_lg_zero908w	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder8_w_lg_zero906w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder8_w_lg_w_lg_zero908w909w	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder8_q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder8_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_aja
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_a2b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder8_w_lg_zero906w & wire_altpriority_encoder8_w_lg_w_lg_zero908w909w);
	altpriority_encoder7 :  cpu_fpoint_addsub_single_altpriority_encoder_aja
	  PORT MAP ( 
		data => data(15 DOWNTO 0),
		q => wire_altpriority_encoder7_q
	  );
	loop62 : FOR i IN 0 TO 3 GENERATE 
		wire_altpriority_encoder8_w_lg_w_lg_zero906w907w(i) <= wire_altpriority_encoder8_w_lg_zero906w(0) AND wire_altpriority_encoder8_q(i);
	END GENERATE loop62;
	loop63 : FOR i IN 0 TO 3 GENERATE 
		wire_altpriority_encoder8_w_lg_zero908w(i) <= wire_altpriority_encoder8_zero AND wire_altpriority_encoder7_q(i);
	END GENERATE loop63;
	wire_altpriority_encoder8_w_lg_zero906w(0) <= NOT wire_altpriority_encoder8_zero;
	loop64 : FOR i IN 0 TO 3 GENERATE 
		wire_altpriority_encoder8_w_lg_w_lg_zero908w909w(i) <= wire_altpriority_encoder8_w_lg_zero908w(i) OR wire_altpriority_encoder8_w_lg_w_lg_zero906w907w(i);
	END GENERATE loop64;
	altpriority_encoder8 :  cpu_fpoint_addsub_single_altpriority_encoder_a2b
	  PORT MAP ( 
		data => data(31 DOWNTO 16),
		q => wire_altpriority_encoder8_q,
		zero => wire_altpriority_encoder8_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_9u8


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=32 WIDTHAD=5 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=16 WIDTHAD=4 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=8 WIDTHAD=3 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=4 WIDTHAD=2 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=2 WIDTHAD=1 data q zero
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_64b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_64b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_64b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder27_w_lg_w_data_range1018w1020w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder27_w_data_range1018w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_altpriority_encoder27_w_lg_w_data_range1018w1020w(0) <= NOT wire_altpriority_encoder27_w_data_range1018w(0);
	q <= ( wire_altpriority_encoder27_w_lg_w_data_range1018w1020w);
	zero <= (NOT (data(0) OR data(1)));
	wire_altpriority_encoder27_w_data_range1018w(0) <= data(0);

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_64b

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_94b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_94b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_94b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder27_w_lg_w_lg_zero1010w1011w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder27_w_lg_zero1012w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder27_w_lg_zero1010w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder27_w_lg_w_lg_zero1012w1013w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder27_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder27_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder28_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder28_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_64b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder27_zero & wire_altpriority_encoder27_w_lg_w_lg_zero1012w1013w);
	zero <= (wire_altpriority_encoder27_zero AND wire_altpriority_encoder28_zero);
	wire_altpriority_encoder27_w_lg_w_lg_zero1010w1011w(0) <= wire_altpriority_encoder27_w_lg_zero1010w(0) AND wire_altpriority_encoder27_q(0);
	wire_altpriority_encoder27_w_lg_zero1012w(0) <= wire_altpriority_encoder27_zero AND wire_altpriority_encoder28_q(0);
	wire_altpriority_encoder27_w_lg_zero1010w(0) <= NOT wire_altpriority_encoder27_zero;
	wire_altpriority_encoder27_w_lg_w_lg_zero1012w1013w(0) <= wire_altpriority_encoder27_w_lg_zero1012w(0) OR wire_altpriority_encoder27_w_lg_w_lg_zero1010w1011w(0);
	altpriority_encoder27 :  cpu_fpoint_addsub_single_altpriority_encoder_64b
	  PORT MAP ( 
		data => data(1 DOWNTO 0),
		q => wire_altpriority_encoder27_q,
		zero => wire_altpriority_encoder27_zero
	  );
	altpriority_encoder28 :  cpu_fpoint_addsub_single_altpriority_encoder_64b
	  PORT MAP ( 
		data => data(3 DOWNTO 2),
		q => wire_altpriority_encoder28_q,
		zero => wire_altpriority_encoder28_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_94b

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_e4b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_e4b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_e4b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder25_w_lg_w_lg_zero1000w1001w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder25_w_lg_zero1002w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder25_w_lg_zero1000w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder25_w_lg_w_lg_zero1002w1003w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder25_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder25_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder26_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder26_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_94b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder25_zero & wire_altpriority_encoder25_w_lg_w_lg_zero1002w1003w);
	zero <= (wire_altpriority_encoder25_zero AND wire_altpriority_encoder26_zero);
	loop65 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder25_w_lg_w_lg_zero1000w1001w(i) <= wire_altpriority_encoder25_w_lg_zero1000w(0) AND wire_altpriority_encoder25_q(i);
	END GENERATE loop65;
	loop66 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder25_w_lg_zero1002w(i) <= wire_altpriority_encoder25_zero AND wire_altpriority_encoder26_q(i);
	END GENERATE loop66;
	wire_altpriority_encoder25_w_lg_zero1000w(0) <= NOT wire_altpriority_encoder25_zero;
	loop67 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder25_w_lg_w_lg_zero1002w1003w(i) <= wire_altpriority_encoder25_w_lg_zero1002w(i) OR wire_altpriority_encoder25_w_lg_w_lg_zero1000w1001w(i);
	END GENERATE loop67;
	altpriority_encoder25 :  cpu_fpoint_addsub_single_altpriority_encoder_94b
	  PORT MAP ( 
		data => data(3 DOWNTO 0),
		q => wire_altpriority_encoder25_q,
		zero => wire_altpriority_encoder25_zero
	  );
	altpriority_encoder26 :  cpu_fpoint_addsub_single_altpriority_encoder_94b
	  PORT MAP ( 
		data => data(7 DOWNTO 4),
		q => wire_altpriority_encoder26_q,
		zero => wire_altpriority_encoder26_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_e4b

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_u5b IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 zero	:	OUT  STD_LOGIC
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_u5b;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_u5b IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder23_w_lg_w_lg_zero990w991w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder23_w_lg_zero992w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder23_w_lg_zero990w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder23_w_lg_w_lg_zero992w993w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder23_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder23_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder24_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder24_zero	:	STD_LOGIC;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_e4b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder23_zero & wire_altpriority_encoder23_w_lg_w_lg_zero992w993w);
	zero <= (wire_altpriority_encoder23_zero AND wire_altpriority_encoder24_zero);
	loop68 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder23_w_lg_w_lg_zero990w991w(i) <= wire_altpriority_encoder23_w_lg_zero990w(0) AND wire_altpriority_encoder23_q(i);
	END GENERATE loop68;
	loop69 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder23_w_lg_zero992w(i) <= wire_altpriority_encoder23_zero AND wire_altpriority_encoder24_q(i);
	END GENERATE loop69;
	wire_altpriority_encoder23_w_lg_zero990w(0) <= NOT wire_altpriority_encoder23_zero;
	loop70 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder23_w_lg_w_lg_zero992w993w(i) <= wire_altpriority_encoder23_w_lg_zero992w(i) OR wire_altpriority_encoder23_w_lg_w_lg_zero990w991w(i);
	END GENERATE loop70;
	altpriority_encoder23 :  cpu_fpoint_addsub_single_altpriority_encoder_e4b
	  PORT MAP ( 
		data => data(7 DOWNTO 0),
		q => wire_altpriority_encoder23_q,
		zero => wire_altpriority_encoder23_zero
	  );
	altpriority_encoder24 :  cpu_fpoint_addsub_single_altpriority_encoder_e4b
	  PORT MAP ( 
		data => data(15 DOWNTO 8),
		q => wire_altpriority_encoder24_q,
		zero => wire_altpriority_encoder24_zero
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_u5b


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=16 WIDTHAD=4 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=8 WIDTHAD=3 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=4 WIDTHAD=2 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END


--altpriority_encoder CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" LSB_PRIORITY="YES" WIDTH=2 WIDTHAD=1 data q
--VERSION_BEGIN 9.1SP1 cbx_altpriority_encoder 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_6la IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (0 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_6la;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_6la IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder34_w_lg_w_data_range1052w1054w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder34_w_data_range1052w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_altpriority_encoder34_w_lg_w_data_range1052w1054w(0) <= NOT wire_altpriority_encoder34_w_data_range1052w(0);
	q <= ( wire_altpriority_encoder34_w_lg_w_data_range1052w1054w);
	wire_altpriority_encoder34_w_data_range1052w(0) <= data(0);

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_6la

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_9la IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (1 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_9la;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_9la IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder33_w_lg_w_lg_zero1045w1046w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder33_w_lg_zero1047w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder33_w_lg_zero1045w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder33_w_lg_w_lg_zero1047w1048w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder33_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder33_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder34_q	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_64b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_6la
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(0 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder33_zero & wire_altpriority_encoder33_w_lg_w_lg_zero1047w1048w);
	wire_altpriority_encoder33_w_lg_w_lg_zero1045w1046w(0) <= wire_altpriority_encoder33_w_lg_zero1045w(0) AND wire_altpriority_encoder33_q(0);
	wire_altpriority_encoder33_w_lg_zero1047w(0) <= wire_altpriority_encoder33_zero AND wire_altpriority_encoder34_q(0);
	wire_altpriority_encoder33_w_lg_zero1045w(0) <= NOT wire_altpriority_encoder33_zero;
	wire_altpriority_encoder33_w_lg_w_lg_zero1047w1048w(0) <= wire_altpriority_encoder33_w_lg_zero1047w(0) OR wire_altpriority_encoder33_w_lg_w_lg_zero1045w1046w(0);
	altpriority_encoder33 :  cpu_fpoint_addsub_single_altpriority_encoder_64b
	  PORT MAP ( 
		data => data(1 DOWNTO 0),
		q => wire_altpriority_encoder33_q,
		zero => wire_altpriority_encoder33_zero
	  );
	altpriority_encoder34 :  cpu_fpoint_addsub_single_altpriority_encoder_6la
	  PORT MAP ( 
		data => data(3 DOWNTO 2),
		q => wire_altpriority_encoder34_q
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_9la

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_ela IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_ela;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_ela IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder31_w_lg_w_lg_zero1036w1037w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder31_w_lg_zero1038w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder31_w_lg_zero1036w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder31_w_lg_w_lg_zero1038w1039w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder31_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder31_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder32_q	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_94b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_9la
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder31_zero & wire_altpriority_encoder31_w_lg_w_lg_zero1038w1039w);
	loop71 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder31_w_lg_w_lg_zero1036w1037w(i) <= wire_altpriority_encoder31_w_lg_zero1036w(0) AND wire_altpriority_encoder31_q(i);
	END GENERATE loop71;
	loop72 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder31_w_lg_zero1038w(i) <= wire_altpriority_encoder31_zero AND wire_altpriority_encoder32_q(i);
	END GENERATE loop72;
	wire_altpriority_encoder31_w_lg_zero1036w(0) <= NOT wire_altpriority_encoder31_zero;
	loop73 : FOR i IN 0 TO 1 GENERATE 
		wire_altpriority_encoder31_w_lg_w_lg_zero1038w1039w(i) <= wire_altpriority_encoder31_w_lg_zero1038w(i) OR wire_altpriority_encoder31_w_lg_w_lg_zero1036w1037w(i);
	END GENERATE loop73;
	altpriority_encoder31 :  cpu_fpoint_addsub_single_altpriority_encoder_94b
	  PORT MAP ( 
		data => data(3 DOWNTO 0),
		q => wire_altpriority_encoder31_q,
		zero => wire_altpriority_encoder31_zero
	  );
	altpriority_encoder32 :  cpu_fpoint_addsub_single_altpriority_encoder_9la
	  PORT MAP ( 
		data => data(7 DOWNTO 4),
		q => wire_altpriority_encoder32_q
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_ela

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_uma IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (3 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_uma;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_uma IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder29_w_lg_w_lg_zero1027w1028w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder29_w_lg_zero1029w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder29_w_lg_zero1027w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder29_w_lg_w_lg_zero1029w1030w	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder29_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder29_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder30_q	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_e4b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_ela
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder29_zero & wire_altpriority_encoder29_w_lg_w_lg_zero1029w1030w);
	loop74 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder29_w_lg_w_lg_zero1027w1028w(i) <= wire_altpriority_encoder29_w_lg_zero1027w(0) AND wire_altpriority_encoder29_q(i);
	END GENERATE loop74;
	loop75 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder29_w_lg_zero1029w(i) <= wire_altpriority_encoder29_zero AND wire_altpriority_encoder30_q(i);
	END GENERATE loop75;
	wire_altpriority_encoder29_w_lg_zero1027w(0) <= NOT wire_altpriority_encoder29_zero;
	loop76 : FOR i IN 0 TO 2 GENERATE 
		wire_altpriority_encoder29_w_lg_w_lg_zero1029w1030w(i) <= wire_altpriority_encoder29_w_lg_zero1029w(i) OR wire_altpriority_encoder29_w_lg_w_lg_zero1027w1028w(i);
	END GENERATE loop76;
	altpriority_encoder29 :  cpu_fpoint_addsub_single_altpriority_encoder_e4b
	  PORT MAP ( 
		data => data(7 DOWNTO 0),
		q => wire_altpriority_encoder29_q,
		zero => wire_altpriority_encoder29_zero
	  );
	altpriority_encoder30 :  cpu_fpoint_addsub_single_altpriority_encoder_ela
	  PORT MAP ( 
		data => data(15 DOWNTO 8),
		q => wire_altpriority_encoder30_q
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_uma

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single_altpriority_encoder_tma IS 
	 PORT 
	 ( 
		 data	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 q	:	OUT  STD_LOGIC_VECTOR (4 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single_altpriority_encoder_tma;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single_altpriority_encoder_tma IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altpriority_encoder21_w_lg_w_lg_zero981w982w	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder21_w_lg_zero983w	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder21_w_lg_zero981w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder21_w_lg_w_lg_zero983w984w	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder21_q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_altpriority_encoder21_zero	:	STD_LOGIC;
	 SIGNAL  wire_altpriority_encoder22_q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_u5b
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		zero	:	OUT  STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_uma
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	q <= ( wire_altpriority_encoder21_zero & wire_altpriority_encoder21_w_lg_w_lg_zero983w984w);
	loop77 : FOR i IN 0 TO 3 GENERATE 
		wire_altpriority_encoder21_w_lg_w_lg_zero981w982w(i) <= wire_altpriority_encoder21_w_lg_zero981w(0) AND wire_altpriority_encoder21_q(i);
	END GENERATE loop77;
	loop78 : FOR i IN 0 TO 3 GENERATE 
		wire_altpriority_encoder21_w_lg_zero983w(i) <= wire_altpriority_encoder21_zero AND wire_altpriority_encoder22_q(i);
	END GENERATE loop78;
	wire_altpriority_encoder21_w_lg_zero981w(0) <= NOT wire_altpriority_encoder21_zero;
	loop79 : FOR i IN 0 TO 3 GENERATE 
		wire_altpriority_encoder21_w_lg_w_lg_zero983w984w(i) <= wire_altpriority_encoder21_w_lg_zero983w(i) OR wire_altpriority_encoder21_w_lg_w_lg_zero981w982w(i);
	END GENERATE loop79;
	altpriority_encoder21 :  cpu_fpoint_addsub_single_altpriority_encoder_u5b
	  PORT MAP ( 
		data => data(15 DOWNTO 0),
		q => wire_altpriority_encoder21_q,
		zero => wire_altpriority_encoder21_zero
	  );
	altpriority_encoder22 :  cpu_fpoint_addsub_single_altpriority_encoder_uma
	  PORT MAP ( 
		data => data(31 DOWNTO 16),
		q => wire_altpriority_encoder22_q
	  );

 END RTL; --cpu_fpoint_addsub_single_altpriority_encoder_tma

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 14 lpm_compare 1 reg 356 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_addsub_single IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 add_sub	:	IN  STD_LOGIC := '1';
		 clk_en	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC;
		 dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END cpu_fpoint_addsub_single;

 ARCHITECTURE RTL OF cpu_fpoint_addsub_single IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_lbarrel_shift_result	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_data	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_rbarrel_shift_result	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_leading_zeroes_cnt_data	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_leading_zeroes_cnt_q	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_trailing_zeros_cnt_data	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_trailing_zeros_cnt_q	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL	 add_sub_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 add_sub_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 aligned_dataa_exp_dffe12	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 aligned_dataa_man_dffe12	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 aligned_dataa_sign_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 aligned_datab_exp_dffe12	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 aligned_datab_man_dffe12	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 aligned_datab_sign_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 both_inputs_are_infinite_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 data_exp_dffe1	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dataa_man_dffe1	:	STD_LOGIC_VECTOR(25 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dataa_sign_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 datab_man_dffe1	:	STD_LOGIC_VECTOR(25 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 datab_sign_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 denormal_res_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 denormal_res_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_adj_dffe21	:	STD_LOGIC_VECTOR(1 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_out_dffe5	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_res_dffe2	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_res_dffe21	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_res_dffe3	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_res_dffe4	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_output_sign_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_output_sign_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_output_sign_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_output_sign_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_output_sign_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_output_sign_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_res_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinite_res_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinity_magnitude_sub_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinity_magnitude_sub_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinity_magnitude_sub_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinity_magnitude_sub_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 infinity_magnitude_sub_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_dataa_infinite_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_dataa_nan_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_datab_infinite_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_datab_nan_dffe12	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinite_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinite_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinite_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinite_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinite_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_infinite_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 input_is_nan_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_add_sub_res_mag_dffe21	:	STD_LOGIC_VECTOR(25 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_add_sub_res_sign_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_dffe31	:	STD_LOGIC_VECTOR(25 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_leading_zeros_dffe31	:	STD_LOGIC_VECTOR(4 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_out_dffe5	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_res_dffe4	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_res_is_not_zero_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_res_is_not_zero_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_res_is_not_zero_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 need_complement_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 round_bit_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 round_bit_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 round_bit_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rounded_res_infinity_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_out_dffe5	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_res_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_res_dffe4	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sticky_bit_dffe1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sticky_bit_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sticky_bit_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sticky_bit_dffe3	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sticky_bit_dffe31	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 zero_man_sign_dffe2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 zero_man_sign_dffe21	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_add_sub1_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_add_sub2_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_add_sub3_result	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  wire_add_sub4_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_add_sub5_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_add_sub6_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_man_2comp_res_lower_w_lg_w_lg_cout381w382w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_2comp_res_lower_w_lg_cout380w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_2comp_res_lower_w_lg_cout381w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_2comp_res_lower_w_lg_w_lg_w_lg_cout381w382w383w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_2comp_res_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_man_2comp_res_lower_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_man_2comp_res_upper0_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_man_2comp_res_upper1_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_lower_w_lg_w_lg_cout368w369w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_lower_w_lg_cout367w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_lower_w_lg_cout368w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_lower_w_lg_w_lg_w_lg_cout368w369w370w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_man_add_sub_lower_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_upper0_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_add_sub_upper1_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_man_res_rounding_add_sub_lower_w_lg_w_lg_cout594w595w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_man_res_rounding_add_sub_lower_w_lg_cout593w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_man_res_rounding_add_sub_lower_w_lg_cout594w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_man_res_rounding_add_sub_lower_w_lg_w_lg_w_lg_cout594w595w596w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_man_res_rounding_add_sub_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_man_res_rounding_add_sub_lower_result	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_man_res_rounding_add_sub_upper1_result	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_trailing_zeros_limit_comparator_agb	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_lg_w_lg_dataa_sign_dffe1_wo345w349w350w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w248w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w267w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w411w421w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_sign_dffe1_wo342w343w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_force_zero_w648w649w650w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_force_zero_w648w649w659w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_sign_dffe1_wo345w349w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_sign_dffe1_wo345w346w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_denormal_result_w572w573w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w324w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w331w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w317w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_amb_mux_w276w279w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_amb_mux_w276w277w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_infinity_w643w653w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_infinity_w643w662w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_infinity_w643w668w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_nan_w644w656w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_nan_w644w665w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_dataa_denormal_dffe11_wo233w243w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_dataa_denormal_dffe11_wo233w234w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_dataa_infinite_dffe11_wo246w247w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_datab_denormal_dffe11_wo252w262w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_datab_denormal_dffe11_wo252w253w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_datab_infinite_dffe11_wo265w266w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_input_datab_infinite_dffe15_wo339w340w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_man_res_not_zero_dffe26_wo517w518w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w293w	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_w411w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w397w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_w426w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_man_add_sub_w_range386w389w392w	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  wire_w601w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_zero_w648w651w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_zero_w648w660w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_dataa_sign_dffe1_wo351w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_dataa_sign_dffe1_wo342w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_dffe15_wo330w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_dffe15_wo323w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_dffe15_wo314w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_w280w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_w274w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_infinity_w654w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_infinity_w663w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_nan_w657w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_nan_w666w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_datab_infinite_dffe15_wo338w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_need_complement_dffe22_wo390w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range17w23w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range27w33w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range37w43w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range47w53w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range57w63w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range67w73w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range77w83w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range20w25w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range30w35w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range40w45w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range50w55w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range60w65w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range70w75w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range80w85w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_all_one_w_range84w220w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_all_one_w_range86w226w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_diff_abs_exceed_max_w_range290w294w	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range554w556w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range557w558w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range559w560w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range561w562w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range563w564w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range565w566w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range567w568w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_max_w_range569w575w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range615w618w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range619w621w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range622w624w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range625w627w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range628w630w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range631w633w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_rounded_res_max_w_range634w636w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w405w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w398w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w428w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_w_range386w393w	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_rounding_add_sub_w_range599w603w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_zero_w648w649w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_aligned_datab_sign_dffe15_wo336w337w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_add_sub_dffe1_wo344w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_add_sub_dffe25_wo505w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_add_sub_w2356w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_dataa_sign_dffe1_wo345w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_datab_sign_dffe1_wo348w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_denormal_result_w572w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_dffe15_wo316w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_amb_mux_w276w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_infinity_w643w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_nan_w644w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_zero_w642w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_dataa_denormal_dffe11_wo233w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_dataa_infinite_dffe11_wo246w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_dataa_zero_dffe11_wo245w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_datab_denormal_dffe11_wo252w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_datab_infinite_dffe11_wo265w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_datab_infinite_dffe15_wo339w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_input_datab_zero_dffe11_wo264w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_man_res_is_not_zero_dffe4_wo641w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_man_res_not_zero_dffe26_wo517w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_need_complement_dffe22_wo387w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_sticky_bit_dffe1_wo357w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_adjustment2_add_sub_w_range525w574w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_diff_abs_exceed_max_w_range290w292w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_not_zero_w_range215w219w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range401w404w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_add_sub_w_range386w389w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_not_zero_w_range218w225w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_rounding_add_sub_w_range599w600w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_force_zero_w648w651w652w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_force_zero_w648w660w661w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_infinity_w654w655w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_force_infinity_w663w664w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_lg_force_zero_w648w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_sticky_bit_dffe27_wo416w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range141w142w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range147w148w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range153w154w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range159w160w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range165w166w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range171w172w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range177w178w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range183w184w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range189w190w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range195w196w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range87w88w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range201w202w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range207w208w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range213w214w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range17w18w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range27w28w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range37w38w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range47w48w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range57w58w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range67w68w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range93w94w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range77w78w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range99w100w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range105w106w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range111w112w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range117w118w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range123w124w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range129w130w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_dataa_range135w136w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range144w145w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range150w151w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range156w157w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range162w163w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range168w169w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range174w175w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range180w181w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range186w187w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range192w193w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range198w199w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range90w91w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range204w205w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range210w211w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range216w217w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range20w21w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range30w31w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range40w41w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range50w51w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range60w61w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range70w71w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range96w97w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range80w81w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range102w103w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range108w109w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range114w115w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range120w121w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range126w127w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range132w133w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_datab_range138w139w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_diff_abs_exceed_max_w_range283w286w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_diff_abs_exceed_max_w_range287w289w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range530w533w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range534w536w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range537w539w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range540w542w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range543w545w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range546w548w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range549w551w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_not_zero_w_range552w553w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range431w434w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range462w464w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range465w467w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range468w470w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range471w473w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range474w476w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range477w479w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range480w482w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range483w485w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range486w488w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range489w491w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range435w437w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range492w494w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range495w497w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range498w500w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range501w503w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range438w440w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range441w443w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range444w446w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range447w449w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range450w452w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range453w455w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range456w458w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_not_zero_w2_range459w461w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_aligned_datab_sign_dffe15_wo336w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  add_sub_dffe11_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe11_wo :	STD_LOGIC;
	 SIGNAL  add_sub_dffe12_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe12_wo :	STD_LOGIC;
	 SIGNAL  add_sub_dffe13_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe13_wo :	STD_LOGIC;
	 SIGNAL  add_sub_dffe14_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe14_wo :	STD_LOGIC;
	 SIGNAL  add_sub_dffe15_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe15_wo :	STD_LOGIC;
	 SIGNAL  add_sub_dffe1_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe1_wo :	STD_LOGIC;
	 SIGNAL  add_sub_dffe25_wi :	STD_LOGIC;
	 SIGNAL  add_sub_dffe25_wo :	STD_LOGIC;
	 SIGNAL  add_sub_w2 :	STD_LOGIC;
	 SIGNAL  adder_upper_w :	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe12_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe12_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe13_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe13_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe14_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe14_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe15_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_dffe15_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_exp_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe12_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe12_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe13_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe13_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe14_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe14_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe15_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe15_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_dffe15_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_dataa_man_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  aligned_dataa_sign_dffe12_wi :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe12_wo :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe13_wi :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe13_wo :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe14_wi :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe14_wo :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe15_wi :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_dffe15_wo :	STD_LOGIC;
	 SIGNAL  aligned_dataa_sign_w :	STD_LOGIC;
	 SIGNAL  aligned_datab_exp_dffe12_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe12_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe13_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe13_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe14_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe14_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe15_wi :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_dffe15_wo :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_exp_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe12_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe12_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe13_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe13_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe14_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe14_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe15_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe15_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_dffe15_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  aligned_datab_man_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  aligned_datab_sign_dffe12_wi :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe12_wo :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe13_wi :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe13_wo :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe14_wi :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe14_wo :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe15_wi :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_dffe15_wo :	STD_LOGIC;
	 SIGNAL  aligned_datab_sign_w :	STD_LOGIC;
	 SIGNAL  borrow_w :	STD_LOGIC;
	 SIGNAL  both_inputs_are_infinite_dffe1_wi :	STD_LOGIC;
	 SIGNAL  both_inputs_are_infinite_dffe1_wo :	STD_LOGIC;
	 SIGNAL  both_inputs_are_infinite_dffe25_wi :	STD_LOGIC;
	 SIGNAL  both_inputs_are_infinite_dffe25_wo :	STD_LOGIC;
	 SIGNAL  data_exp_dffe1_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  data_exp_dffe1_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  dataa_dffe11_wi :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  dataa_dffe11_wo :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  dataa_man_dffe1_wi :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  dataa_man_dffe1_wo :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  dataa_sign_dffe1_wi :	STD_LOGIC;
	 SIGNAL  dataa_sign_dffe1_wo :	STD_LOGIC;
	 SIGNAL  dataa_sign_dffe25_wi :	STD_LOGIC;
	 SIGNAL  dataa_sign_dffe25_wo :	STD_LOGIC;
	 SIGNAL  datab_dffe11_wi :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  datab_dffe11_wo :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  datab_man_dffe1_wi :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  datab_man_dffe1_wo :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  datab_sign_dffe1_wi :	STD_LOGIC;
	 SIGNAL  datab_sign_dffe1_wo :	STD_LOGIC;
	 SIGNAL  denormal_flag_w :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe32_wi :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe32_wo :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe33_wi :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe33_wo :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe3_wi :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe3_wo :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe41_wi :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe41_wo :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe42_wi :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe42_wo :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe4_wi :	STD_LOGIC;
	 SIGNAL  denormal_res_dffe4_wo :	STD_LOGIC;
	 SIGNAL  denormal_result_w :	STD_LOGIC;
	 SIGNAL  exp_a_all_one_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_a_not_zero_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_adj_0pads :	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  exp_adj_dffe21_wi :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adj_dffe21_wo :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adj_dffe23_wi :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adj_dffe23_wo :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adj_dffe26_wi :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adj_dffe26_wo :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adjust_by_add1 :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adjust_by_add2 :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_adjustment2_add_sub_dataa_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_adjustment2_add_sub_datab_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_adjustment2_add_sub_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_adjustment_add_sub_dataa_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_adjustment_add_sub_datab_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_adjustment_add_sub_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_all_ones_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_all_zeros_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_amb_mux_dffe13_wi :	STD_LOGIC;
	 SIGNAL  exp_amb_mux_dffe13_wo :	STD_LOGIC;
	 SIGNAL  exp_amb_mux_dffe14_wi :	STD_LOGIC;
	 SIGNAL  exp_amb_mux_dffe14_wo :	STD_LOGIC;
	 SIGNAL  exp_amb_mux_dffe15_wi :	STD_LOGIC;
	 SIGNAL  exp_amb_mux_dffe15_wo :	STD_LOGIC;
	 SIGNAL  exp_amb_mux_w :	STD_LOGIC;
	 SIGNAL  exp_amb_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_b_all_one_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_b_not_zero_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_bma_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_diff_abs_exceed_max_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  exp_diff_abs_max_w :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  exp_diff_abs_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_intermediate_res_dffe41_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_intermediate_res_dffe41_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_intermediate_res_dffe42_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_intermediate_res_dffe42_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_intermediate_res_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_out_dffe5_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_out_dffe5_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe21_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe21_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe22_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe22_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe23_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe23_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe25_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe25_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe26_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe26_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe27_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe27_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe2_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe2_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe32_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe32_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe33_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe33_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe3_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe3_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe4_wi :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_dffe4_wo :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_max_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_not_zero_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_res_rounding_adder_dataa_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_res_rounding_adder_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_rounded_res_infinity_w :	STD_LOGIC;
	 SIGNAL  exp_rounded_res_max_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_rounded_res_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_rounding_adjustment_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_value :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  force_infinity_w :	STD_LOGIC;
	 SIGNAL  force_nan_w :	STD_LOGIC;
	 SIGNAL  force_zero_w :	STD_LOGIC;
	 SIGNAL  guard_bit_dffe3_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe1_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe1_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe21_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe21_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe22_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe22_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe23_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe23_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe25_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe25_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe26_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe26_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe27_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe27_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe2_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe2_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe31_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe31_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe32_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe32_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe33_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe33_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe3_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe3_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe41_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe41_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe42_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe42_wo :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe4_wi :	STD_LOGIC;
	 SIGNAL  infinite_output_sign_dffe4_wo :	STD_LOGIC;
	 SIGNAL  infinite_res_dff32_wi :	STD_LOGIC;
	 SIGNAL  infinite_res_dff32_wo :	STD_LOGIC;
	 SIGNAL  infinite_res_dff33_wi :	STD_LOGIC;
	 SIGNAL  infinite_res_dff33_wo :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe3_wi :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe3_wo :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe41_wi :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe41_wo :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe42_wi :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe42_wo :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe4_wi :	STD_LOGIC;
	 SIGNAL  infinite_res_dffe4_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe21_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe21_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe22_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe22_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe23_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe23_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe26_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe26_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe27_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe27_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe2_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe2_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe31_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe31_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe32_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe32_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe33_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe33_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe3_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe3_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe41_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe41_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe42_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe42_wo :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe4_wi :	STD_LOGIC;
	 SIGNAL  infinity_magnitude_sub_dffe4_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_denormal_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_denormal_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_denormal_w :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe12_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe12_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe13_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe13_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe14_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe14_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe15_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_dffe15_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_infinite_w :	STD_LOGIC;
	 SIGNAL  input_dataa_nan_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_nan_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_nan_dffe12_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_nan_dffe12_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_nan_w :	STD_LOGIC;
	 SIGNAL  input_dataa_zero_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_dataa_zero_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_dataa_zero_w :	STD_LOGIC;
	 SIGNAL  input_datab_denormal_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_datab_denormal_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_datab_denormal_w :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe12_wi :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe12_wo :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe13_wi :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe13_wo :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe14_wi :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe14_wo :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe15_wi :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_dffe15_wo :	STD_LOGIC;
	 SIGNAL  input_datab_infinite_w :	STD_LOGIC;
	 SIGNAL  input_datab_nan_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_datab_nan_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_datab_nan_dffe12_wi :	STD_LOGIC;
	 SIGNAL  input_datab_nan_dffe12_wo :	STD_LOGIC;
	 SIGNAL  input_datab_nan_w :	STD_LOGIC;
	 SIGNAL  input_datab_zero_dffe11_wi :	STD_LOGIC;
	 SIGNAL  input_datab_zero_dffe11_wo :	STD_LOGIC;
	 SIGNAL  input_datab_zero_w :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe1_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe1_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe21_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe21_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe22_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe22_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe23_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe23_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe25_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe25_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe26_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe26_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe27_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe27_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe2_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe2_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe31_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe31_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe32_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe32_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe33_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe33_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe3_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe3_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe41_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe41_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe42_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe42_wo :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe4_wi :	STD_LOGIC;
	 SIGNAL  input_is_infinite_dffe4_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe13_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe13_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe14_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe14_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe15_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe15_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe1_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe1_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe21_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe21_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe22_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe22_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe23_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe23_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe25_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe25_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe26_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe26_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe27_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe27_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe2_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe2_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe31_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe31_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe32_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe32_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe33_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe33_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe3_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe3_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe41_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe41_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe42_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe42_wo :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe4_wi :	STD_LOGIC;
	 SIGNAL  input_is_nan_dffe4_wo :	STD_LOGIC;
	 SIGNAL  man_2comp_res_dataa_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_2comp_res_datab_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_2comp_res_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_a_not_zero_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_add_sub_dataa_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_add_sub_datab_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe21_wi :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe21_wo :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe23_wi :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe23_wo :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe26_wi :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe26_wo :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe27_wi :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_dffe27_wo :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_add_sub_res_mag_w2 :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_add_sub_res_sign_dffe21_wo :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_dffe23_wi :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_dffe23_wo :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_dffe26_wi :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_dffe26_wo :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_dffe27_wi :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_dffe27_wo :	STD_LOGIC;
	 SIGNAL  man_add_sub_res_sign_w2 :	STD_LOGIC;
	 SIGNAL  man_add_sub_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  man_all_zeros_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_b_not_zero_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_dffe31_wo :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_intermediate_res_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_leading_zeros_cnt_w :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  man_leading_zeros_dffe31_wi :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  man_leading_zeros_dffe31_wo :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  man_nan_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_out_dffe5_wi :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_out_dffe5_wo :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_res_dffe4_wi :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_res_dffe4_wo :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_res_is_not_zero_dffe31_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe31_wo :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe32_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe32_wo :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe33_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe33_wo :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe3_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe3_wo :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe41_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe41_wo :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe42_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe42_wo :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe4_wi :	STD_LOGIC;
	 SIGNAL  man_res_is_not_zero_dffe4_wo :	STD_LOGIC;
	 SIGNAL  man_res_mag_w2 :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_res_not_zero_dffe23_wi :	STD_LOGIC;
	 SIGNAL  man_res_not_zero_dffe23_wo :	STD_LOGIC;
	 SIGNAL  man_res_not_zero_dffe26_wi :	STD_LOGIC;
	 SIGNAL  man_res_not_zero_dffe26_wo :	STD_LOGIC;
	 SIGNAL  man_res_not_zero_w2 :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  man_res_rounding_add_sub_datab_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_res_rounding_add_sub_w :	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  man_res_w3 :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_rounded_res_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_rounding_add_value_w :	STD_LOGIC;
	 SIGNAL  man_smaller_dffe13_wi :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_smaller_dffe13_wo :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_smaller_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  need_complement_dffe22_wi :	STD_LOGIC;
	 SIGNAL  need_complement_dffe22_wo :	STD_LOGIC;
	 SIGNAL  need_complement_dffe2_wi :	STD_LOGIC;
	 SIGNAL  need_complement_dffe2_wo :	STD_LOGIC;
	 SIGNAL  pos_sign_bit_ext :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  priority_encoder_1pads_w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  round_bit_dffe21_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe21_wo :	STD_LOGIC;
	 SIGNAL  round_bit_dffe23_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe23_wo :	STD_LOGIC;
	 SIGNAL  round_bit_dffe26_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe26_wo :	STD_LOGIC;
	 SIGNAL  round_bit_dffe31_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe31_wo :	STD_LOGIC;
	 SIGNAL  round_bit_dffe32_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe32_wo :	STD_LOGIC;
	 SIGNAL  round_bit_dffe33_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe33_wo :	STD_LOGIC;
	 SIGNAL  round_bit_dffe3_wi :	STD_LOGIC;
	 SIGNAL  round_bit_dffe3_wo :	STD_LOGIC;
	 SIGNAL  round_bit_w :	STD_LOGIC;
	 SIGNAL  rounded_res_infinity_dffe4_wi :	STD_LOGIC;
	 SIGNAL  rounded_res_infinity_dffe4_wo :	STD_LOGIC;
	 SIGNAL  rshift_distance_dffe13_wi :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  rshift_distance_dffe13_wo :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  rshift_distance_dffe14_wi :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  rshift_distance_dffe14_wo :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  rshift_distance_dffe15_wi :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  rshift_distance_dffe15_wo :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  rshift_distance_w :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  sign_dffe31_wi :	STD_LOGIC;
	 SIGNAL  sign_dffe31_wo :	STD_LOGIC;
	 SIGNAL  sign_dffe32_wi :	STD_LOGIC;
	 SIGNAL  sign_dffe32_wo :	STD_LOGIC;
	 SIGNAL  sign_dffe33_wi :	STD_LOGIC;
	 SIGNAL  sign_dffe33_wo :	STD_LOGIC;
	 SIGNAL  sign_out_dffe5_wi :	STD_LOGIC;
	 SIGNAL  sign_out_dffe5_wo :	STD_LOGIC;
	 SIGNAL  sign_res_dffe3_wi :	STD_LOGIC;
	 SIGNAL  sign_res_dffe3_wo :	STD_LOGIC;
	 SIGNAL  sign_res_dffe41_wi :	STD_LOGIC;
	 SIGNAL  sign_res_dffe41_wo :	STD_LOGIC;
	 SIGNAL  sign_res_dffe42_wi :	STD_LOGIC;
	 SIGNAL  sign_res_dffe42_wo :	STD_LOGIC;
	 SIGNAL  sign_res_dffe4_wi :	STD_LOGIC;
	 SIGNAL  sign_res_dffe4_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_cnt_dataa_w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  sticky_bit_cnt_datab_w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  sticky_bit_cnt_res_w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  sticky_bit_dffe1_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe1_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe21_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe21_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe22_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe22_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe23_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe23_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe25_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe25_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe26_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe26_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe27_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe27_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe2_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe2_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe31_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe31_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe32_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe32_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe33_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe33_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe3_wi :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe3_wo :	STD_LOGIC;
	 SIGNAL  sticky_bit_w :	STD_LOGIC;
	 SIGNAL  trailing_zeros_limit_w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  zero_man_sign_dffe21_wi :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe21_wo :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe22_wi :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe22_wo :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe23_wi :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe23_wo :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe26_wi :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe26_wo :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe27_wi :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe27_wo :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe2_wi :	STD_LOGIC;
	 SIGNAL  zero_man_sign_dffe2_wo :	STD_LOGIC;
	 SIGNAL  wire_w_aligned_dataa_exp_dffe15_wo_range315w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_aligned_datab_exp_dffe15_wo_range313w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range141w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range153w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range159w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range165w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range171w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range177w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range183w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range189w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range195w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range87w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range201w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range207w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range213w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range17w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range27w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range37w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range47w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range57w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range67w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range93w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range77w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range99w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range105w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range111w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range117w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range129w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_range135w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_dataa_dffe11_wo_range242w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_dataa_dffe11_wo_range232w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_datab_range144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range150w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range156w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range162w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range168w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range174w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range180w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range186w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range192w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range198w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range90w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range204w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range210w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range216w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range20w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range30w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range40w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range50w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range60w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range70w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range96w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range80w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range102w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range108w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range114w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range132w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_range138w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_datab_dffe11_wo_range261w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_datab_dffe11_wo_range251w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range7w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range24w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range34w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range44w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range54w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range64w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range74w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_all_one_w_range84w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range2w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range19w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range29w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range39w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range49w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range59w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_not_zero_w_range69w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range532w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range535w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range538w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range541w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range544w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range547w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range571w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range550w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_adjustment2_add_sub_w_range525w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_amb_w_range275w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range9w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range26w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range36w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range46w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range56w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range66w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range76w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_all_one_w_range86w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range5w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range22w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range32w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range42w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range52w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range62w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_not_zero_w_range72w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bma_w_range273w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_exp_diff_abs_exceed_max_w_range283w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_diff_abs_exceed_max_w_range287w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_diff_abs_exceed_max_w_range290w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_diff_abs_w_range291w	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_w_exp_diff_abs_w_range285w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_diff_abs_w_range288w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range554w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range557w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range559w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range561w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range563w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range565w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range567w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_max_w_range569w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range530w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range534w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range537w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range540w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range543w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range546w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range549w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_not_zero_w_range552w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range615w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range619w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range622w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range625w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range628w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range631w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_max_w_range634w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range617w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range620w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range623w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range626w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range629w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range632w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_rounded_res_w_range635w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range12w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range143w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range149w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range155w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range161w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range167w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range173w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range179w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range185w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range191w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range197w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range89w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range203w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range209w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range215w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range95w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range101w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range107w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range113w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range119w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range125w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range131w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_not_zero_w_range137w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range457w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range460w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range463w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range466w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range469w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range472w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range475w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range478w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range481w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range484w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range487w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range490w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range493w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range496w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range499w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range502w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range433w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range436w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range439w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range442w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range445w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range448w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range451w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe21_wo_range454w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe27_wo_range410w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe27_wo_range425w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe27_wo_range401w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe27_wo_range427w	:	STD_LOGIC_VECTOR (25 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_res_mag_dffe27_wo_range395w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_add_sub_w_range386w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range15w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range146w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range152w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range158w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range164w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range170w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range176w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range182w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range188w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range194w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range200w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range92w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range206w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range212w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range218w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range98w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range104w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range110w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range116w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range122w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range128w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range134w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_not_zero_w_range140w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range431w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range462w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range465w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range468w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range471w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range474w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range477w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range480w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range483w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range486w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range489w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range435w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range492w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range495w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range498w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range501w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range438w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range441w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range444w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range447w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range450w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range453w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range456w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_not_zero_w2_range459w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_rounding_add_sub_w_range598w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_man_res_rounding_add_sub_w_range602w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_man_res_rounding_add_sub_w_range599w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  cpu_fpoint_addsub_single_altbarrel_shift_0ig
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clk_en	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		data	:	IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		distance	:	IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		result	:	OUT  STD_LOGIC_VECTOR(25 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altbarrel_shift_l2e
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		distance	:	IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		result	:	OUT  STD_LOGIC_VECTOR(25 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_9u8
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_addsub_single_altpriority_encoder_tma
	 PORT
	 ( 
		data	:	IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		q	:	OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  lpm_compare
	 GENERIC 
	 (
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "UNSIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_compare"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		aeb	:	OUT STD_LOGIC;
		agb	:	OUT STD_LOGIC;
		ageb	:	OUT STD_LOGIC;
		alb	:	OUT STD_LOGIC;
		aleb	:	OUT STD_LOGIC;
		aneb	:	OUT STD_LOGIC;
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	wire_w_lg_w_lg_w_lg_dataa_sign_dffe1_wo345w349w350w(0) <= wire_w_lg_w_lg_dataa_sign_dffe1_wo345w349w(0) AND add_sub_dffe1_wo;
	wire_w248w(0) <= wire_w_lg_w_lg_input_dataa_infinite_dffe11_wo246w247w(0) AND wire_w_lg_input_dataa_zero_dffe11_wo245w(0);
	wire_w267w(0) <= wire_w_lg_w_lg_input_datab_infinite_dffe11_wo265w266w(0) AND wire_w_lg_input_datab_zero_dffe11_wo264w(0);
	wire_w_lg_w411w421w(0) <= wire_w411w(0) AND sticky_bit_dffe27_wo;
	wire_w_lg_w_lg_dataa_sign_dffe1_wo342w343w(0) <= wire_w_lg_dataa_sign_dffe1_wo342w(0) AND add_sub_dffe1_wo;
	loop80 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_w_lg_force_zero_w648w649w650w(i) <= wire_w_lg_w_lg_force_zero_w648w649w(0) AND exp_res_dffe4_wo(i);
	END GENERATE loop80;
	loop81 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_w_lg_force_zero_w648w649w659w(i) <= wire_w_lg_w_lg_force_zero_w648w649w(0) AND man_res_dffe4_wo(i);
	END GENERATE loop81;
	wire_w_lg_w_lg_dataa_sign_dffe1_wo345w349w(0) <= wire_w_lg_dataa_sign_dffe1_wo345w(0) AND wire_w_lg_datab_sign_dffe1_wo348w(0);
	wire_w_lg_w_lg_dataa_sign_dffe1_wo345w346w(0) <= wire_w_lg_dataa_sign_dffe1_wo345w(0) AND datab_sign_dffe1_wo;
	loop82 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_denormal_result_w572w573w(i) <= wire_w_lg_denormal_result_w572w(0) AND wire_w_exp_adjustment2_add_sub_w_range571w(i);
	END GENERATE loop82;
	loop83 : FOR i IN 0 TO 25 GENERATE 
		wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w324w(i) <= wire_w_lg_exp_amb_mux_dffe15_wo316w(0) AND aligned_dataa_man_dffe15_w(i);
	END GENERATE loop83;
	loop84 : FOR i IN 0 TO 25 GENERATE 
		wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w331w(i) <= wire_w_lg_exp_amb_mux_dffe15_wo316w(0) AND wire_rbarrel_shift_result(i);
	END GENERATE loop84;
	loop85 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w317w(i) <= wire_w_lg_exp_amb_mux_dffe15_wo316w(0) AND wire_w_aligned_dataa_exp_dffe15_wo_range315w(i);
	END GENERATE loop85;
	loop86 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_w_lg_exp_amb_mux_w276w279w(i) <= wire_w_lg_exp_amb_mux_w276w(0) AND aligned_datab_man_dffe12_wo(i);
	END GENERATE loop86;
	loop87 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_exp_amb_mux_w276w277w(i) <= wire_w_lg_exp_amb_mux_w276w(0) AND wire_w_exp_amb_w_range275w(i);
	END GENERATE loop87;
	loop88 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_force_infinity_w643w653w(i) <= wire_w_lg_force_infinity_w643w(0) AND wire_w_lg_w_lg_w_lg_force_zero_w648w651w652w(i);
	END GENERATE loop88;
	loop89 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_force_infinity_w643w662w(i) <= wire_w_lg_force_infinity_w643w(0) AND wire_w_lg_w_lg_w_lg_force_zero_w648w660w661w(i);
	END GENERATE loop89;
	wire_w_lg_w_lg_force_infinity_w643w668w(0) <= wire_w_lg_force_infinity_w643w(0) AND sign_res_dffe4_wo;
	loop90 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_force_nan_w644w656w(i) <= wire_w_lg_force_nan_w644w(0) AND wire_w_lg_w_lg_force_infinity_w654w655w(i);
	END GENERATE loop90;
	loop91 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_force_nan_w644w665w(i) <= wire_w_lg_force_nan_w644w(0) AND wire_w_lg_w_lg_force_infinity_w663w664w(i);
	END GENERATE loop91;
	loop92 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_input_dataa_denormal_dffe11_wo233w243w(i) <= wire_w_lg_input_dataa_denormal_dffe11_wo233w(0) AND wire_w_dataa_dffe11_wo_range242w(i);
	END GENERATE loop92;
	loop93 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_input_dataa_denormal_dffe11_wo233w234w(i) <= wire_w_lg_input_dataa_denormal_dffe11_wo233w(0) AND wire_w_dataa_dffe11_wo_range232w(i);
	END GENERATE loop93;
	wire_w_lg_w_lg_input_dataa_infinite_dffe11_wo246w247w(0) <= wire_w_lg_input_dataa_infinite_dffe11_wo246w(0) AND wire_w_lg_input_dataa_denormal_dffe11_wo233w(0);
	loop94 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_input_datab_denormal_dffe11_wo252w262w(i) <= wire_w_lg_input_datab_denormal_dffe11_wo252w(0) AND wire_w_datab_dffe11_wo_range261w(i);
	END GENERATE loop94;
	loop95 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_input_datab_denormal_dffe11_wo252w253w(i) <= wire_w_lg_input_datab_denormal_dffe11_wo252w(0) AND wire_w_datab_dffe11_wo_range251w(i);
	END GENERATE loop95;
	wire_w_lg_w_lg_input_datab_infinite_dffe11_wo265w266w(0) <= wire_w_lg_input_datab_infinite_dffe11_wo265w(0) AND wire_w_lg_input_datab_denormal_dffe11_wo252w(0);
	wire_w_lg_w_lg_input_datab_infinite_dffe15_wo339w340w(0) <= wire_w_lg_input_datab_infinite_dffe15_wo339w(0) AND aligned_dataa_sign_dffe15_wo;
	wire_w_lg_w_lg_man_res_not_zero_dffe26_wo517w518w(0) <= wire_w_lg_man_res_not_zero_dffe26_wo517w(0) AND zero_man_sign_dffe26_wo;
	loop96 : FOR i IN 0 TO 4 GENERATE 
		wire_w293w(i) <= wire_w_lg_w_exp_diff_abs_exceed_max_w_range290w292w(0) AND wire_w_exp_diff_abs_w_range291w(i);
	END GENERATE loop96;
	wire_w411w(0) <= wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w(0) AND wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range401w404w(0);
	loop97 : FOR i IN 0 TO 1 GENERATE 
		wire_w397w(i) <= wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w(0) AND exp_adjust_by_add1(i);
	END GENERATE loop97;
	loop98 : FOR i IN 0 TO 25 GENERATE 
		wire_w426w(i) <= wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w(0) AND wire_w_man_add_sub_res_mag_dffe27_wo_range425w(i);
	END GENERATE loop98;
	loop99 : FOR i IN 0 TO 27 GENERATE 
		wire_w_lg_w_lg_w_man_add_sub_w_range386w389w392w(i) <= wire_w_lg_w_man_add_sub_w_range386w389w(0) AND man_add_sub_w(i);
	END GENERATE loop99;
	loop100 : FOR i IN 0 TO 22 GENERATE 
		wire_w601w(i) <= wire_w_lg_w_man_res_rounding_add_sub_w_range599w600w(0) AND wire_w_man_res_rounding_add_sub_w_range598w(i);
	END GENERATE loop100;
	loop101 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_force_zero_w648w651w(i) <= wire_w_lg_force_zero_w648w(0) AND exp_all_zeros_w(i);
	END GENERATE loop101;
	loop102 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_force_zero_w648w660w(i) <= wire_w_lg_force_zero_w648w(0) AND man_all_zeros_w(i);
	END GENERATE loop102;
	wire_w_lg_dataa_sign_dffe1_wo351w(0) <= dataa_sign_dffe1_wo AND wire_w_lg_datab_sign_dffe1_wo348w(0);
	wire_w_lg_dataa_sign_dffe1_wo342w(0) <= dataa_sign_dffe1_wo AND datab_sign_dffe1_wo;
	loop103 : FOR i IN 0 TO 25 GENERATE 
		wire_w_lg_exp_amb_mux_dffe15_wo330w(i) <= exp_amb_mux_dffe15_wo AND aligned_datab_man_dffe15_w(i);
	END GENERATE loop103;
	loop104 : FOR i IN 0 TO 25 GENERATE 
		wire_w_lg_exp_amb_mux_dffe15_wo323w(i) <= exp_amb_mux_dffe15_wo AND wire_rbarrel_shift_result(i);
	END GENERATE loop104;
	loop105 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_exp_amb_mux_dffe15_wo314w(i) <= exp_amb_mux_dffe15_wo AND wire_w_aligned_datab_exp_dffe15_wo_range313w(i);
	END GENERATE loop105;
	loop106 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_exp_amb_mux_w280w(i) <= exp_amb_mux_w AND aligned_dataa_man_dffe12_wo(i);
	END GENERATE loop106;
	loop107 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_exp_amb_mux_w274w(i) <= exp_amb_mux_w AND wire_w_exp_bma_w_range273w(i);
	END GENERATE loop107;
	loop108 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_force_infinity_w654w(i) <= force_infinity_w AND exp_all_ones_w(i);
	END GENERATE loop108;
	loop109 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_force_infinity_w663w(i) <= force_infinity_w AND man_all_zeros_w(i);
	END GENERATE loop109;
	loop110 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_force_nan_w657w(i) <= force_nan_w AND exp_all_ones_w(i);
	END GENERATE loop110;
	loop111 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_force_nan_w666w(i) <= force_nan_w AND man_nan_w(i);
	END GENERATE loop111;
	wire_w_lg_input_datab_infinite_dffe15_wo338w(0) <= input_datab_infinite_dffe15_wo AND wire_w_lg_w_lg_aligned_datab_sign_dffe15_wo336w337w(0);
	wire_w_lg_need_complement_dffe22_wo390w(0) <= need_complement_dffe22_wo AND wire_w_lg_w_man_add_sub_w_range386w389w(0);
	wire_w_lg_w_dataa_range17w23w(0) <= wire_w_dataa_range17w(0) AND wire_w_exp_a_all_one_w_range7w(0);
	wire_w_lg_w_dataa_range27w33w(0) <= wire_w_dataa_range27w(0) AND wire_w_exp_a_all_one_w_range24w(0);
	wire_w_lg_w_dataa_range37w43w(0) <= wire_w_dataa_range37w(0) AND wire_w_exp_a_all_one_w_range34w(0);
	wire_w_lg_w_dataa_range47w53w(0) <= wire_w_dataa_range47w(0) AND wire_w_exp_a_all_one_w_range44w(0);
	wire_w_lg_w_dataa_range57w63w(0) <= wire_w_dataa_range57w(0) AND wire_w_exp_a_all_one_w_range54w(0);
	wire_w_lg_w_dataa_range67w73w(0) <= wire_w_dataa_range67w(0) AND wire_w_exp_a_all_one_w_range64w(0);
	wire_w_lg_w_dataa_range77w83w(0) <= wire_w_dataa_range77w(0) AND wire_w_exp_a_all_one_w_range74w(0);
	wire_w_lg_w_datab_range20w25w(0) <= wire_w_datab_range20w(0) AND wire_w_exp_b_all_one_w_range9w(0);
	wire_w_lg_w_datab_range30w35w(0) <= wire_w_datab_range30w(0) AND wire_w_exp_b_all_one_w_range26w(0);
	wire_w_lg_w_datab_range40w45w(0) <= wire_w_datab_range40w(0) AND wire_w_exp_b_all_one_w_range36w(0);
	wire_w_lg_w_datab_range50w55w(0) <= wire_w_datab_range50w(0) AND wire_w_exp_b_all_one_w_range46w(0);
	wire_w_lg_w_datab_range60w65w(0) <= wire_w_datab_range60w(0) AND wire_w_exp_b_all_one_w_range56w(0);
	wire_w_lg_w_datab_range70w75w(0) <= wire_w_datab_range70w(0) AND wire_w_exp_b_all_one_w_range66w(0);
	wire_w_lg_w_datab_range80w85w(0) <= wire_w_datab_range80w(0) AND wire_w_exp_b_all_one_w_range76w(0);
	wire_w_lg_w_exp_a_all_one_w_range84w220w(0) <= wire_w_exp_a_all_one_w_range84w(0) AND wire_w_lg_w_man_a_not_zero_w_range215w219w(0);
	wire_w_lg_w_exp_b_all_one_w_range86w226w(0) <= wire_w_exp_b_all_one_w_range86w(0) AND wire_w_lg_w_man_b_not_zero_w_range218w225w(0);
	loop112 : FOR i IN 0 TO 4 GENERATE 
		wire_w_lg_w_exp_diff_abs_exceed_max_w_range290w294w(i) <= wire_w_exp_diff_abs_exceed_max_w_range290w(0) AND exp_diff_abs_max_w(i);
	END GENERATE loop112;
	wire_w_lg_w_exp_res_max_w_range554w556w(0) <= wire_w_exp_res_max_w_range554w(0) AND wire_w_exp_adjustment2_add_sub_w_range532w(0);
	wire_w_lg_w_exp_res_max_w_range557w558w(0) <= wire_w_exp_res_max_w_range557w(0) AND wire_w_exp_adjustment2_add_sub_w_range535w(0);
	wire_w_lg_w_exp_res_max_w_range559w560w(0) <= wire_w_exp_res_max_w_range559w(0) AND wire_w_exp_adjustment2_add_sub_w_range538w(0);
	wire_w_lg_w_exp_res_max_w_range561w562w(0) <= wire_w_exp_res_max_w_range561w(0) AND wire_w_exp_adjustment2_add_sub_w_range541w(0);
	wire_w_lg_w_exp_res_max_w_range563w564w(0) <= wire_w_exp_res_max_w_range563w(0) AND wire_w_exp_adjustment2_add_sub_w_range544w(0);
	wire_w_lg_w_exp_res_max_w_range565w566w(0) <= wire_w_exp_res_max_w_range565w(0) AND wire_w_exp_adjustment2_add_sub_w_range547w(0);
	wire_w_lg_w_exp_res_max_w_range567w568w(0) <= wire_w_exp_res_max_w_range567w(0) AND wire_w_exp_adjustment2_add_sub_w_range550w(0);
	wire_w_lg_w_exp_res_max_w_range569w575w(0) <= wire_w_exp_res_max_w_range569w(0) AND wire_w_lg_w_exp_adjustment2_add_sub_w_range525w574w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range615w618w(0) <= wire_w_exp_rounded_res_max_w_range615w(0) AND wire_w_exp_rounded_res_w_range617w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range619w621w(0) <= wire_w_exp_rounded_res_max_w_range619w(0) AND wire_w_exp_rounded_res_w_range620w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range622w624w(0) <= wire_w_exp_rounded_res_max_w_range622w(0) AND wire_w_exp_rounded_res_w_range623w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range625w627w(0) <= wire_w_exp_rounded_res_max_w_range625w(0) AND wire_w_exp_rounded_res_w_range626w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range628w630w(0) <= wire_w_exp_rounded_res_max_w_range628w(0) AND wire_w_exp_rounded_res_w_range629w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range631w633w(0) <= wire_w_exp_rounded_res_max_w_range631w(0) AND wire_w_exp_rounded_res_w_range632w(0);
	wire_w_lg_w_exp_rounded_res_max_w_range634w636w(0) <= wire_w_exp_rounded_res_max_w_range634w(0) AND wire_w_exp_rounded_res_w_range635w(0);
	wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w405w(0) <= wire_w_man_add_sub_res_mag_dffe27_wo_range395w(0) AND wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range401w404w(0);
	loop113 : FOR i IN 0 TO 1 GENERATE 
		wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w398w(i) <= wire_w_man_add_sub_res_mag_dffe27_wo_range395w(0) AND exp_adjust_by_add2(i);
	END GENERATE loop113;
	loop114 : FOR i IN 0 TO 25 GENERATE 
		wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w428w(i) <= wire_w_man_add_sub_res_mag_dffe27_wo_range395w(0) AND wire_w_man_add_sub_res_mag_dffe27_wo_range427w(i);
	END GENERATE loop114;
	loop115 : FOR i IN 0 TO 27 GENERATE 
		wire_w_lg_w_man_add_sub_w_range386w393w(i) <= wire_w_man_add_sub_w_range386w(0) AND man_2comp_res_w(i);
	END GENERATE loop115;
	loop116 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_man_res_rounding_add_sub_w_range599w603w(i) <= wire_w_man_res_rounding_add_sub_w_range599w(0) AND wire_w_man_res_rounding_add_sub_w_range602w(i);
	END GENERATE loop116;
	wire_w_lg_w_lg_force_zero_w648w649w(0) <= NOT wire_w_lg_force_zero_w648w(0);
	wire_w_lg_w_lg_aligned_datab_sign_dffe15_wo336w337w(0) <= NOT wire_w_lg_aligned_datab_sign_dffe15_wo336w(0);
	wire_w_lg_add_sub_dffe1_wo344w(0) <= NOT add_sub_dffe1_wo;
	wire_w_lg_add_sub_dffe25_wo505w(0) <= NOT add_sub_dffe25_wo;
	wire_w_lg_add_sub_w2356w(0) <= NOT add_sub_w2;
	wire_w_lg_dataa_sign_dffe1_wo345w(0) <= NOT dataa_sign_dffe1_wo;
	wire_w_lg_datab_sign_dffe1_wo348w(0) <= NOT datab_sign_dffe1_wo;
	wire_w_lg_denormal_result_w572w(0) <= NOT denormal_result_w;
	wire_w_lg_exp_amb_mux_dffe15_wo316w(0) <= NOT exp_amb_mux_dffe15_wo;
	wire_w_lg_exp_amb_mux_w276w(0) <= NOT exp_amb_mux_w;
	wire_w_lg_force_infinity_w643w(0) <= NOT force_infinity_w;
	wire_w_lg_force_nan_w644w(0) <= NOT force_nan_w;
	wire_w_lg_force_zero_w642w(0) <= NOT force_zero_w;
	wire_w_lg_input_dataa_denormal_dffe11_wo233w(0) <= NOT input_dataa_denormal_dffe11_wo;
	wire_w_lg_input_dataa_infinite_dffe11_wo246w(0) <= NOT input_dataa_infinite_dffe11_wo;
	wire_w_lg_input_dataa_zero_dffe11_wo245w(0) <= NOT input_dataa_zero_dffe11_wo;
	wire_w_lg_input_datab_denormal_dffe11_wo252w(0) <= NOT input_datab_denormal_dffe11_wo;
	wire_w_lg_input_datab_infinite_dffe11_wo265w(0) <= NOT input_datab_infinite_dffe11_wo;
	wire_w_lg_input_datab_infinite_dffe15_wo339w(0) <= NOT input_datab_infinite_dffe15_wo;
	wire_w_lg_input_datab_zero_dffe11_wo264w(0) <= NOT input_datab_zero_dffe11_wo;
	wire_w_lg_man_res_is_not_zero_dffe4_wo641w(0) <= NOT man_res_is_not_zero_dffe4_wo;
	wire_w_lg_man_res_not_zero_dffe26_wo517w(0) <= NOT man_res_not_zero_dffe26_wo;
	wire_w_lg_need_complement_dffe22_wo387w(0) <= NOT need_complement_dffe22_wo;
	wire_w_lg_sticky_bit_dffe1_wo357w(0) <= NOT sticky_bit_dffe1_wo;
	wire_w_lg_w_exp_adjustment2_add_sub_w_range525w574w(0) <= NOT wire_w_exp_adjustment2_add_sub_w_range525w(0);
	wire_w_lg_w_exp_diff_abs_exceed_max_w_range290w292w(0) <= NOT wire_w_exp_diff_abs_exceed_max_w_range290w(0);
	wire_w_lg_w_man_a_not_zero_w_range215w219w(0) <= NOT wire_w_man_a_not_zero_w_range215w(0);
	wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range401w404w(0) <= NOT wire_w_man_add_sub_res_mag_dffe27_wo_range401w(0);
	wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w(0) <= NOT wire_w_man_add_sub_res_mag_dffe27_wo_range395w(0);
	wire_w_lg_w_man_add_sub_w_range386w389w(0) <= NOT wire_w_man_add_sub_w_range386w(0);
	wire_w_lg_w_man_b_not_zero_w_range218w225w(0) <= NOT wire_w_man_b_not_zero_w_range218w(0);
	wire_w_lg_w_man_res_rounding_add_sub_w_range599w600w(0) <= NOT wire_w_man_res_rounding_add_sub_w_range599w(0);
	loop117 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_w_lg_force_zero_w648w651w652w(i) <= wire_w_lg_w_lg_force_zero_w648w651w(i) OR wire_w_lg_w_lg_w_lg_force_zero_w648w649w650w(i);
	END GENERATE loop117;
	loop118 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_w_lg_force_zero_w648w660w661w(i) <= wire_w_lg_w_lg_force_zero_w648w660w(i) OR wire_w_lg_w_lg_w_lg_force_zero_w648w649w659w(i);
	END GENERATE loop118;
	loop119 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_force_infinity_w654w655w(i) <= wire_w_lg_force_infinity_w654w(i) OR wire_w_lg_w_lg_force_infinity_w643w653w(i);
	END GENERATE loop119;
	loop120 : FOR i IN 0 TO 22 GENERATE 
		wire_w_lg_w_lg_force_infinity_w663w664w(i) <= wire_w_lg_force_infinity_w663w(i) OR wire_w_lg_w_lg_force_infinity_w643w662w(i);
	END GENERATE loop120;
	wire_w_lg_force_zero_w648w(0) <= force_zero_w OR denormal_flag_w;
	wire_w_lg_sticky_bit_dffe27_wo416w(0) <= sticky_bit_dffe27_wo OR wire_w_man_add_sub_res_mag_dffe27_wo_range410w(0);
	wire_w_lg_w_dataa_range141w142w(0) <= wire_w_dataa_range141w(0) OR wire_w_man_a_not_zero_w_range137w(0);
	wire_w_lg_w_dataa_range147w148w(0) <= wire_w_dataa_range147w(0) OR wire_w_man_a_not_zero_w_range143w(0);
	wire_w_lg_w_dataa_range153w154w(0) <= wire_w_dataa_range153w(0) OR wire_w_man_a_not_zero_w_range149w(0);
	wire_w_lg_w_dataa_range159w160w(0) <= wire_w_dataa_range159w(0) OR wire_w_man_a_not_zero_w_range155w(0);
	wire_w_lg_w_dataa_range165w166w(0) <= wire_w_dataa_range165w(0) OR wire_w_man_a_not_zero_w_range161w(0);
	wire_w_lg_w_dataa_range171w172w(0) <= wire_w_dataa_range171w(0) OR wire_w_man_a_not_zero_w_range167w(0);
	wire_w_lg_w_dataa_range177w178w(0) <= wire_w_dataa_range177w(0) OR wire_w_man_a_not_zero_w_range173w(0);
	wire_w_lg_w_dataa_range183w184w(0) <= wire_w_dataa_range183w(0) OR wire_w_man_a_not_zero_w_range179w(0);
	wire_w_lg_w_dataa_range189w190w(0) <= wire_w_dataa_range189w(0) OR wire_w_man_a_not_zero_w_range185w(0);
	wire_w_lg_w_dataa_range195w196w(0) <= wire_w_dataa_range195w(0) OR wire_w_man_a_not_zero_w_range191w(0);
	wire_w_lg_w_dataa_range87w88w(0) <= wire_w_dataa_range87w(0) OR wire_w_man_a_not_zero_w_range12w(0);
	wire_w_lg_w_dataa_range201w202w(0) <= wire_w_dataa_range201w(0) OR wire_w_man_a_not_zero_w_range197w(0);
	wire_w_lg_w_dataa_range207w208w(0) <= wire_w_dataa_range207w(0) OR wire_w_man_a_not_zero_w_range203w(0);
	wire_w_lg_w_dataa_range213w214w(0) <= wire_w_dataa_range213w(0) OR wire_w_man_a_not_zero_w_range209w(0);
	wire_w_lg_w_dataa_range17w18w(0) <= wire_w_dataa_range17w(0) OR wire_w_exp_a_not_zero_w_range2w(0);
	wire_w_lg_w_dataa_range27w28w(0) <= wire_w_dataa_range27w(0) OR wire_w_exp_a_not_zero_w_range19w(0);
	wire_w_lg_w_dataa_range37w38w(0) <= wire_w_dataa_range37w(0) OR wire_w_exp_a_not_zero_w_range29w(0);
	wire_w_lg_w_dataa_range47w48w(0) <= wire_w_dataa_range47w(0) OR wire_w_exp_a_not_zero_w_range39w(0);
	wire_w_lg_w_dataa_range57w58w(0) <= wire_w_dataa_range57w(0) OR wire_w_exp_a_not_zero_w_range49w(0);
	wire_w_lg_w_dataa_range67w68w(0) <= wire_w_dataa_range67w(0) OR wire_w_exp_a_not_zero_w_range59w(0);
	wire_w_lg_w_dataa_range93w94w(0) <= wire_w_dataa_range93w(0) OR wire_w_man_a_not_zero_w_range89w(0);
	wire_w_lg_w_dataa_range77w78w(0) <= wire_w_dataa_range77w(0) OR wire_w_exp_a_not_zero_w_range69w(0);
	wire_w_lg_w_dataa_range99w100w(0) <= wire_w_dataa_range99w(0) OR wire_w_man_a_not_zero_w_range95w(0);
	wire_w_lg_w_dataa_range105w106w(0) <= wire_w_dataa_range105w(0) OR wire_w_man_a_not_zero_w_range101w(0);
	wire_w_lg_w_dataa_range111w112w(0) <= wire_w_dataa_range111w(0) OR wire_w_man_a_not_zero_w_range107w(0);
	wire_w_lg_w_dataa_range117w118w(0) <= wire_w_dataa_range117w(0) OR wire_w_man_a_not_zero_w_range113w(0);
	wire_w_lg_w_dataa_range123w124w(0) <= wire_w_dataa_range123w(0) OR wire_w_man_a_not_zero_w_range119w(0);
	wire_w_lg_w_dataa_range129w130w(0) <= wire_w_dataa_range129w(0) OR wire_w_man_a_not_zero_w_range125w(0);
	wire_w_lg_w_dataa_range135w136w(0) <= wire_w_dataa_range135w(0) OR wire_w_man_a_not_zero_w_range131w(0);
	wire_w_lg_w_datab_range144w145w(0) <= wire_w_datab_range144w(0) OR wire_w_man_b_not_zero_w_range140w(0);
	wire_w_lg_w_datab_range150w151w(0) <= wire_w_datab_range150w(0) OR wire_w_man_b_not_zero_w_range146w(0);
	wire_w_lg_w_datab_range156w157w(0) <= wire_w_datab_range156w(0) OR wire_w_man_b_not_zero_w_range152w(0);
	wire_w_lg_w_datab_range162w163w(0) <= wire_w_datab_range162w(0) OR wire_w_man_b_not_zero_w_range158w(0);
	wire_w_lg_w_datab_range168w169w(0) <= wire_w_datab_range168w(0) OR wire_w_man_b_not_zero_w_range164w(0);
	wire_w_lg_w_datab_range174w175w(0) <= wire_w_datab_range174w(0) OR wire_w_man_b_not_zero_w_range170w(0);
	wire_w_lg_w_datab_range180w181w(0) <= wire_w_datab_range180w(0) OR wire_w_man_b_not_zero_w_range176w(0);
	wire_w_lg_w_datab_range186w187w(0) <= wire_w_datab_range186w(0) OR wire_w_man_b_not_zero_w_range182w(0);
	wire_w_lg_w_datab_range192w193w(0) <= wire_w_datab_range192w(0) OR wire_w_man_b_not_zero_w_range188w(0);
	wire_w_lg_w_datab_range198w199w(0) <= wire_w_datab_range198w(0) OR wire_w_man_b_not_zero_w_range194w(0);
	wire_w_lg_w_datab_range90w91w(0) <= wire_w_datab_range90w(0) OR wire_w_man_b_not_zero_w_range15w(0);
	wire_w_lg_w_datab_range204w205w(0) <= wire_w_datab_range204w(0) OR wire_w_man_b_not_zero_w_range200w(0);
	wire_w_lg_w_datab_range210w211w(0) <= wire_w_datab_range210w(0) OR wire_w_man_b_not_zero_w_range206w(0);
	wire_w_lg_w_datab_range216w217w(0) <= wire_w_datab_range216w(0) OR wire_w_man_b_not_zero_w_range212w(0);
	wire_w_lg_w_datab_range20w21w(0) <= wire_w_datab_range20w(0) OR wire_w_exp_b_not_zero_w_range5w(0);
	wire_w_lg_w_datab_range30w31w(0) <= wire_w_datab_range30w(0) OR wire_w_exp_b_not_zero_w_range22w(0);
	wire_w_lg_w_datab_range40w41w(0) <= wire_w_datab_range40w(0) OR wire_w_exp_b_not_zero_w_range32w(0);
	wire_w_lg_w_datab_range50w51w(0) <= wire_w_datab_range50w(0) OR wire_w_exp_b_not_zero_w_range42w(0);
	wire_w_lg_w_datab_range60w61w(0) <= wire_w_datab_range60w(0) OR wire_w_exp_b_not_zero_w_range52w(0);
	wire_w_lg_w_datab_range70w71w(0) <= wire_w_datab_range70w(0) OR wire_w_exp_b_not_zero_w_range62w(0);
	wire_w_lg_w_datab_range96w97w(0) <= wire_w_datab_range96w(0) OR wire_w_man_b_not_zero_w_range92w(0);
	wire_w_lg_w_datab_range80w81w(0) <= wire_w_datab_range80w(0) OR wire_w_exp_b_not_zero_w_range72w(0);
	wire_w_lg_w_datab_range102w103w(0) <= wire_w_datab_range102w(0) OR wire_w_man_b_not_zero_w_range98w(0);
	wire_w_lg_w_datab_range108w109w(0) <= wire_w_datab_range108w(0) OR wire_w_man_b_not_zero_w_range104w(0);
	wire_w_lg_w_datab_range114w115w(0) <= wire_w_datab_range114w(0) OR wire_w_man_b_not_zero_w_range110w(0);
	wire_w_lg_w_datab_range120w121w(0) <= wire_w_datab_range120w(0) OR wire_w_man_b_not_zero_w_range116w(0);
	wire_w_lg_w_datab_range126w127w(0) <= wire_w_datab_range126w(0) OR wire_w_man_b_not_zero_w_range122w(0);
	wire_w_lg_w_datab_range132w133w(0) <= wire_w_datab_range132w(0) OR wire_w_man_b_not_zero_w_range128w(0);
	wire_w_lg_w_datab_range138w139w(0) <= wire_w_datab_range138w(0) OR wire_w_man_b_not_zero_w_range134w(0);
	wire_w_lg_w_exp_diff_abs_exceed_max_w_range283w286w(0) <= wire_w_exp_diff_abs_exceed_max_w_range283w(0) OR wire_w_exp_diff_abs_w_range285w(0);
	wire_w_lg_w_exp_diff_abs_exceed_max_w_range287w289w(0) <= wire_w_exp_diff_abs_exceed_max_w_range287w(0) OR wire_w_exp_diff_abs_w_range288w(0);
	wire_w_lg_w_exp_res_not_zero_w_range530w533w(0) <= wire_w_exp_res_not_zero_w_range530w(0) OR wire_w_exp_adjustment2_add_sub_w_range532w(0);
	wire_w_lg_w_exp_res_not_zero_w_range534w536w(0) <= wire_w_exp_res_not_zero_w_range534w(0) OR wire_w_exp_adjustment2_add_sub_w_range535w(0);
	wire_w_lg_w_exp_res_not_zero_w_range537w539w(0) <= wire_w_exp_res_not_zero_w_range537w(0) OR wire_w_exp_adjustment2_add_sub_w_range538w(0);
	wire_w_lg_w_exp_res_not_zero_w_range540w542w(0) <= wire_w_exp_res_not_zero_w_range540w(0) OR wire_w_exp_adjustment2_add_sub_w_range541w(0);
	wire_w_lg_w_exp_res_not_zero_w_range543w545w(0) <= wire_w_exp_res_not_zero_w_range543w(0) OR wire_w_exp_adjustment2_add_sub_w_range544w(0);
	wire_w_lg_w_exp_res_not_zero_w_range546w548w(0) <= wire_w_exp_res_not_zero_w_range546w(0) OR wire_w_exp_adjustment2_add_sub_w_range547w(0);
	wire_w_lg_w_exp_res_not_zero_w_range549w551w(0) <= wire_w_exp_res_not_zero_w_range549w(0) OR wire_w_exp_adjustment2_add_sub_w_range550w(0);
	wire_w_lg_w_exp_res_not_zero_w_range552w553w(0) <= wire_w_exp_res_not_zero_w_range552w(0) OR wire_w_exp_adjustment2_add_sub_w_range525w(0);
	wire_w_lg_w_man_res_not_zero_w2_range431w434w(0) <= wire_w_man_res_not_zero_w2_range431w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range433w(0);
	wire_w_lg_w_man_res_not_zero_w2_range462w464w(0) <= wire_w_man_res_not_zero_w2_range462w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range463w(0);
	wire_w_lg_w_man_res_not_zero_w2_range465w467w(0) <= wire_w_man_res_not_zero_w2_range465w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range466w(0);
	wire_w_lg_w_man_res_not_zero_w2_range468w470w(0) <= wire_w_man_res_not_zero_w2_range468w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range469w(0);
	wire_w_lg_w_man_res_not_zero_w2_range471w473w(0) <= wire_w_man_res_not_zero_w2_range471w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range472w(0);
	wire_w_lg_w_man_res_not_zero_w2_range474w476w(0) <= wire_w_man_res_not_zero_w2_range474w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range475w(0);
	wire_w_lg_w_man_res_not_zero_w2_range477w479w(0) <= wire_w_man_res_not_zero_w2_range477w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range478w(0);
	wire_w_lg_w_man_res_not_zero_w2_range480w482w(0) <= wire_w_man_res_not_zero_w2_range480w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range481w(0);
	wire_w_lg_w_man_res_not_zero_w2_range483w485w(0) <= wire_w_man_res_not_zero_w2_range483w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range484w(0);
	wire_w_lg_w_man_res_not_zero_w2_range486w488w(0) <= wire_w_man_res_not_zero_w2_range486w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range487w(0);
	wire_w_lg_w_man_res_not_zero_w2_range489w491w(0) <= wire_w_man_res_not_zero_w2_range489w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range490w(0);
	wire_w_lg_w_man_res_not_zero_w2_range435w437w(0) <= wire_w_man_res_not_zero_w2_range435w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range436w(0);
	wire_w_lg_w_man_res_not_zero_w2_range492w494w(0) <= wire_w_man_res_not_zero_w2_range492w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range493w(0);
	wire_w_lg_w_man_res_not_zero_w2_range495w497w(0) <= wire_w_man_res_not_zero_w2_range495w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range496w(0);
	wire_w_lg_w_man_res_not_zero_w2_range498w500w(0) <= wire_w_man_res_not_zero_w2_range498w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range499w(0);
	wire_w_lg_w_man_res_not_zero_w2_range501w503w(0) <= wire_w_man_res_not_zero_w2_range501w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range502w(0);
	wire_w_lg_w_man_res_not_zero_w2_range438w440w(0) <= wire_w_man_res_not_zero_w2_range438w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range439w(0);
	wire_w_lg_w_man_res_not_zero_w2_range441w443w(0) <= wire_w_man_res_not_zero_w2_range441w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range442w(0);
	wire_w_lg_w_man_res_not_zero_w2_range444w446w(0) <= wire_w_man_res_not_zero_w2_range444w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range445w(0);
	wire_w_lg_w_man_res_not_zero_w2_range447w449w(0) <= wire_w_man_res_not_zero_w2_range447w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range448w(0);
	wire_w_lg_w_man_res_not_zero_w2_range450w452w(0) <= wire_w_man_res_not_zero_w2_range450w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range451w(0);
	wire_w_lg_w_man_res_not_zero_w2_range453w455w(0) <= wire_w_man_res_not_zero_w2_range453w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range454w(0);
	wire_w_lg_w_man_res_not_zero_w2_range456w458w(0) <= wire_w_man_res_not_zero_w2_range456w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range457w(0);
	wire_w_lg_w_man_res_not_zero_w2_range459w461w(0) <= wire_w_man_res_not_zero_w2_range459w(0) OR wire_w_man_add_sub_res_mag_dffe21_wo_range460w(0);
	wire_w_lg_aligned_datab_sign_dffe15_wo336w(0) <= aligned_datab_sign_dffe15_wo XOR add_sub_dffe15_wo;
	add_sub_dffe11_wi <= add_sub;
	add_sub_dffe11_wo <= add_sub_dffe11_wi;
	add_sub_dffe12_wi <= add_sub_dffe11_wo;
	add_sub_dffe12_wo <= add_sub_dffe12;
	add_sub_dffe13_wi <= add_sub_dffe12_wo;
	add_sub_dffe13_wo <= add_sub_dffe13_wi;
	add_sub_dffe14_wi <= add_sub_dffe13_wo;
	add_sub_dffe14_wo <= add_sub_dffe14_wi;
	add_sub_dffe15_wi <= add_sub_dffe14_wo;
	add_sub_dffe15_wo <= add_sub_dffe15_wi;
	add_sub_dffe1_wi <= add_sub_dffe15_wo;
	add_sub_dffe1_wo <= add_sub_dffe1;
	add_sub_dffe25_wi <= add_sub_w2;
	add_sub_dffe25_wo <= add_sub_dffe25_wi;
	add_sub_w2 <= ((((wire_w_lg_dataa_sign_dffe1_wo351w(0) AND wire_w_lg_add_sub_dffe1_wo344w(0)) OR wire_w_lg_w_lg_w_lg_dataa_sign_dffe1_wo345w349w350w(0)) OR (wire_w_lg_w_lg_dataa_sign_dffe1_wo345w346w(0) AND wire_w_lg_add_sub_dffe1_wo344w(0))) OR wire_w_lg_w_lg_dataa_sign_dffe1_wo342w343w(0));
	adder_upper_w <= man_intermediate_res_w(25 DOWNTO 13);
	aligned_dataa_exp_dffe12_wi <= aligned_dataa_exp_w;
	aligned_dataa_exp_dffe12_wo <= aligned_dataa_exp_dffe12;
	aligned_dataa_exp_dffe13_wi <= aligned_dataa_exp_dffe12_wo;
	aligned_dataa_exp_dffe13_wo <= aligned_dataa_exp_dffe13_wi;
	aligned_dataa_exp_dffe14_wi <= aligned_dataa_exp_dffe13_wo;
	aligned_dataa_exp_dffe14_wo <= aligned_dataa_exp_dffe14_wi;
	aligned_dataa_exp_dffe15_wi <= aligned_dataa_exp_dffe14_wo;
	aligned_dataa_exp_dffe15_wo <= aligned_dataa_exp_dffe15_wi;
	aligned_dataa_exp_w <= ( "0" & wire_w_lg_w_lg_input_dataa_denormal_dffe11_wo233w234w);
	aligned_dataa_man_dffe12_wi <= aligned_dataa_man_w(25 DOWNTO 2);
	aligned_dataa_man_dffe12_wo <= aligned_dataa_man_dffe12;
	aligned_dataa_man_dffe13_wi <= aligned_dataa_man_dffe12_wo;
	aligned_dataa_man_dffe13_wo <= aligned_dataa_man_dffe13_wi;
	aligned_dataa_man_dffe14_wi <= aligned_dataa_man_dffe13_wo;
	aligned_dataa_man_dffe14_wo <= aligned_dataa_man_dffe14_wi;
	aligned_dataa_man_dffe15_w <= ( aligned_dataa_man_dffe15_wo & "00");
	aligned_dataa_man_dffe15_wi <= aligned_dataa_man_dffe14_wo;
	aligned_dataa_man_dffe15_wo <= aligned_dataa_man_dffe15_wi;
	aligned_dataa_man_w <= ( wire_w248w & wire_w_lg_w_lg_input_dataa_denormal_dffe11_wo233w243w & "00");
	aligned_dataa_sign_dffe12_wi <= aligned_dataa_sign_w;
	aligned_dataa_sign_dffe12_wo <= aligned_dataa_sign_dffe12;
	aligned_dataa_sign_dffe13_wi <= aligned_dataa_sign_dffe12_wo;
	aligned_dataa_sign_dffe13_wo <= aligned_dataa_sign_dffe13_wi;
	aligned_dataa_sign_dffe14_wi <= aligned_dataa_sign_dffe13_wo;
	aligned_dataa_sign_dffe14_wo <= aligned_dataa_sign_dffe14_wi;
	aligned_dataa_sign_dffe15_wi <= aligned_dataa_sign_dffe14_wo;
	aligned_dataa_sign_dffe15_wo <= aligned_dataa_sign_dffe15_wi;
	aligned_dataa_sign_w <= dataa_dffe11_wo(31);
	aligned_datab_exp_dffe12_wi <= aligned_datab_exp_w;
	aligned_datab_exp_dffe12_wo <= aligned_datab_exp_dffe12;
	aligned_datab_exp_dffe13_wi <= aligned_datab_exp_dffe12_wo;
	aligned_datab_exp_dffe13_wo <= aligned_datab_exp_dffe13_wi;
	aligned_datab_exp_dffe14_wi <= aligned_datab_exp_dffe13_wo;
	aligned_datab_exp_dffe14_wo <= aligned_datab_exp_dffe14_wi;
	aligned_datab_exp_dffe15_wi <= aligned_datab_exp_dffe14_wo;
	aligned_datab_exp_dffe15_wo <= aligned_datab_exp_dffe15_wi;
	aligned_datab_exp_w <= ( "0" & wire_w_lg_w_lg_input_datab_denormal_dffe11_wo252w253w);
	aligned_datab_man_dffe12_wi <= aligned_datab_man_w(25 DOWNTO 2);
	aligned_datab_man_dffe12_wo <= aligned_datab_man_dffe12;
	aligned_datab_man_dffe13_wi <= aligned_datab_man_dffe12_wo;
	aligned_datab_man_dffe13_wo <= aligned_datab_man_dffe13_wi;
	aligned_datab_man_dffe14_wi <= aligned_datab_man_dffe13_wo;
	aligned_datab_man_dffe14_wo <= aligned_datab_man_dffe14_wi;
	aligned_datab_man_dffe15_w <= ( aligned_datab_man_dffe15_wo & "00");
	aligned_datab_man_dffe15_wi <= aligned_datab_man_dffe14_wo;
	aligned_datab_man_dffe15_wo <= aligned_datab_man_dffe15_wi;
	aligned_datab_man_w <= ( wire_w267w & wire_w_lg_w_lg_input_datab_denormal_dffe11_wo252w262w & "00");
	aligned_datab_sign_dffe12_wi <= aligned_datab_sign_w;
	aligned_datab_sign_dffe12_wo <= aligned_datab_sign_dffe12;
	aligned_datab_sign_dffe13_wi <= aligned_datab_sign_dffe12_wo;
	aligned_datab_sign_dffe13_wo <= aligned_datab_sign_dffe13_wi;
	aligned_datab_sign_dffe14_wi <= aligned_datab_sign_dffe13_wo;
	aligned_datab_sign_dffe14_wo <= aligned_datab_sign_dffe14_wi;
	aligned_datab_sign_dffe15_wi <= aligned_datab_sign_dffe14_wo;
	aligned_datab_sign_dffe15_wo <= aligned_datab_sign_dffe15_wi;
	aligned_datab_sign_w <= datab_dffe11_wo(31);
	borrow_w <= (wire_w_lg_sticky_bit_dffe1_wo357w(0) AND wire_w_lg_add_sub_w2356w(0));
	both_inputs_are_infinite_dffe1_wi <= (input_dataa_infinite_dffe15_wo AND input_datab_infinite_dffe15_wo);
	both_inputs_are_infinite_dffe1_wo <= both_inputs_are_infinite_dffe1;
	both_inputs_are_infinite_dffe25_wi <= both_inputs_are_infinite_dffe1_wo;
	both_inputs_are_infinite_dffe25_wo <= both_inputs_are_infinite_dffe25_wi;
	data_exp_dffe1_wi <= (wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w317w OR wire_w_lg_exp_amb_mux_dffe15_wo314w);
	data_exp_dffe1_wo <= data_exp_dffe1;
	dataa_dffe11_wi <= dataa;
	dataa_dffe11_wo <= dataa_dffe11_wi;
	dataa_man_dffe1_wi <= (wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w324w OR wire_w_lg_exp_amb_mux_dffe15_wo323w);
	dataa_man_dffe1_wo <= dataa_man_dffe1;
	dataa_sign_dffe1_wi <= aligned_dataa_sign_dffe15_wo;
	dataa_sign_dffe1_wo <= dataa_sign_dffe1;
	dataa_sign_dffe25_wi <= dataa_sign_dffe1_wo;
	dataa_sign_dffe25_wo <= dataa_sign_dffe25_wi;
	datab_dffe11_wi <= datab;
	datab_dffe11_wo <= datab_dffe11_wi;
	datab_man_dffe1_wi <= (wire_w_lg_w_lg_exp_amb_mux_dffe15_wo316w331w OR wire_w_lg_exp_amb_mux_dffe15_wo330w);
	datab_man_dffe1_wo <= datab_man_dffe1;
	datab_sign_dffe1_wi <= aligned_datab_sign_dffe15_wo;
	datab_sign_dffe1_wo <= datab_sign_dffe1;
	denormal_flag_w <= (((wire_w_lg_force_nan_w644w(0) AND wire_w_lg_force_infinity_w643w(0)) AND wire_w_lg_force_zero_w642w(0)) AND denormal_res_dffe4_wo);
	denormal_res_dffe32_wi <= denormal_result_w;
	denormal_res_dffe32_wo <= denormal_res_dffe32_wi;
	denormal_res_dffe33_wi <= denormal_res_dffe32_wo;
	denormal_res_dffe33_wo <= denormal_res_dffe33_wi;
	denormal_res_dffe3_wi <= denormal_res_dffe33_wo;
	denormal_res_dffe3_wo <= denormal_res_dffe3;
	denormal_res_dffe41_wi <= denormal_res_dffe42_wo;
	denormal_res_dffe41_wo <= denormal_res_dffe41_wi;
	denormal_res_dffe42_wi <= denormal_res_dffe3_wo;
	denormal_res_dffe42_wo <= denormal_res_dffe42_wi;
	denormal_res_dffe4_wi <= denormal_res_dffe41_wo;
	denormal_res_dffe4_wo <= denormal_res_dffe4;
	denormal_result_w <= ((NOT exp_res_not_zero_w(8)) OR exp_adjustment2_add_sub_w(8));
	exp_a_all_one_w <= ( wire_w_lg_w_dataa_range77w83w & wire_w_lg_w_dataa_range67w73w & wire_w_lg_w_dataa_range57w63w & wire_w_lg_w_dataa_range47w53w & wire_w_lg_w_dataa_range37w43w & wire_w_lg_w_dataa_range27w33w & wire_w_lg_w_dataa_range17w23w & dataa(23));
	exp_a_not_zero_w <= ( wire_w_lg_w_dataa_range77w78w & wire_w_lg_w_dataa_range67w68w & wire_w_lg_w_dataa_range57w58w & wire_w_lg_w_dataa_range47w48w & wire_w_lg_w_dataa_range37w38w & wire_w_lg_w_dataa_range27w28w & wire_w_lg_w_dataa_range17w18w & dataa(23));
	exp_adj_0pads <= (OTHERS => '0');
	exp_adj_dffe21_wi <= (wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w398w OR wire_w397w);
	exp_adj_dffe21_wo <= exp_adj_dffe21;
	exp_adj_dffe23_wi <= exp_adj_dffe21_wo;
	exp_adj_dffe23_wo <= exp_adj_dffe23_wi;
	exp_adj_dffe26_wi <= exp_adj_dffe23_wo;
	exp_adj_dffe26_wo <= exp_adj_dffe26_wi;
	exp_adjust_by_add1 <= "01";
	exp_adjust_by_add2 <= "10";
	exp_adjustment2_add_sub_dataa_w <= exp_value;
	exp_adjustment2_add_sub_datab_w <= exp_adjustment_add_sub_w;
	exp_adjustment2_add_sub_w <= wire_add_sub5_result;
	exp_adjustment_add_sub_dataa_w <= ( priority_encoder_1pads_w & wire_leading_zeroes_cnt_q);
	exp_adjustment_add_sub_datab_w <= ( exp_adj_0pads & exp_adj_dffe26_wo);
	exp_adjustment_add_sub_w <= wire_add_sub4_result;
	exp_all_ones_w <= (OTHERS => '1');
	exp_all_zeros_w <= (OTHERS => '0');
	exp_amb_mux_dffe13_wi <= exp_amb_mux_w;
	exp_amb_mux_dffe13_wo <= exp_amb_mux_dffe13_wi;
	exp_amb_mux_dffe14_wi <= exp_amb_mux_dffe13_wo;
	exp_amb_mux_dffe14_wo <= exp_amb_mux_dffe14_wi;
	exp_amb_mux_dffe15_wi <= exp_amb_mux_dffe14_wo;
	exp_amb_mux_dffe15_wo <= exp_amb_mux_dffe15_wi;
	exp_amb_mux_w <= exp_amb_w(8);
	exp_amb_w <= wire_add_sub1_result;
	exp_b_all_one_w <= ( wire_w_lg_w_datab_range80w85w & wire_w_lg_w_datab_range70w75w & wire_w_lg_w_datab_range60w65w & wire_w_lg_w_datab_range50w55w & wire_w_lg_w_datab_range40w45w & wire_w_lg_w_datab_range30w35w & wire_w_lg_w_datab_range20w25w & datab(23));
	exp_b_not_zero_w <= ( wire_w_lg_w_datab_range80w81w & wire_w_lg_w_datab_range70w71w & wire_w_lg_w_datab_range60w61w & wire_w_lg_w_datab_range50w51w & wire_w_lg_w_datab_range40w41w & wire_w_lg_w_datab_range30w31w & wire_w_lg_w_datab_range20w21w & datab(23));
	exp_bma_w <= wire_add_sub2_result;
	exp_diff_abs_exceed_max_w <= ( wire_w_lg_w_exp_diff_abs_exceed_max_w_range287w289w & wire_w_lg_w_exp_diff_abs_exceed_max_w_range283w286w & exp_diff_abs_w(5));
	exp_diff_abs_max_w <= (OTHERS => '1');
	exp_diff_abs_w <= (wire_w_lg_w_lg_exp_amb_mux_w276w277w OR wire_w_lg_exp_amb_mux_w274w);
	exp_intermediate_res_dffe41_wi <= exp_intermediate_res_dffe42_wo;
	exp_intermediate_res_dffe41_wo <= exp_intermediate_res_dffe41_wi;
	exp_intermediate_res_dffe42_wi <= exp_intermediate_res_w;
	exp_intermediate_res_dffe42_wo <= exp_intermediate_res_dffe42_wi;
	exp_intermediate_res_w <= exp_res_dffe3_wo;
	exp_out_dffe5_wi <= (wire_w_lg_force_nan_w657w OR wire_w_lg_w_lg_force_nan_w644w656w);
	exp_out_dffe5_wo <= exp_out_dffe5;
	exp_res_dffe21_wi <= exp_res_dffe27_wo;
	exp_res_dffe21_wo <= exp_res_dffe21;
	exp_res_dffe22_wi <= exp_res_dffe2_wo;
	exp_res_dffe22_wo <= exp_res_dffe22_wi;
	exp_res_dffe23_wi <= exp_res_dffe21_wo;
	exp_res_dffe23_wo <= exp_res_dffe23_wi;
	exp_res_dffe25_wi <= data_exp_dffe1_wo;
	exp_res_dffe25_wo <= exp_res_dffe25_wi;
	exp_res_dffe26_wi <= exp_res_dffe23_wo;
	exp_res_dffe26_wo <= exp_res_dffe26_wi;
	exp_res_dffe27_wi <= exp_res_dffe22_wo;
	exp_res_dffe27_wo <= exp_res_dffe27_wi;
	exp_res_dffe2_wi <= exp_res_dffe25_wo;
	exp_res_dffe2_wo <= exp_res_dffe2;
	exp_res_dffe32_wi <= wire_w_lg_w_lg_denormal_result_w572w573w;
	exp_res_dffe32_wo <= exp_res_dffe32_wi;
	exp_res_dffe33_wi <= exp_res_dffe32_wo;
	exp_res_dffe33_wo <= exp_res_dffe33_wi;
	exp_res_dffe3_wi <= exp_res_dffe33_wo;
	exp_res_dffe3_wo <= exp_res_dffe3;
	exp_res_dffe4_wi <= exp_rounded_res_w;
	exp_res_dffe4_wo <= exp_res_dffe4;
	exp_res_max_w <= ( wire_w_lg_w_exp_res_max_w_range567w568w & wire_w_lg_w_exp_res_max_w_range565w566w & wire_w_lg_w_exp_res_max_w_range563w564w & wire_w_lg_w_exp_res_max_w_range561w562w & wire_w_lg_w_exp_res_max_w_range559w560w & wire_w_lg_w_exp_res_max_w_range557w558w & wire_w_lg_w_exp_res_max_w_range554w556w & exp_adjustment2_add_sub_w(0));
	exp_res_not_zero_w <= ( wire_w_lg_w_exp_res_not_zero_w_range552w553w & wire_w_lg_w_exp_res_not_zero_w_range549w551w & wire_w_lg_w_exp_res_not_zero_w_range546w548w & wire_w_lg_w_exp_res_not_zero_w_range543w545w & wire_w_lg_w_exp_res_not_zero_w_range540w542w & wire_w_lg_w_exp_res_not_zero_w_range537w539w & wire_w_lg_w_exp_res_not_zero_w_range534w536w & wire_w_lg_w_exp_res_not_zero_w_range530w533w & exp_adjustment2_add_sub_w(0));
	exp_res_rounding_adder_dataa_w <= ( "0" & exp_intermediate_res_dffe41_wo);
	exp_res_rounding_adder_w <= wire_add_sub6_result;
	exp_rounded_res_infinity_w <= exp_rounded_res_max_w(7);
	exp_rounded_res_max_w <= ( wire_w_lg_w_exp_rounded_res_max_w_range634w636w & wire_w_lg_w_exp_rounded_res_max_w_range631w633w & wire_w_lg_w_exp_rounded_res_max_w_range628w630w & wire_w_lg_w_exp_rounded_res_max_w_range625w627w & wire_w_lg_w_exp_rounded_res_max_w_range622w624w & wire_w_lg_w_exp_rounded_res_max_w_range619w621w & wire_w_lg_w_exp_rounded_res_max_w_range615w618w & exp_rounded_res_w(0));
	exp_rounded_res_w <= exp_res_rounding_adder_w(7 DOWNTO 0);
	exp_rounding_adjustment_w <= ( "00000000" & man_res_rounding_add_sub_w(24));
	exp_value <= ( "0" & exp_res_dffe26_wo);
	force_infinity_w <= ((input_is_infinite_dffe4_wo OR rounded_res_infinity_dffe4_wo) OR infinite_res_dffe4_wo);
	force_nan_w <= (infinity_magnitude_sub_dffe4_wo OR input_is_nan_dffe4_wo);
	force_zero_w <= wire_w_lg_man_res_is_not_zero_dffe4_wo641w(0);
	guard_bit_dffe3_wo <= man_res_w3(0);
	infinite_output_sign_dffe1_wi <= (wire_w_lg_w_lg_input_datab_infinite_dffe15_wo339w340w(0) OR wire_w_lg_input_datab_infinite_dffe15_wo338w(0));
	infinite_output_sign_dffe1_wo <= infinite_output_sign_dffe1;
	infinite_output_sign_dffe21_wi <= infinite_output_sign_dffe27_wo;
	infinite_output_sign_dffe21_wo <= infinite_output_sign_dffe21;
	infinite_output_sign_dffe22_wi <= infinite_output_sign_dffe2_wo;
	infinite_output_sign_dffe22_wo <= infinite_output_sign_dffe22_wi;
	infinite_output_sign_dffe23_wi <= infinite_output_sign_dffe21_wo;
	infinite_output_sign_dffe23_wo <= infinite_output_sign_dffe23_wi;
	infinite_output_sign_dffe25_wi <= infinite_output_sign_dffe1_wo;
	infinite_output_sign_dffe25_wo <= infinite_output_sign_dffe25_wi;
	infinite_output_sign_dffe26_wi <= infinite_output_sign_dffe23_wo;
	infinite_output_sign_dffe26_wo <= infinite_output_sign_dffe26_wi;
	infinite_output_sign_dffe27_wi <= infinite_output_sign_dffe22_wo;
	infinite_output_sign_dffe27_wo <= infinite_output_sign_dffe27_wi;
	infinite_output_sign_dffe2_wi <= infinite_output_sign_dffe25_wo;
	infinite_output_sign_dffe2_wo <= infinite_output_sign_dffe2;
	infinite_output_sign_dffe31_wi <= infinite_output_sign_dffe26_wo;
	infinite_output_sign_dffe31_wo <= infinite_output_sign_dffe31;
	infinite_output_sign_dffe32_wi <= infinite_output_sign_dffe31_wo;
	infinite_output_sign_dffe32_wo <= infinite_output_sign_dffe32_wi;
	infinite_output_sign_dffe33_wi <= infinite_output_sign_dffe32_wo;
	infinite_output_sign_dffe33_wo <= infinite_output_sign_dffe33_wi;
	infinite_output_sign_dffe3_wi <= infinite_output_sign_dffe33_wo;
	infinite_output_sign_dffe3_wo <= infinite_output_sign_dffe3;
	infinite_output_sign_dffe41_wi <= infinite_output_sign_dffe42_wo;
	infinite_output_sign_dffe41_wo <= infinite_output_sign_dffe41_wi;
	infinite_output_sign_dffe42_wi <= infinite_output_sign_dffe3_wo;
	infinite_output_sign_dffe42_wo <= infinite_output_sign_dffe42_wi;
	infinite_output_sign_dffe4_wi <= infinite_output_sign_dffe41_wo;
	infinite_output_sign_dffe4_wo <= infinite_output_sign_dffe4;
	infinite_res_dff32_wi <= wire_w_lg_w_exp_res_max_w_range569w575w(0);
	infinite_res_dff32_wo <= infinite_res_dff32_wi;
	infinite_res_dff33_wi <= infinite_res_dff32_wo;
	infinite_res_dff33_wo <= infinite_res_dff33_wi;
	infinite_res_dffe3_wi <= infinite_res_dff33_wo;
	infinite_res_dffe3_wo <= infinite_res_dffe3;
	infinite_res_dffe41_wi <= infinite_res_dffe42_wo;
	infinite_res_dffe41_wo <= infinite_res_dffe41_wi;
	infinite_res_dffe42_wi <= infinite_res_dffe3_wo;
	infinite_res_dffe42_wo <= infinite_res_dffe42_wi;
	infinite_res_dffe4_wi <= infinite_res_dffe41_wo;
	infinite_res_dffe4_wo <= infinite_res_dffe4;
	infinity_magnitude_sub_dffe21_wi <= infinity_magnitude_sub_dffe27_wo;
	infinity_magnitude_sub_dffe21_wo <= infinity_magnitude_sub_dffe21;
	infinity_magnitude_sub_dffe22_wi <= infinity_magnitude_sub_dffe2_wo;
	infinity_magnitude_sub_dffe22_wo <= infinity_magnitude_sub_dffe22_wi;
	infinity_magnitude_sub_dffe23_wi <= infinity_magnitude_sub_dffe21_wo;
	infinity_magnitude_sub_dffe23_wo <= infinity_magnitude_sub_dffe23_wi;
	infinity_magnitude_sub_dffe26_wi <= infinity_magnitude_sub_dffe23_wo;
	infinity_magnitude_sub_dffe26_wo <= infinity_magnitude_sub_dffe26_wi;
	infinity_magnitude_sub_dffe27_wi <= infinity_magnitude_sub_dffe22_wo;
	infinity_magnitude_sub_dffe27_wo <= infinity_magnitude_sub_dffe27_wi;
	infinity_magnitude_sub_dffe2_wi <= (wire_w_lg_add_sub_dffe25_wo505w(0) AND both_inputs_are_infinite_dffe25_wo);
	infinity_magnitude_sub_dffe2_wo <= infinity_magnitude_sub_dffe2;
	infinity_magnitude_sub_dffe31_wi <= infinity_magnitude_sub_dffe26_wo;
	infinity_magnitude_sub_dffe31_wo <= infinity_magnitude_sub_dffe31;
	infinity_magnitude_sub_dffe32_wi <= infinity_magnitude_sub_dffe31_wo;
	infinity_magnitude_sub_dffe32_wo <= infinity_magnitude_sub_dffe32_wi;
	infinity_magnitude_sub_dffe33_wi <= infinity_magnitude_sub_dffe32_wo;
	infinity_magnitude_sub_dffe33_wo <= infinity_magnitude_sub_dffe33_wi;
	infinity_magnitude_sub_dffe3_wi <= infinity_magnitude_sub_dffe33_wo;
	infinity_magnitude_sub_dffe3_wo <= infinity_magnitude_sub_dffe3;
	infinity_magnitude_sub_dffe41_wi <= infinity_magnitude_sub_dffe42_wo;
	infinity_magnitude_sub_dffe41_wo <= infinity_magnitude_sub_dffe41_wi;
	infinity_magnitude_sub_dffe42_wi <= infinity_magnitude_sub_dffe3_wo;
	infinity_magnitude_sub_dffe42_wo <= infinity_magnitude_sub_dffe42_wi;
	infinity_magnitude_sub_dffe4_wi <= infinity_magnitude_sub_dffe41_wo;
	infinity_magnitude_sub_dffe4_wo <= infinity_magnitude_sub_dffe4;
	input_dataa_denormal_dffe11_wi <= input_dataa_denormal_w;
	input_dataa_denormal_dffe11_wo <= input_dataa_denormal_dffe11_wi;
	input_dataa_denormal_w <= ((NOT exp_a_not_zero_w(7)) AND man_a_not_zero_w(22));
	input_dataa_infinite_dffe11_wi <= input_dataa_infinite_w;
	input_dataa_infinite_dffe11_wo <= input_dataa_infinite_dffe11_wi;
	input_dataa_infinite_dffe12_wi <= input_dataa_infinite_dffe11_wo;
	input_dataa_infinite_dffe12_wo <= input_dataa_infinite_dffe12;
	input_dataa_infinite_dffe13_wi <= input_dataa_infinite_dffe12_wo;
	input_dataa_infinite_dffe13_wo <= input_dataa_infinite_dffe13_wi;
	input_dataa_infinite_dffe14_wi <= input_dataa_infinite_dffe13_wo;
	input_dataa_infinite_dffe14_wo <= input_dataa_infinite_dffe14_wi;
	input_dataa_infinite_dffe15_wi <= input_dataa_infinite_dffe14_wo;
	input_dataa_infinite_dffe15_wo <= input_dataa_infinite_dffe15_wi;
	input_dataa_infinite_w <= wire_w_lg_w_exp_a_all_one_w_range84w220w(0);
	input_dataa_nan_dffe11_wi <= input_dataa_nan_w;
	input_dataa_nan_dffe11_wo <= input_dataa_nan_dffe11_wi;
	input_dataa_nan_dffe12_wi <= input_dataa_nan_dffe11_wo;
	input_dataa_nan_dffe12_wo <= input_dataa_nan_dffe12;
	input_dataa_nan_w <= (exp_a_all_one_w(7) AND man_a_not_zero_w(22));
	input_dataa_zero_dffe11_wi <= input_dataa_zero_w;
	input_dataa_zero_dffe11_wo <= input_dataa_zero_dffe11_wi;
	input_dataa_zero_w <= ((NOT exp_a_not_zero_w(7)) AND wire_w_lg_w_man_a_not_zero_w_range215w219w(0));
	input_datab_denormal_dffe11_wi <= input_datab_denormal_w;
	input_datab_denormal_dffe11_wo <= input_datab_denormal_dffe11_wi;
	input_datab_denormal_w <= ((NOT exp_b_not_zero_w(7)) AND man_b_not_zero_w(22));
	input_datab_infinite_dffe11_wi <= input_datab_infinite_w;
	input_datab_infinite_dffe11_wo <= input_datab_infinite_dffe11_wi;
	input_datab_infinite_dffe12_wi <= input_datab_infinite_dffe11_wo;
	input_datab_infinite_dffe12_wo <= input_datab_infinite_dffe12;
	input_datab_infinite_dffe13_wi <= input_datab_infinite_dffe12_wo;
	input_datab_infinite_dffe13_wo <= input_datab_infinite_dffe13_wi;
	input_datab_infinite_dffe14_wi <= input_datab_infinite_dffe13_wo;
	input_datab_infinite_dffe14_wo <= input_datab_infinite_dffe14_wi;
	input_datab_infinite_dffe15_wi <= input_datab_infinite_dffe14_wo;
	input_datab_infinite_dffe15_wo <= input_datab_infinite_dffe15_wi;
	input_datab_infinite_w <= wire_w_lg_w_exp_b_all_one_w_range86w226w(0);
	input_datab_nan_dffe11_wi <= input_datab_nan_w;
	input_datab_nan_dffe11_wo <= input_datab_nan_dffe11_wi;
	input_datab_nan_dffe12_wi <= input_datab_nan_dffe11_wo;
	input_datab_nan_dffe12_wo <= input_datab_nan_dffe12;
	input_datab_nan_w <= (exp_b_all_one_w(7) AND man_b_not_zero_w(22));
	input_datab_zero_dffe11_wi <= input_datab_zero_w;
	input_datab_zero_dffe11_wo <= input_datab_zero_dffe11_wi;
	input_datab_zero_w <= ((NOT exp_b_not_zero_w(7)) AND wire_w_lg_w_man_b_not_zero_w_range218w225w(0));
	input_is_infinite_dffe1_wi <= (input_dataa_infinite_dffe15_wo OR input_datab_infinite_dffe15_wo);
	input_is_infinite_dffe1_wo <= input_is_infinite_dffe1;
	input_is_infinite_dffe21_wi <= input_is_infinite_dffe27_wo;
	input_is_infinite_dffe21_wo <= input_is_infinite_dffe21;
	input_is_infinite_dffe22_wi <= input_is_infinite_dffe2_wo;
	input_is_infinite_dffe22_wo <= input_is_infinite_dffe22_wi;
	input_is_infinite_dffe23_wi <= input_is_infinite_dffe21_wo;
	input_is_infinite_dffe23_wo <= input_is_infinite_dffe23_wi;
	input_is_infinite_dffe25_wi <= input_is_infinite_dffe1_wo;
	input_is_infinite_dffe25_wo <= input_is_infinite_dffe25_wi;
	input_is_infinite_dffe26_wi <= input_is_infinite_dffe23_wo;
	input_is_infinite_dffe26_wo <= input_is_infinite_dffe26_wi;
	input_is_infinite_dffe27_wi <= input_is_infinite_dffe22_wo;
	input_is_infinite_dffe27_wo <= input_is_infinite_dffe27_wi;
	input_is_infinite_dffe2_wi <= input_is_infinite_dffe25_wo;
	input_is_infinite_dffe2_wo <= input_is_infinite_dffe2;
	input_is_infinite_dffe31_wi <= input_is_infinite_dffe26_wo;
	input_is_infinite_dffe31_wo <= input_is_infinite_dffe31;
	input_is_infinite_dffe32_wi <= input_is_infinite_dffe31_wo;
	input_is_infinite_dffe32_wo <= input_is_infinite_dffe32_wi;
	input_is_infinite_dffe33_wi <= input_is_infinite_dffe32_wo;
	input_is_infinite_dffe33_wo <= input_is_infinite_dffe33_wi;
	input_is_infinite_dffe3_wi <= input_is_infinite_dffe33_wo;
	input_is_infinite_dffe3_wo <= input_is_infinite_dffe3;
	input_is_infinite_dffe41_wi <= input_is_infinite_dffe42_wo;
	input_is_infinite_dffe41_wo <= input_is_infinite_dffe41_wi;
	input_is_infinite_dffe42_wi <= input_is_infinite_dffe3_wo;
	input_is_infinite_dffe42_wo <= input_is_infinite_dffe42_wi;
	input_is_infinite_dffe4_wi <= input_is_infinite_dffe41_wo;
	input_is_infinite_dffe4_wo <= input_is_infinite_dffe4;
	input_is_nan_dffe13_wi <= (input_dataa_nan_dffe12_wo OR input_datab_nan_dffe12_wo);
	input_is_nan_dffe13_wo <= input_is_nan_dffe13_wi;
	input_is_nan_dffe14_wi <= input_is_nan_dffe13_wo;
	input_is_nan_dffe14_wo <= input_is_nan_dffe14_wi;
	input_is_nan_dffe15_wi <= input_is_nan_dffe14_wo;
	input_is_nan_dffe15_wo <= input_is_nan_dffe15_wi;
	input_is_nan_dffe1_wi <= input_is_nan_dffe15_wo;
	input_is_nan_dffe1_wo <= input_is_nan_dffe1;
	input_is_nan_dffe21_wi <= input_is_nan_dffe27_wo;
	input_is_nan_dffe21_wo <= input_is_nan_dffe21;
	input_is_nan_dffe22_wi <= input_is_nan_dffe2_wo;
	input_is_nan_dffe22_wo <= input_is_nan_dffe22_wi;
	input_is_nan_dffe23_wi <= input_is_nan_dffe21_wo;
	input_is_nan_dffe23_wo <= input_is_nan_dffe23_wi;
	input_is_nan_dffe25_wi <= input_is_nan_dffe1_wo;
	input_is_nan_dffe25_wo <= input_is_nan_dffe25_wi;
	input_is_nan_dffe26_wi <= input_is_nan_dffe23_wo;
	input_is_nan_dffe26_wo <= input_is_nan_dffe26_wi;
	input_is_nan_dffe27_wi <= input_is_nan_dffe22_wo;
	input_is_nan_dffe27_wo <= input_is_nan_dffe27_wi;
	input_is_nan_dffe2_wi <= input_is_nan_dffe25_wo;
	input_is_nan_dffe2_wo <= input_is_nan_dffe2;
	input_is_nan_dffe31_wi <= input_is_nan_dffe26_wo;
	input_is_nan_dffe31_wo <= input_is_nan_dffe31;
	input_is_nan_dffe32_wi <= input_is_nan_dffe31_wo;
	input_is_nan_dffe32_wo <= input_is_nan_dffe32_wi;
	input_is_nan_dffe33_wi <= input_is_nan_dffe32_wo;
	input_is_nan_dffe33_wo <= input_is_nan_dffe33_wi;
	input_is_nan_dffe3_wi <= input_is_nan_dffe33_wo;
	input_is_nan_dffe3_wo <= input_is_nan_dffe3;
	input_is_nan_dffe41_wi <= input_is_nan_dffe42_wo;
	input_is_nan_dffe41_wo <= input_is_nan_dffe41_wi;
	input_is_nan_dffe42_wi <= input_is_nan_dffe3_wo;
	input_is_nan_dffe42_wo <= input_is_nan_dffe42_wi;
	input_is_nan_dffe4_wi <= input_is_nan_dffe41_wo;
	input_is_nan_dffe4_wo <= input_is_nan_dffe4;
	man_2comp_res_dataa_w <= ( pos_sign_bit_ext & datab_man_dffe1_wo);
	man_2comp_res_datab_w <= ( pos_sign_bit_ext & dataa_man_dffe1_wo);
	man_2comp_res_w <= ( wire_man_2comp_res_lower_w_lg_w_lg_w_lg_cout381w382w383w & wire_man_2comp_res_lower_result);
	man_a_not_zero_w <= ( wire_w_lg_w_dataa_range213w214w & wire_w_lg_w_dataa_range207w208w & wire_w_lg_w_dataa_range201w202w & wire_w_lg_w_dataa_range195w196w & wire_w_lg_w_dataa_range189w190w & wire_w_lg_w_dataa_range183w184w & wire_w_lg_w_dataa_range177w178w & wire_w_lg_w_dataa_range171w172w & wire_w_lg_w_dataa_range165w166w & wire_w_lg_w_dataa_range159w160w & wire_w_lg_w_dataa_range153w154w & wire_w_lg_w_dataa_range147w148w & wire_w_lg_w_dataa_range141w142w & wire_w_lg_w_dataa_range135w136w & wire_w_lg_w_dataa_range129w130w & wire_w_lg_w_dataa_range123w124w & wire_w_lg_w_dataa_range117w118w & wire_w_lg_w_dataa_range111w112w & wire_w_lg_w_dataa_range105w106w & wire_w_lg_w_dataa_range99w100w & wire_w_lg_w_dataa_range93w94w & wire_w_lg_w_dataa_range87w88w & dataa(0));
	man_add_sub_dataa_w <= ( pos_sign_bit_ext & dataa_man_dffe1_wo);
	man_add_sub_datab_w <= ( pos_sign_bit_ext & datab_man_dffe1_wo);
	man_add_sub_res_mag_dffe21_wi <= man_res_mag_w2;
	man_add_sub_res_mag_dffe21_wo <= man_add_sub_res_mag_dffe21;
	man_add_sub_res_mag_dffe23_wi <= man_add_sub_res_mag_dffe21_wo;
	man_add_sub_res_mag_dffe23_wo <= man_add_sub_res_mag_dffe23_wi;
	man_add_sub_res_mag_dffe26_wi <= man_add_sub_res_mag_dffe23_wo;
	man_add_sub_res_mag_dffe26_wo <= man_add_sub_res_mag_dffe26_wi;
	man_add_sub_res_mag_dffe27_wi <= man_add_sub_res_mag_w2;
	man_add_sub_res_mag_dffe27_wo <= man_add_sub_res_mag_dffe27_wi;
	man_add_sub_res_mag_w2 <= (wire_w_lg_w_man_add_sub_w_range386w393w OR wire_w_lg_w_lg_w_man_add_sub_w_range386w389w392w);
	man_add_sub_res_sign_dffe21_wo <= man_add_sub_res_sign_dffe21;
	man_add_sub_res_sign_dffe23_wi <= man_add_sub_res_sign_dffe21_wo;
	man_add_sub_res_sign_dffe23_wo <= man_add_sub_res_sign_dffe23_wi;
	man_add_sub_res_sign_dffe26_wi <= man_add_sub_res_sign_dffe23_wo;
	man_add_sub_res_sign_dffe26_wo <= man_add_sub_res_sign_dffe26_wi;
	man_add_sub_res_sign_dffe27_wi <= man_add_sub_res_sign_w2;
	man_add_sub_res_sign_dffe27_wo <= man_add_sub_res_sign_dffe27_wi;
	man_add_sub_res_sign_w2 <= (wire_w_lg_need_complement_dffe22_wo390w(0) OR (wire_w_lg_need_complement_dffe22_wo387w(0) AND man_add_sub_w(27)));
	man_add_sub_w <= ( wire_man_add_sub_lower_w_lg_w_lg_w_lg_cout368w369w370w & wire_man_add_sub_lower_result);
	man_all_zeros_w <= (OTHERS => '0');
	man_b_not_zero_w <= ( wire_w_lg_w_datab_range216w217w & wire_w_lg_w_datab_range210w211w & wire_w_lg_w_datab_range204w205w & wire_w_lg_w_datab_range198w199w & wire_w_lg_w_datab_range192w193w & wire_w_lg_w_datab_range186w187w & wire_w_lg_w_datab_range180w181w & wire_w_lg_w_datab_range174w175w & wire_w_lg_w_datab_range168w169w & wire_w_lg_w_datab_range162w163w & wire_w_lg_w_datab_range156w157w & wire_w_lg_w_datab_range150w151w & wire_w_lg_w_datab_range144w145w & wire_w_lg_w_datab_range138w139w & wire_w_lg_w_datab_range132w133w & wire_w_lg_w_datab_range126w127w & wire_w_lg_w_datab_range120w121w & wire_w_lg_w_datab_range114w115w & wire_w_lg_w_datab_range108w109w & wire_w_lg_w_datab_range102w103w & wire_w_lg_w_datab_range96w97w & wire_w_lg_w_datab_range90w91w & datab(0));
	man_dffe31_wo <= man_dffe31;
	man_intermediate_res_w <= ( "00" & man_res_w3);
	man_leading_zeros_cnt_w <= man_leading_zeros_dffe31_wo;
	man_leading_zeros_dffe31_wi <= (NOT wire_leading_zeroes_cnt_q);
	man_leading_zeros_dffe31_wo <= man_leading_zeros_dffe31;
	man_nan_w <= "10000000000000000000000";
	man_out_dffe5_wi <= (wire_w_lg_force_nan_w666w OR wire_w_lg_w_lg_force_nan_w644w665w);
	man_out_dffe5_wo <= man_out_dffe5;
	man_res_dffe4_wi <= man_rounded_res_w;
	man_res_dffe4_wo <= man_res_dffe4;
	man_res_is_not_zero_dffe31_wi <= man_res_not_zero_dffe26_wo;
	man_res_is_not_zero_dffe31_wo <= man_res_is_not_zero_dffe31;
	man_res_is_not_zero_dffe32_wi <= man_res_is_not_zero_dffe31_wo;
	man_res_is_not_zero_dffe32_wo <= man_res_is_not_zero_dffe32_wi;
	man_res_is_not_zero_dffe33_wi <= man_res_is_not_zero_dffe32_wo;
	man_res_is_not_zero_dffe33_wo <= man_res_is_not_zero_dffe33_wi;
	man_res_is_not_zero_dffe3_wi <= man_res_is_not_zero_dffe33_wo;
	man_res_is_not_zero_dffe3_wo <= man_res_is_not_zero_dffe3;
	man_res_is_not_zero_dffe41_wi <= man_res_is_not_zero_dffe42_wo;
	man_res_is_not_zero_dffe41_wo <= man_res_is_not_zero_dffe41_wi;
	man_res_is_not_zero_dffe42_wi <= man_res_is_not_zero_dffe3_wo;
	man_res_is_not_zero_dffe42_wo <= man_res_is_not_zero_dffe42_wi;
	man_res_is_not_zero_dffe4_wi <= man_res_is_not_zero_dffe41_wo;
	man_res_is_not_zero_dffe4_wo <= man_res_is_not_zero_dffe4;
	man_res_mag_w2 <= (wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w428w OR wire_w426w);
	man_res_not_zero_dffe23_wi <= man_res_not_zero_w2(24);
	man_res_not_zero_dffe23_wo <= man_res_not_zero_dffe23_wi;
	man_res_not_zero_dffe26_wi <= man_res_not_zero_dffe23_wo;
	man_res_not_zero_dffe26_wo <= man_res_not_zero_dffe26_wi;
	man_res_not_zero_w2 <= ( wire_w_lg_w_man_res_not_zero_w2_range501w503w & wire_w_lg_w_man_res_not_zero_w2_range498w500w & wire_w_lg_w_man_res_not_zero_w2_range495w497w & wire_w_lg_w_man_res_not_zero_w2_range492w494w & wire_w_lg_w_man_res_not_zero_w2_range489w491w & wire_w_lg_w_man_res_not_zero_w2_range486w488w & wire_w_lg_w_man_res_not_zero_w2_range483w485w & wire_w_lg_w_man_res_not_zero_w2_range480w482w & wire_w_lg_w_man_res_not_zero_w2_range477w479w & wire_w_lg_w_man_res_not_zero_w2_range474w476w & wire_w_lg_w_man_res_not_zero_w2_range471w473w & wire_w_lg_w_man_res_not_zero_w2_range468w470w & wire_w_lg_w_man_res_not_zero_w2_range465w467w & wire_w_lg_w_man_res_not_zero_w2_range462w464w & wire_w_lg_w_man_res_not_zero_w2_range459w461w & wire_w_lg_w_man_res_not_zero_w2_range456w458w & wire_w_lg_w_man_res_not_zero_w2_range453w455w & wire_w_lg_w_man_res_not_zero_w2_range450w452w & wire_w_lg_w_man_res_not_zero_w2_range447w449w & wire_w_lg_w_man_res_not_zero_w2_range444w446w & wire_w_lg_w_man_res_not_zero_w2_range441w443w & wire_w_lg_w_man_res_not_zero_w2_range438w440w & wire_w_lg_w_man_res_not_zero_w2_range435w437w & wire_w_lg_w_man_res_not_zero_w2_range431w434w & man_add_sub_res_mag_dffe21_wo(1));
	man_res_rounding_add_sub_datab_w <= ( "0000000000000000000000000" & man_rounding_add_value_w);
	man_res_rounding_add_sub_w <= ( wire_man_res_rounding_add_sub_lower_w_lg_w_lg_w_lg_cout594w595w596w & wire_man_res_rounding_add_sub_lower_result);
	man_res_w3 <= wire_lbarrel_shift_result(25 DOWNTO 2);
	man_rounded_res_w <= (wire_w_lg_w_man_res_rounding_add_sub_w_range599w603w OR wire_w601w);
	man_rounding_add_value_w <= (round_bit_dffe3_wo AND (sticky_bit_dffe3_wo OR guard_bit_dffe3_wo));
	man_smaller_dffe13_wi <= man_smaller_w;
	man_smaller_dffe13_wo <= man_smaller_dffe13_wi;
	man_smaller_w <= (wire_w_lg_exp_amb_mux_w280w OR wire_w_lg_w_lg_exp_amb_mux_w276w279w);
	need_complement_dffe22_wi <= need_complement_dffe2_wo;
	need_complement_dffe22_wo <= need_complement_dffe22_wi;
	need_complement_dffe2_wi <= dataa_sign_dffe25_wo;
	need_complement_dffe2_wo <= need_complement_dffe2;
	pos_sign_bit_ext <= (OTHERS => '0');
	priority_encoder_1pads_w <= (OTHERS => '1');
	result <= ( sign_out_dffe5_wo & exp_out_dffe5_wo & man_out_dffe5_wo);
	round_bit_dffe21_wi <= round_bit_w;
	round_bit_dffe21_wo <= round_bit_dffe21;
	round_bit_dffe23_wi <= round_bit_dffe21_wo;
	round_bit_dffe23_wo <= round_bit_dffe23_wi;
	round_bit_dffe26_wi <= round_bit_dffe23_wo;
	round_bit_dffe26_wo <= round_bit_dffe26_wi;
	round_bit_dffe31_wi <= round_bit_dffe26_wo;
	round_bit_dffe31_wo <= round_bit_dffe31;
	round_bit_dffe32_wi <= round_bit_dffe31_wo;
	round_bit_dffe32_wo <= round_bit_dffe32_wi;
	round_bit_dffe33_wi <= round_bit_dffe32_wo;
	round_bit_dffe33_wo <= round_bit_dffe33_wi;
	round_bit_dffe3_wi <= round_bit_dffe33_wo;
	round_bit_dffe3_wo <= round_bit_dffe3;
	round_bit_w <= ((((wire_w411w(0) AND man_add_sub_res_mag_dffe27_wo(0)) OR ((wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w(0) AND man_add_sub_res_mag_dffe27_wo(25)) AND man_add_sub_res_mag_dffe27_wo(1))) OR (wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w405w(0) AND man_add_sub_res_mag_dffe27_wo(2))) OR ((man_add_sub_res_mag_dffe27_wo(26) AND man_add_sub_res_mag_dffe27_wo(25)) AND man_add_sub_res_mag_dffe27_wo(2)));
	rounded_res_infinity_dffe4_wi <= exp_rounded_res_infinity_w;
	rounded_res_infinity_dffe4_wo <= rounded_res_infinity_dffe4;
	rshift_distance_dffe13_wi <= rshift_distance_w;
	rshift_distance_dffe13_wo <= rshift_distance_dffe13_wi;
	rshift_distance_dffe14_wi <= rshift_distance_dffe13_wo;
	rshift_distance_dffe14_wo <= rshift_distance_dffe14_wi;
	rshift_distance_dffe15_wi <= rshift_distance_dffe14_wo;
	rshift_distance_dffe15_wo <= rshift_distance_dffe15_wi;
	rshift_distance_w <= (wire_w_lg_w_exp_diff_abs_exceed_max_w_range290w294w OR wire_w293w);
	sign_dffe31_wi <= ((man_res_not_zero_dffe26_wo AND man_add_sub_res_sign_dffe26_wo) OR wire_w_lg_w_lg_man_res_not_zero_dffe26_wo517w518w(0));
	sign_dffe31_wo <= sign_dffe31;
	sign_dffe32_wi <= sign_dffe31_wo;
	sign_dffe32_wo <= sign_dffe32_wi;
	sign_dffe33_wi <= sign_dffe32_wo;
	sign_dffe33_wo <= sign_dffe33_wi;
	sign_out_dffe5_wi <= (wire_w_lg_force_nan_w644w(0) AND ((force_infinity_w AND infinite_output_sign_dffe4_wo) OR wire_w_lg_w_lg_force_infinity_w643w668w(0)));
	sign_out_dffe5_wo <= sign_out_dffe5;
	sign_res_dffe3_wi <= sign_dffe33_wo;
	sign_res_dffe3_wo <= sign_res_dffe3;
	sign_res_dffe41_wi <= sign_res_dffe42_wo;
	sign_res_dffe41_wo <= sign_res_dffe41_wi;
	sign_res_dffe42_wi <= sign_res_dffe3_wo;
	sign_res_dffe42_wo <= sign_res_dffe42_wi;
	sign_res_dffe4_wi <= sign_res_dffe41_wo;
	sign_res_dffe4_wo <= sign_res_dffe4;
	sticky_bit_cnt_dataa_w <= ( "0" & rshift_distance_dffe15_wo);
	sticky_bit_cnt_datab_w <= ( "0" & wire_trailing_zeros_cnt_q);
	sticky_bit_cnt_res_w <= wire_add_sub3_result;
	sticky_bit_dffe1_wi <= wire_trailing_zeros_limit_comparator_agb;
	sticky_bit_dffe1_wo <= sticky_bit_dffe1;
	sticky_bit_dffe21_wi <= sticky_bit_w;
	sticky_bit_dffe21_wo <= sticky_bit_dffe21;
	sticky_bit_dffe22_wi <= sticky_bit_dffe2_wo;
	sticky_bit_dffe22_wo <= sticky_bit_dffe22_wi;
	sticky_bit_dffe23_wi <= sticky_bit_dffe21_wo;
	sticky_bit_dffe23_wo <= sticky_bit_dffe23_wi;
	sticky_bit_dffe25_wi <= sticky_bit_dffe1_wo;
	sticky_bit_dffe25_wo <= sticky_bit_dffe25_wi;
	sticky_bit_dffe26_wi <= sticky_bit_dffe23_wo;
	sticky_bit_dffe26_wo <= sticky_bit_dffe26_wi;
	sticky_bit_dffe27_wi <= sticky_bit_dffe22_wo;
	sticky_bit_dffe27_wo <= sticky_bit_dffe27_wi;
	sticky_bit_dffe2_wi <= sticky_bit_dffe25_wo;
	sticky_bit_dffe2_wo <= sticky_bit_dffe2;
	sticky_bit_dffe31_wi <= sticky_bit_dffe26_wo;
	sticky_bit_dffe31_wo <= sticky_bit_dffe31;
	sticky_bit_dffe32_wi <= sticky_bit_dffe31_wo;
	sticky_bit_dffe32_wo <= sticky_bit_dffe32_wi;
	sticky_bit_dffe33_wi <= sticky_bit_dffe32_wo;
	sticky_bit_dffe33_wo <= sticky_bit_dffe33_wi;
	sticky_bit_dffe3_wi <= sticky_bit_dffe33_wo;
	sticky_bit_dffe3_wo <= sticky_bit_dffe3;
	sticky_bit_w <= (((wire_w_lg_w411w421w(0) OR ((wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w396w(0) AND man_add_sub_res_mag_dffe27_wo(25)) AND wire_w_lg_sticky_bit_dffe27_wo416w(0))) OR (wire_w_lg_w_man_add_sub_res_mag_dffe27_wo_range395w405w(0) AND (wire_w_lg_sticky_bit_dffe27_wo416w(0) OR man_add_sub_res_mag_dffe27_wo(1)))) OR ((man_add_sub_res_mag_dffe27_wo(26) AND man_add_sub_res_mag_dffe27_wo(25)) AND (wire_w_lg_sticky_bit_dffe27_wo416w(0) OR man_add_sub_res_mag_dffe27_wo(1))));
	trailing_zeros_limit_w <= "000010";
	zero_man_sign_dffe21_wi <= zero_man_sign_dffe27_wo;
	zero_man_sign_dffe21_wo <= zero_man_sign_dffe21;
	zero_man_sign_dffe22_wi <= zero_man_sign_dffe2_wo;
	zero_man_sign_dffe22_wo <= zero_man_sign_dffe22_wi;
	zero_man_sign_dffe23_wi <= zero_man_sign_dffe21_wo;
	zero_man_sign_dffe23_wo <= zero_man_sign_dffe23_wi;
	zero_man_sign_dffe26_wi <= zero_man_sign_dffe23_wo;
	zero_man_sign_dffe26_wo <= zero_man_sign_dffe26_wi;
	zero_man_sign_dffe27_wi <= zero_man_sign_dffe22_wo;
	zero_man_sign_dffe27_wo <= zero_man_sign_dffe27_wi;
	zero_man_sign_dffe2_wi <= (dataa_sign_dffe25_wo AND add_sub_dffe25_wo);
	zero_man_sign_dffe2_wo <= zero_man_sign_dffe2;
	wire_w_aligned_dataa_exp_dffe15_wo_range315w <= aligned_dataa_exp_dffe15_wo(7 DOWNTO 0);
	wire_w_aligned_datab_exp_dffe15_wo_range313w <= aligned_datab_exp_dffe15_wo(7 DOWNTO 0);
	wire_w_dataa_range141w(0) <= dataa(10);
	wire_w_dataa_range147w(0) <= dataa(11);
	wire_w_dataa_range153w(0) <= dataa(12);
	wire_w_dataa_range159w(0) <= dataa(13);
	wire_w_dataa_range165w(0) <= dataa(14);
	wire_w_dataa_range171w(0) <= dataa(15);
	wire_w_dataa_range177w(0) <= dataa(16);
	wire_w_dataa_range183w(0) <= dataa(17);
	wire_w_dataa_range189w(0) <= dataa(18);
	wire_w_dataa_range195w(0) <= dataa(19);
	wire_w_dataa_range87w(0) <= dataa(1);
	wire_w_dataa_range201w(0) <= dataa(20);
	wire_w_dataa_range207w(0) <= dataa(21);
	wire_w_dataa_range213w(0) <= dataa(22);
	wire_w_dataa_range17w(0) <= dataa(24);
	wire_w_dataa_range27w(0) <= dataa(25);
	wire_w_dataa_range37w(0) <= dataa(26);
	wire_w_dataa_range47w(0) <= dataa(27);
	wire_w_dataa_range57w(0) <= dataa(28);
	wire_w_dataa_range67w(0) <= dataa(29);
	wire_w_dataa_range93w(0) <= dataa(2);
	wire_w_dataa_range77w(0) <= dataa(30);
	wire_w_dataa_range99w(0) <= dataa(3);
	wire_w_dataa_range105w(0) <= dataa(4);
	wire_w_dataa_range111w(0) <= dataa(5);
	wire_w_dataa_range117w(0) <= dataa(6);
	wire_w_dataa_range123w(0) <= dataa(7);
	wire_w_dataa_range129w(0) <= dataa(8);
	wire_w_dataa_range135w(0) <= dataa(9);
	wire_w_dataa_dffe11_wo_range242w <= dataa_dffe11_wo(22 DOWNTO 0);
	wire_w_dataa_dffe11_wo_range232w <= dataa_dffe11_wo(30 DOWNTO 23);
	wire_w_datab_range144w(0) <= datab(10);
	wire_w_datab_range150w(0) <= datab(11);
	wire_w_datab_range156w(0) <= datab(12);
	wire_w_datab_range162w(0) <= datab(13);
	wire_w_datab_range168w(0) <= datab(14);
	wire_w_datab_range174w(0) <= datab(15);
	wire_w_datab_range180w(0) <= datab(16);
	wire_w_datab_range186w(0) <= datab(17);
	wire_w_datab_range192w(0) <= datab(18);
	wire_w_datab_range198w(0) <= datab(19);
	wire_w_datab_range90w(0) <= datab(1);
	wire_w_datab_range204w(0) <= datab(20);
	wire_w_datab_range210w(0) <= datab(21);
	wire_w_datab_range216w(0) <= datab(22);
	wire_w_datab_range20w(0) <= datab(24);
	wire_w_datab_range30w(0) <= datab(25);
	wire_w_datab_range40w(0) <= datab(26);
	wire_w_datab_range50w(0) <= datab(27);
	wire_w_datab_range60w(0) <= datab(28);
	wire_w_datab_range70w(0) <= datab(29);
	wire_w_datab_range96w(0) <= datab(2);
	wire_w_datab_range80w(0) <= datab(30);
	wire_w_datab_range102w(0) <= datab(3);
	wire_w_datab_range108w(0) <= datab(4);
	wire_w_datab_range114w(0) <= datab(5);
	wire_w_datab_range120w(0) <= datab(6);
	wire_w_datab_range126w(0) <= datab(7);
	wire_w_datab_range132w(0) <= datab(8);
	wire_w_datab_range138w(0) <= datab(9);
	wire_w_datab_dffe11_wo_range261w <= datab_dffe11_wo(22 DOWNTO 0);
	wire_w_datab_dffe11_wo_range251w <= datab_dffe11_wo(30 DOWNTO 23);
	wire_w_exp_a_all_one_w_range7w(0) <= exp_a_all_one_w(0);
	wire_w_exp_a_all_one_w_range24w(0) <= exp_a_all_one_w(1);
	wire_w_exp_a_all_one_w_range34w(0) <= exp_a_all_one_w(2);
	wire_w_exp_a_all_one_w_range44w(0) <= exp_a_all_one_w(3);
	wire_w_exp_a_all_one_w_range54w(0) <= exp_a_all_one_w(4);
	wire_w_exp_a_all_one_w_range64w(0) <= exp_a_all_one_w(5);
	wire_w_exp_a_all_one_w_range74w(0) <= exp_a_all_one_w(6);
	wire_w_exp_a_all_one_w_range84w(0) <= exp_a_all_one_w(7);
	wire_w_exp_a_not_zero_w_range2w(0) <= exp_a_not_zero_w(0);
	wire_w_exp_a_not_zero_w_range19w(0) <= exp_a_not_zero_w(1);
	wire_w_exp_a_not_zero_w_range29w(0) <= exp_a_not_zero_w(2);
	wire_w_exp_a_not_zero_w_range39w(0) <= exp_a_not_zero_w(3);
	wire_w_exp_a_not_zero_w_range49w(0) <= exp_a_not_zero_w(4);
	wire_w_exp_a_not_zero_w_range59w(0) <= exp_a_not_zero_w(5);
	wire_w_exp_a_not_zero_w_range69w(0) <= exp_a_not_zero_w(6);
	wire_w_exp_adjustment2_add_sub_w_range532w(0) <= exp_adjustment2_add_sub_w(1);
	wire_w_exp_adjustment2_add_sub_w_range535w(0) <= exp_adjustment2_add_sub_w(2);
	wire_w_exp_adjustment2_add_sub_w_range538w(0) <= exp_adjustment2_add_sub_w(3);
	wire_w_exp_adjustment2_add_sub_w_range541w(0) <= exp_adjustment2_add_sub_w(4);
	wire_w_exp_adjustment2_add_sub_w_range544w(0) <= exp_adjustment2_add_sub_w(5);
	wire_w_exp_adjustment2_add_sub_w_range547w(0) <= exp_adjustment2_add_sub_w(6);
	wire_w_exp_adjustment2_add_sub_w_range571w <= exp_adjustment2_add_sub_w(7 DOWNTO 0);
	wire_w_exp_adjustment2_add_sub_w_range550w(0) <= exp_adjustment2_add_sub_w(7);
	wire_w_exp_adjustment2_add_sub_w_range525w(0) <= exp_adjustment2_add_sub_w(8);
	wire_w_exp_amb_w_range275w <= exp_amb_w(7 DOWNTO 0);
	wire_w_exp_b_all_one_w_range9w(0) <= exp_b_all_one_w(0);
	wire_w_exp_b_all_one_w_range26w(0) <= exp_b_all_one_w(1);
	wire_w_exp_b_all_one_w_range36w(0) <= exp_b_all_one_w(2);
	wire_w_exp_b_all_one_w_range46w(0) <= exp_b_all_one_w(3);
	wire_w_exp_b_all_one_w_range56w(0) <= exp_b_all_one_w(4);
	wire_w_exp_b_all_one_w_range66w(0) <= exp_b_all_one_w(5);
	wire_w_exp_b_all_one_w_range76w(0) <= exp_b_all_one_w(6);
	wire_w_exp_b_all_one_w_range86w(0) <= exp_b_all_one_w(7);
	wire_w_exp_b_not_zero_w_range5w(0) <= exp_b_not_zero_w(0);
	wire_w_exp_b_not_zero_w_range22w(0) <= exp_b_not_zero_w(1);
	wire_w_exp_b_not_zero_w_range32w(0) <= exp_b_not_zero_w(2);
	wire_w_exp_b_not_zero_w_range42w(0) <= exp_b_not_zero_w(3);
	wire_w_exp_b_not_zero_w_range52w(0) <= exp_b_not_zero_w(4);
	wire_w_exp_b_not_zero_w_range62w(0) <= exp_b_not_zero_w(5);
	wire_w_exp_b_not_zero_w_range72w(0) <= exp_b_not_zero_w(6);
	wire_w_exp_bma_w_range273w <= exp_bma_w(7 DOWNTO 0);
	wire_w_exp_diff_abs_exceed_max_w_range283w(0) <= exp_diff_abs_exceed_max_w(0);
	wire_w_exp_diff_abs_exceed_max_w_range287w(0) <= exp_diff_abs_exceed_max_w(1);
	wire_w_exp_diff_abs_exceed_max_w_range290w(0) <= exp_diff_abs_exceed_max_w(2);
	wire_w_exp_diff_abs_w_range291w <= exp_diff_abs_w(4 DOWNTO 0);
	wire_w_exp_diff_abs_w_range285w(0) <= exp_diff_abs_w(6);
	wire_w_exp_diff_abs_w_range288w(0) <= exp_diff_abs_w(7);
	wire_w_exp_res_max_w_range554w(0) <= exp_res_max_w(0);
	wire_w_exp_res_max_w_range557w(0) <= exp_res_max_w(1);
	wire_w_exp_res_max_w_range559w(0) <= exp_res_max_w(2);
	wire_w_exp_res_max_w_range561w(0) <= exp_res_max_w(3);
	wire_w_exp_res_max_w_range563w(0) <= exp_res_max_w(4);
	wire_w_exp_res_max_w_range565w(0) <= exp_res_max_w(5);
	wire_w_exp_res_max_w_range567w(0) <= exp_res_max_w(6);
	wire_w_exp_res_max_w_range569w(0) <= exp_res_max_w(7);
	wire_w_exp_res_not_zero_w_range530w(0) <= exp_res_not_zero_w(0);
	wire_w_exp_res_not_zero_w_range534w(0) <= exp_res_not_zero_w(1);
	wire_w_exp_res_not_zero_w_range537w(0) <= exp_res_not_zero_w(2);
	wire_w_exp_res_not_zero_w_range540w(0) <= exp_res_not_zero_w(3);
	wire_w_exp_res_not_zero_w_range543w(0) <= exp_res_not_zero_w(4);
	wire_w_exp_res_not_zero_w_range546w(0) <= exp_res_not_zero_w(5);
	wire_w_exp_res_not_zero_w_range549w(0) <= exp_res_not_zero_w(6);
	wire_w_exp_res_not_zero_w_range552w(0) <= exp_res_not_zero_w(7);
	wire_w_exp_rounded_res_max_w_range615w(0) <= exp_rounded_res_max_w(0);
	wire_w_exp_rounded_res_max_w_range619w(0) <= exp_rounded_res_max_w(1);
	wire_w_exp_rounded_res_max_w_range622w(0) <= exp_rounded_res_max_w(2);
	wire_w_exp_rounded_res_max_w_range625w(0) <= exp_rounded_res_max_w(3);
	wire_w_exp_rounded_res_max_w_range628w(0) <= exp_rounded_res_max_w(4);
	wire_w_exp_rounded_res_max_w_range631w(0) <= exp_rounded_res_max_w(5);
	wire_w_exp_rounded_res_max_w_range634w(0) <= exp_rounded_res_max_w(6);
	wire_w_exp_rounded_res_w_range617w(0) <= exp_rounded_res_w(1);
	wire_w_exp_rounded_res_w_range620w(0) <= exp_rounded_res_w(2);
	wire_w_exp_rounded_res_w_range623w(0) <= exp_rounded_res_w(3);
	wire_w_exp_rounded_res_w_range626w(0) <= exp_rounded_res_w(4);
	wire_w_exp_rounded_res_w_range629w(0) <= exp_rounded_res_w(5);
	wire_w_exp_rounded_res_w_range632w(0) <= exp_rounded_res_w(6);
	wire_w_exp_rounded_res_w_range635w(0) <= exp_rounded_res_w(7);
	wire_w_man_a_not_zero_w_range12w(0) <= man_a_not_zero_w(0);
	wire_w_man_a_not_zero_w_range143w(0) <= man_a_not_zero_w(10);
	wire_w_man_a_not_zero_w_range149w(0) <= man_a_not_zero_w(11);
	wire_w_man_a_not_zero_w_range155w(0) <= man_a_not_zero_w(12);
	wire_w_man_a_not_zero_w_range161w(0) <= man_a_not_zero_w(13);
	wire_w_man_a_not_zero_w_range167w(0) <= man_a_not_zero_w(14);
	wire_w_man_a_not_zero_w_range173w(0) <= man_a_not_zero_w(15);
	wire_w_man_a_not_zero_w_range179w(0) <= man_a_not_zero_w(16);
	wire_w_man_a_not_zero_w_range185w(0) <= man_a_not_zero_w(17);
	wire_w_man_a_not_zero_w_range191w(0) <= man_a_not_zero_w(18);
	wire_w_man_a_not_zero_w_range197w(0) <= man_a_not_zero_w(19);
	wire_w_man_a_not_zero_w_range89w(0) <= man_a_not_zero_w(1);
	wire_w_man_a_not_zero_w_range203w(0) <= man_a_not_zero_w(20);
	wire_w_man_a_not_zero_w_range209w(0) <= man_a_not_zero_w(21);
	wire_w_man_a_not_zero_w_range215w(0) <= man_a_not_zero_w(22);
	wire_w_man_a_not_zero_w_range95w(0) <= man_a_not_zero_w(2);
	wire_w_man_a_not_zero_w_range101w(0) <= man_a_not_zero_w(3);
	wire_w_man_a_not_zero_w_range107w(0) <= man_a_not_zero_w(4);
	wire_w_man_a_not_zero_w_range113w(0) <= man_a_not_zero_w(5);
	wire_w_man_a_not_zero_w_range119w(0) <= man_a_not_zero_w(6);
	wire_w_man_a_not_zero_w_range125w(0) <= man_a_not_zero_w(7);
	wire_w_man_a_not_zero_w_range131w(0) <= man_a_not_zero_w(8);
	wire_w_man_a_not_zero_w_range137w(0) <= man_a_not_zero_w(9);
	wire_w_man_add_sub_res_mag_dffe21_wo_range457w(0) <= man_add_sub_res_mag_dffe21_wo(10);
	wire_w_man_add_sub_res_mag_dffe21_wo_range460w(0) <= man_add_sub_res_mag_dffe21_wo(11);
	wire_w_man_add_sub_res_mag_dffe21_wo_range463w(0) <= man_add_sub_res_mag_dffe21_wo(12);
	wire_w_man_add_sub_res_mag_dffe21_wo_range466w(0) <= man_add_sub_res_mag_dffe21_wo(13);
	wire_w_man_add_sub_res_mag_dffe21_wo_range469w(0) <= man_add_sub_res_mag_dffe21_wo(14);
	wire_w_man_add_sub_res_mag_dffe21_wo_range472w(0) <= man_add_sub_res_mag_dffe21_wo(15);
	wire_w_man_add_sub_res_mag_dffe21_wo_range475w(0) <= man_add_sub_res_mag_dffe21_wo(16);
	wire_w_man_add_sub_res_mag_dffe21_wo_range478w(0) <= man_add_sub_res_mag_dffe21_wo(17);
	wire_w_man_add_sub_res_mag_dffe21_wo_range481w(0) <= man_add_sub_res_mag_dffe21_wo(18);
	wire_w_man_add_sub_res_mag_dffe21_wo_range484w(0) <= man_add_sub_res_mag_dffe21_wo(19);
	wire_w_man_add_sub_res_mag_dffe21_wo_range487w(0) <= man_add_sub_res_mag_dffe21_wo(20);
	wire_w_man_add_sub_res_mag_dffe21_wo_range490w(0) <= man_add_sub_res_mag_dffe21_wo(21);
	wire_w_man_add_sub_res_mag_dffe21_wo_range493w(0) <= man_add_sub_res_mag_dffe21_wo(22);
	wire_w_man_add_sub_res_mag_dffe21_wo_range496w(0) <= man_add_sub_res_mag_dffe21_wo(23);
	wire_w_man_add_sub_res_mag_dffe21_wo_range499w(0) <= man_add_sub_res_mag_dffe21_wo(24);
	wire_w_man_add_sub_res_mag_dffe21_wo_range502w(0) <= man_add_sub_res_mag_dffe21_wo(25);
	wire_w_man_add_sub_res_mag_dffe21_wo_range433w(0) <= man_add_sub_res_mag_dffe21_wo(2);
	wire_w_man_add_sub_res_mag_dffe21_wo_range436w(0) <= man_add_sub_res_mag_dffe21_wo(3);
	wire_w_man_add_sub_res_mag_dffe21_wo_range439w(0) <= man_add_sub_res_mag_dffe21_wo(4);
	wire_w_man_add_sub_res_mag_dffe21_wo_range442w(0) <= man_add_sub_res_mag_dffe21_wo(5);
	wire_w_man_add_sub_res_mag_dffe21_wo_range445w(0) <= man_add_sub_res_mag_dffe21_wo(6);
	wire_w_man_add_sub_res_mag_dffe21_wo_range448w(0) <= man_add_sub_res_mag_dffe21_wo(7);
	wire_w_man_add_sub_res_mag_dffe21_wo_range451w(0) <= man_add_sub_res_mag_dffe21_wo(8);
	wire_w_man_add_sub_res_mag_dffe21_wo_range454w(0) <= man_add_sub_res_mag_dffe21_wo(9);
	wire_w_man_add_sub_res_mag_dffe27_wo_range410w(0) <= man_add_sub_res_mag_dffe27_wo(0);
	wire_w_man_add_sub_res_mag_dffe27_wo_range425w <= man_add_sub_res_mag_dffe27_wo(25 DOWNTO 0);
	wire_w_man_add_sub_res_mag_dffe27_wo_range401w(0) <= man_add_sub_res_mag_dffe27_wo(25);
	wire_w_man_add_sub_res_mag_dffe27_wo_range427w <= man_add_sub_res_mag_dffe27_wo(26 DOWNTO 1);
	wire_w_man_add_sub_res_mag_dffe27_wo_range395w(0) <= man_add_sub_res_mag_dffe27_wo(26);
	wire_w_man_add_sub_w_range386w(0) <= man_add_sub_w(27);
	wire_w_man_b_not_zero_w_range15w(0) <= man_b_not_zero_w(0);
	wire_w_man_b_not_zero_w_range146w(0) <= man_b_not_zero_w(10);
	wire_w_man_b_not_zero_w_range152w(0) <= man_b_not_zero_w(11);
	wire_w_man_b_not_zero_w_range158w(0) <= man_b_not_zero_w(12);
	wire_w_man_b_not_zero_w_range164w(0) <= man_b_not_zero_w(13);
	wire_w_man_b_not_zero_w_range170w(0) <= man_b_not_zero_w(14);
	wire_w_man_b_not_zero_w_range176w(0) <= man_b_not_zero_w(15);
	wire_w_man_b_not_zero_w_range182w(0) <= man_b_not_zero_w(16);
	wire_w_man_b_not_zero_w_range188w(0) <= man_b_not_zero_w(17);
	wire_w_man_b_not_zero_w_range194w(0) <= man_b_not_zero_w(18);
	wire_w_man_b_not_zero_w_range200w(0) <= man_b_not_zero_w(19);
	wire_w_man_b_not_zero_w_range92w(0) <= man_b_not_zero_w(1);
	wire_w_man_b_not_zero_w_range206w(0) <= man_b_not_zero_w(20);
	wire_w_man_b_not_zero_w_range212w(0) <= man_b_not_zero_w(21);
	wire_w_man_b_not_zero_w_range218w(0) <= man_b_not_zero_w(22);
	wire_w_man_b_not_zero_w_range98w(0) <= man_b_not_zero_w(2);
	wire_w_man_b_not_zero_w_range104w(0) <= man_b_not_zero_w(3);
	wire_w_man_b_not_zero_w_range110w(0) <= man_b_not_zero_w(4);
	wire_w_man_b_not_zero_w_range116w(0) <= man_b_not_zero_w(5);
	wire_w_man_b_not_zero_w_range122w(0) <= man_b_not_zero_w(6);
	wire_w_man_b_not_zero_w_range128w(0) <= man_b_not_zero_w(7);
	wire_w_man_b_not_zero_w_range134w(0) <= man_b_not_zero_w(8);
	wire_w_man_b_not_zero_w_range140w(0) <= man_b_not_zero_w(9);
	wire_w_man_res_not_zero_w2_range431w(0) <= man_res_not_zero_w2(0);
	wire_w_man_res_not_zero_w2_range462w(0) <= man_res_not_zero_w2(10);
	wire_w_man_res_not_zero_w2_range465w(0) <= man_res_not_zero_w2(11);
	wire_w_man_res_not_zero_w2_range468w(0) <= man_res_not_zero_w2(12);
	wire_w_man_res_not_zero_w2_range471w(0) <= man_res_not_zero_w2(13);
	wire_w_man_res_not_zero_w2_range474w(0) <= man_res_not_zero_w2(14);
	wire_w_man_res_not_zero_w2_range477w(0) <= man_res_not_zero_w2(15);
	wire_w_man_res_not_zero_w2_range480w(0) <= man_res_not_zero_w2(16);
	wire_w_man_res_not_zero_w2_range483w(0) <= man_res_not_zero_w2(17);
	wire_w_man_res_not_zero_w2_range486w(0) <= man_res_not_zero_w2(18);
	wire_w_man_res_not_zero_w2_range489w(0) <= man_res_not_zero_w2(19);
	wire_w_man_res_not_zero_w2_range435w(0) <= man_res_not_zero_w2(1);
	wire_w_man_res_not_zero_w2_range492w(0) <= man_res_not_zero_w2(20);
	wire_w_man_res_not_zero_w2_range495w(0) <= man_res_not_zero_w2(21);
	wire_w_man_res_not_zero_w2_range498w(0) <= man_res_not_zero_w2(22);
	wire_w_man_res_not_zero_w2_range501w(0) <= man_res_not_zero_w2(23);
	wire_w_man_res_not_zero_w2_range438w(0) <= man_res_not_zero_w2(2);
	wire_w_man_res_not_zero_w2_range441w(0) <= man_res_not_zero_w2(3);
	wire_w_man_res_not_zero_w2_range444w(0) <= man_res_not_zero_w2(4);
	wire_w_man_res_not_zero_w2_range447w(0) <= man_res_not_zero_w2(5);
	wire_w_man_res_not_zero_w2_range450w(0) <= man_res_not_zero_w2(6);
	wire_w_man_res_not_zero_w2_range453w(0) <= man_res_not_zero_w2(7);
	wire_w_man_res_not_zero_w2_range456w(0) <= man_res_not_zero_w2(8);
	wire_w_man_res_not_zero_w2_range459w(0) <= man_res_not_zero_w2(9);
	wire_w_man_res_rounding_add_sub_w_range598w <= man_res_rounding_add_sub_w(22 DOWNTO 0);
	wire_w_man_res_rounding_add_sub_w_range602w <= man_res_rounding_add_sub_w(23 DOWNTO 1);
	wire_w_man_res_rounding_add_sub_w_range599w(0) <= man_res_rounding_add_sub_w(24);
	lbarrel_shift :  cpu_fpoint_addsub_single_altbarrel_shift_0ig
	  PORT MAP ( 
		aclr => aclr,
		clk_en => clk_en,
		clock => clock,
		data => man_dffe31_wo,
		distance => man_leading_zeros_cnt_w,
		result => wire_lbarrel_shift_result
	  );
	wire_rbarrel_shift_data <= ( man_smaller_dffe13_wo & "00");
	rbarrel_shift :  cpu_fpoint_addsub_single_altbarrel_shift_l2e
	  PORT MAP ( 
		data => wire_rbarrel_shift_data,
		distance => rshift_distance_dffe13_wo,
		result => wire_rbarrel_shift_result
	  );
	wire_leading_zeroes_cnt_data <= ( man_add_sub_res_mag_dffe21_wo(25 DOWNTO 1) & "1" & "000000");
	leading_zeroes_cnt :  cpu_fpoint_addsub_single_altpriority_encoder_9u8
	  PORT MAP ( 
		data => wire_leading_zeroes_cnt_data,
		q => wire_leading_zeroes_cnt_q
	  );
	wire_trailing_zeros_cnt_data <= ( "111111111" & man_smaller_dffe13_wo(22 DOWNTO 0));
	trailing_zeros_cnt :  cpu_fpoint_addsub_single_altpriority_encoder_tma
	  PORT MAP ( 
		data => wire_trailing_zeros_cnt_data,
		q => wire_trailing_zeros_cnt_q
	  );
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN add_sub_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN add_sub_dffe1 <= add_sub_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN add_sub_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN add_sub_dffe12 <= add_sub_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN aligned_dataa_exp_dffe12 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN aligned_dataa_exp_dffe12 <= aligned_dataa_exp_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN aligned_dataa_man_dffe12 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN aligned_dataa_man_dffe12 <= aligned_dataa_man_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN aligned_dataa_sign_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN aligned_dataa_sign_dffe12 <= aligned_dataa_sign_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN aligned_datab_exp_dffe12 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN aligned_datab_exp_dffe12 <= aligned_datab_exp_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN aligned_datab_man_dffe12 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN aligned_datab_man_dffe12 <= aligned_datab_man_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN aligned_datab_sign_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN aligned_datab_sign_dffe12 <= aligned_datab_sign_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN both_inputs_are_infinite_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN both_inputs_are_infinite_dffe1 <= both_inputs_are_infinite_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN data_exp_dffe1 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN data_exp_dffe1 <= data_exp_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataa_man_dffe1 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dataa_man_dffe1 <= dataa_man_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN dataa_sign_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN dataa_sign_dffe1 <= dataa_sign_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN datab_man_dffe1 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN datab_man_dffe1 <= datab_man_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN datab_sign_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN datab_sign_dffe1 <= datab_sign_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN denormal_res_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN denormal_res_dffe3 <= denormal_res_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN denormal_res_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN denormal_res_dffe4 <= denormal_res_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_adj_dffe21 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_adj_dffe21 <= exp_adj_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_out_dffe5 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_out_dffe5 <= exp_out_dffe5_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_res_dffe2 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_res_dffe2 <= exp_res_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_res_dffe21 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_res_dffe21 <= exp_res_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_res_dffe3 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_res_dffe3 <= exp_res_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_res_dffe4 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_res_dffe4 <= exp_res_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_output_sign_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_output_sign_dffe1 <= infinite_output_sign_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_output_sign_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_output_sign_dffe2 <= infinite_output_sign_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_output_sign_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_output_sign_dffe21 <= infinite_output_sign_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_output_sign_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_output_sign_dffe3 <= infinite_output_sign_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_output_sign_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_output_sign_dffe31 <= infinite_output_sign_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_output_sign_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_output_sign_dffe4 <= infinite_output_sign_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_res_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_res_dffe3 <= infinite_res_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinite_res_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinite_res_dffe4 <= infinite_res_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinity_magnitude_sub_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinity_magnitude_sub_dffe2 <= infinity_magnitude_sub_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinity_magnitude_sub_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinity_magnitude_sub_dffe21 <= infinity_magnitude_sub_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinity_magnitude_sub_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinity_magnitude_sub_dffe3 <= infinity_magnitude_sub_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinity_magnitude_sub_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinity_magnitude_sub_dffe31 <= infinity_magnitude_sub_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN infinity_magnitude_sub_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN infinity_magnitude_sub_dffe4 <= infinity_magnitude_sub_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_dataa_infinite_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_dataa_infinite_dffe12 <= input_dataa_infinite_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_dataa_nan_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_dataa_nan_dffe12 <= input_dataa_nan_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_datab_infinite_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_datab_infinite_dffe12 <= input_datab_infinite_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_datab_nan_dffe12 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_datab_nan_dffe12 <= input_datab_nan_dffe12_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinite_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinite_dffe1 <= input_is_infinite_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinite_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinite_dffe2 <= input_is_infinite_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinite_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinite_dffe21 <= input_is_infinite_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinite_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinite_dffe3 <= input_is_infinite_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinite_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinite_dffe31 <= input_is_infinite_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_infinite_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_infinite_dffe4 <= input_is_infinite_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe1 <= input_is_nan_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe2 <= input_is_nan_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe21 <= input_is_nan_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe3 <= input_is_nan_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe31 <= input_is_nan_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN input_is_nan_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN input_is_nan_dffe4 <= input_is_nan_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_add_sub_res_mag_dffe21 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_add_sub_res_mag_dffe21 <= man_add_sub_res_mag_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_add_sub_res_sign_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_add_sub_res_sign_dffe21 <= man_add_sub_res_sign_dffe27_wo;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_dffe31 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_dffe31 <= man_add_sub_res_mag_dffe26_wo;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_leading_zeros_dffe31 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_leading_zeros_dffe31 <= man_leading_zeros_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_out_dffe5 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_out_dffe5 <= man_out_dffe5_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_res_dffe4 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_res_dffe4 <= man_res_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_res_is_not_zero_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_res_is_not_zero_dffe3 <= man_res_is_not_zero_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_res_is_not_zero_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_res_is_not_zero_dffe31 <= man_res_is_not_zero_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_res_is_not_zero_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_res_is_not_zero_dffe4 <= man_res_is_not_zero_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN need_complement_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN need_complement_dffe2 <= need_complement_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN round_bit_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN round_bit_dffe21 <= round_bit_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN round_bit_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN round_bit_dffe3 <= round_bit_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN round_bit_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN round_bit_dffe31 <= round_bit_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rounded_res_infinity_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN rounded_res_infinity_dffe4 <= rounded_res_infinity_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_dffe31 <= sign_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_out_dffe5 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_out_dffe5 <= sign_out_dffe5_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_res_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_res_dffe3 <= sign_res_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_res_dffe4 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_res_dffe4 <= sign_res_dffe4_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sticky_bit_dffe1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sticky_bit_dffe1 <= sticky_bit_dffe1_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sticky_bit_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sticky_bit_dffe2 <= sticky_bit_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sticky_bit_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sticky_bit_dffe21 <= sticky_bit_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sticky_bit_dffe3 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sticky_bit_dffe3 <= sticky_bit_dffe3_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sticky_bit_dffe31 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sticky_bit_dffe31 <= sticky_bit_dffe31_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN zero_man_sign_dffe2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN zero_man_sign_dffe2 <= zero_man_sign_dffe2_wi;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN zero_man_sign_dffe21 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN zero_man_sign_dffe21 <= zero_man_sign_dffe21_wi;
			END IF;
		END IF;
	END PROCESS;
	add_sub1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		clken => clk_en,
		clock => clock,
		dataa => aligned_dataa_exp_w,
		datab => aligned_datab_exp_w,
		result => wire_add_sub1_result
	  );
	add_sub2 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		clken => clk_en,
		clock => clock,
		dataa => aligned_datab_exp_w,
		datab => aligned_dataa_exp_w,
		result => wire_add_sub2_result
	  );
	add_sub3 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 6
	  )
	  PORT MAP ( 
		dataa => sticky_bit_cnt_dataa_w,
		datab => sticky_bit_cnt_datab_w,
		result => wire_add_sub3_result
	  );
	add_sub4 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		dataa => exp_adjustment_add_sub_dataa_w,
		datab => exp_adjustment_add_sub_datab_w,
		result => wire_add_sub4_result
	  );
	add_sub5 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		clken => clk_en,
		clock => clock,
		dataa => exp_adjustment2_add_sub_dataa_w,
		datab => exp_adjustment2_add_sub_datab_w,
		result => wire_add_sub5_result
	  );
	add_sub6 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		dataa => exp_res_rounding_adder_dataa_w,
		datab => exp_rounding_adjustment_w,
		result => wire_add_sub6_result
	  );
	loop121 : FOR i IN 0 TO 13 GENERATE 
		wire_man_2comp_res_lower_w_lg_w_lg_cout381w382w(i) <= wire_man_2comp_res_lower_w_lg_cout381w(0) AND wire_man_2comp_res_upper0_result(i);
	END GENERATE loop121;
	loop122 : FOR i IN 0 TO 13 GENERATE 
		wire_man_2comp_res_lower_w_lg_cout380w(i) <= wire_man_2comp_res_lower_cout AND wire_man_2comp_res_upper1_result(i);
	END GENERATE loop122;
	wire_man_2comp_res_lower_w_lg_cout381w(0) <= NOT wire_man_2comp_res_lower_cout;
	loop123 : FOR i IN 0 TO 13 GENERATE 
		wire_man_2comp_res_lower_w_lg_w_lg_w_lg_cout381w382w383w(i) <= wire_man_2comp_res_lower_w_lg_w_lg_cout381w382w(i) OR wire_man_2comp_res_lower_w_lg_cout380w(i);
	END GENERATE loop123;
	man_2comp_res_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		add_sub => add_sub_w2,
		cin => borrow_w,
		clken => clk_en,
		clock => clock,
		cout => wire_man_2comp_res_lower_cout,
		dataa => man_2comp_res_dataa_w(13 DOWNTO 0),
		datab => man_2comp_res_datab_w(13 DOWNTO 0),
		result => wire_man_2comp_res_lower_result
	  );
	man_2comp_res_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		add_sub => add_sub_w2,
		cin => wire_gnd,
		clken => clk_en,
		clock => clock,
		dataa => man_2comp_res_dataa_w(27 DOWNTO 14),
		datab => man_2comp_res_datab_w(27 DOWNTO 14),
		result => wire_man_2comp_res_upper0_result
	  );
	man_2comp_res_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		add_sub => add_sub_w2,
		cin => wire_vcc,
		clken => clk_en,
		clock => clock,
		dataa => man_2comp_res_dataa_w(27 DOWNTO 14),
		datab => man_2comp_res_datab_w(27 DOWNTO 14),
		result => wire_man_2comp_res_upper1_result
	  );
	loop124 : FOR i IN 0 TO 13 GENERATE 
		wire_man_add_sub_lower_w_lg_w_lg_cout368w369w(i) <= wire_man_add_sub_lower_w_lg_cout368w(0) AND wire_man_add_sub_upper0_result(i);
	END GENERATE loop124;
	loop125 : FOR i IN 0 TO 13 GENERATE 
		wire_man_add_sub_lower_w_lg_cout367w(i) <= wire_man_add_sub_lower_cout AND wire_man_add_sub_upper1_result(i);
	END GENERATE loop125;
	wire_man_add_sub_lower_w_lg_cout368w(0) <= NOT wire_man_add_sub_lower_cout;
	loop126 : FOR i IN 0 TO 13 GENERATE 
		wire_man_add_sub_lower_w_lg_w_lg_w_lg_cout368w369w370w(i) <= wire_man_add_sub_lower_w_lg_w_lg_cout368w369w(i) OR wire_man_add_sub_lower_w_lg_cout367w(i);
	END GENERATE loop126;
	man_add_sub_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		add_sub => add_sub_w2,
		cin => borrow_w,
		clken => clk_en,
		clock => clock,
		cout => wire_man_add_sub_lower_cout,
		dataa => man_add_sub_dataa_w(13 DOWNTO 0),
		datab => man_add_sub_datab_w(13 DOWNTO 0),
		result => wire_man_add_sub_lower_result
	  );
	man_add_sub_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		add_sub => add_sub_w2,
		cin => wire_gnd,
		clken => clk_en,
		clock => clock,
		dataa => man_add_sub_dataa_w(27 DOWNTO 14),
		datab => man_add_sub_datab_w(27 DOWNTO 14),
		result => wire_man_add_sub_upper0_result
	  );
	man_add_sub_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14,
		lpm_hint => "USE_WYS=ON"
	  )
	  PORT MAP ( 
		aclr => aclr,
		add_sub => add_sub_w2,
		cin => wire_vcc,
		clken => clk_en,
		clock => clock,
		dataa => man_add_sub_dataa_w(27 DOWNTO 14),
		datab => man_add_sub_datab_w(27 DOWNTO 14),
		result => wire_man_add_sub_upper1_result
	  );
	loop127 : FOR i IN 0 TO 12 GENERATE 
		wire_man_res_rounding_add_sub_lower_w_lg_w_lg_cout594w595w(i) <= wire_man_res_rounding_add_sub_lower_w_lg_cout594w(0) AND adder_upper_w(i);
	END GENERATE loop127;
	loop128 : FOR i IN 0 TO 12 GENERATE 
		wire_man_res_rounding_add_sub_lower_w_lg_cout593w(i) <= wire_man_res_rounding_add_sub_lower_cout AND wire_man_res_rounding_add_sub_upper1_result(i);
	END GENERATE loop128;
	wire_man_res_rounding_add_sub_lower_w_lg_cout594w(0) <= NOT wire_man_res_rounding_add_sub_lower_cout;
	loop129 : FOR i IN 0 TO 12 GENERATE 
		wire_man_res_rounding_add_sub_lower_w_lg_w_lg_w_lg_cout594w595w596w(i) <= wire_man_res_rounding_add_sub_lower_w_lg_w_lg_cout594w595w(i) OR wire_man_res_rounding_add_sub_lower_w_lg_cout593w(i);
	END GENERATE loop129;
	man_res_rounding_add_sub_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		cout => wire_man_res_rounding_add_sub_lower_cout,
		dataa => man_intermediate_res_w(12 DOWNTO 0),
		datab => man_res_rounding_add_sub_datab_w(12 DOWNTO 0),
		result => wire_man_res_rounding_add_sub_lower_result
	  );
	man_res_rounding_add_sub_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		cin => wire_vcc,
		dataa => man_intermediate_res_w(25 DOWNTO 13),
		datab => man_res_rounding_add_sub_datab_w(25 DOWNTO 13),
		result => wire_man_res_rounding_add_sub_upper1_result
	  );
	trailing_zeros_limit_comparator :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 6
	  )
	  PORT MAP ( 
		agb => wire_trailing_zeros_limit_comparator_agb,
		dataa => sticky_bit_cnt_res_w,
		datab => trailing_zeros_limit_w
	  );

 END RTL; --cpu_fpoint_addsub_single
--VALID FILE

--altfp_div CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DECODER_SUPPORT="YES" DENORMAL_SUPPORT="NO" DEVICE_FAMILY="CYCLONEII" EXCEPTION_HANDLING="NO" PIPELINE=33 REDUCED_FUNCTIONALITY="NO" WIDTH_EXP=8 WIDTH_MAN=23 aclr clk_en clock dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END


-- Copyright (C) 1991-2010 Altera Corporation
--  Your use of Altera Corporation's design tools, logic functions 
--  and other software and tools, and its AMPP partner logic 
--  functions, and any output files from any of the foregoing 
--  (including device programming or simulation files), and any 
--  associated documentation or information are expressly subject 
--  to the terms and conditions of the Altera Program License 
--  Subscription Agreement, Altera MegaCore Function License 
--  Agreement, or other applicable license agreement, including, 
--  without limitation, that your use is for the sole purpose of 
--  programming logic devices manufactured by Altera and sold by 
--  Altera or its authorized distributors.  Please refer to the 
--  applicable agreement for further details.




--altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="YES" LPM_DIRECTION="ADD" LPM_WIDTH=24 cin cout dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 2 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_csa_vhf IS 
	 PORT 
	 ( 
		 cin	:	IN  STD_LOGIC := '0';
		 cout	:	OUT  STD_LOGIC;
		 dataa	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0) := (OTHERS => '0');
		 datab	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_csa_vhf;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_csa_vhf IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_csa_lower_w_lg_w_lg_cout819w820w	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout818w	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout819w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_w_lg_w_lg_cout819w820w821w	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_csa_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_lower_result	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_result	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  adder_upper_w :	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  cout_w :	STD_LOGIC;
	 SIGNAL  result_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	wire_vcc <= '1';
	adder_upper_w <= dataa(23 DOWNTO 12);
	cout <= cout_w;
	cout_w <= (wire_csa_lower_cout AND wire_csa_upper1_cout);
	result <= result_w;
	result_w <= ( wire_csa_lower_w_lg_w_lg_w_lg_cout819w820w821w & wire_csa_lower_result);
	loop0 : FOR i IN 0 TO 11 GENERATE 
		wire_csa_lower_w_lg_w_lg_cout819w820w(i) <= wire_csa_lower_w_lg_cout819w(0) AND adder_upper_w(i);
	END GENERATE loop0;
	loop1 : FOR i IN 0 TO 11 GENERATE 
		wire_csa_lower_w_lg_cout818w(i) <= wire_csa_lower_cout AND wire_csa_upper1_result(i);
	END GENERATE loop1;
	wire_csa_lower_w_lg_cout819w(0) <= NOT wire_csa_lower_cout;
	loop2 : FOR i IN 0 TO 11 GENERATE 
		wire_csa_lower_w_lg_w_lg_w_lg_cout819w820w821w(i) <= wire_csa_lower_w_lg_w_lg_cout819w820w(i) OR wire_csa_lower_w_lg_cout818w(i);
	END GENERATE loop2;
	csa_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 12
	  )
	  PORT MAP ( 
		cin => cin,
		cout => wire_csa_lower_cout,
		dataa => dataa(11 DOWNTO 0),
		datab => datab(11 DOWNTO 0),
		result => wire_csa_lower_result
	  );
	csa_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 12
	  )
	  PORT MAP ( 
		cin => wire_vcc,
		cout => wire_csa_upper1_cout,
		dataa => dataa(23 DOWNTO 12),
		datab => datab(23 DOWNTO 12),
		result => wire_csa_upper1_result
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_csa_vhf


--altfp_div_srt_ext CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="CYCLONEII" ITERATION=14 OPTMIZE="SPEED" WIDTH_DIV=24 aclr clken clock denom divider numer quotient remain
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END


--altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="ADD" LPM_WIDTH=24 dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_csa_mke IS 
	 PORT 
	 ( 
		 dataa	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0) := (OTHERS => '0');
		 datab	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_csa_mke;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_csa_mke IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_csa_lower_w_lg_w_lg_cout1513w1514w	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1512w	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1513w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_w_lg_w_lg_cout1513w1514w1515w	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_csa_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_lower_result	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper0_result	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_result	:	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  result_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	result <= result_w;
	result_w <= ( wire_csa_lower_w_lg_w_lg_w_lg_cout1513w1514w1515w & wire_csa_lower_result);
	loop3 : FOR i IN 0 TO 11 GENERATE 
		wire_csa_lower_w_lg_w_lg_cout1513w1514w(i) <= wire_csa_lower_w_lg_cout1513w(0) AND wire_csa_upper0_result(i);
	END GENERATE loop3;
	loop4 : FOR i IN 0 TO 11 GENERATE 
		wire_csa_lower_w_lg_cout1512w(i) <= wire_csa_lower_cout AND wire_csa_upper1_result(i);
	END GENERATE loop4;
	wire_csa_lower_w_lg_cout1513w(0) <= NOT wire_csa_lower_cout;
	loop5 : FOR i IN 0 TO 11 GENERATE 
		wire_csa_lower_w_lg_w_lg_w_lg_cout1513w1514w1515w(i) <= wire_csa_lower_w_lg_w_lg_cout1513w1514w(i) OR wire_csa_lower_w_lg_cout1512w(i);
	END GENERATE loop5;
	csa_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 12
	  )
	  PORT MAP ( 
		cout => wire_csa_lower_cout,
		dataa => dataa(11 DOWNTO 0),
		datab => datab(11 DOWNTO 0),
		result => wire_csa_lower_result
	  );
	csa_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 12
	  )
	  PORT MAP ( 
		cin => wire_gnd,
		dataa => dataa(23 DOWNTO 12),
		datab => datab(23 DOWNTO 12),
		result => wire_csa_upper0_result
	  );
	csa_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 12
	  )
	  PORT MAP ( 
		cin => wire_vcc,
		dataa => dataa(23 DOWNTO 12),
		datab => datab(23 DOWNTO 12),
		result => wire_csa_upper1_result
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_csa_mke


--altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="SUB" LPM_PIPELINE=1 LPM_WIDTH=28 aclr clken clock dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_csa_2jh IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 dataa	:	IN  STD_LOGIC_VECTOR (27 DOWNTO 0) := (OTHERS => '0');
		 datab	:	IN  STD_LOGIC_VECTOR (27 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (27 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_csa_2jh;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_csa_2jh IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_csa_lower_w_lg_w_lg_cout1524w1525w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1523w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1524w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_w_lg_w_lg_cout1524w1525w1526w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_csa_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_lower_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper0_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  result_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	result <= result_w;
	result_w <= ( wire_csa_lower_w_lg_w_lg_w_lg_cout1524w1525w1526w & wire_csa_lower_result);
	loop6 : FOR i IN 0 TO 13 GENERATE 
		wire_csa_lower_w_lg_w_lg_cout1524w1525w(i) <= wire_csa_lower_w_lg_cout1524w(0) AND wire_csa_upper0_result(i);
	END GENERATE loop6;
	loop7 : FOR i IN 0 TO 13 GENERATE 
		wire_csa_lower_w_lg_cout1523w(i) <= wire_csa_lower_cout AND wire_csa_upper1_result(i);
	END GENERATE loop7;
	wire_csa_lower_w_lg_cout1524w(0) <= NOT wire_csa_lower_cout;
	loop8 : FOR i IN 0 TO 13 GENERATE 
		wire_csa_lower_w_lg_w_lg_w_lg_cout1524w1525w1526w(i) <= wire_csa_lower_w_lg_w_lg_cout1524w1525w(i) OR wire_csa_lower_w_lg_cout1523w(i);
	END GENERATE loop8;
	csa_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		cout => wire_csa_lower_cout,
		dataa => dataa(13 DOWNTO 0),
		datab => datab(13 DOWNTO 0),
		result => wire_csa_lower_result
	  );
	csa_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		aclr => aclr,
		cin => wire_gnd,
		clken => clken,
		clock => clock,
		dataa => dataa(27 DOWNTO 14),
		datab => datab(27 DOWNTO 14),
		result => wire_csa_upper0_result
	  );
	csa_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		aclr => aclr,
		cin => wire_vcc,
		clken => clken,
		clock => clock,
		dataa => dataa(27 DOWNTO 14),
		datab => datab(27 DOWNTO 14),
		result => wire_csa_upper1_result
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_csa_2jh


--altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="SUB" LPM_WIDTH=28 dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_csa_rle IS 
	 PORT 
	 ( 
		 dataa	:	IN  STD_LOGIC_VECTOR (27 DOWNTO 0) := (OTHERS => '0');
		 datab	:	IN  STD_LOGIC_VECTOR (27 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (27 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_csa_rle;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_csa_rle IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_csa_lower_w_lg_w_lg_cout1535w1536w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1534w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1535w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_w_lg_w_lg_cout1535w1536w1537w	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_csa_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_lower_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper0_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  result_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	result <= result_w;
	result_w <= ( wire_csa_lower_w_lg_w_lg_w_lg_cout1535w1536w1537w & wire_csa_lower_result);
	loop9 : FOR i IN 0 TO 13 GENERATE 
		wire_csa_lower_w_lg_w_lg_cout1535w1536w(i) <= wire_csa_lower_w_lg_cout1535w(0) AND wire_csa_upper0_result(i);
	END GENERATE loop9;
	loop10 : FOR i IN 0 TO 13 GENERATE 
		wire_csa_lower_w_lg_cout1534w(i) <= wire_csa_lower_cout AND wire_csa_upper1_result(i);
	END GENERATE loop10;
	wire_csa_lower_w_lg_cout1535w(0) <= NOT wire_csa_lower_cout;
	loop11 : FOR i IN 0 TO 13 GENERATE 
		wire_csa_lower_w_lg_w_lg_w_lg_cout1535w1536w1537w(i) <= wire_csa_lower_w_lg_w_lg_cout1535w1536w(i) OR wire_csa_lower_w_lg_cout1534w(i);
	END GENERATE loop11;
	csa_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		cout => wire_csa_lower_cout,
		dataa => dataa(13 DOWNTO 0),
		datab => datab(13 DOWNTO 0),
		result => wire_csa_lower_result
	  );
	csa_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		cin => wire_gnd,
		dataa => dataa(27 DOWNTO 14),
		datab => datab(27 DOWNTO 14),
		result => wire_csa_upper0_result
	  );
	csa_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		cin => wire_vcc,
		dataa => dataa(27 DOWNTO 14),
		datab => datab(27 DOWNTO 14),
		result => wire_csa_upper1_result
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_csa_rle


--srt_block_int CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="CYCLONEII" OPTIMIZE="SPEED" POSITION="FIRST" WIDTH_DIV=24 WIDTH_RK_IN=24 WIDTH_RK_OUT=25 WIDTH_ROM=3 WIDTH_ROM_ADD=12 aclr clken clock divider divider_reg Rk Rk_next rom
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END


--altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="ADD" LPM_WIDTH=27 dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_csa_pke IS 
	 PORT 
	 ( 
		 dataa	:	IN  STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
		 datab	:	IN  STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (26 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_csa_pke;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_csa_pke IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_csa_lower_w_lg_w_lg_cout1590w1591w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1589w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1590w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_w_lg_w_lg_cout1590w1591w1592w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_csa_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_lower_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper0_result	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_result	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  result_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	result <= result_w;
	result_w <= ( wire_csa_lower_w_lg_w_lg_w_lg_cout1590w1591w1592w & wire_csa_lower_result);
	loop12 : FOR i IN 0 TO 12 GENERATE 
		wire_csa_lower_w_lg_w_lg_cout1590w1591w(i) <= wire_csa_lower_w_lg_cout1590w(0) AND wire_csa_upper0_result(i);
	END GENERATE loop12;
	loop13 : FOR i IN 0 TO 12 GENERATE 
		wire_csa_lower_w_lg_cout1589w(i) <= wire_csa_lower_cout AND wire_csa_upper1_result(i);
	END GENERATE loop13;
	wire_csa_lower_w_lg_cout1590w(0) <= NOT wire_csa_lower_cout;
	loop14 : FOR i IN 0 TO 12 GENERATE 
		wire_csa_lower_w_lg_w_lg_w_lg_cout1590w1591w1592w(i) <= wire_csa_lower_w_lg_w_lg_cout1590w1591w(i) OR wire_csa_lower_w_lg_cout1589w(i);
	END GENERATE loop14;
	csa_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		cout => wire_csa_lower_cout,
		dataa => dataa(13 DOWNTO 0),
		datab => datab(13 DOWNTO 0),
		result => wire_csa_lower_result
	  );
	csa_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		cin => wire_gnd,
		dataa => dataa(26 DOWNTO 14),
		datab => datab(26 DOWNTO 14),
		result => wire_csa_upper0_result
	  );
	csa_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		cin => wire_vcc,
		dataa => dataa(26 DOWNTO 14),
		datab => datab(26 DOWNTO 14),
		result => wire_csa_upper1_result
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_csa_pke


--altfp_div_csa CARRY_SELECT="YES" CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DATAB_IS_CONSTANT="NO" LPM_DIRECTION="SUB" LPM_WIDTH=27 dataa datab result
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_csa_qle IS 
	 PORT 
	 ( 
		 dataa	:	IN  STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
		 datab	:	IN  STD_LOGIC_VECTOR (26 DOWNTO 0) := (OTHERS => '0');
		 result	:	OUT  STD_LOGIC_VECTOR (26 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_csa_qle;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_csa_qle IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_csa_lower_w_lg_w_lg_cout1601w1602w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1600w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_cout1601w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_csa_lower_w_lg_w_lg_w_lg_cout1601w1602w1603w	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_csa_lower_cout	:	STD_LOGIC;
	 SIGNAL  wire_csa_lower_result	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper0_result	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  wire_vcc	:	STD_LOGIC;
	 SIGNAL  wire_csa_upper1_result	:	STD_LOGIC_VECTOR (12 DOWNTO 0);
	 SIGNAL  result_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	wire_gnd <= '0';
	wire_vcc <= '1';
	result <= result_w;
	result_w <= ( wire_csa_lower_w_lg_w_lg_w_lg_cout1601w1602w1603w & wire_csa_lower_result);
	loop15 : FOR i IN 0 TO 12 GENERATE 
		wire_csa_lower_w_lg_w_lg_cout1601w1602w(i) <= wire_csa_lower_w_lg_cout1601w(0) AND wire_csa_upper0_result(i);
	END GENERATE loop15;
	loop16 : FOR i IN 0 TO 12 GENERATE 
		wire_csa_lower_w_lg_cout1600w(i) <= wire_csa_lower_cout AND wire_csa_upper1_result(i);
	END GENERATE loop16;
	wire_csa_lower_w_lg_cout1601w(0) <= NOT wire_csa_lower_cout;
	loop17 : FOR i IN 0 TO 12 GENERATE 
		wire_csa_lower_w_lg_w_lg_w_lg_cout1601w1602w1603w(i) <= wire_csa_lower_w_lg_w_lg_cout1601w1602w(i) OR wire_csa_lower_w_lg_cout1600w(i);
	END GENERATE loop17;
	csa_lower :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		cout => wire_csa_lower_cout,
		dataa => dataa(13 DOWNTO 0),
		datab => datab(13 DOWNTO 0),
		result => wire_csa_lower_result
	  );
	csa_upper0 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		cin => wire_gnd,
		dataa => dataa(26 DOWNTO 14),
		datab => datab(26 DOWNTO 14),
		result => wire_csa_upper0_result
	  );
	csa_upper1 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		cin => wire_vcc,
		dataa => dataa(26 DOWNTO 14),
		datab => datab(26 DOWNTO 14),
		result => wire_csa_upper1_result
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_csa_qle


--qds_block CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" FIRST_QDS="YES" aclr clken clock decoder_bus decoder_output
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.lpm_components.all;

--synthesis_resources = lpm_compare 4 lpm_mux 1 reg 2 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_qds_block_mab IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 decoder_bus	:	IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
		 decoder_output	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_qds_block_mab;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_qds_block_mab IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	 q_next_dffe	:	STD_LOGIC_VECTOR(1 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_cmpr35_aleb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr36_aleb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr37_aleb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr38_aleb	:	STD_LOGIC;
	 SIGNAL  wire_mux34_data_2d	:	STD_LOGIC_2D(15 DOWNTO 0, 31 DOWNTO 0);
	 SIGNAL  wire_mux34_result	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_k_comp_w_range1666w1676w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_k_comp_w_range1668w1678w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_k_comp_w_range1664w1675w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_k_comp_w_range1667w1677w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_k_comp_w_range1668w1672w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_lg_w_k_comp_w_range1668w1678w1679w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_lg_w_lg_w_k_comp_w_range1668w1672w1673w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  decoder_output_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  Div_w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  k_comp_w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  mk_bus_const_w :	STD_LOGIC_VECTOR (511 DOWNTO 0);
	 SIGNAL  mk_bus_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  mk_neg1_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  mk_pos0_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  mk_pos1_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  mk_pos2_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  q_next_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  Rk_in_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  Rk_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_k_comp_w_range1664w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_k_comp_w_range1666w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_k_comp_w_range1667w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_k_comp_w_range1668w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block28_w_q_next_w_range1681w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 COMPONENT  lpm_compare
	 GENERIC 
	 (
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "UNSIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_compare"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		aeb	:	OUT STD_LOGIC;
		agb	:	OUT STD_LOGIC;
		ageb	:	OUT STD_LOGIC;
		alb	:	OUT STD_LOGIC;
		aleb	:	OUT STD_LOGIC;
		aneb	:	OUT STD_LOGIC;
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	wire_qds_block28_w_lg_w_k_comp_w_range1666w1676w(0) <= wire_qds_block28_w_k_comp_w_range1666w(0) AND wire_qds_block28_w_lg_w_k_comp_w_range1664w1675w(0);
	wire_qds_block28_w_lg_w_k_comp_w_range1668w1678w(0) <= wire_qds_block28_w_k_comp_w_range1668w(0) AND wire_qds_block28_w_lg_w_k_comp_w_range1667w1677w(0);
	wire_qds_block28_w_lg_w_k_comp_w_range1664w1675w(0) <= NOT wire_qds_block28_w_k_comp_w_range1664w(0);
	wire_qds_block28_w_lg_w_k_comp_w_range1667w1677w(0) <= NOT wire_qds_block28_w_k_comp_w_range1667w(0);
	wire_qds_block28_w_lg_w_k_comp_w_range1668w1672w(0) <= NOT wire_qds_block28_w_k_comp_w_range1668w(0);
	wire_qds_block28_w_lg_w_lg_w_k_comp_w_range1668w1678w1679w(0) <= wire_qds_block28_w_lg_w_k_comp_w_range1668w1678w(0) OR wire_qds_block28_w_lg_w_k_comp_w_range1666w1676w(0);
	wire_qds_block28_w_lg_w_lg_w_k_comp_w_range1668w1672w1673w(0) <= wire_qds_block28_w_lg_w_k_comp_w_range1668w1672w(0) OR wire_qds_block28_w_k_comp_w_range1664w(0);
	decoder_output <= decoder_output_w;
	decoder_output_w <= ( "0" & q_next_dffe);
	Div_w <= decoder_bus(3 DOWNTO 0);
	k_comp_w <= ( wire_cmpr38_aleb & wire_cmpr37_aleb & wire_cmpr36_aleb & wire_cmpr35_aleb);
	mk_bus_const_w <= ( "01011101000111111110000110100011" & "01011010000111101110001010100110" & "01010111000111011110001110101001" & "01010100000111001110010010101100" & "01010001000110111110010110101111" & "01001110000110101110011010110010" & "01001011000110011110011110110101" & "01001000000110001110100010111000" & "01000101000101111110100110111011" & "01000010000101101110101010111110" & "00111111000101011110101111000001" & "00111100000101001110110011000100" & "00111001000100111110110111000111" & "00110110000100101110111011001010" & "00110011000100011110111111001101" & "00110000000100001111000011010000");
	mk_bus_w <= wire_mux34_result;
	mk_neg1_w <= ( mk_bus_w(7) & mk_bus_w(7 DOWNTO 0));
	mk_pos0_w <= ( mk_bus_w(15) & mk_bus_w(15 DOWNTO 8));
	mk_pos1_w <= ( mk_bus_w(23) & mk_bus_w(23 DOWNTO 16));
	mk_pos2_w <= ( mk_bus_w(31) & mk_bus_w(31 DOWNTO 24));
	q_next_w <= ( k_comp_w(1) & wire_qds_block28_w_lg_w_lg_w_k_comp_w_range1668w1672w1673w & wire_qds_block28_w_lg_w_lg_w_k_comp_w_range1668w1678w1679w);
	Rk_in_w <= ( decoder_bus(11 DOWNTO 4) & "0");
	Rk_w <= Rk_in_w;
	wire_qds_block28_w_k_comp_w_range1664w(0) <= k_comp_w(0);
	wire_qds_block28_w_k_comp_w_range1666w(0) <= k_comp_w(1);
	wire_qds_block28_w_k_comp_w_range1667w(0) <= k_comp_w(2);
	wire_qds_block28_w_k_comp_w_range1668w(0) <= k_comp_w(3);
	wire_qds_block28_w_q_next_w_range1681w <= q_next_w(1 DOWNTO 0);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN q_next_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN q_next_dffe <= wire_qds_block28_w_q_next_w_range1681w;
			END IF;
		END IF;
	END PROCESS;
	cmpr35 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr35_aleb,
		dataa => Rk_w,
		datab => mk_neg1_w
	  );
	cmpr36 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr36_aleb,
		dataa => Rk_w,
		datab => mk_pos0_w
	  );
	cmpr37 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr37_aleb,
		dataa => Rk_w,
		datab => mk_pos1_w
	  );
	cmpr38 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr38_aleb,
		dataa => Rk_w,
		datab => mk_pos2_w
	  );
	loop18 : FOR i IN 0 TO 15 GENERATE
		loop19 : FOR j IN 0 TO 31 GENERATE
			wire_mux34_data_2d(i, j) <= mk_bus_const_w(i*32+j);
		END GENERATE loop19;
	END GENERATE loop18;
	mux34 :  lpm_mux
	  GENERIC MAP (
		LPM_SIZE => 16,
		LPM_WIDTH => 32,
		LPM_WIDTHS => 4
	  )
	  PORT MAP ( 
		data => wire_mux34_data_2d,
		result => wire_mux34_result,
		sel => Div_w
	  );

 END RTL; --cpu_fpoint_div_single_qds_block_mab

 LIBRARY lpm;
 USE lpm.lpm_components.all;

--synthesis_resources = lpm_add_sub 12 lpm_compare 4 lpm_mux 2 reg 197 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_srt_block_int_h0n IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 divider	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 divider_reg	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 Rk	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 Rk_next	:	OUT  STD_LOGIC_VECTOR (24 DOWNTO 0);
		 rom	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_srt_block_int_h0n;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_srt_block_int_h0n IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altfp_div_csa29_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa29_w_result_range1565w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa30_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa30_w_result_range1566w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa31_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa31_w_result_range1567w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa32_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa32_w_result_range1568w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL	 divider_dffe	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 divider_dffe_1a	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 neg_qk1d_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 neg_qk2d_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pos_qk1d_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pos_qk2d_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 Rk_adder_padded_dffe	:	STD_LOGIC_VECTOR(20 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 Rk_next_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_out_dffe	:	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_mux33_data_2d	:	STD_LOGIC_2D(7 DOWNTO 0, 24 DOWNTO 0);
	 SIGNAL  wire_mux33_result	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_qds_block28_decoder_output	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  divider_1D_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  divider_2D_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  divider_dffe_1a_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  divider_dffe_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_in_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  neg_qk1d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  neg_qk2d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  padded_2_zeros_w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  padded_3_zeros_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  pos_qk0d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  pos_qk1d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  pos_qk2d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  qkd_mux_input_w :	STD_LOGIC_VECTOR (199 DOWNTO 0);
	 SIGNAL  qkd_mux_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_adder_padded_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  Rk_dffe_1a_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  Rk_in_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  Rk_next_dffe_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  rom_add_w :	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  rom_mux_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_1a_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_dffe_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int11_w_divider_in_w_range1546w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_srt_block_int11_w_Rk_adder_padded_w_range1558w	:	STD_LOGIC_VECTOR (20 DOWNTO 0);
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_pke
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_qle
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_qds_block_mab
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		decoder_bus	:	IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		decoder_output	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	divider_1D_w <= ( padded_3_zeros_w & divider_in_w);
	divider_2D_w <= ( padded_2_zeros_w & divider_in_w & "0");
	divider_dffe_1a_w <= divider_dffe_1a;
	divider_dffe_w <= ( "1" & divider_dffe);
	divider_in_w <= divider;
	divider_reg <= divider_dffe_w;
	neg_qk1d_int_w <= neg_qk1d_dffe;
	neg_qk2d_int_w <= neg_qk2d_dffe;
	padded_2_zeros_w <= (OTHERS => '0');
	padded_3_zeros_w <= (OTHERS => '0');
	pos_qk0d_int_w <= ( padded_3_zeros_w & "1" & Rk_adder_padded_dffe(20 DOWNTO 0));
	pos_qk1d_int_w <= pos_qk1d_dffe;
	pos_qk2d_int_w <= pos_qk2d_dffe;
	qkd_mux_input_w <= ( pos_qk2d_int_w & pos_qk2d_int_w & pos_qk1d_int_w & pos_qk0d_int_w & neg_qk2d_int_w & neg_qk2d_int_w & neg_qk1d_int_w & pos_qk0d_int_w);
	qkd_mux_w <= wire_mux33_result(24 DOWNTO 0);
	Rk_adder_padded_w <= ( padded_3_zeros_w & Rk_dffe_1a_w);
	Rk_dffe_1a_w <= Rk_in_w;
	Rk_in_w <= Rk;
	Rk_next <= Rk_next_dffe_w;
	Rk_next_dffe_w <= Rk_next_dffe;
	rom <= rom_out_dffe_w;
	rom_add_w <= ( padded_3_zeros_w & Rk_in_w(23 DOWNTO 19) & divider_in_w(22 DOWNTO 19));
	rom_mux_w <= rom_out_1a_w;
	rom_out_1a_w <= wire_qds_block28_decoder_output;
	rom_out_dffe_w <= rom_out_dffe;
	wire_srt_block_int11_w_divider_in_w_range1546w <= divider_in_w(22 DOWNTO 0);
	wire_srt_block_int11_w_Rk_adder_padded_w_range1558w <= Rk_adder_padded_w(20 DOWNTO 0);
	wire_altfp_div_csa29_w_result_range1565w <= wire_altfp_div_csa29_result(24 DOWNTO 0);
	altfp_div_csa29 :  cpu_fpoint_div_single_altfp_div_csa_pke
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_1D_w,
		result => wire_altfp_div_csa29_result
	  );
	wire_altfp_div_csa30_w_result_range1566w <= wire_altfp_div_csa30_result(24 DOWNTO 0);
	altfp_div_csa30 :  cpu_fpoint_div_single_altfp_div_csa_pke
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_2D_w,
		result => wire_altfp_div_csa30_result
	  );
	wire_altfp_div_csa31_w_result_range1567w <= wire_altfp_div_csa31_result(24 DOWNTO 0);
	altfp_div_csa31 :  cpu_fpoint_div_single_altfp_div_csa_qle
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_1D_w,
		result => wire_altfp_div_csa31_result
	  );
	wire_altfp_div_csa32_w_result_range1568w <= wire_altfp_div_csa32_result(24 DOWNTO 0);
	altfp_div_csa32 :  cpu_fpoint_div_single_altfp_div_csa_qle
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_2D_w,
		result => wire_altfp_div_csa32_result
	  );
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN divider_dffe <= divider_dffe_1a_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_dffe_1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN divider_dffe_1a <= wire_srt_block_int11_w_divider_in_w_range1546w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN neg_qk1d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN neg_qk1d_dffe <= wire_altfp_div_csa31_w_result_range1567w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN neg_qk2d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN neg_qk2d_dffe <= wire_altfp_div_csa32_w_result_range1568w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN pos_qk1d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN pos_qk1d_dffe <= wire_altfp_div_csa29_w_result_range1565w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN pos_qk2d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN pos_qk2d_dffe <= wire_altfp_div_csa30_w_result_range1566w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN Rk_adder_padded_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN Rk_adder_padded_dffe <= wire_srt_block_int11_w_Rk_adder_padded_w_range1558w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN Rk_next_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN Rk_next_dffe <= qkd_mux_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_out_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_out_dffe <= rom_out_1a_w;
			END IF;
		END IF;
	END PROCESS;
	loop20 : FOR i IN 0 TO 7 GENERATE
		loop21 : FOR j IN 0 TO 24 GENERATE
			wire_mux33_data_2d(i, j) <= qkd_mux_input_w(i*25+j);
		END GENERATE loop21;
	END GENERATE loop20;
	mux33 :  lpm_mux
	  GENERIC MAP (
		LPM_SIZE => 8,
		LPM_WIDTH => 25,
		LPM_WIDTHS => 3
	  )
	  PORT MAP ( 
		data => wire_mux33_data_2d,
		result => wire_mux33_result,
		sel => rom_mux_w
	  );
	qds_block28 :  cpu_fpoint_div_single_qds_block_mab
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		decoder_bus => rom_add_w,
		decoder_output => wire_qds_block28_decoder_output
	  );

 END RTL; --cpu_fpoint_div_single_srt_block_int_h0n


--srt_block_int CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="CYCLONEII" OPTIMIZE="SPEED" POSITION="MIDDLE" WIDTH_DIV=24 WIDTH_RK_IN=25 WIDTH_RK_OUT=25 WIDTH_ROM=3 WIDTH_ROM_ADD=12 aclr clken clock divider divider_reg Rk Rk_next rom
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END


--qds_block CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" aclr clken clock decoder_bus decoder_output
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.lpm_components.all;

--synthesis_resources = lpm_compare 4 lpm_mux 1 reg 3 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_qds_block_ls9 IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 decoder_bus	:	IN  STD_LOGIC_VECTOR (11 DOWNTO 0);
		 decoder_output	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_qds_block_ls9;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_qds_block_ls9 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	 q_next_dffe	:	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_cmpr46_aleb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr47_aleb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr48_aleb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr49_aleb	:	STD_LOGIC;
	 SIGNAL  wire_mux45_data_2d	:	STD_LOGIC_2D(15 DOWNTO 0, 31 DOWNTO 0);
	 SIGNAL  wire_mux45_result	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_k_comp_w_range1795w1805w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_k_comp_w_range1797w1807w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_k_comp_w_range1793w1804w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_k_comp_w_range1796w1806w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_k_comp_w_range1797w1801w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_lg_w_k_comp_w_range1797w1807w1808w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_lg_w_lg_w_k_comp_w_range1797w1801w1802w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  decoder_output_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  Div_w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  k_comp_w :	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  mk_bus_const_w :	STD_LOGIC_VECTOR (511 DOWNTO 0);
	 SIGNAL  mk_bus_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  mk_neg1_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  mk_pos0_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  mk_pos1_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  mk_pos2_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  q_next_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  Rk_in_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  Rk_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_k_comp_w_range1793w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_k_comp_w_range1795w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_k_comp_w_range1796w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_qds_block39_w_k_comp_w_range1797w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  lpm_compare
	 GENERIC 
	 (
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "UNSIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_compare"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		aeb	:	OUT STD_LOGIC;
		agb	:	OUT STD_LOGIC;
		ageb	:	OUT STD_LOGIC;
		alb	:	OUT STD_LOGIC;
		aleb	:	OUT STD_LOGIC;
		aneb	:	OUT STD_LOGIC;
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	wire_qds_block39_w_lg_w_k_comp_w_range1795w1805w(0) <= wire_qds_block39_w_k_comp_w_range1795w(0) AND wire_qds_block39_w_lg_w_k_comp_w_range1793w1804w(0);
	wire_qds_block39_w_lg_w_k_comp_w_range1797w1807w(0) <= wire_qds_block39_w_k_comp_w_range1797w(0) AND wire_qds_block39_w_lg_w_k_comp_w_range1796w1806w(0);
	wire_qds_block39_w_lg_w_k_comp_w_range1793w1804w(0) <= NOT wire_qds_block39_w_k_comp_w_range1793w(0);
	wire_qds_block39_w_lg_w_k_comp_w_range1796w1806w(0) <= NOT wire_qds_block39_w_k_comp_w_range1796w(0);
	wire_qds_block39_w_lg_w_k_comp_w_range1797w1801w(0) <= NOT wire_qds_block39_w_k_comp_w_range1797w(0);
	wire_qds_block39_w_lg_w_lg_w_k_comp_w_range1797w1807w1808w(0) <= wire_qds_block39_w_lg_w_k_comp_w_range1797w1807w(0) OR wire_qds_block39_w_lg_w_k_comp_w_range1795w1805w(0);
	wire_qds_block39_w_lg_w_lg_w_k_comp_w_range1797w1801w1802w(0) <= wire_qds_block39_w_lg_w_k_comp_w_range1797w1801w(0) OR wire_qds_block39_w_k_comp_w_range1793w(0);
	decoder_output <= decoder_output_w;
	decoder_output_w <= q_next_dffe;
	Div_w <= decoder_bus(3 DOWNTO 0);
	k_comp_w <= ( wire_cmpr49_aleb & wire_cmpr48_aleb & wire_cmpr47_aleb & wire_cmpr46_aleb);
	mk_bus_const_w <= ( "01011101000111111110000110100011" & "01011010000111101110001010100110" & "01010111000111011110001110101001" & "01010100000111001110010010101100" & "01010001000110111110010110101111" & "01001110000110101110011010110010" & "01001011000110011110011110110101" & "01001000000110001110100010111000" & "01000101000101111110100110111011" & "01000010000101101110101010111110" & "00111111000101011110101111000001" & "00111100000101001110110011000100" & "00111001000100111110110111000111" & "00110110000100101110111011001010" & "00110011000100011110111111001101" & "00110000000100001111000011010000");
	mk_bus_w <= wire_mux45_result;
	mk_neg1_w <= ( mk_bus_w(7) & mk_bus_w(7 DOWNTO 0));
	mk_pos0_w <= ( mk_bus_w(15) & mk_bus_w(15 DOWNTO 8));
	mk_pos1_w <= ( mk_bus_w(23) & mk_bus_w(23 DOWNTO 16));
	mk_pos2_w <= ( mk_bus_w(31) & mk_bus_w(31 DOWNTO 24));
	q_next_w <= ( k_comp_w(1) & wire_qds_block39_w_lg_w_lg_w_k_comp_w_range1797w1801w1802w & wire_qds_block39_w_lg_w_lg_w_k_comp_w_range1797w1807w1808w);
	Rk_in_w <= ( decoder_bus(11 DOWNTO 4) & "0");
	Rk_w <= Rk_in_w;
	wire_qds_block39_w_k_comp_w_range1793w(0) <= k_comp_w(0);
	wire_qds_block39_w_k_comp_w_range1795w(0) <= k_comp_w(1);
	wire_qds_block39_w_k_comp_w_range1796w(0) <= k_comp_w(2);
	wire_qds_block39_w_k_comp_w_range1797w(0) <= k_comp_w(3);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN q_next_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN q_next_dffe <= q_next_w;
			END IF;
		END IF;
	END PROCESS;
	cmpr46 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr46_aleb,
		dataa => Rk_w,
		datab => mk_neg1_w
	  );
	cmpr47 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr47_aleb,
		dataa => Rk_w,
		datab => mk_pos0_w
	  );
	cmpr48 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr48_aleb,
		dataa => Rk_w,
		datab => mk_pos1_w
	  );
	cmpr49 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aleb => wire_cmpr49_aleb,
		dataa => Rk_w,
		datab => mk_pos2_w
	  );
	loop22 : FOR i IN 0 TO 15 GENERATE
		loop23 : FOR j IN 0 TO 31 GENERATE
			wire_mux45_data_2d(i, j) <= mk_bus_const_w(i*32+j);
		END GENERATE loop23;
	END GENERATE loop22;
	mux45 :  lpm_mux
	  GENERIC MAP (
		LPM_SIZE => 16,
		LPM_WIDTH => 32,
		LPM_WIDTHS => 4
	  )
	  PORT MAP ( 
		data => wire_mux45_data_2d,
		result => wire_mux45_result,
		sel => Div_w
	  );

 END RTL; --cpu_fpoint_div_single_qds_block_ls9

 LIBRARY lpm;
 USE lpm.lpm_components.all;

--synthesis_resources = lpm_add_sub 12 lpm_compare 4 lpm_mux 2 reg 200 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_srt_block_int_p2n IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 divider	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 divider_reg	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 Rk	:	IN  STD_LOGIC_VECTOR (24 DOWNTO 0);
		 Rk_next	:	OUT  STD_LOGIC_VECTOR (24 DOWNTO 0);
		 rom	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_srt_block_int_p2n;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_srt_block_int_p2n IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altfp_div_csa40_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa40_w_result_range1708w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa41_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa41_w_result_range1709w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa42_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa42_w_result_range1714w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa43_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa43_w_result_range1715w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL	 divider_dffe	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 divider_dffe_1a	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 neg_qk1d_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 neg_qk2d_dffe	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pos_qk1d_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pos_qk2d_dffe	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 Rk_adder_padded_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 Rk_next_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_out_dffe	:	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_mux44_data_2d	:	STD_LOGIC_2D(7 DOWNTO 0, 24 DOWNTO 0);
	 SIGNAL  wire_mux44_result	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_qds_block39_decoder_output	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  divider_1D_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  divider_2D_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  divider_dffe_1a_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  divider_dffe_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_in_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  neg_qk1d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  neg_qk2d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  padded_2_zeros_w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  padded_3_zeros_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  pos_qk0d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  pos_qk1d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  pos_qk2d_int_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  qkd_mux_input_w :	STD_LOGIC_VECTOR (199 DOWNTO 0);
	 SIGNAL  qkd_mux_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_adder_padded_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  Rk_dffe_1a_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_in_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_dffe_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  rom_add_w :	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  rom_mux_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_1a_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_dffe_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int12_w_divider_in_w_range1692w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_srt_block_int12_w_Rk_adder_padded_w_range1701w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_pke
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_qle
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_qds_block_ls9
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		decoder_bus	:	IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		decoder_output	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	divider_1D_w <= ( padded_3_zeros_w & divider_in_w);
	divider_2D_w <= ( padded_2_zeros_w & divider_in_w & "0");
	divider_dffe_1a_w <= divider_dffe_1a;
	divider_dffe_w <= ( "1" & divider_dffe);
	divider_in_w <= divider;
	divider_reg <= divider_dffe_w;
	neg_qk1d_int_w <= neg_qk1d_dffe;
	neg_qk2d_int_w <= ( neg_qk2d_dffe & "0");
	padded_2_zeros_w <= (OTHERS => '0');
	padded_3_zeros_w <= (OTHERS => '0');
	pos_qk0d_int_w <= ( Rk_adder_padded_dffe(22 DOWNTO 0) & padded_2_zeros_w);
	pos_qk1d_int_w <= pos_qk1d_dffe;
	pos_qk2d_int_w <= ( pos_qk2d_dffe & "0");
	qkd_mux_input_w <= ( pos_qk2d_int_w & pos_qk2d_int_w & pos_qk1d_int_w & pos_qk0d_int_w & neg_qk2d_int_w & neg_qk2d_int_w & neg_qk1d_int_w & pos_qk0d_int_w);
	qkd_mux_w <= wire_mux44_result(24 DOWNTO 0);
	Rk_adder_padded_w <= ( Rk_dffe_1a_w & padded_2_zeros_w);
	Rk_dffe_1a_w <= Rk_in_w;
	Rk_in_w <= Rk;
	Rk_next <= Rk_next_dffe_w;
	Rk_next_dffe_w <= Rk_next_dffe;
	rom <= rom_out_dffe_w;
	rom_add_w <= ( Rk_in_w(24 DOWNTO 17) & divider_in_w(22 DOWNTO 19));
	rom_mux_w <= rom_out_1a_w;
	rom_out_1a_w <= wire_qds_block39_decoder_output;
	rom_out_dffe_w <= rom_out_dffe;
	wire_srt_block_int12_w_divider_in_w_range1692w <= divider_in_w(22 DOWNTO 0);
	wire_srt_block_int12_w_Rk_adder_padded_w_range1701w <= Rk_adder_padded_w(26 DOWNTO 2);
	wire_altfp_div_csa40_w_result_range1708w <= wire_altfp_div_csa40_result(24 DOWNTO 0);
	altfp_div_csa40 :  cpu_fpoint_div_single_altfp_div_csa_pke
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_1D_w,
		result => wire_altfp_div_csa40_result
	  );
	wire_altfp_div_csa41_w_result_range1709w <= wire_altfp_div_csa41_result(24 DOWNTO 1);
	altfp_div_csa41 :  cpu_fpoint_div_single_altfp_div_csa_pke
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_2D_w,
		result => wire_altfp_div_csa41_result
	  );
	wire_altfp_div_csa42_w_result_range1714w <= wire_altfp_div_csa42_result(24 DOWNTO 0);
	altfp_div_csa42 :  cpu_fpoint_div_single_altfp_div_csa_qle
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_1D_w,
		result => wire_altfp_div_csa42_result
	  );
	wire_altfp_div_csa43_w_result_range1715w <= wire_altfp_div_csa43_result(24 DOWNTO 1);
	altfp_div_csa43 :  cpu_fpoint_div_single_altfp_div_csa_qle
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_2D_w,
		result => wire_altfp_div_csa43_result
	  );
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN divider_dffe <= divider_dffe_1a_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_dffe_1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN divider_dffe_1a <= wire_srt_block_int12_w_divider_in_w_range1692w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN neg_qk1d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN neg_qk1d_dffe <= wire_altfp_div_csa42_w_result_range1714w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN neg_qk2d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN neg_qk2d_dffe <= wire_altfp_div_csa43_w_result_range1715w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN pos_qk1d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN pos_qk1d_dffe <= wire_altfp_div_csa40_w_result_range1708w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN pos_qk2d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN pos_qk2d_dffe <= wire_altfp_div_csa41_w_result_range1709w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN Rk_adder_padded_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN Rk_adder_padded_dffe <= wire_srt_block_int12_w_Rk_adder_padded_w_range1701w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN Rk_next_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN Rk_next_dffe <= qkd_mux_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_out_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_out_dffe <= rom_out_1a_w;
			END IF;
		END IF;
	END PROCESS;
	loop24 : FOR i IN 0 TO 7 GENERATE
		loop25 : FOR j IN 0 TO 24 GENERATE
			wire_mux44_data_2d(i, j) <= qkd_mux_input_w(i*25+j);
		END GENERATE loop25;
	END GENERATE loop24;
	mux44 :  lpm_mux
	  GENERIC MAP (
		LPM_SIZE => 8,
		LPM_WIDTH => 25,
		LPM_WIDTHS => 3
	  )
	  PORT MAP ( 
		data => wire_mux44_data_2d,
		result => wire_mux44_result,
		sel => rom_mux_w
	  );
	qds_block39 :  cpu_fpoint_div_single_qds_block_ls9
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		decoder_bus => rom_add_w,
		decoder_output => wire_qds_block39_decoder_output
	  );

 END RTL; --cpu_fpoint_div_single_srt_block_int_p2n


--srt_block_int CBX_AUTO_BLACKBOX="ON" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="CYCLONEII" OPTIMIZE="SPEED" POSITION="LAST" WIDTH_DIV=24 WIDTH_RK_IN=25 WIDTH_RK_OUT=27 WIDTH_ROM=3 WIDTH_ROM_ADD=12 aclr clken clock divider divider_reg Rk Rk_next rom
--VERSION_BEGIN 9.1SP1 cbx_altbarrel_shift 2010:01:25:21:24:34:SJ cbx_altfp_div 2010:01:25:21:24:34:SJ cbx_altsyncram 2010:01:25:21:24:34:SJ cbx_cycloneii 2010:01:25:21:24:34:SJ cbx_lpm_abs 2010:01:25:21:24:34:SJ cbx_lpm_add_sub 2010:01:25:21:24:34:SJ cbx_lpm_compare 2010:01:25:21:24:34:SJ cbx_lpm_decode 2010:01:25:21:24:34:SJ cbx_lpm_divide 2010:01:25:21:24:34:SJ cbx_lpm_mult 2010:01:25:21:24:34:SJ cbx_lpm_mux 2010:01:25:21:24:34:SJ cbx_mgl 2010:01:25:21:38:39:SJ cbx_padd 2010:01:25:21:24:34:SJ cbx_stratix 2010:01:25:21:24:34:SJ cbx_stratixii 2010:01:25:21:24:34:SJ cbx_stratixiii 2010:01:25:21:24:34:SJ cbx_util_mgl 2010:01:25:21:24:34:SJ  VERSION_END

 LIBRARY lpm;
 USE lpm.lpm_components.all;

--synthesis_resources = lpm_add_sub 12 lpm_compare 4 lpm_mux 2 reg 159 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_srt_block_int_0tm IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 divider	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 divider_reg	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 Rk	:	IN  STD_LOGIC_VECTOR (24 DOWNTO 0);
		 Rk_next	:	OUT  STD_LOGIC_VECTOR (26 DOWNTO 0);
		 rom	:	OUT  STD_LOGIC_VECTOR (2 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_srt_block_int_0tm;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_srt_block_int_0tm IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altfp_div_csa51_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa51_w_result_range1832w	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa52_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa52_w_result_range1833w	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa53_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa53_w_result_range1834w	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa54_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa54_w_result_range1835w	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL	 divider_dffe_1a	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 neg_qk1d_dffe	:	STD_LOGIC_VECTOR(26 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 neg_qk2d_dffe	:	STD_LOGIC_VECTOR(26 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pos_qk1d_dffe	:	STD_LOGIC_VECTOR(26 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 pos_qk2d_dffe	:	STD_LOGIC_VECTOR(26 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 Rk_adder_padded_dffe	:	STD_LOGIC_VECTOR(24 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_mux55_data_2d	:	STD_LOGIC_2D(7 DOWNTO 0, 26 DOWNTO 0);
	 SIGNAL  wire_mux55_result	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_qds_block50_decoder_output	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  divider_1D_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  divider_2D_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  divider_dffe_1a_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  divider_dffe_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_in_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  neg_qk1d_int_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  neg_qk2d_int_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  padded_2_zeros_w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  padded_3_zeros_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  pos_qk0d_int_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  pos_qk1d_int_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  pos_qk2d_int_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  qkd_mux_input_w :	STD_LOGIC_VECTOR (215 DOWNTO 0);
	 SIGNAL  qkd_mux_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  Rk_adder_padded_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  Rk_dffe_1a_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_in_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_dffe_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  rom_add_w :	STD_LOGIC_VECTOR (11 DOWNTO 0);
	 SIGNAL  rom_mux_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_1a_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_dffe_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int24_w_divider_in_w_range1816w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_srt_block_int24_w_Rk_adder_padded_w_range1825w	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_pke
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_qle
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_qds_block_ls9
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		decoder_bus	:	IN  STD_LOGIC_VECTOR(11 DOWNTO 0);
		decoder_output	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	divider_1D_w <= ( padded_3_zeros_w & divider_in_w);
	divider_2D_w <= ( padded_2_zeros_w & divider_in_w & "0");
	divider_dffe_1a_w <= divider_dffe_1a;
	divider_dffe_w <= ( "1" & divider_dffe_1a_w);
	divider_in_w <= divider;
	divider_reg <= divider_dffe_w;
	neg_qk1d_int_w <= neg_qk1d_dffe;
	neg_qk2d_int_w <= neg_qk2d_dffe;
	padded_2_zeros_w <= (OTHERS => '0');
	padded_3_zeros_w <= (OTHERS => '0');
	pos_qk0d_int_w <= ( Rk_adder_padded_dffe(24 DOWNTO 0) & padded_2_zeros_w);
	pos_qk1d_int_w <= pos_qk1d_dffe;
	pos_qk2d_int_w <= pos_qk2d_dffe;
	qkd_mux_input_w <= ( pos_qk2d_int_w & pos_qk2d_int_w & pos_qk1d_int_w & pos_qk0d_int_w & neg_qk2d_int_w & neg_qk2d_int_w & neg_qk1d_int_w & pos_qk0d_int_w);
	qkd_mux_w <= wire_mux55_result(26 DOWNTO 0);
	Rk_adder_padded_w <= ( Rk_dffe_1a_w & padded_2_zeros_w);
	Rk_dffe_1a_w <= Rk_in_w;
	Rk_in_w <= Rk;
	Rk_next <= Rk_next_dffe_w;
	Rk_next_dffe_w <= qkd_mux_w;
	rom <= rom_out_dffe_w;
	rom_add_w <= ( Rk_in_w(24 DOWNTO 17) & divider_in_w(22 DOWNTO 19));
	rom_mux_w <= rom_out_1a_w;
	rom_out_1a_w <= wire_qds_block50_decoder_output;
	rom_out_dffe_w <= rom_out_1a_w;
	wire_srt_block_int24_w_divider_in_w_range1816w <= divider_in_w(22 DOWNTO 0);
	wire_srt_block_int24_w_Rk_adder_padded_w_range1825w <= Rk_adder_padded_w(26 DOWNTO 2);
	wire_altfp_div_csa51_w_result_range1832w <= wire_altfp_div_csa51_result(26 DOWNTO 0);
	altfp_div_csa51 :  cpu_fpoint_div_single_altfp_div_csa_pke
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_1D_w,
		result => wire_altfp_div_csa51_result
	  );
	wire_altfp_div_csa52_w_result_range1833w <= wire_altfp_div_csa52_result(26 DOWNTO 0);
	altfp_div_csa52 :  cpu_fpoint_div_single_altfp_div_csa_pke
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_2D_w,
		result => wire_altfp_div_csa52_result
	  );
	wire_altfp_div_csa53_w_result_range1834w <= wire_altfp_div_csa53_result(26 DOWNTO 0);
	altfp_div_csa53 :  cpu_fpoint_div_single_altfp_div_csa_qle
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_1D_w,
		result => wire_altfp_div_csa53_result
	  );
	wire_altfp_div_csa54_w_result_range1835w <= wire_altfp_div_csa54_result(26 DOWNTO 0);
	altfp_div_csa54 :  cpu_fpoint_div_single_altfp_div_csa_qle
	  PORT MAP ( 
		dataa => Rk_adder_padded_w,
		datab => divider_2D_w,
		result => wire_altfp_div_csa54_result
	  );
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_dffe_1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN divider_dffe_1a <= wire_srt_block_int24_w_divider_in_w_range1816w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN neg_qk1d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN neg_qk1d_dffe <= wire_altfp_div_csa53_w_result_range1834w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN neg_qk2d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN neg_qk2d_dffe <= wire_altfp_div_csa54_w_result_range1835w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN pos_qk1d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN pos_qk1d_dffe <= wire_altfp_div_csa51_w_result_range1832w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN pos_qk2d_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN pos_qk2d_dffe <= wire_altfp_div_csa52_w_result_range1833w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN Rk_adder_padded_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN Rk_adder_padded_dffe <= wire_srt_block_int24_w_Rk_adder_padded_w_range1825w;
			END IF;
		END IF;
	END PROCESS;
	loop26 : FOR i IN 0 TO 7 GENERATE
		loop27 : FOR j IN 0 TO 26 GENERATE
			wire_mux55_data_2d(i, j) <= qkd_mux_input_w(i*27+j);
		END GENERATE loop27;
	END GENERATE loop26;
	mux55 :  lpm_mux
	  GENERIC MAP (
		LPM_SIZE => 8,
		LPM_WIDTH => 27,
		LPM_WIDTHS => 3
	  )
	  PORT MAP ( 
		data => wire_mux55_data_2d,
		result => wire_mux55_result,
		sel => rom_mux_w
	  );
	qds_block50 :  cpu_fpoint_div_single_qds_block_ls9
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		decoder_bus => rom_add_w,
		decoder_output => wire_qds_block50_decoder_output
	  );

 END RTL; --cpu_fpoint_div_single_srt_block_int_0tm

--synthesis_resources = lpm_add_sub 177 lpm_compare 56 lpm_mux 28 reg 3289 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single_altfp_div_srt_ext_mkh IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clken	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC := '0';
		 denom	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 divider	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 numer	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0);
		 quotient	:	OUT  STD_LOGIC_VECTOR (27 DOWNTO 0);
		 remain	:	OUT  STD_LOGIC_VECTOR (23 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single_altfp_div_srt_ext_mkh;

 ARCHITECTURE RTL OF cpu_fpoint_div_single_altfp_div_srt_ext_mkh IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altfp_div_csa25_result	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa26_result	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  wire_altfp_div_csa27_result	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL	 divider_next_special_dffe	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 Rk_remainder_special_dffe	:	STD_LOGIC_VECTOR(26 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe0c	:	STD_LOGIC_VECTOR(49 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe10c	:	STD_LOGIC_VECTOR(14 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe11c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe12c	:	STD_LOGIC_VECTOR(2 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe1c	:	STD_LOGIC_VECTOR(68 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe2c	:	STD_LOGIC_VECTOR(62 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe3c	:	STD_LOGIC_VECTOR(56 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe4c	:	STD_LOGIC_VECTOR(50 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe5c	:	STD_LOGIC_VECTOR(44 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe6c	:	STD_LOGIC_VECTOR(38 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe7c	:	STD_LOGIC_VECTOR(32 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe8c	:	STD_LOGIC_VECTOR(26 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rom_reg_dffe9c	:	STD_LOGIC_VECTOR(20 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_srt_block_int11_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int11_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int11_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int12_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int12_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int12_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int13_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int13_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int13_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int14_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int14_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int14_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int15_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int15_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int15_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int16_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int16_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int16_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int17_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int17_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int17_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int18_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int18_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int18_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int19_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int19_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int19_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int20_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int20_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int20_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int21_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int21_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int21_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int22_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int22_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int22_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int23_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int23_Rk_next	:	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  wire_srt_block_int23_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_srt_block_int24_divider_reg	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_srt_block_int24_Rk_next	:	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  wire_srt_block_int24_rom	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_mux_remainder_w1500w1504w	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_mux_remainder_w1500w1501w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1324w1352w1422w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1324w1352w1353w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1344w1402w1452w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1344w1402w1403w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1346w1407w1455w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1346w1407w1408w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1348w1412w1458w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1348w1412w1413w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1350w1417w1461w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1350w1417w1418w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1326w1357w1425w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1326w1357w1358w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1328w1362w1428w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1328w1362w1363w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1330w1367w1431w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1330w1367w1368w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1332w1372w1434w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1332w1372w1373w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1334w1377w1437w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1334w1377w1378w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1336w1382w1440w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1336w1382w1383w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1338w1387w1443w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1338w1387w1388w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1340w1392w1446w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1340w1392w1393w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1342w1397w1449w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1342w1397w1398w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1499w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1503w	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1354w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1421w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1404w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1451w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1409w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1454w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1414w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1457w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1419w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1460w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1359w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1424w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1364w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1427w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1369w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1430w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1374w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1433w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1379w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1436w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1384w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1439w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1389w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1442w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1394w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1445w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1399w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1448w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1500w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1352w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1402w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1407w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1412w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1417w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1357w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1362w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1367w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1372w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1377w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1382w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1387w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1392w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1397w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  added_remainder_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_dffe_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_special_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w0c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w10c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w11c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w12c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w13c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w1c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w2c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w3c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w4c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w5c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w6c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w7c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w8c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_next_w9c :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  divider_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  full_neg_rom_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  full_pos_rom_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  mux_remainder_w :	STD_LOGIC;
	 SIGNAL  neg_rom_w0c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w10c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w11c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w12c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w13c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w1c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w2c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w3c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w4c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w5c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w6c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w7c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w8c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  neg_rom_w9c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w0c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w10c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w11c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w12c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w13c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w1c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w2c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w3c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w4c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w5c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w6c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w7c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w8c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  pos_rom_w9c :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  Rk_next0_w :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w0c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w10c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w11c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w12c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w13c :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  Rk_next_w1c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w2c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w3c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w4c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w5c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w6c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w7c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w8c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_next_w9c :	STD_LOGIC_VECTOR (24 DOWNTO 0);
	 SIGNAL  Rk_remainder_special_w :	STD_LOGIC_VECTOR (26 DOWNTO 0);
	 SIGNAL  Rk_remainder_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  Rk_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  rom_dffe_w0c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w10c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w11c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w12c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w13c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w1c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w2c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w3c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w4c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w5c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w6c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w7c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w8c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_dffe_w9c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_mux_w :	STD_LOGIC_VECTOR (13 DOWNTO 0);
	 SIGNAL  rom_out_1a_w :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w0c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w10c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w11c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w12c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w13c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w1c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w2c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w3c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w4c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w5c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w6c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w7c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w8c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rom_out_w9c :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  srt_adjust_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  srt_adjusted_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  true_quotient_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  value_one_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  zero_quotient_w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_Rk_remainder_special_w_range1498w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w0c_range1311w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w10c_range1401w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w11c_range1406w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w12c_range1411w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w13c_range1416w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w1c_range1356w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w2c_range1361w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w3c_range1366w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w4c_range1371w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w5c_range1376w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w6c_range1381w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w7c_range1386w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w8c_range1391w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_dffe_w9c_range1396w	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1324w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1344w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1346w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1348w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1350w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1326w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1328w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1330w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1332w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1334w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1336w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1338w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1340w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_w_rom_mux_w_range1342w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_mke
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_2jh
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		dataa	:	IN  STD_LOGIC_VECTOR(27 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(27 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(27 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_rle
	 PORT
	 ( 
		dataa	:	IN  STD_LOGIC_VECTOR(27 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(27 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(27 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_srt_block_int_h0n
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		divider	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		divider_reg	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0);
		Rk	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		Rk_next	:	OUT  STD_LOGIC_VECTOR(24 DOWNTO 0);
		rom	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_srt_block_int_p2n
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		divider	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		divider_reg	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0);
		Rk	:	IN  STD_LOGIC_VECTOR(24 DOWNTO 0);
		Rk_next	:	OUT  STD_LOGIC_VECTOR(24 DOWNTO 0);
		rom	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_srt_block_int_0tm
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		divider	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		divider_reg	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0);
		Rk	:	IN  STD_LOGIC_VECTOR(24 DOWNTO 0);
		Rk_next	:	OUT  STD_LOGIC_VECTOR(26 DOWNTO 0);
		rom	:	OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	loop28 : FOR i IN 0 TO 27 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_mux_remainder_w1500w1504w(i) <= wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1500w(0) AND srt_adjust_w(i);
	END GENERATE loop28;
	loop29 : FOR i IN 0 TO 23 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_mux_remainder_w1500w1501w(i) <= wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1500w(0) AND wire_altfp_div_srt_ext1_w_Rk_remainder_special_w_range1498w(i);
	END GENERATE loop29;
	loop30 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1324w1352w1422w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1352w(0) AND zero_quotient_w(i);
	END GENERATE loop30;
	loop31 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1324w1352w1353w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1352w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w0c_range1311w(i);
	END GENERATE loop31;
	loop32 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1344w1402w1452w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1402w(0) AND zero_quotient_w(i);
	END GENERATE loop32;
	loop33 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1344w1402w1403w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1402w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w10c_range1401w(i);
	END GENERATE loop33;
	loop34 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1346w1407w1455w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1407w(0) AND zero_quotient_w(i);
	END GENERATE loop34;
	loop35 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1346w1407w1408w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1407w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w11c_range1406w(i);
	END GENERATE loop35;
	loop36 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1348w1412w1458w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1412w(0) AND zero_quotient_w(i);
	END GENERATE loop36;
	loop37 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1348w1412w1413w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1412w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w12c_range1411w(i);
	END GENERATE loop37;
	loop38 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1350w1417w1461w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1417w(0) AND zero_quotient_w(i);
	END GENERATE loop38;
	loop39 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1350w1417w1418w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1417w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w13c_range1416w(i);
	END GENERATE loop39;
	loop40 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1326w1357w1425w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1357w(0) AND zero_quotient_w(i);
	END GENERATE loop40;
	loop41 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1326w1357w1358w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1357w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w1c_range1356w(i);
	END GENERATE loop41;
	loop42 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1328w1362w1428w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1362w(0) AND zero_quotient_w(i);
	END GENERATE loop42;
	loop43 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1328w1362w1363w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1362w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w2c_range1361w(i);
	END GENERATE loop43;
	loop44 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1330w1367w1431w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1367w(0) AND zero_quotient_w(i);
	END GENERATE loop44;
	loop45 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1330w1367w1368w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1367w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w3c_range1366w(i);
	END GENERATE loop45;
	loop46 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1332w1372w1434w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1372w(0) AND zero_quotient_w(i);
	END GENERATE loop46;
	loop47 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1332w1372w1373w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1372w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w4c_range1371w(i);
	END GENERATE loop47;
	loop48 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1334w1377w1437w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1377w(0) AND zero_quotient_w(i);
	END GENERATE loop48;
	loop49 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1334w1377w1378w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1377w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w5c_range1376w(i);
	END GENERATE loop49;
	loop50 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1336w1382w1440w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1382w(0) AND zero_quotient_w(i);
	END GENERATE loop50;
	loop51 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1336w1382w1383w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1382w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w6c_range1381w(i);
	END GENERATE loop51;
	loop52 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1338w1387w1443w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1387w(0) AND zero_quotient_w(i);
	END GENERATE loop52;
	loop53 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1338w1387w1388w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1387w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w7c_range1386w(i);
	END GENERATE loop53;
	loop54 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1340w1392w1446w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1392w(0) AND zero_quotient_w(i);
	END GENERATE loop54;
	loop55 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1340w1392w1393w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1392w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w8c_range1391w(i);
	END GENERATE loop55;
	loop56 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1342w1397w1449w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1397w(0) AND zero_quotient_w(i);
	END GENERATE loop56;
	loop57 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1342w1397w1398w(i) <= wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1397w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w9c_range1396w(i);
	END GENERATE loop57;
	loop58 : FOR i IN 0 TO 23 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1499w(i) <= mux_remainder_w AND added_remainder_w(i);
	END GENERATE loop58;
	loop59 : FOR i IN 0 TO 27 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1503w(i) <= mux_remainder_w AND srt_adjusted_w(i);
	END GENERATE loop59;
	loop60 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1354w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1324w(0) AND zero_quotient_w(i);
	END GENERATE loop60;
	loop61 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1421w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1324w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w0c_range1311w(i);
	END GENERATE loop61;
	loop62 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1404w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1344w(0) AND zero_quotient_w(i);
	END GENERATE loop62;
	loop63 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1451w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1344w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w10c_range1401w(i);
	END GENERATE loop63;
	loop64 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1409w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1346w(0) AND zero_quotient_w(i);
	END GENERATE loop64;
	loop65 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1454w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1346w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w11c_range1406w(i);
	END GENERATE loop65;
	loop66 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1414w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1348w(0) AND zero_quotient_w(i);
	END GENERATE loop66;
	loop67 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1457w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1348w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w12c_range1411w(i);
	END GENERATE loop67;
	loop68 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1419w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1350w(0) AND zero_quotient_w(i);
	END GENERATE loop68;
	loop69 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1460w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1350w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w13c_range1416w(i);
	END GENERATE loop69;
	loop70 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1359w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1326w(0) AND zero_quotient_w(i);
	END GENERATE loop70;
	loop71 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1424w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1326w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w1c_range1356w(i);
	END GENERATE loop71;
	loop72 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1364w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1328w(0) AND zero_quotient_w(i);
	END GENERATE loop72;
	loop73 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1427w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1328w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w2c_range1361w(i);
	END GENERATE loop73;
	loop74 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1369w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1330w(0) AND zero_quotient_w(i);
	END GENERATE loop74;
	loop75 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1430w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1330w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w3c_range1366w(i);
	END GENERATE loop75;
	loop76 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1374w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1332w(0) AND zero_quotient_w(i);
	END GENERATE loop76;
	loop77 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1433w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1332w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w4c_range1371w(i);
	END GENERATE loop77;
	loop78 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1379w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1334w(0) AND zero_quotient_w(i);
	END GENERATE loop78;
	loop79 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1436w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1334w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w5c_range1376w(i);
	END GENERATE loop79;
	loop80 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1384w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1336w(0) AND zero_quotient_w(i);
	END GENERATE loop80;
	loop81 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1439w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1336w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w6c_range1381w(i);
	END GENERATE loop81;
	loop82 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1389w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1338w(0) AND zero_quotient_w(i);
	END GENERATE loop82;
	loop83 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1442w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1338w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w7c_range1386w(i);
	END GENERATE loop83;
	loop84 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1394w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1340w(0) AND zero_quotient_w(i);
	END GENERATE loop84;
	loop85 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1445w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1340w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w8c_range1391w(i);
	END GENERATE loop85;
	loop86 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1399w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1342w(0) AND zero_quotient_w(i);
	END GENERATE loop86;
	loop87 : FOR i IN 0 TO 1 GENERATE 
		wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1448w(i) <= wire_altfp_div_srt_ext1_w_rom_mux_w_range1342w(0) AND wire_altfp_div_srt_ext1_w_rom_dffe_w9c_range1396w(i);
	END GENERATE loop87;
	wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1500w(0) <= NOT mux_remainder_w;
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1352w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1324w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1402w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1344w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1407w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1346w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1412w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1348w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1417w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1350w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1357w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1326w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1362w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1328w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1367w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1330w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1372w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1332w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1377w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1334w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1382w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1336w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1387w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1338w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1392w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1340w(0);
	wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1397w(0) <= NOT wire_altfp_div_srt_ext1_w_rom_mux_w_range1342w(0);
	added_remainder_w <= wire_altfp_div_csa25_result;
	divider <= divider_next_special_w;
	divider_dffe_w <= wire_srt_block_int11_divider_reg;
	divider_next_special_w <= divider_next_special_dffe;
	divider_next_w0c <= divider_dffe_w;
	divider_next_w10c <= wire_srt_block_int21_divider_reg;
	divider_next_w11c <= wire_srt_block_int22_divider_reg;
	divider_next_w12c <= wire_srt_block_int23_divider_reg;
	divider_next_w13c <= wire_srt_block_int24_divider_reg;
	divider_next_w1c <= wire_srt_block_int12_divider_reg;
	divider_next_w2c <= wire_srt_block_int13_divider_reg;
	divider_next_w3c <= wire_srt_block_int14_divider_reg;
	divider_next_w4c <= wire_srt_block_int15_divider_reg;
	divider_next_w5c <= wire_srt_block_int16_divider_reg;
	divider_next_w6c <= wire_srt_block_int17_divider_reg;
	divider_next_w7c <= wire_srt_block_int18_divider_reg;
	divider_next_w8c <= wire_srt_block_int19_divider_reg;
	divider_next_w9c <= wire_srt_block_int20_divider_reg;
	divider_w <= denom;
	full_neg_rom_w <= ( neg_rom_w0c & neg_rom_w1c & neg_rom_w2c & neg_rom_w3c & neg_rom_w4c & neg_rom_w5c & neg_rom_w6c & neg_rom_w7c & neg_rom_w8c & neg_rom_w9c & neg_rom_w10c & neg_rom_w11c & neg_rom_w12c & neg_rom_w13c);
	full_pos_rom_w <= ( pos_rom_w0c & pos_rom_w1c & pos_rom_w2c & pos_rom_w3c & pos_rom_w4c & pos_rom_w5c & pos_rom_w6c & pos_rom_w7c & pos_rom_w8c & pos_rom_w9c & pos_rom_w10c & pos_rom_w11c & pos_rom_w12c & pos_rom_w13c);
	mux_remainder_w <= ((Rk_remainder_special_w(26) OR Rk_remainder_special_w(25)) OR Rk_remainder_special_w(24));
	neg_rom_w0c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1324w1352w1422w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1421w);
	neg_rom_w10c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1344w1402w1452w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1451w);
	neg_rom_w11c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1346w1407w1455w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1454w);
	neg_rom_w12c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1348w1412w1458w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1457w);
	neg_rom_w13c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1350w1417w1461w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1460w);
	neg_rom_w1c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1326w1357w1425w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1424w);
	neg_rom_w2c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1328w1362w1428w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1427w);
	neg_rom_w3c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1330w1367w1431w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1430w);
	neg_rom_w4c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1332w1372w1434w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1433w);
	neg_rom_w5c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1334w1377w1437w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1436w);
	neg_rom_w6c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1336w1382w1440w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1439w);
	neg_rom_w7c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1338w1387w1443w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1442w);
	neg_rom_w8c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1340w1392w1446w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1445w);
	neg_rom_w9c <= (wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1342w1397w1449w OR wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1448w);
	pos_rom_w0c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1324w1354w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1324w1352w1353w);
	pos_rom_w10c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1344w1404w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1344w1402w1403w);
	pos_rom_w11c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1346w1409w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1346w1407w1408w);
	pos_rom_w12c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1348w1414w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1348w1412w1413w);
	pos_rom_w13c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1350w1419w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1350w1417w1418w);
	pos_rom_w1c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1326w1359w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1326w1357w1358w);
	pos_rom_w2c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1328w1364w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1328w1362w1363w);
	pos_rom_w3c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1330w1369w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1330w1367w1368w);
	pos_rom_w4c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1332w1374w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1332w1372w1373w);
	pos_rom_w5c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1334w1379w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1334w1377w1378w);
	pos_rom_w6c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1336w1384w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1336w1382w1383w);
	pos_rom_w7c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1338w1389w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1338w1387w1388w);
	pos_rom_w8c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1340w1394w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1340w1392w1393w);
	pos_rom_w9c <= (wire_altfp_div_srt_ext1_w_lg_w_rom_mux_w_range1342w1399w OR wire_altfp_div_srt_ext1_w_lg_w_lg_w_rom_mux_w_range1342w1397w1398w);
	quotient <= true_quotient_w;
	remain <= Rk_remainder_w;
	Rk_next0_w <= wire_srt_block_int11_Rk_next;
	Rk_next_w0c <= Rk_next0_w;
	Rk_next_w10c <= wire_srt_block_int21_Rk_next;
	Rk_next_w11c <= wire_srt_block_int22_Rk_next;
	Rk_next_w12c <= wire_srt_block_int23_Rk_next;
	Rk_next_w13c <= wire_srt_block_int24_Rk_next;
	Rk_next_w1c <= wire_srt_block_int12_Rk_next;
	Rk_next_w2c <= wire_srt_block_int13_Rk_next;
	Rk_next_w3c <= wire_srt_block_int14_Rk_next;
	Rk_next_w4c <= wire_srt_block_int15_Rk_next;
	Rk_next_w5c <= wire_srt_block_int16_Rk_next;
	Rk_next_w6c <= wire_srt_block_int17_Rk_next;
	Rk_next_w7c <= wire_srt_block_int18_Rk_next;
	Rk_next_w8c <= wire_srt_block_int19_Rk_next;
	Rk_next_w9c <= wire_srt_block_int20_Rk_next;
	Rk_remainder_special_w <= Rk_remainder_special_dffe;
	Rk_remainder_w <= (wire_altfp_div_srt_ext1_w_lg_w_lg_mux_remainder_w1500w1501w OR wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1499w);
	Rk_w <= numer;
	rom_dffe_w0c <= ( "0" & rom_reg_dffe0c(49 DOWNTO 48));
	rom_dffe_w10c <= rom_reg_dffe10c(14 DOWNTO 12);
	rom_dffe_w11c <= rom_reg_dffe11c(8 DOWNTO 6);
	rom_dffe_w12c <= rom_reg_dffe12c(2 DOWNTO 0);
	rom_dffe_w13c <= rom_out_w13c;
	rom_dffe_w1c <= rom_reg_dffe1c(68 DOWNTO 66);
	rom_dffe_w2c <= rom_reg_dffe2c(62 DOWNTO 60);
	rom_dffe_w3c <= rom_reg_dffe3c(56 DOWNTO 54);
	rom_dffe_w4c <= rom_reg_dffe4c(50 DOWNTO 48);
	rom_dffe_w5c <= rom_reg_dffe5c(44 DOWNTO 42);
	rom_dffe_w6c <= rom_reg_dffe6c(38 DOWNTO 36);
	rom_dffe_w7c <= rom_reg_dffe7c(32 DOWNTO 30);
	rom_dffe_w8c <= rom_reg_dffe8c(26 DOWNTO 24);
	rom_dffe_w9c <= rom_reg_dffe9c(20 DOWNTO 18);
	rom_mux_w <= ( rom_dffe_w13c(2) & rom_dffe_w12c(2) & rom_dffe_w11c(2) & rom_dffe_w10c(2) & rom_dffe_w9c(2) & rom_dffe_w8c(2) & rom_dffe_w7c(2) & rom_dffe_w6c(2) & rom_dffe_w5c(2) & rom_dffe_w4c(2) & rom_dffe_w3c(2) & rom_dffe_w2c(2) & rom_dffe_w1c(2) & rom_dffe_w0c(2));
	rom_out_1a_w <= wire_srt_block_int11_rom;
	rom_out_w0c <= rom_out_1a_w;
	rom_out_w10c <= wire_srt_block_int21_rom;
	rom_out_w11c <= wire_srt_block_int22_rom;
	rom_out_w12c <= wire_srt_block_int23_rom;
	rom_out_w13c <= wire_srt_block_int24_rom;
	rom_out_w1c <= wire_srt_block_int12_rom;
	rom_out_w2c <= wire_srt_block_int13_rom;
	rom_out_w3c <= wire_srt_block_int14_rom;
	rom_out_w4c <= wire_srt_block_int15_rom;
	rom_out_w5c <= wire_srt_block_int16_rom;
	rom_out_w6c <= wire_srt_block_int17_rom;
	rom_out_w7c <= wire_srt_block_int18_rom;
	rom_out_w8c <= wire_srt_block_int19_rom;
	rom_out_w9c <= wire_srt_block_int20_rom;
	srt_adjust_w <= wire_altfp_div_csa26_result;
	srt_adjusted_w <= wire_altfp_div_csa27_result;
	true_quotient_w <= (wire_altfp_div_srt_ext1_w_lg_w_lg_mux_remainder_w1500w1504w OR wire_altfp_div_srt_ext1_w_lg_mux_remainder_w1503w);
	value_one_w <= "0000000000000000000000000001";
	zero_quotient_w <= (OTHERS => '0');
	wire_altfp_div_srt_ext1_w_Rk_remainder_special_w_range1498w <= Rk_remainder_special_w(23 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w0c_range1311w <= rom_dffe_w0c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w10c_range1401w <= rom_dffe_w10c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w11c_range1406w <= rom_dffe_w11c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w12c_range1411w <= rom_dffe_w12c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w13c_range1416w <= rom_dffe_w13c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w1c_range1356w <= rom_dffe_w1c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w2c_range1361w <= rom_dffe_w2c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w3c_range1366w <= rom_dffe_w3c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w4c_range1371w <= rom_dffe_w4c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w5c_range1376w <= rom_dffe_w5c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w6c_range1381w <= rom_dffe_w6c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w7c_range1386w <= rom_dffe_w7c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w8c_range1391w <= rom_dffe_w8c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_dffe_w9c_range1396w <= rom_dffe_w9c(1 DOWNTO 0);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1324w(0) <= rom_mux_w(0);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1344w(0) <= rom_mux_w(10);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1346w(0) <= rom_mux_w(11);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1348w(0) <= rom_mux_w(12);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1350w(0) <= rom_mux_w(13);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1326w(0) <= rom_mux_w(1);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1328w(0) <= rom_mux_w(2);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1330w(0) <= rom_mux_w(3);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1332w(0) <= rom_mux_w(4);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1334w(0) <= rom_mux_w(5);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1336w(0) <= rom_mux_w(6);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1338w(0) <= rom_mux_w(7);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1340w(0) <= rom_mux_w(8);
	wire_altfp_div_srt_ext1_w_rom_mux_w_range1342w(0) <= rom_mux_w(9);
	altfp_div_csa25 :  cpu_fpoint_div_single_altfp_div_csa_mke
	  PORT MAP ( 
		dataa => Rk_remainder_special_w(23 DOWNTO 0),
		datab => divider_next_special_w,
		result => wire_altfp_div_csa25_result
	  );
	altfp_div_csa26 :  cpu_fpoint_div_single_altfp_div_csa_2jh
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		dataa => full_pos_rom_w,
		datab => full_neg_rom_w,
		result => wire_altfp_div_csa26_result
	  );
	altfp_div_csa27 :  cpu_fpoint_div_single_altfp_div_csa_rle
	  PORT MAP ( 
		dataa => srt_adjust_w,
		datab => value_one_w,
		result => wire_altfp_div_csa27_result
	  );
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_next_special_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN divider_next_special_dffe <= divider_next_w13c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN Rk_remainder_special_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN Rk_remainder_special_dffe <= Rk_next_w13c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe0c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe0c <= ( rom_reg_dffe0c(47 DOWNTO 0) & rom_out_w0c(1 DOWNTO 0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe10c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe10c <= ( rom_reg_dffe10c(11 DOWNTO 0) & rom_out_w10c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe11c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe11c <= ( rom_reg_dffe11c(5 DOWNTO 0) & rom_out_w11c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe12c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe12c <= ( rom_out_w12c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe1c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe1c <= ( rom_reg_dffe1c(65 DOWNTO 0) & rom_out_w1c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe2c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe2c <= ( rom_reg_dffe2c(59 DOWNTO 0) & rom_out_w2c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe3c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe3c <= ( rom_reg_dffe3c(53 DOWNTO 0) & rom_out_w3c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe4c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe4c <= ( rom_reg_dffe4c(47 DOWNTO 0) & rom_out_w4c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe5c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe5c <= ( rom_reg_dffe5c(41 DOWNTO 0) & rom_out_w5c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe6c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe6c <= ( rom_reg_dffe6c(35 DOWNTO 0) & rom_out_w6c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe7c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe7c <= ( rom_reg_dffe7c(29 DOWNTO 0) & rom_out_w7c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe8c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe8c <= ( rom_reg_dffe8c(23 DOWNTO 0) & rom_out_w8c);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rom_reg_dffe9c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clken = '1') THEN rom_reg_dffe9c <= ( rom_reg_dffe9c(17 DOWNTO 0) & rom_out_w9c);
			END IF;
		END IF;
	END PROCESS;
	srt_block_int11 :  cpu_fpoint_div_single_srt_block_int_h0n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_w,
		divider_reg => wire_srt_block_int11_divider_reg,
		Rk => Rk_w,
		Rk_next => wire_srt_block_int11_Rk_next,
		rom => wire_srt_block_int11_rom
	  );
	srt_block_int12 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w0c,
		divider_reg => wire_srt_block_int12_divider_reg,
		Rk => Rk_next_w0c,
		Rk_next => wire_srt_block_int12_Rk_next,
		rom => wire_srt_block_int12_rom
	  );
	srt_block_int13 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w1c,
		divider_reg => wire_srt_block_int13_divider_reg,
		Rk => Rk_next_w1c,
		Rk_next => wire_srt_block_int13_Rk_next,
		rom => wire_srt_block_int13_rom
	  );
	srt_block_int14 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w2c,
		divider_reg => wire_srt_block_int14_divider_reg,
		Rk => Rk_next_w2c,
		Rk_next => wire_srt_block_int14_Rk_next,
		rom => wire_srt_block_int14_rom
	  );
	srt_block_int15 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w3c,
		divider_reg => wire_srt_block_int15_divider_reg,
		Rk => Rk_next_w3c,
		Rk_next => wire_srt_block_int15_Rk_next,
		rom => wire_srt_block_int15_rom
	  );
	srt_block_int16 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w4c,
		divider_reg => wire_srt_block_int16_divider_reg,
		Rk => Rk_next_w4c,
		Rk_next => wire_srt_block_int16_Rk_next,
		rom => wire_srt_block_int16_rom
	  );
	srt_block_int17 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w5c,
		divider_reg => wire_srt_block_int17_divider_reg,
		Rk => Rk_next_w5c,
		Rk_next => wire_srt_block_int17_Rk_next,
		rom => wire_srt_block_int17_rom
	  );
	srt_block_int18 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w6c,
		divider_reg => wire_srt_block_int18_divider_reg,
		Rk => Rk_next_w6c,
		Rk_next => wire_srt_block_int18_Rk_next,
		rom => wire_srt_block_int18_rom
	  );
	srt_block_int19 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w7c,
		divider_reg => wire_srt_block_int19_divider_reg,
		Rk => Rk_next_w7c,
		Rk_next => wire_srt_block_int19_Rk_next,
		rom => wire_srt_block_int19_rom
	  );
	srt_block_int20 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w8c,
		divider_reg => wire_srt_block_int20_divider_reg,
		Rk => Rk_next_w8c,
		Rk_next => wire_srt_block_int20_Rk_next,
		rom => wire_srt_block_int20_rom
	  );
	srt_block_int21 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w9c,
		divider_reg => wire_srt_block_int21_divider_reg,
		Rk => Rk_next_w9c,
		Rk_next => wire_srt_block_int21_Rk_next,
		rom => wire_srt_block_int21_rom
	  );
	srt_block_int22 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w10c,
		divider_reg => wire_srt_block_int22_divider_reg,
		Rk => Rk_next_w10c,
		Rk_next => wire_srt_block_int22_Rk_next,
		rom => wire_srt_block_int22_rom
	  );
	srt_block_int23 :  cpu_fpoint_div_single_srt_block_int_p2n
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w11c,
		divider_reg => wire_srt_block_int23_divider_reg,
		Rk => Rk_next_w11c,
		Rk_next => wire_srt_block_int23_Rk_next,
		rom => wire_srt_block_int23_rom
	  );
	srt_block_int24 :  cpu_fpoint_div_single_srt_block_int_0tm
	  PORT MAP ( 
		aclr => aclr,
		clken => clken,
		clock => clock,
		divider => divider_next_w12c,
		divider_reg => wire_srt_block_int24_divider_reg,
		Rk => Rk_next_w12c,
		Rk_next => wire_srt_block_int24_Rk_next,
		rom => wire_srt_block_int24_rom
	  );

 END RTL; --cpu_fpoint_div_single_altfp_div_srt_ext_mkh

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = lpm_add_sub 181 lpm_compare 62 lpm_mux 28 reg 4070 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  cpu_fpoint_div_single IS 
	 PORT 
	 ( 
		 aclr	:	IN  STD_LOGIC := '0';
		 clk_en	:	IN  STD_LOGIC := '1';
		 clock	:	IN  STD_LOGIC;
		 dataa	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 datab	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END cpu_fpoint_div_single;

 ARCHITECTURE RTL OF cpu_fpoint_div_single IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_altfp_div_csa8_cout	:	STD_LOGIC;
	 SIGNAL  wire_altfp_div_csa8_result	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_divider	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_quotient	:	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  wire_altfp_div_srt_ext1_remain	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL	 and_or_dffe	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_dffe1a	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_dffe3a	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline0c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline10c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline11c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline12c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline13c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline14c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline15c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline16c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline17c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline18c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline19c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline1c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline20c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline21c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline22c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline23c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline24c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline25c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline26c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline27c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline2c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline3c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline4c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline5c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline6c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline7c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline8c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 and_or_pipeline9c	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 bias_addition_overf_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_bias_addition_overf_dffe_w_lg_q781w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 divider_pipe1a	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_a_and_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_a_b_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_a_dffe	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_a_or_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_exp_a_or_dffe_w_lg_q629w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 exp_b_and_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_b_dffe	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_b_or_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_exp_b_or_dffe_w_lg_q632w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 exp_dffe1a	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_dffe2a	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline0c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline10c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline11c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline12c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline13c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline14c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline15c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline16c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline17c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline18c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline19c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline1c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline20c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline21c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline22c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline23c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline24c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline25c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline26c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline2c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline3c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline4c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline5c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline6c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline7c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline8c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_pipeline9c	:	STD_LOGIC_VECTOR(8 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 exp_res_pipe3	:	STD_LOGIC_VECTOR(7 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 implied_bit	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 implied_bit2a	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_a_and_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_a_dffe	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_a_or_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_man_a_or_dffe_w_lg_q635w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 man_b_and_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_b_dffe	:	STD_LOGIC_VECTOR(22 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 man_b_or_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_man_b_or_dffe_w_lg_q638w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 man_res_pipe3	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 quotient_pipe1a	:	STD_LOGIC_VECTOR(27 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 remainder_pipe1a	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 result_output_dffe	:	STD_LOGIC_VECTOR(31 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rnd_overflow_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 rnded_man_pipe2a	:	STD_LOGIC_VECTOR(23 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_a_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_b_dffe	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline0c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline10c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline11c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline12c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline13c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline14c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline15c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline16c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline17c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline18c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline19c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline1c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline20c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline21c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline22c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline23c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline24c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline25c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline26c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline27c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline2c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline3c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline4c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline5c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline6c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline7c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline8c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_div_pipeline9c	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_pipe1a	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_pipe2a	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 sign_pipe3a	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_add_sub10_overflow	:	STD_LOGIC;
	 SIGNAL  wire_add_sub10_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_add_sub9_result	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_cmpr2_aeb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr2_agb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr3_aeb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr3_agb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr4_aeb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr4_agb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr5_ageb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr6_aeb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr6_agb	:	STD_LOGIC;
	 SIGNAL  wire_cmpr7_ageb	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_lg_w_lg_bias_addition_overf_w521w524w525w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_bias_addition_overf_w521w522w523w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_guard_bit_dffe1a_w446w447w448w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_mux1_exp_s1a478w481w482w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_mux1_exp_s1a478w479w480w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_bias_addition_overf_w519w520w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_mux1_exp_s1a476w477w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_mux1_exp_s1a473w474w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_bias_addition_overf_w521w524w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_bias_addition_overf_w521w522w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_S0329w333w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_S0329w330w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_S0329w337w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_S0329w335w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_S0329w353w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_datab_S0339w343w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_datab_S0339w340w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_datab_S0339w347w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_datab_S0339w345w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_datab_S0339w361w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_a_b_w487w488w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_guard_bit_dffe1a_w446w447w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_infinite_w800w801w	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_mux1_exp_s1a478w481w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_mux1_exp_s1a478w479w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_mux_zero_non_zero_S0590w591w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_nan_w780w808w	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_not_exp_res_int2_or_res_w620w621w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_not_exp_res_int2_or_res_w620w624w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_quo_msb_m1_w380w436w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_quo_msb_m1_w380w381w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_quo_msb_m1_w380w439w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_quo_msb_m1_w380w442w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_rnd_overflow457w458w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_zero_w804w805w	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_w_lg_bias_addition_overf_w519w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_dataa_S0354w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_lg_datab_S0362w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_a_b_w486w	:	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_a_non_zero_w643w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_b_non_zero_w652w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_infi_bus_w586w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_infinite_w802w	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_w_lg_mux1_exp_s1a476w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_mux1_exp_s1a473w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_mux_zero_non_zero_S0592w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_nan_w809w	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_w_lg_not_exp_res_int2_or_res_w625w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_not_exp_res_int2_or_res_w622w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_quo_msb_m1_w382w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w_lg_rnd_overflow459w	:	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  wire_w411w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_zero_w806w	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range26w28w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range29w30w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range31w32w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range33w34w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range35w36w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range37w38w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_and_w_range39w40w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range67w69w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range70w71w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range72w73w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range74w75w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range76w77w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range78w79w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_and_w_range80w81w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range492w495w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range496w498w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range499w501w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range502w504w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range505w507w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range508w510w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_bias_and_w_range511w513w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range680w683w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range684w686w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range687w689w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range690w692w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range693w695w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range696w698w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_and_w_range699w701w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range153w155w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range174w175w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range176w177w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range178w179w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range180w181w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range182w183w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range184w185w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range186w187w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range188w189w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range190w191w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range192w193w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range156w157w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range194w195w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range196w197w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range158w159w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range160w161w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range162w163w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range164w165w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range166w167w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range168w169w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range170w171w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_and_w_range172w173w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range269w271w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range290w291w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range292w293w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range294w295w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range296w297w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range298w299w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range300w301w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range302w303w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range304w305w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range306w307w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range308w309w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range272w273w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range310w311w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range312w313w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range274w275w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range276w277w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range278w279w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range280w281w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range282w283w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range284w285w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range286w287w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_and_w_range288w289w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range562w565w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range566w568w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range569w571w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range572w574w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range575w577w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range578w580w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_infi_and_w_range581w583w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_bias_addition_overf_w521w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_dataa_S0329w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_datab_S0339w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_a_b_w487w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_a_one_w640w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_a_or_msb_w325w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_b_one_w649w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_b_or_msb_w327w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_sign_w516w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_guard_bit_dffe1a_w446w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_infi_combi_w779w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_infinite_w800w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_mux1_exp_s0a475w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_mux1_exp_s1a478w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_mux_zero_non_zero_S0590w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_nan_w780w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_not_exp_res_int2_or_res_w620w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_quo_msb_m1_w380w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rnd_overflow457w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_zero_dataa_w775w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_zero_w804w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range772w773w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_dataa_S0354w355w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_datab_S0362w363w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_exp_zero_bus_w587w588w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_man_a_zero_w641w642w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_man_b_zero_w650w651w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_exp_zero_bus_w587w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_man_a_zero_w641w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_man_b_zero_w650w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w412w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range3w6w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range7w9w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range10w12w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range13w15w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range16w18w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range19w21w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_a_or_w_range22w24w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range44w47w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range48w50w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range51w53w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range54w56w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range57w59w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range60w62w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_b_or_w_range63w65w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_higher_or_range531w534w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range596w599w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range600w602w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range603w605w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range606w608w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range609w611w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range612w614w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_exp_res_int2_or_w_range615w617w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range85w88w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range116w118w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range119w121w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range122w124w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range125w127w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range128w130w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range131w133w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range134w136w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range137w139w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range140w142w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range143w145w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range89w91w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range146w148w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range149w151w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range92w94w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range95w97w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range98w100w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range101w103w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range104w106w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range107w109w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range110w112w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_a_or_w_range113w115w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range201w204w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range232w234w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range235w237w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range238w240w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range241w243w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range244w246w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range247w249w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range250w252w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range253w255w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range256w258w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range259w261w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range205w207w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range262w264w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range265w267w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range208w210w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range211w213w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range214w216w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range217w219w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range220w222w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range223w225w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range226w228w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_b_or_w_range229w231w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range705w708w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range736w738w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range739w741w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range742w744w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range745w747w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range748w750w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range751w753w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range754w756w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range757w759w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range760w762w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range763w765w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range709w711w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range766w768w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range769w771w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range712w714w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range715w717w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range718w720w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range721w723w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range724w726w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range727w729w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range730w732w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_man_res_or_w_range733w735w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range537w540w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range541w543w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range544w546w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range547w549w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range550w552w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range553w555w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_norm_zero_or_w_range556w558w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sticky_bit_quo_msb_m1_or_range388w391w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  add_1_dataa_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  add_1_datab_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  add_1_w :	STD_LOGIC;
	 SIGNAL  add_one_process_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  and_or_dffe1a_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  and_or_dffe3a_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  and_or_dffe_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  and_or_int_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  and_or_pipeline_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  bias_add_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  bias_addition_overf_w :	STD_LOGIC;
	 SIGNAL  bias_addition_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  bias_value_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  checked_quotient_dffe1a_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  checked_quotient_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  dataa_exp_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  dataa_int :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  dataa_man_bus_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  dataa_S0 :	STD_LOGIC;
	 SIGNAL  datab_exp_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  datab_int :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  datab_man_bus_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  datab_S0 :	STD_LOGIC;
	 SIGNAL  divider_srt_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  exp_a_and_msb2_w :	STD_LOGIC;
	 SIGNAL  exp_a_and_msb_w :	STD_LOGIC;
	 SIGNAL  exp_a_and_mux_w :	STD_LOGIC;
	 SIGNAL  exp_a_and_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_a_b_w :	STD_LOGIC;
	 SIGNAL  exp_a_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_a_non_zero_w :	STD_LOGIC;
	 SIGNAL  exp_a_one_w :	STD_LOGIC;
	 SIGNAL  exp_a_or_msb2_w :	STD_LOGIC;
	 SIGNAL  exp_a_or_msb_w :	STD_LOGIC;
	 SIGNAL  exp_a_or_mux_w :	STD_LOGIC;
	 SIGNAL  exp_a_or_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_a_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_a_zero_w :	STD_LOGIC;
	 SIGNAL  exp_b_and_msb2_w :	STD_LOGIC;
	 SIGNAL  exp_b_and_msb_w :	STD_LOGIC;
	 SIGNAL  exp_b_and_mux_w :	STD_LOGIC;
	 SIGNAL  exp_b_and_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_b_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_b_non_zero_w :	STD_LOGIC;
	 SIGNAL  exp_b_one_w :	STD_LOGIC;
	 SIGNAL  exp_b_or_msb2_w :	STD_LOGIC;
	 SIGNAL  exp_b_or_msb_w :	STD_LOGIC;
	 SIGNAL  exp_b_or_mux_w :	STD_LOGIC;
	 SIGNAL  exp_b_or_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_b_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_b_zero_w :	STD_LOGIC;
	 SIGNAL  exp_bias_and_res_w :	STD_LOGIC;
	 SIGNAL  exp_bias_and_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_bias_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_dffe1a_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_dffe2a_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_exc_ones_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_exc_zeros_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_higher_bit :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_higher_or :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  exp_infi_bus_w :	STD_LOGIC;
	 SIGNAL  exp_man_and_or_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_or_result_w :	STD_LOGIC;
	 SIGNAL  exp_pipeline_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_res_and_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_int2_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_int2_or_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_int2_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_int_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_res_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  exp_sign_w :	STD_LOGIC;
	 SIGNAL  exp_sub_a_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_sub_b_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_sub_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  exp_zero_bus_w :	STD_LOGIC;
	 SIGNAL  guard_bit_dffe1a_w :	STD_LOGIC;
	 SIGNAL  guard_bit_quo_msb_m1 :	STD_LOGIC;
	 SIGNAL  guard_bit_quo_msb_m2 :	STD_LOGIC;
	 SIGNAL  guard_bit_w :	STD_LOGIC;
	 SIGNAL  infi_combi_w :	STD_LOGIC;
	 SIGNAL  infi_dataa_w :	STD_LOGIC;
	 SIGNAL  infi_datab_w :	STD_LOGIC;
	 SIGNAL  infi_res_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  infinite_int_w :	STD_LOGIC;
	 SIGNAL  infinite_w :	STD_LOGIC;
	 SIGNAL  man_24_zeros_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_a_and_msb2_w :	STD_LOGIC;
	 SIGNAL  man_a_and_msb_w :	STD_LOGIC;
	 SIGNAL  man_a_and_mux_w :	STD_LOGIC;
	 SIGNAL  man_a_and_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_a_bus_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_a_int_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_a_non_zero_w :	STD_LOGIC;
	 SIGNAL  man_a_one_w :	STD_LOGIC;
	 SIGNAL  man_a_or_msb2_w :	STD_LOGIC;
	 SIGNAL  man_a_or_msb_w :	STD_LOGIC;
	 SIGNAL  man_a_or_mux_w :	STD_LOGIC;
	 SIGNAL  man_a_or_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_a_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_a_zero_w :	STD_LOGIC;
	 SIGNAL  man_b_and_msb2_w :	STD_LOGIC;
	 SIGNAL  man_b_and_msb_w :	STD_LOGIC;
	 SIGNAL  man_b_and_mux_w :	STD_LOGIC;
	 SIGNAL  man_b_and_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_b_bus_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_b_int_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_b_non_zero_w :	STD_LOGIC;
	 SIGNAL  man_b_one_w :	STD_LOGIC;
	 SIGNAL  man_b_or_msb2_w :	STD_LOGIC;
	 SIGNAL  man_b_or_msb_w :	STD_LOGIC;
	 SIGNAL  man_b_or_mux_w :	STD_LOGIC;
	 SIGNAL  man_b_or_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_b_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_b_zero_w :	STD_LOGIC;
	 SIGNAL  man_exc_nan_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_exc_zeros_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_res_bus_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_res_int2_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_res_int_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  man_res_or_w :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  man_res_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  mux1_exp_s0a :	STD_LOGIC;
	 SIGNAL  mux1_exp_s1a :	STD_LOGIC;
	 SIGNAL  mux_1_res_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  mux_2_res_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  mux_3_res_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  mux_zero_non_zero_S0 :	STD_LOGIC;
	 SIGNAL  mux_zero_non_zero_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  nan_dataa_w :	STD_LOGIC;
	 SIGNAL  nan_datab_w :	STD_LOGIC;
	 SIGNAL  nan_res_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  nan_w :	STD_LOGIC;
	 SIGNAL  norm_dataa_w :	STD_LOGIC;
	 SIGNAL  norm_datab_w :	STD_LOGIC;
	 SIGNAL  norm_infi_and_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  norm_infi_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  norm_res_int_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  norm_zero_bus_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  norm_zero_or_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  not_bias_addition_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  not_exp_res_int2_or_res_w :	STD_LOGIC;
	 SIGNAL  overflow_int_w :	STD_LOGIC;
	 SIGNAL  overflow_man_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  overflow_ones_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  quo_msb_m1_compare_dataa :	STD_LOGIC_VECTOR (52 DOWNTO 0);
	 SIGNAL  quo_msb_m1_compare_datab :	STD_LOGIC_VECTOR (52 DOWNTO 0);
	 SIGNAL  quo_msb_m1_compare_w :	STD_LOGIC;
	 SIGNAL  quo_msb_m1_w :	STD_LOGIC;
	 SIGNAL  quo_msb_m2_compare_dataa :	STD_LOGIC_VECTOR (53 DOWNTO 0);
	 SIGNAL  quo_msb_m2_compare_datab :	STD_LOGIC_VECTOR (53 DOWNTO 0);
	 SIGNAL  quo_msb_m2_compare_w :	STD_LOGIC;
	 SIGNAL  quotient_msb_m1_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  quotient_msb_m2_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  quotient_w :	STD_LOGIC_VECTOR (27 DOWNTO 0);
	 SIGNAL  remainder_srt_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  res_rnded_man_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  rnd_add_overf_w :	STD_LOGIC;
	 SIGNAL  rnd_overflow :	STD_LOGIC;
	 SIGNAL  rnded_man_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  round_bit_dffe1a_w :	STD_LOGIC;
	 SIGNAL  round_bit_quo_msb_m1 :	STD_LOGIC;
	 SIGNAL  round_bit_quo_msb_m2 :	STD_LOGIC;
	 SIGNAL  round_bit_w :	STD_LOGIC;
	 SIGNAL  sign_a_w :	STD_LOGIC;
	 SIGNAL  sign_b_w :	STD_LOGIC;
	 SIGNAL  sign_div :	STD_LOGIC;
	 SIGNAL  sign_div_pipeline_w :	STD_LOGIC;
	 SIGNAL  sign_exc_bit_w :	STD_LOGIC;
	 SIGNAL  signed_N_exp_h_or :	STD_LOGIC;
	 SIGNAL  sticky_bit_dffe1a_w :	STD_LOGIC;
	 SIGNAL  sticky_bit_quo_msb_m1 :	STD_LOGIC;
	 SIGNAL  sticky_bit_quo_msb_m1_bit :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  sticky_bit_quo_msb_m1_or :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  sticky_bit_quo_msb_m1_tmp :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  sticky_bit_quo_msb_m2 :	STD_LOGIC;
	 SIGNAL  sticky_bit_quo_msb_m2_bit :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  sticky_bit_quo_msb_m2_or :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  sticky_bit_quo_msb_m2_tmp :	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  sticky_bit_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_lower_lower_ageb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_lower_upper_aeb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_lower_upper_agb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_upper_lower_aeb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_upper_lower_agb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_upper_upper_aeb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m1_comparator_upper_upper_agb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m2_comparator_lower_ageb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m2_comparator_upper_aeb_w :	STD_LOGIC;
	 SIGNAL  sticky_quo_msb_m2_comparator_upper_agb_w :	STD_LOGIC;
	 SIGNAL  underflow_zeros_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  value_add_1_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  value_minus_1_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  value_normal_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  value_zero_w :	STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL  zero_bit_23_w :	STD_LOGIC_VECTOR (23 DOWNTO 0);
	 SIGNAL  zero_bit_31_w :	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  zero_bit_8_w :	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  zero_bit_w :	STD_LOGIC;
	 SIGNAL  zero_dataa_w :	STD_LOGIC;
	 SIGNAL  zero_datab_w :	STD_LOGIC;
	 SIGNAL  zero_res_w :	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  zero_w :	STD_LOGIC;
	 SIGNAL  wire_w_dataa_range352w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_dataa_int_range366w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_dataa_int_range365w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_datab_range360w	:	STD_LOGIC_VECTOR (30 DOWNTO 0);
	 SIGNAL  wire_w_datab_int_range368w	:	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  wire_w_datab_int_range367w	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range26w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range29w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range31w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range33w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range35w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range37w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_and_w_range39w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range5w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range8w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range11w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range14w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range17w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range20w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_bus_w_range23w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range3w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range7w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range10w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range13w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range16w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range19w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_a_or_w_range22w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range67w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range70w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range72w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range74w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range76w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range78w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_and_w_range80w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range46w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range49w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range52w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range55w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range58w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range61w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_bus_w_range64w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range44w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range48w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range51w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range54w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range57w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range60w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_b_or_w_range63w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range492w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range496w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range499w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range502w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range505w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range508w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_and_w_range511w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range494w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range497w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range500w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range503w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range506w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range509w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_bias_bus_w_range512w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_higher_bit_range533w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_higher_or_range531w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range680w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range684w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range687w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range690w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range693w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range696w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range699w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_and_w_range702w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range682w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range685w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range688w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range691w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range694w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range697w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_bus_w_range700w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range598w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range601w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range604w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range607w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range610w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range613w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_bus_w_range616w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range596w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range600w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range603w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range606w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range609w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range612w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_exp_res_int2_or_w_range615w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range153w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range174w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range176w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range178w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range180w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range182w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range184w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range186w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range188w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range190w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range192w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range156w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range194w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range196w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range158w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range160w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range162w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range164w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range166w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range168w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range170w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_and_w_range172w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range114w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range117w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range129w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range132w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range135w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range138w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range141w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range87w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range150w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range90w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range93w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range96w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range99w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range102w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range105w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range108w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_bus_w_range111w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range85w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range116w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range119w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range122w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range125w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range128w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range131w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range134w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range137w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range140w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range143w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range89w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range146w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range149w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range92w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range95w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range98w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range101w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range104w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range107w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range110w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_a_or_w_range113w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range269w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range290w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range292w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range294w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range296w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range298w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range300w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range302w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range304w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range306w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range308w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range272w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range310w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range312w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range274w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range276w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range278w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range280w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range282w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range284w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range286w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_and_w_range288w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range230w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range233w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range236w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range239w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range242w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range245w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range248w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range251w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range254w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range257w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range203w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range260w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range263w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range266w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range206w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range209w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range212w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range215w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range218w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range221w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range224w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_bus_w_range227w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range201w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range232w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range235w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range238w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range241w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range244w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range247w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range250w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range253w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range256w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range259w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range205w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range262w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range265w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range208w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range211w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range214w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range217w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range220w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range223w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range226w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_b_or_w_range229w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range734w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range737w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range740w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range743w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range746w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range749w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range752w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range755w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range758w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range761w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range707w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range764w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range767w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range770w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range710w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range713w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range716w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range719w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range722w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range725w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range728w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_bus_w_range731w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range705w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range736w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range739w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range742w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range745w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range748w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range751w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range754w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range757w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range760w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range763w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range709w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range766w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range769w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range772w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range712w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range715w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range718w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range721w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range724w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range727w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range730w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_man_res_or_w_range733w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range562w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range566w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range569w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range572w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range575w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range578w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_and_w_range581w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range564w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range567w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range570w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range573w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range576w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range579w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_infi_bus_w_range582w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range539w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range542w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range545w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range548w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range551w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range554w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_bus_w_range557w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range537w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range541w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range544w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range547w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range550w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range553w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_norm_zero_or_w_range556w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_quo_msb_m1_bit_range390w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sticky_bit_quo_msb_m1_or_range388w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  cpu_fpoint_div_single_altfp_div_csa_vhf
	 PORT
	 ( 
		cin	:	IN  STD_LOGIC := '0';
		cout	:	OUT  STD_LOGIC;
		dataa	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0) := (OTHERS => '0');
		result	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  cpu_fpoint_div_single_altfp_div_srt_ext_mkh
	 PORT
	 ( 
		aclr	:	IN  STD_LOGIC := '0';
		clken	:	IN  STD_LOGIC := '1';
		clock	:	IN  STD_LOGIC := '0';
		denom	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		divider	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0);
		numer	:	IN  STD_LOGIC_VECTOR(23 DOWNTO 0);
		quotient	:	OUT  STD_LOGIC_VECTOR(27 DOWNTO 0);
		remain	:	OUT  STD_LOGIC_VECTOR(23 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  lpm_add_sub
	 GENERIC 
	 (
		LPM_DIRECTION	:	STRING := "DEFAULT";
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "SIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_add_sub"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		add_sub	:	IN STD_LOGIC := '1';
		cin	:	IN STD_LOGIC := 'Z';
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		cout	:	OUT STD_LOGIC;
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		overflow	:	OUT STD_LOGIC;
		result	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0)
	 ); 
	 END COMPONENT;
	 COMPONENT  lpm_compare
	 GENERIC 
	 (
		LPM_PIPELINE	:	NATURAL := 0;
		LPM_REPRESENTATION	:	STRING := "UNSIGNED";
		LPM_WIDTH	:	NATURAL;
		lpm_hint	:	STRING := "UNUSED";
		lpm_type	:	STRING := "lpm_compare"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		aeb	:	OUT STD_LOGIC;
		agb	:	OUT STD_LOGIC;
		ageb	:	OUT STD_LOGIC;
		alb	:	OUT STD_LOGIC;
		aleb	:	OUT STD_LOGIC;
		aneb	:	OUT STD_LOGIC;
		clken	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC := '0';
		dataa	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		datab	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
 BEGIN

	loop88 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_w_lg_bias_addition_overf_w521w524w525w(i) <= wire_w_lg_w_lg_bias_addition_overf_w521w524w(0) AND bias_addition_w(i);
	END GENERATE loop88;
	loop89 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_w_lg_bias_addition_overf_w521w522w523w(i) <= wire_w_lg_w_lg_bias_addition_overf_w521w522w(0) AND underflow_zeros_w(i);
	END GENERATE loop89;
	wire_w_lg_w_lg_w_lg_guard_bit_dffe1a_w446w447w448w(0) <= wire_w_lg_w_lg_guard_bit_dffe1a_w446w447w(0) AND sticky_bit_dffe1a_w;
	loop90 : FOR i IN 0 TO 8 GENERATE 
		wire_w_lg_w_lg_w_lg_mux1_exp_s1a478w481w482w(i) <= wire_w_lg_w_lg_mux1_exp_s1a478w481w(0) AND value_minus_1_w(i);
	END GENERATE loop90;
	loop91 : FOR i IN 0 TO 8 GENERATE 
		wire_w_lg_w_lg_w_lg_mux1_exp_s1a478w479w480w(i) <= wire_w_lg_w_lg_mux1_exp_s1a478w479w(0) AND value_normal_w(i);
	END GENERATE loop91;
	loop92 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_bias_addition_overf_w519w520w(i) <= wire_w_lg_bias_addition_overf_w519w(0) AND overflow_ones_w(i);
	END GENERATE loop92;
	loop93 : FOR i IN 0 TO 8 GENERATE 
		wire_w_lg_w_lg_mux1_exp_s1a476w477w(i) <= wire_w_lg_mux1_exp_s1a476w(0) AND value_normal_w(i);
	END GENERATE loop93;
	loop94 : FOR i IN 0 TO 8 GENERATE 
		wire_w_lg_w_lg_mux1_exp_s1a473w474w(i) <= wire_w_lg_mux1_exp_s1a473w(0) AND value_add_1_w(i);
	END GENERATE loop94;
	wire_w_lg_w_lg_bias_addition_overf_w521w524w(0) <= wire_w_lg_bias_addition_overf_w521w(0) AND wire_w_lg_exp_sign_w516w(0);
	wire_w_lg_w_lg_bias_addition_overf_w521w522w(0) <= wire_w_lg_bias_addition_overf_w521w(0) AND exp_sign_w;
	wire_w_lg_w_lg_dataa_S0329w333w(0) <= wire_w_lg_dataa_S0329w(0) AND exp_a_and_msb_w;
	wire_w_lg_w_lg_dataa_S0329w330w(0) <= wire_w_lg_dataa_S0329w(0) AND exp_a_or_msb_w;
	wire_w_lg_w_lg_dataa_S0329w337w(0) <= wire_w_lg_dataa_S0329w(0) AND man_a_and_msb_w;
	wire_w_lg_w_lg_dataa_S0329w335w(0) <= wire_w_lg_dataa_S0329w(0) AND man_a_or_msb_w;
	loop95 : FOR i IN 0 TO 30 GENERATE 
		wire_w_lg_w_lg_dataa_S0329w353w(i) <= wire_w_lg_dataa_S0329w(0) AND wire_w_dataa_range352w(i);
	END GENERATE loop95;
	wire_w_lg_w_lg_datab_S0339w343w(0) <= wire_w_lg_datab_S0339w(0) AND exp_b_and_msb_w;
	wire_w_lg_w_lg_datab_S0339w340w(0) <= wire_w_lg_datab_S0339w(0) AND exp_b_or_msb_w;
	wire_w_lg_w_lg_datab_S0339w347w(0) <= wire_w_lg_datab_S0339w(0) AND man_b_and_msb_w;
	wire_w_lg_w_lg_datab_S0339w345w(0) <= wire_w_lg_datab_S0339w(0) AND man_b_or_msb_w;
	loop96 : FOR i IN 0 TO 30 GENERATE 
		wire_w_lg_w_lg_datab_S0339w361w(i) <= wire_w_lg_datab_S0339w(0) AND wire_w_datab_range360w(i);
	END GENERATE loop96;
	loop97 : FOR i IN 0 TO 8 GENERATE 
		wire_w_lg_w_lg_exp_a_b_w487w488w(i) <= wire_w_lg_exp_a_b_w487w(0) AND value_zero_w(i);
	END GENERATE loop97;
	wire_w_lg_w_lg_guard_bit_dffe1a_w446w447w(0) <= wire_w_lg_guard_bit_dffe1a_w446w(0) AND round_bit_dffe1a_w;
	loop98 : FOR i IN 0 TO 31 GENERATE 
		wire_w_lg_w_lg_infinite_w800w801w(i) <= wire_w_lg_infinite_w800w(0) AND norm_res_int_w(i);
	END GENERATE loop98;
	wire_w_lg_w_lg_mux1_exp_s1a478w481w(0) <= wire_w_lg_mux1_exp_s1a478w(0) AND wire_w_lg_mux1_exp_s0a475w(0);
	wire_w_lg_w_lg_mux1_exp_s1a478w479w(0) <= wire_w_lg_mux1_exp_s1a478w(0) AND mux1_exp_s0a;
	loop99 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_w_lg_mux_zero_non_zero_S0590w591w(i) <= wire_w_lg_mux_zero_non_zero_S0590w(0) AND res_rnded_man_w(i);
	END GENERATE loop99;
	loop100 : FOR i IN 0 TO 31 GENERATE 
		wire_w_lg_w_lg_nan_w780w808w(i) <= wire_w_lg_nan_w780w(0) AND mux_2_res_w(i);
	END GENERATE loop100;
	loop101 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_w_lg_not_exp_res_int2_or_res_w620w621w(i) <= wire_w_lg_not_exp_res_int2_or_res_w620w(0) AND exp_res_int2_w(i);
	END GENERATE loop101;
	loop102 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_w_lg_not_exp_res_int2_or_res_w620w624w(i) <= wire_w_lg_not_exp_res_int2_or_res_w620w(0) AND man_res_int2_w(i);
	END GENERATE loop102;
	wire_w_lg_w_lg_quo_msb_m1_w380w436w(0) <= wire_w_lg_quo_msb_m1_w380w(0) AND guard_bit_quo_msb_m2;
	loop103 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_w_lg_quo_msb_m1_w380w381w(i) <= wire_w_lg_quo_msb_m1_w380w(0) AND quotient_msb_m2_w(i);
	END GENERATE loop103;
	wire_w_lg_w_lg_quo_msb_m1_w380w439w(0) <= wire_w_lg_quo_msb_m1_w380w(0) AND round_bit_quo_msb_m2;
	wire_w_lg_w_lg_quo_msb_m1_w380w442w(0) <= wire_w_lg_quo_msb_m1_w380w(0) AND sticky_bit_quo_msb_m2;
	loop104 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_w_lg_rnd_overflow457w458w(i) <= wire_w_lg_rnd_overflow457w(0) AND add_one_process_w(i);
	END GENERATE loop104;
	loop105 : FOR i IN 0 TO 31 GENERATE 
		wire_w_lg_w_lg_zero_w804w805w(i) <= wire_w_lg_zero_w804w(0) AND mux_1_res_w(i);
	END GENERATE loop105;
	wire_w_lg_bias_addition_overf_w519w(0) <= bias_addition_overf_w AND wire_w_lg_exp_sign_w516w(0);
	loop106 : FOR i IN 0 TO 30 GENERATE 
		wire_w_lg_dataa_S0354w(i) <= dataa_S0 AND zero_bit_31_w(i);
	END GENERATE loop106;
	loop107 : FOR i IN 0 TO 30 GENERATE 
		wire_w_lg_datab_S0362w(i) <= datab_S0 AND zero_bit_31_w(i);
	END GENERATE loop107;
	loop108 : FOR i IN 0 TO 8 GENERATE 
		wire_w_lg_exp_a_b_w486w(i) <= exp_a_b_w AND bias_value_w(i);
	END GENERATE loop108;
	wire_w_lg_exp_a_non_zero_w643w(0) <= exp_a_non_zero_w AND wire_w_lg_w_lg_man_a_zero_w641w642w(0);
	wire_w_lg_exp_b_non_zero_w652w(0) <= exp_b_non_zero_w AND wire_w_lg_w_lg_man_b_zero_w650w651w(0);
	wire_w_lg_exp_infi_bus_w586w(0) <= exp_infi_bus_w AND wire_w_lg_exp_sign_w516w(0);
	loop109 : FOR i IN 0 TO 31 GENERATE 
		wire_w_lg_infinite_w802w(i) <= infinite_w AND infi_res_w(i);
	END GENERATE loop109;
	wire_w_lg_mux1_exp_s1a476w(0) <= mux1_exp_s1a AND wire_w_lg_mux1_exp_s0a475w(0);
	wire_w_lg_mux1_exp_s1a473w(0) <= mux1_exp_s1a AND mux1_exp_s0a;
	loop110 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_mux_zero_non_zero_S0592w(i) <= mux_zero_non_zero_S0 AND man_24_zeros_w(i);
	END GENERATE loop110;
	loop111 : FOR i IN 0 TO 31 GENERATE 
		wire_w_lg_nan_w809w(i) <= nan_w AND nan_res_w(i);
	END GENERATE loop111;
	loop112 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_not_exp_res_int2_or_res_w625w(i) <= not_exp_res_int2_or_res_w AND zero_bit_23_w(i);
	END GENERATE loop112;
	loop113 : FOR i IN 0 TO 7 GENERATE 
		wire_w_lg_not_exp_res_int2_or_res_w622w(i) <= not_exp_res_int2_or_res_w AND zero_bit_8_w(i);
	END GENERATE loop113;
	loop114 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_quo_msb_m1_w382w(i) <= quo_msb_m1_w AND quotient_msb_m1_w(i);
	END GENERATE loop114;
	loop115 : FOR i IN 0 TO 23 GENERATE 
		wire_w_lg_rnd_overflow459w(i) <= rnd_overflow AND overflow_man_w(i);
	END GENERATE loop115;
	wire_w411w(0) <= sticky_quo_msb_m1_comparator_upper_upper_aeb_w AND sticky_quo_msb_m1_comparator_upper_lower_agb_w;
	loop116 : FOR i IN 0 TO 31 GENERATE 
		wire_w_lg_zero_w806w(i) <= zero_w AND zero_res_w(i);
	END GENERATE loop116;
	wire_w_lg_w_exp_a_and_w_range26w28w(0) <= wire_w_exp_a_and_w_range26w(0) AND wire_w_exp_a_bus_w_range5w(0);
	wire_w_lg_w_exp_a_and_w_range29w30w(0) <= wire_w_exp_a_and_w_range29w(0) AND wire_w_exp_a_bus_w_range8w(0);
	wire_w_lg_w_exp_a_and_w_range31w32w(0) <= wire_w_exp_a_and_w_range31w(0) AND wire_w_exp_a_bus_w_range11w(0);
	wire_w_lg_w_exp_a_and_w_range33w34w(0) <= wire_w_exp_a_and_w_range33w(0) AND wire_w_exp_a_bus_w_range14w(0);
	wire_w_lg_w_exp_a_and_w_range35w36w(0) <= wire_w_exp_a_and_w_range35w(0) AND wire_w_exp_a_bus_w_range17w(0);
	wire_w_lg_w_exp_a_and_w_range37w38w(0) <= wire_w_exp_a_and_w_range37w(0) AND wire_w_exp_a_bus_w_range20w(0);
	wire_w_lg_w_exp_a_and_w_range39w40w(0) <= wire_w_exp_a_and_w_range39w(0) AND wire_w_exp_a_bus_w_range23w(0);
	wire_w_lg_w_exp_b_and_w_range67w69w(0) <= wire_w_exp_b_and_w_range67w(0) AND wire_w_exp_b_bus_w_range46w(0);
	wire_w_lg_w_exp_b_and_w_range70w71w(0) <= wire_w_exp_b_and_w_range70w(0) AND wire_w_exp_b_bus_w_range49w(0);
	wire_w_lg_w_exp_b_and_w_range72w73w(0) <= wire_w_exp_b_and_w_range72w(0) AND wire_w_exp_b_bus_w_range52w(0);
	wire_w_lg_w_exp_b_and_w_range74w75w(0) <= wire_w_exp_b_and_w_range74w(0) AND wire_w_exp_b_bus_w_range55w(0);
	wire_w_lg_w_exp_b_and_w_range76w77w(0) <= wire_w_exp_b_and_w_range76w(0) AND wire_w_exp_b_bus_w_range58w(0);
	wire_w_lg_w_exp_b_and_w_range78w79w(0) <= wire_w_exp_b_and_w_range78w(0) AND wire_w_exp_b_bus_w_range61w(0);
	wire_w_lg_w_exp_b_and_w_range80w81w(0) <= wire_w_exp_b_and_w_range80w(0) AND wire_w_exp_b_bus_w_range64w(0);
	wire_w_lg_w_exp_bias_and_w_range492w495w(0) <= wire_w_exp_bias_and_w_range492w(0) AND wire_w_exp_bias_bus_w_range494w(0);
	wire_w_lg_w_exp_bias_and_w_range496w498w(0) <= wire_w_exp_bias_and_w_range496w(0) AND wire_w_exp_bias_bus_w_range497w(0);
	wire_w_lg_w_exp_bias_and_w_range499w501w(0) <= wire_w_exp_bias_and_w_range499w(0) AND wire_w_exp_bias_bus_w_range500w(0);
	wire_w_lg_w_exp_bias_and_w_range502w504w(0) <= wire_w_exp_bias_and_w_range502w(0) AND wire_w_exp_bias_bus_w_range503w(0);
	wire_w_lg_w_exp_bias_and_w_range505w507w(0) <= wire_w_exp_bias_and_w_range505w(0) AND wire_w_exp_bias_bus_w_range506w(0);
	wire_w_lg_w_exp_bias_and_w_range508w510w(0) <= wire_w_exp_bias_and_w_range508w(0) AND wire_w_exp_bias_bus_w_range509w(0);
	wire_w_lg_w_exp_bias_and_w_range511w513w(0) <= wire_w_exp_bias_and_w_range511w(0) AND wire_w_exp_bias_bus_w_range512w(0);
	wire_w_lg_w_exp_res_and_w_range680w683w(0) <= wire_w_exp_res_and_w_range680w(0) AND wire_w_exp_res_bus_w_range682w(0);
	wire_w_lg_w_exp_res_and_w_range684w686w(0) <= wire_w_exp_res_and_w_range684w(0) AND wire_w_exp_res_bus_w_range685w(0);
	wire_w_lg_w_exp_res_and_w_range687w689w(0) <= wire_w_exp_res_and_w_range687w(0) AND wire_w_exp_res_bus_w_range688w(0);
	wire_w_lg_w_exp_res_and_w_range690w692w(0) <= wire_w_exp_res_and_w_range690w(0) AND wire_w_exp_res_bus_w_range691w(0);
	wire_w_lg_w_exp_res_and_w_range693w695w(0) <= wire_w_exp_res_and_w_range693w(0) AND wire_w_exp_res_bus_w_range694w(0);
	wire_w_lg_w_exp_res_and_w_range696w698w(0) <= wire_w_exp_res_and_w_range696w(0) AND wire_w_exp_res_bus_w_range697w(0);
	wire_w_lg_w_exp_res_and_w_range699w701w(0) <= wire_w_exp_res_and_w_range699w(0) AND wire_w_exp_res_bus_w_range700w(0);
	wire_w_lg_w_man_a_and_w_range153w155w(0) <= wire_w_man_a_and_w_range153w(0) AND wire_w_man_a_bus_w_range87w(0);
	wire_w_lg_w_man_a_and_w_range174w175w(0) <= wire_w_man_a_and_w_range174w(0) AND wire_w_man_a_bus_w_range117w(0);
	wire_w_lg_w_man_a_and_w_range176w177w(0) <= wire_w_man_a_and_w_range176w(0) AND wire_w_man_a_bus_w_range120w(0);
	wire_w_lg_w_man_a_and_w_range178w179w(0) <= wire_w_man_a_and_w_range178w(0) AND wire_w_man_a_bus_w_range123w(0);
	wire_w_lg_w_man_a_and_w_range180w181w(0) <= wire_w_man_a_and_w_range180w(0) AND wire_w_man_a_bus_w_range126w(0);
	wire_w_lg_w_man_a_and_w_range182w183w(0) <= wire_w_man_a_and_w_range182w(0) AND wire_w_man_a_bus_w_range129w(0);
	wire_w_lg_w_man_a_and_w_range184w185w(0) <= wire_w_man_a_and_w_range184w(0) AND wire_w_man_a_bus_w_range132w(0);
	wire_w_lg_w_man_a_and_w_range186w187w(0) <= wire_w_man_a_and_w_range186w(0) AND wire_w_man_a_bus_w_range135w(0);
	wire_w_lg_w_man_a_and_w_range188w189w(0) <= wire_w_man_a_and_w_range188w(0) AND wire_w_man_a_bus_w_range138w(0);
	wire_w_lg_w_man_a_and_w_range190w191w(0) <= wire_w_man_a_and_w_range190w(0) AND wire_w_man_a_bus_w_range141w(0);
	wire_w_lg_w_man_a_and_w_range192w193w(0) <= wire_w_man_a_and_w_range192w(0) AND wire_w_man_a_bus_w_range144w(0);
	wire_w_lg_w_man_a_and_w_range156w157w(0) <= wire_w_man_a_and_w_range156w(0) AND wire_w_man_a_bus_w_range90w(0);
	wire_w_lg_w_man_a_and_w_range194w195w(0) <= wire_w_man_a_and_w_range194w(0) AND wire_w_man_a_bus_w_range147w(0);
	wire_w_lg_w_man_a_and_w_range196w197w(0) <= wire_w_man_a_and_w_range196w(0) AND wire_w_man_a_bus_w_range150w(0);
	wire_w_lg_w_man_a_and_w_range158w159w(0) <= wire_w_man_a_and_w_range158w(0) AND wire_w_man_a_bus_w_range93w(0);
	wire_w_lg_w_man_a_and_w_range160w161w(0) <= wire_w_man_a_and_w_range160w(0) AND wire_w_man_a_bus_w_range96w(0);
	wire_w_lg_w_man_a_and_w_range162w163w(0) <= wire_w_man_a_and_w_range162w(0) AND wire_w_man_a_bus_w_range99w(0);
	wire_w_lg_w_man_a_and_w_range164w165w(0) <= wire_w_man_a_and_w_range164w(0) AND wire_w_man_a_bus_w_range102w(0);
	wire_w_lg_w_man_a_and_w_range166w167w(0) <= wire_w_man_a_and_w_range166w(0) AND wire_w_man_a_bus_w_range105w(0);
	wire_w_lg_w_man_a_and_w_range168w169w(0) <= wire_w_man_a_and_w_range168w(0) AND wire_w_man_a_bus_w_range108w(0);
	wire_w_lg_w_man_a_and_w_range170w171w(0) <= wire_w_man_a_and_w_range170w(0) AND wire_w_man_a_bus_w_range111w(0);
	wire_w_lg_w_man_a_and_w_range172w173w(0) <= wire_w_man_a_and_w_range172w(0) AND wire_w_man_a_bus_w_range114w(0);
	wire_w_lg_w_man_b_and_w_range269w271w(0) <= wire_w_man_b_and_w_range269w(0) AND wire_w_man_b_bus_w_range203w(0);
	wire_w_lg_w_man_b_and_w_range290w291w(0) <= wire_w_man_b_and_w_range290w(0) AND wire_w_man_b_bus_w_range233w(0);
	wire_w_lg_w_man_b_and_w_range292w293w(0) <= wire_w_man_b_and_w_range292w(0) AND wire_w_man_b_bus_w_range236w(0);
	wire_w_lg_w_man_b_and_w_range294w295w(0) <= wire_w_man_b_and_w_range294w(0) AND wire_w_man_b_bus_w_range239w(0);
	wire_w_lg_w_man_b_and_w_range296w297w(0) <= wire_w_man_b_and_w_range296w(0) AND wire_w_man_b_bus_w_range242w(0);
	wire_w_lg_w_man_b_and_w_range298w299w(0) <= wire_w_man_b_and_w_range298w(0) AND wire_w_man_b_bus_w_range245w(0);
	wire_w_lg_w_man_b_and_w_range300w301w(0) <= wire_w_man_b_and_w_range300w(0) AND wire_w_man_b_bus_w_range248w(0);
	wire_w_lg_w_man_b_and_w_range302w303w(0) <= wire_w_man_b_and_w_range302w(0) AND wire_w_man_b_bus_w_range251w(0);
	wire_w_lg_w_man_b_and_w_range304w305w(0) <= wire_w_man_b_and_w_range304w(0) AND wire_w_man_b_bus_w_range254w(0);
	wire_w_lg_w_man_b_and_w_range306w307w(0) <= wire_w_man_b_and_w_range306w(0) AND wire_w_man_b_bus_w_range257w(0);
	wire_w_lg_w_man_b_and_w_range308w309w(0) <= wire_w_man_b_and_w_range308w(0) AND wire_w_man_b_bus_w_range260w(0);
	wire_w_lg_w_man_b_and_w_range272w273w(0) <= wire_w_man_b_and_w_range272w(0) AND wire_w_man_b_bus_w_range206w(0);
	wire_w_lg_w_man_b_and_w_range310w311w(0) <= wire_w_man_b_and_w_range310w(0) AND wire_w_man_b_bus_w_range263w(0);
	wire_w_lg_w_man_b_and_w_range312w313w(0) <= wire_w_man_b_and_w_range312w(0) AND wire_w_man_b_bus_w_range266w(0);
	wire_w_lg_w_man_b_and_w_range274w275w(0) <= wire_w_man_b_and_w_range274w(0) AND wire_w_man_b_bus_w_range209w(0);
	wire_w_lg_w_man_b_and_w_range276w277w(0) <= wire_w_man_b_and_w_range276w(0) AND wire_w_man_b_bus_w_range212w(0);
	wire_w_lg_w_man_b_and_w_range278w279w(0) <= wire_w_man_b_and_w_range278w(0) AND wire_w_man_b_bus_w_range215w(0);
	wire_w_lg_w_man_b_and_w_range280w281w(0) <= wire_w_man_b_and_w_range280w(0) AND wire_w_man_b_bus_w_range218w(0);
	wire_w_lg_w_man_b_and_w_range282w283w(0) <= wire_w_man_b_and_w_range282w(0) AND wire_w_man_b_bus_w_range221w(0);
	wire_w_lg_w_man_b_and_w_range284w285w(0) <= wire_w_man_b_and_w_range284w(0) AND wire_w_man_b_bus_w_range224w(0);
	wire_w_lg_w_man_b_and_w_range286w287w(0) <= wire_w_man_b_and_w_range286w(0) AND wire_w_man_b_bus_w_range227w(0);
	wire_w_lg_w_man_b_and_w_range288w289w(0) <= wire_w_man_b_and_w_range288w(0) AND wire_w_man_b_bus_w_range230w(0);
	wire_w_lg_w_norm_infi_and_w_range562w565w(0) <= wire_w_norm_infi_and_w_range562w(0) AND wire_w_norm_infi_bus_w_range564w(0);
	wire_w_lg_w_norm_infi_and_w_range566w568w(0) <= wire_w_norm_infi_and_w_range566w(0) AND wire_w_norm_infi_bus_w_range567w(0);
	wire_w_lg_w_norm_infi_and_w_range569w571w(0) <= wire_w_norm_infi_and_w_range569w(0) AND wire_w_norm_infi_bus_w_range570w(0);
	wire_w_lg_w_norm_infi_and_w_range572w574w(0) <= wire_w_norm_infi_and_w_range572w(0) AND wire_w_norm_infi_bus_w_range573w(0);
	wire_w_lg_w_norm_infi_and_w_range575w577w(0) <= wire_w_norm_infi_and_w_range575w(0) AND wire_w_norm_infi_bus_w_range576w(0);
	wire_w_lg_w_norm_infi_and_w_range578w580w(0) <= wire_w_norm_infi_and_w_range578w(0) AND wire_w_norm_infi_bus_w_range579w(0);
	wire_w_lg_w_norm_infi_and_w_range581w583w(0) <= wire_w_norm_infi_and_w_range581w(0) AND wire_w_norm_infi_bus_w_range582w(0);
	wire_w_lg_bias_addition_overf_w521w(0) <= NOT bias_addition_overf_w;
	wire_w_lg_dataa_S0329w(0) <= NOT dataa_S0;
	wire_w_lg_datab_S0339w(0) <= NOT datab_S0;
	wire_w_lg_exp_a_b_w487w(0) <= NOT exp_a_b_w;
	wire_w_lg_exp_a_one_w640w(0) <= NOT exp_a_one_w;
	wire_w_lg_exp_a_or_msb_w325w(0) <= NOT exp_a_or_msb_w;
	wire_w_lg_exp_b_one_w649w(0) <= NOT exp_b_one_w;
	wire_w_lg_exp_b_or_msb_w327w(0) <= NOT exp_b_or_msb_w;
	wire_w_lg_exp_sign_w516w(0) <= NOT exp_sign_w;
	wire_w_lg_guard_bit_dffe1a_w446w(0) <= NOT guard_bit_dffe1a_w;
	wire_w_lg_infi_combi_w779w(0) <= NOT infi_combi_w;
	wire_w_lg_infinite_w800w(0) <= NOT infinite_w;
	wire_w_lg_mux1_exp_s0a475w(0) <= NOT mux1_exp_s0a;
	wire_w_lg_mux1_exp_s1a478w(0) <= NOT mux1_exp_s1a;
	wire_w_lg_mux_zero_non_zero_S0590w(0) <= NOT mux_zero_non_zero_S0;
	wire_w_lg_nan_w780w(0) <= NOT nan_w;
	wire_w_lg_not_exp_res_int2_or_res_w620w(0) <= NOT not_exp_res_int2_or_res_w;
	wire_w_lg_quo_msb_m1_w380w(0) <= NOT quo_msb_m1_w;
	wire_w_lg_rnd_overflow457w(0) <= NOT rnd_overflow;
	wire_w_lg_zero_dataa_w775w(0) <= NOT zero_dataa_w;
	wire_w_lg_zero_w804w(0) <= NOT zero_w;
	wire_w_lg_w_man_res_or_w_range772w773w(0) <= NOT wire_w_man_res_or_w_range772w(0);
	loop117 : FOR i IN 0 TO 30 GENERATE 
		wire_w_lg_w_lg_dataa_S0354w355w(i) <= wire_w_lg_dataa_S0354w(i) OR wire_w_lg_w_lg_dataa_S0329w353w(i);
	END GENERATE loop117;
	loop118 : FOR i IN 0 TO 30 GENERATE 
		wire_w_lg_w_lg_datab_S0362w363w(i) <= wire_w_lg_datab_S0362w(i) OR wire_w_lg_w_lg_datab_S0339w361w(i);
	END GENERATE loop118;
	wire_w_lg_w_lg_exp_zero_bus_w587w588w(0) <= wire_w_lg_exp_zero_bus_w587w(0) OR bias_addition_overf_w;
	wire_w_lg_w_lg_man_a_zero_w641w642w(0) <= wire_w_lg_man_a_zero_w641w(0) OR man_a_one_w;
	wire_w_lg_w_lg_man_b_zero_w650w651w(0) <= wire_w_lg_man_b_zero_w650w(0) OR man_b_one_w;
	wire_w_lg_exp_zero_bus_w587w(0) <= exp_zero_bus_w OR signed_N_exp_h_or;
	wire_w_lg_man_a_zero_w641w(0) <= man_a_zero_w OR man_a_non_zero_w;
	wire_w_lg_man_b_zero_w650w(0) <= man_b_zero_w OR man_b_non_zero_w;
	wire_w412w(0) <= sticky_quo_msb_m1_comparator_upper_upper_agb_w OR wire_w411w(0);
	wire_w_lg_w_exp_a_or_w_range3w6w(0) <= wire_w_exp_a_or_w_range3w(0) OR wire_w_exp_a_bus_w_range5w(0);
	wire_w_lg_w_exp_a_or_w_range7w9w(0) <= wire_w_exp_a_or_w_range7w(0) OR wire_w_exp_a_bus_w_range8w(0);
	wire_w_lg_w_exp_a_or_w_range10w12w(0) <= wire_w_exp_a_or_w_range10w(0) OR wire_w_exp_a_bus_w_range11w(0);
	wire_w_lg_w_exp_a_or_w_range13w15w(0) <= wire_w_exp_a_or_w_range13w(0) OR wire_w_exp_a_bus_w_range14w(0);
	wire_w_lg_w_exp_a_or_w_range16w18w(0) <= wire_w_exp_a_or_w_range16w(0) OR wire_w_exp_a_bus_w_range17w(0);
	wire_w_lg_w_exp_a_or_w_range19w21w(0) <= wire_w_exp_a_or_w_range19w(0) OR wire_w_exp_a_bus_w_range20w(0);
	wire_w_lg_w_exp_a_or_w_range22w24w(0) <= wire_w_exp_a_or_w_range22w(0) OR wire_w_exp_a_bus_w_range23w(0);
	wire_w_lg_w_exp_b_or_w_range44w47w(0) <= wire_w_exp_b_or_w_range44w(0) OR wire_w_exp_b_bus_w_range46w(0);
	wire_w_lg_w_exp_b_or_w_range48w50w(0) <= wire_w_exp_b_or_w_range48w(0) OR wire_w_exp_b_bus_w_range49w(0);
	wire_w_lg_w_exp_b_or_w_range51w53w(0) <= wire_w_exp_b_or_w_range51w(0) OR wire_w_exp_b_bus_w_range52w(0);
	wire_w_lg_w_exp_b_or_w_range54w56w(0) <= wire_w_exp_b_or_w_range54w(0) OR wire_w_exp_b_bus_w_range55w(0);
	wire_w_lg_w_exp_b_or_w_range57w59w(0) <= wire_w_exp_b_or_w_range57w(0) OR wire_w_exp_b_bus_w_range58w(0);
	wire_w_lg_w_exp_b_or_w_range60w62w(0) <= wire_w_exp_b_or_w_range60w(0) OR wire_w_exp_b_bus_w_range61w(0);
	wire_w_lg_w_exp_b_or_w_range63w65w(0) <= wire_w_exp_b_or_w_range63w(0) OR wire_w_exp_b_bus_w_range64w(0);
	wire_w_lg_w_exp_higher_or_range531w534w(0) <= wire_w_exp_higher_or_range531w(0) OR wire_w_exp_higher_bit_range533w(0);
	wire_w_lg_w_exp_res_int2_or_w_range596w599w(0) <= wire_w_exp_res_int2_or_w_range596w(0) OR wire_w_exp_res_int2_bus_w_range598w(0);
	wire_w_lg_w_exp_res_int2_or_w_range600w602w(0) <= wire_w_exp_res_int2_or_w_range600w(0) OR wire_w_exp_res_int2_bus_w_range601w(0);
	wire_w_lg_w_exp_res_int2_or_w_range603w605w(0) <= wire_w_exp_res_int2_or_w_range603w(0) OR wire_w_exp_res_int2_bus_w_range604w(0);
	wire_w_lg_w_exp_res_int2_or_w_range606w608w(0) <= wire_w_exp_res_int2_or_w_range606w(0) OR wire_w_exp_res_int2_bus_w_range607w(0);
	wire_w_lg_w_exp_res_int2_or_w_range609w611w(0) <= wire_w_exp_res_int2_or_w_range609w(0) OR wire_w_exp_res_int2_bus_w_range610w(0);
	wire_w_lg_w_exp_res_int2_or_w_range612w614w(0) <= wire_w_exp_res_int2_or_w_range612w(0) OR wire_w_exp_res_int2_bus_w_range613w(0);
	wire_w_lg_w_exp_res_int2_or_w_range615w617w(0) <= wire_w_exp_res_int2_or_w_range615w(0) OR wire_w_exp_res_int2_bus_w_range616w(0);
	wire_w_lg_w_man_a_or_w_range85w88w(0) <= wire_w_man_a_or_w_range85w(0) OR wire_w_man_a_bus_w_range87w(0);
	wire_w_lg_w_man_a_or_w_range116w118w(0) <= wire_w_man_a_or_w_range116w(0) OR wire_w_man_a_bus_w_range117w(0);
	wire_w_lg_w_man_a_or_w_range119w121w(0) <= wire_w_man_a_or_w_range119w(0) OR wire_w_man_a_bus_w_range120w(0);
	wire_w_lg_w_man_a_or_w_range122w124w(0) <= wire_w_man_a_or_w_range122w(0) OR wire_w_man_a_bus_w_range123w(0);
	wire_w_lg_w_man_a_or_w_range125w127w(0) <= wire_w_man_a_or_w_range125w(0) OR wire_w_man_a_bus_w_range126w(0);
	wire_w_lg_w_man_a_or_w_range128w130w(0) <= wire_w_man_a_or_w_range128w(0) OR wire_w_man_a_bus_w_range129w(0);
	wire_w_lg_w_man_a_or_w_range131w133w(0) <= wire_w_man_a_or_w_range131w(0) OR wire_w_man_a_bus_w_range132w(0);
	wire_w_lg_w_man_a_or_w_range134w136w(0) <= wire_w_man_a_or_w_range134w(0) OR wire_w_man_a_bus_w_range135w(0);
	wire_w_lg_w_man_a_or_w_range137w139w(0) <= wire_w_man_a_or_w_range137w(0) OR wire_w_man_a_bus_w_range138w(0);
	wire_w_lg_w_man_a_or_w_range140w142w(0) <= wire_w_man_a_or_w_range140w(0) OR wire_w_man_a_bus_w_range141w(0);
	wire_w_lg_w_man_a_or_w_range143w145w(0) <= wire_w_man_a_or_w_range143w(0) OR wire_w_man_a_bus_w_range144w(0);
	wire_w_lg_w_man_a_or_w_range89w91w(0) <= wire_w_man_a_or_w_range89w(0) OR wire_w_man_a_bus_w_range90w(0);
	wire_w_lg_w_man_a_or_w_range146w148w(0) <= wire_w_man_a_or_w_range146w(0) OR wire_w_man_a_bus_w_range147w(0);
	wire_w_lg_w_man_a_or_w_range149w151w(0) <= wire_w_man_a_or_w_range149w(0) OR wire_w_man_a_bus_w_range150w(0);
	wire_w_lg_w_man_a_or_w_range92w94w(0) <= wire_w_man_a_or_w_range92w(0) OR wire_w_man_a_bus_w_range93w(0);
	wire_w_lg_w_man_a_or_w_range95w97w(0) <= wire_w_man_a_or_w_range95w(0) OR wire_w_man_a_bus_w_range96w(0);
	wire_w_lg_w_man_a_or_w_range98w100w(0) <= wire_w_man_a_or_w_range98w(0) OR wire_w_man_a_bus_w_range99w(0);
	wire_w_lg_w_man_a_or_w_range101w103w(0) <= wire_w_man_a_or_w_range101w(0) OR wire_w_man_a_bus_w_range102w(0);
	wire_w_lg_w_man_a_or_w_range104w106w(0) <= wire_w_man_a_or_w_range104w(0) OR wire_w_man_a_bus_w_range105w(0);
	wire_w_lg_w_man_a_or_w_range107w109w(0) <= wire_w_man_a_or_w_range107w(0) OR wire_w_man_a_bus_w_range108w(0);
	wire_w_lg_w_man_a_or_w_range110w112w(0) <= wire_w_man_a_or_w_range110w(0) OR wire_w_man_a_bus_w_range111w(0);
	wire_w_lg_w_man_a_or_w_range113w115w(0) <= wire_w_man_a_or_w_range113w(0) OR wire_w_man_a_bus_w_range114w(0);
	wire_w_lg_w_man_b_or_w_range201w204w(0) <= wire_w_man_b_or_w_range201w(0) OR wire_w_man_b_bus_w_range203w(0);
	wire_w_lg_w_man_b_or_w_range232w234w(0) <= wire_w_man_b_or_w_range232w(0) OR wire_w_man_b_bus_w_range233w(0);
	wire_w_lg_w_man_b_or_w_range235w237w(0) <= wire_w_man_b_or_w_range235w(0) OR wire_w_man_b_bus_w_range236w(0);
	wire_w_lg_w_man_b_or_w_range238w240w(0) <= wire_w_man_b_or_w_range238w(0) OR wire_w_man_b_bus_w_range239w(0);
	wire_w_lg_w_man_b_or_w_range241w243w(0) <= wire_w_man_b_or_w_range241w(0) OR wire_w_man_b_bus_w_range242w(0);
	wire_w_lg_w_man_b_or_w_range244w246w(0) <= wire_w_man_b_or_w_range244w(0) OR wire_w_man_b_bus_w_range245w(0);
	wire_w_lg_w_man_b_or_w_range247w249w(0) <= wire_w_man_b_or_w_range247w(0) OR wire_w_man_b_bus_w_range248w(0);
	wire_w_lg_w_man_b_or_w_range250w252w(0) <= wire_w_man_b_or_w_range250w(0) OR wire_w_man_b_bus_w_range251w(0);
	wire_w_lg_w_man_b_or_w_range253w255w(0) <= wire_w_man_b_or_w_range253w(0) OR wire_w_man_b_bus_w_range254w(0);
	wire_w_lg_w_man_b_or_w_range256w258w(0) <= wire_w_man_b_or_w_range256w(0) OR wire_w_man_b_bus_w_range257w(0);
	wire_w_lg_w_man_b_or_w_range259w261w(0) <= wire_w_man_b_or_w_range259w(0) OR wire_w_man_b_bus_w_range260w(0);
	wire_w_lg_w_man_b_or_w_range205w207w(0) <= wire_w_man_b_or_w_range205w(0) OR wire_w_man_b_bus_w_range206w(0);
	wire_w_lg_w_man_b_or_w_range262w264w(0) <= wire_w_man_b_or_w_range262w(0) OR wire_w_man_b_bus_w_range263w(0);
	wire_w_lg_w_man_b_or_w_range265w267w(0) <= wire_w_man_b_or_w_range265w(0) OR wire_w_man_b_bus_w_range266w(0);
	wire_w_lg_w_man_b_or_w_range208w210w(0) <= wire_w_man_b_or_w_range208w(0) OR wire_w_man_b_bus_w_range209w(0);
	wire_w_lg_w_man_b_or_w_range211w213w(0) <= wire_w_man_b_or_w_range211w(0) OR wire_w_man_b_bus_w_range212w(0);
	wire_w_lg_w_man_b_or_w_range214w216w(0) <= wire_w_man_b_or_w_range214w(0) OR wire_w_man_b_bus_w_range215w(0);
	wire_w_lg_w_man_b_or_w_range217w219w(0) <= wire_w_man_b_or_w_range217w(0) OR wire_w_man_b_bus_w_range218w(0);
	wire_w_lg_w_man_b_or_w_range220w222w(0) <= wire_w_man_b_or_w_range220w(0) OR wire_w_man_b_bus_w_range221w(0);
	wire_w_lg_w_man_b_or_w_range223w225w(0) <= wire_w_man_b_or_w_range223w(0) OR wire_w_man_b_bus_w_range224w(0);
	wire_w_lg_w_man_b_or_w_range226w228w(0) <= wire_w_man_b_or_w_range226w(0) OR wire_w_man_b_bus_w_range227w(0);
	wire_w_lg_w_man_b_or_w_range229w231w(0) <= wire_w_man_b_or_w_range229w(0) OR wire_w_man_b_bus_w_range230w(0);
	wire_w_lg_w_man_res_or_w_range705w708w(0) <= wire_w_man_res_or_w_range705w(0) OR wire_w_man_res_bus_w_range707w(0);
	wire_w_lg_w_man_res_or_w_range736w738w(0) <= wire_w_man_res_or_w_range736w(0) OR wire_w_man_res_bus_w_range737w(0);
	wire_w_lg_w_man_res_or_w_range739w741w(0) <= wire_w_man_res_or_w_range739w(0) OR wire_w_man_res_bus_w_range740w(0);
	wire_w_lg_w_man_res_or_w_range742w744w(0) <= wire_w_man_res_or_w_range742w(0) OR wire_w_man_res_bus_w_range743w(0);
	wire_w_lg_w_man_res_or_w_range745w747w(0) <= wire_w_man_res_or_w_range745w(0) OR wire_w_man_res_bus_w_range746w(0);
	wire_w_lg_w_man_res_or_w_range748w750w(0) <= wire_w_man_res_or_w_range748w(0) OR wire_w_man_res_bus_w_range749w(0);
	wire_w_lg_w_man_res_or_w_range751w753w(0) <= wire_w_man_res_or_w_range751w(0) OR wire_w_man_res_bus_w_range752w(0);
	wire_w_lg_w_man_res_or_w_range754w756w(0) <= wire_w_man_res_or_w_range754w(0) OR wire_w_man_res_bus_w_range755w(0);
	wire_w_lg_w_man_res_or_w_range757w759w(0) <= wire_w_man_res_or_w_range757w(0) OR wire_w_man_res_bus_w_range758w(0);
	wire_w_lg_w_man_res_or_w_range760w762w(0) <= wire_w_man_res_or_w_range760w(0) OR wire_w_man_res_bus_w_range761w(0);
	wire_w_lg_w_man_res_or_w_range763w765w(0) <= wire_w_man_res_or_w_range763w(0) OR wire_w_man_res_bus_w_range764w(0);
	wire_w_lg_w_man_res_or_w_range709w711w(0) <= wire_w_man_res_or_w_range709w(0) OR wire_w_man_res_bus_w_range710w(0);
	wire_w_lg_w_man_res_or_w_range766w768w(0) <= wire_w_man_res_or_w_range766w(0) OR wire_w_man_res_bus_w_range767w(0);
	wire_w_lg_w_man_res_or_w_range769w771w(0) <= wire_w_man_res_or_w_range769w(0) OR wire_w_man_res_bus_w_range770w(0);
	wire_w_lg_w_man_res_or_w_range712w714w(0) <= wire_w_man_res_or_w_range712w(0) OR wire_w_man_res_bus_w_range713w(0);
	wire_w_lg_w_man_res_or_w_range715w717w(0) <= wire_w_man_res_or_w_range715w(0) OR wire_w_man_res_bus_w_range716w(0);
	wire_w_lg_w_man_res_or_w_range718w720w(0) <= wire_w_man_res_or_w_range718w(0) OR wire_w_man_res_bus_w_range719w(0);
	wire_w_lg_w_man_res_or_w_range721w723w(0) <= wire_w_man_res_or_w_range721w(0) OR wire_w_man_res_bus_w_range722w(0);
	wire_w_lg_w_man_res_or_w_range724w726w(0) <= wire_w_man_res_or_w_range724w(0) OR wire_w_man_res_bus_w_range725w(0);
	wire_w_lg_w_man_res_or_w_range727w729w(0) <= wire_w_man_res_or_w_range727w(0) OR wire_w_man_res_bus_w_range728w(0);
	wire_w_lg_w_man_res_or_w_range730w732w(0) <= wire_w_man_res_or_w_range730w(0) OR wire_w_man_res_bus_w_range731w(0);
	wire_w_lg_w_man_res_or_w_range733w735w(0) <= wire_w_man_res_or_w_range733w(0) OR wire_w_man_res_bus_w_range734w(0);
	wire_w_lg_w_norm_zero_or_w_range537w540w(0) <= wire_w_norm_zero_or_w_range537w(0) OR wire_w_norm_zero_bus_w_range539w(0);
	wire_w_lg_w_norm_zero_or_w_range541w543w(0) <= wire_w_norm_zero_or_w_range541w(0) OR wire_w_norm_zero_bus_w_range542w(0);
	wire_w_lg_w_norm_zero_or_w_range544w546w(0) <= wire_w_norm_zero_or_w_range544w(0) OR wire_w_norm_zero_bus_w_range545w(0);
	wire_w_lg_w_norm_zero_or_w_range547w549w(0) <= wire_w_norm_zero_or_w_range547w(0) OR wire_w_norm_zero_bus_w_range548w(0);
	wire_w_lg_w_norm_zero_or_w_range550w552w(0) <= wire_w_norm_zero_or_w_range550w(0) OR wire_w_norm_zero_bus_w_range551w(0);
	wire_w_lg_w_norm_zero_or_w_range553w555w(0) <= wire_w_norm_zero_or_w_range553w(0) OR wire_w_norm_zero_bus_w_range554w(0);
	wire_w_lg_w_norm_zero_or_w_range556w558w(0) <= wire_w_norm_zero_or_w_range556w(0) OR wire_w_norm_zero_bus_w_range557w(0);
	wire_w_lg_w_sticky_bit_quo_msb_m1_or_range388w391w(0) <= wire_w_sticky_bit_quo_msb_m1_or_range388w(0) OR wire_w_sticky_bit_quo_msb_m1_bit_range390w(0);
	add_1_dataa_w <= ( checked_quotient_dffe1a_w);
	add_1_datab_w <= (OTHERS => '0');
	add_1_w <= (wire_w_lg_w_lg_w_lg_guard_bit_dffe1a_w446w447w448w(0) OR (guard_bit_dffe1a_w AND round_bit_dffe1a_w));
	add_one_process_w <= wire_altfp_div_csa8_result;
	and_or_dffe1a_w <= and_or_dffe1a;
	and_or_dffe3a_w <= and_or_dffe3a;
	and_or_dffe_w <= and_or_dffe;
	and_or_int_w <= and_or_dffe1a;
	and_or_pipeline_w <= and_or_pipeline27c;
	bias_add_w <= (wire_w_lg_w_lg_exp_a_b_w487w488w OR wire_w_lg_exp_a_b_w486w);
	bias_addition_overf_w <= (wire_add_sub10_overflow OR (wire_w_lg_exp_sign_w516w(0) AND exp_bias_and_res_w));
	bias_addition_w <= wire_add_sub10_result(7 DOWNTO 0);
	bias_value_w <= (((wire_w_lg_w_lg_w_lg_mux1_exp_s1a478w481w482w OR wire_w_lg_w_lg_w_lg_mux1_exp_s1a478w479w480w) OR wire_w_lg_w_lg_mux1_exp_s1a476w477w) OR wire_w_lg_w_lg_mux1_exp_s1a473w474w);
	checked_quotient_dffe1a_w <= checked_quotient_w;
	checked_quotient_w <= (wire_w_lg_quo_msb_m1_w382w OR wire_w_lg_w_lg_quo_msb_m1_w380w381w);
	dataa_exp_bus_w <= dataa(30 DOWNTO 23);
	dataa_int <= ( dataa(31) & wire_w_lg_w_lg_dataa_S0354w355w);
	dataa_man_bus_w <= dataa(22 DOWNTO 0);
	dataa_S0 <= (wire_w_lg_exp_a_or_msb_w325w(0) AND man_a_or_msb_w);
	datab_exp_bus_w <= datab(30 DOWNTO 23);
	datab_int <= ( datab(31) & wire_w_lg_w_lg_datab_S0362w363w);
	datab_man_bus_w <= datab(22 DOWNTO 0);
	datab_S0 <= (wire_w_lg_exp_b_or_msb_w327w(0) AND man_b_or_msb_w);
	divider_srt_w <= divider_pipe1a;
	exp_a_and_msb2_w <= and_or_dffe3a_w(6);
	exp_a_and_msb_w <= exp_a_and_w(7);
	exp_a_and_mux_w <= ((dataa_S0 AND zero_bit_w) OR wire_w_lg_w_lg_dataa_S0329w333w(0));
	exp_a_and_w <= ( wire_w_lg_w_exp_a_and_w_range39w40w & wire_w_lg_w_exp_a_and_w_range37w38w & wire_w_lg_w_exp_a_and_w_range35w36w & wire_w_lg_w_exp_a_and_w_range33w34w & wire_w_lg_w_exp_a_and_w_range31w32w & wire_w_lg_w_exp_a_and_w_range29w30w & wire_w_lg_w_exp_a_and_w_range26w28w & exp_a_bus_w(0));
	exp_a_b_w <= exp_a_b_dffe;
	exp_a_bus_w <= dataa_exp_bus_w;
	exp_a_non_zero_w <= exp_a_or_dffe;
	exp_a_one_w <= exp_a_and_dffe;
	exp_a_or_msb2_w <= and_or_dffe3a_w(7);
	exp_a_or_msb_w <= exp_a_or_w(7);
	exp_a_or_mux_w <= ((dataa_S0 AND zero_bit_w) OR wire_w_lg_w_lg_dataa_S0329w330w(0));
	exp_a_or_w <= ( wire_w_lg_w_exp_a_or_w_range22w24w & wire_w_lg_w_exp_a_or_w_range19w21w & wire_w_lg_w_exp_a_or_w_range16w18w & wire_w_lg_w_exp_a_or_w_range13w15w & wire_w_lg_w_exp_a_or_w_range10w12w & wire_w_lg_w_exp_a_or_w_range7w9w & wire_w_lg_w_exp_a_or_w_range3w6w & exp_a_bus_w(0));
	exp_a_w <= exp_a_dffe;
	exp_a_zero_w <= wire_exp_a_or_dffe_w_lg_q629w(0);
	exp_b_and_msb2_w <= and_or_dffe3a_w(2);
	exp_b_and_msb_w <= exp_b_and_w(7);
	exp_b_and_mux_w <= ((datab_S0 AND zero_bit_w) OR wire_w_lg_w_lg_datab_S0339w343w(0));
	exp_b_and_w <= ( wire_w_lg_w_exp_b_and_w_range80w81w & wire_w_lg_w_exp_b_and_w_range78w79w & wire_w_lg_w_exp_b_and_w_range76w77w & wire_w_lg_w_exp_b_and_w_range74w75w & wire_w_lg_w_exp_b_and_w_range72w73w & wire_w_lg_w_exp_b_and_w_range70w71w & wire_w_lg_w_exp_b_and_w_range67w69w & exp_b_bus_w(0));
	exp_b_bus_w <= datab_exp_bus_w;
	exp_b_non_zero_w <= exp_b_or_dffe;
	exp_b_one_w <= exp_b_and_dffe;
	exp_b_or_msb2_w <= and_or_dffe3a_w(3);
	exp_b_or_msb_w <= exp_b_or_w(7);
	exp_b_or_mux_w <= ((datab_S0 AND zero_bit_w) OR wire_w_lg_w_lg_datab_S0339w340w(0));
	exp_b_or_w <= ( wire_w_lg_w_exp_b_or_w_range63w65w & wire_w_lg_w_exp_b_or_w_range60w62w & wire_w_lg_w_exp_b_or_w_range57w59w & wire_w_lg_w_exp_b_or_w_range54w56w & wire_w_lg_w_exp_b_or_w_range51w53w & wire_w_lg_w_exp_b_or_w_range48w50w & wire_w_lg_w_exp_b_or_w_range44w47w & exp_b_bus_w(0));
	exp_b_w <= exp_b_dffe;
	exp_b_zero_w <= wire_exp_b_or_dffe_w_lg_q632w(0);
	exp_bias_and_res_w <= exp_bias_and_w(7);
	exp_bias_and_w <= ( wire_w_lg_w_exp_bias_and_w_range511w513w & wire_w_lg_w_exp_bias_and_w_range508w510w & wire_w_lg_w_exp_bias_and_w_range505w507w & wire_w_lg_w_exp_bias_and_w_range502w504w & wire_w_lg_w_exp_bias_and_w_range499w501w & wire_w_lg_w_exp_bias_and_w_range496w498w & wire_w_lg_w_exp_bias_and_w_range492w495w & exp_bias_bus_w(0));
	exp_bias_bus_w <= wire_add_sub10_result(7 DOWNTO 0);
	exp_dffe1a_w <= exp_dffe1a;
	exp_dffe2a_w <= exp_dffe2a;
	exp_exc_ones_w <= (OTHERS => '1');
	exp_exc_zeros_w <= (OTHERS => '0');
	exp_higher_bit <= not_bias_addition_w(7 DOWNTO 6);
	exp_higher_or <= ( wire_w_lg_w_exp_higher_or_range531w534w & exp_higher_bit(0));
	exp_infi_bus_w <= norm_infi_and_w(7);
	exp_man_and_or_w <= ( exp_a_or_mux_w & exp_a_and_mux_w & man_a_or_mux_w & man_a_and_mux_w & exp_b_or_mux_w & exp_b_and_mux_w & man_b_or_mux_w & man_b_and_mux_w);
	exp_or_result_w <= (and_or_dffe1a_w(7) OR and_or_dffe1a_w(3));
	exp_pipeline_w <= exp_pipeline26c;
	exp_res_and_w <= ( wire_w_lg_w_exp_res_and_w_range699w701w & wire_w_lg_w_exp_res_and_w_range696w698w & wire_w_lg_w_exp_res_and_w_range693w695w & wire_w_lg_w_exp_res_and_w_range690w692w & wire_w_lg_w_exp_res_and_w_range687w689w & wire_w_lg_w_exp_res_and_w_range684w686w & wire_w_lg_w_exp_res_and_w_range680w683w & exp_res_bus_w(0));
	exp_res_bus_w <= exp_res_w;
	exp_res_int2_bus_w <= exp_res_int2_w;
	exp_res_int2_or_w <= ( wire_w_lg_w_exp_res_int2_or_w_range615w617w & wire_w_lg_w_exp_res_int2_or_w_range612w614w & wire_w_lg_w_exp_res_int2_or_w_range609w611w & wire_w_lg_w_exp_res_int2_or_w_range606w608w & wire_w_lg_w_exp_res_int2_or_w_range603w605w & wire_w_lg_w_exp_res_int2_or_w_range600w602w & wire_w_lg_w_exp_res_int2_or_w_range596w599w & exp_res_int2_bus_w(0));
	exp_res_int2_w <= exp_res_pipe3;
	exp_res_int_w <= ((wire_w_lg_w_lg_w_lg_bias_addition_overf_w521w524w525w OR wire_w_lg_w_lg_w_lg_bias_addition_overf_w521w522w523w) OR wire_w_lg_w_lg_bias_addition_overf_w519w520w);
	exp_res_w <= (wire_w_lg_not_exp_res_int2_or_res_w622w OR wire_w_lg_w_lg_not_exp_res_int2_or_res_w620w621w);
	exp_sign_w <= wire_add_sub10_result(8);
	exp_sub_a_w <= ( "0" & exp_a_w);
	exp_sub_b_w <= ( "0" & exp_b_w);
	exp_sub_w <= wire_add_sub9_result;
	exp_zero_bus_w <= (NOT norm_zero_or_w(7));
	guard_bit_dffe1a_w <= guard_bit_w;
	guard_bit_quo_msb_m1 <= quotient_w(3);
	guard_bit_quo_msb_m2 <= quotient_w(2);
	guard_bit_w <= ((quo_msb_m1_w AND guard_bit_quo_msb_m1) OR wire_w_lg_w_lg_quo_msb_m1_w380w436w(0));
	infi_combi_w <= (((infi_dataa_w AND norm_datab_w) OR (norm_dataa_w AND zero_datab_w)) OR (infi_dataa_w AND zero_datab_w));
	infi_dataa_w <= (exp_a_one_w AND man_a_zero_w);
	infi_datab_w <= (exp_b_one_w AND man_b_zero_w);
	infi_res_w <= ( sign_exc_bit_w & exp_exc_ones_w & man_exc_zeros_w);
	infinite_int_w <= (infi_combi_w OR overflow_int_w);
	infinite_w <= infinite_int_w;
	man_24_zeros_w <= (OTHERS => '0');
	man_a_and_msb2_w <= and_or_dffe3a_w(4);
	man_a_and_msb_w <= man_a_and_w(22);
	man_a_and_mux_w <= ((dataa_S0 AND zero_bit_w) OR wire_w_lg_w_lg_dataa_S0329w337w(0));
	man_a_and_w <= ( wire_w_lg_w_man_a_and_w_range196w197w & wire_w_lg_w_man_a_and_w_range194w195w & wire_w_lg_w_man_a_and_w_range192w193w & wire_w_lg_w_man_a_and_w_range190w191w & wire_w_lg_w_man_a_and_w_range188w189w & wire_w_lg_w_man_a_and_w_range186w187w & wire_w_lg_w_man_a_and_w_range184w185w & wire_w_lg_w_man_a_and_w_range182w183w & wire_w_lg_w_man_a_and_w_range180w181w & wire_w_lg_w_man_a_and_w_range178w179w & wire_w_lg_w_man_a_and_w_range176w177w & wire_w_lg_w_man_a_and_w_range174w175w & wire_w_lg_w_man_a_and_w_range172w173w & wire_w_lg_w_man_a_and_w_range170w171w & wire_w_lg_w_man_a_and_w_range168w169w & wire_w_lg_w_man_a_and_w_range166w167w & wire_w_lg_w_man_a_and_w_range164w165w & wire_w_lg_w_man_a_and_w_range162w163w & wire_w_lg_w_man_a_and_w_range160w161w & wire_w_lg_w_man_a_and_w_range158w159w & wire_w_lg_w_man_a_and_w_range156w157w & wire_w_lg_w_man_a_and_w_range153w155w & man_a_bus_w(0));
	man_a_bus_w <= dataa_man_bus_w;
	man_a_int_w <= man_a_dffe;
	man_a_non_zero_w <= man_a_or_dffe;
	man_a_one_w <= man_a_and_dffe;
	man_a_or_msb2_w <= and_or_dffe3a_w(5);
	man_a_or_msb_w <= man_a_or_w(22);
	man_a_or_mux_w <= ((dataa_S0 AND zero_bit_w) OR wire_w_lg_w_lg_dataa_S0329w335w(0));
	man_a_or_w <= ( wire_w_lg_w_man_a_or_w_range149w151w & wire_w_lg_w_man_a_or_w_range146w148w & wire_w_lg_w_man_a_or_w_range143w145w & wire_w_lg_w_man_a_or_w_range140w142w & wire_w_lg_w_man_a_or_w_range137w139w & wire_w_lg_w_man_a_or_w_range134w136w & wire_w_lg_w_man_a_or_w_range131w133w & wire_w_lg_w_man_a_or_w_range128w130w & wire_w_lg_w_man_a_or_w_range125w127w & wire_w_lg_w_man_a_or_w_range122w124w & wire_w_lg_w_man_a_or_w_range119w121w & wire_w_lg_w_man_a_or_w_range116w118w & wire_w_lg_w_man_a_or_w_range113w115w & wire_w_lg_w_man_a_or_w_range110w112w & wire_w_lg_w_man_a_or_w_range107w109w & wire_w_lg_w_man_a_or_w_range104w106w & wire_w_lg_w_man_a_or_w_range101w103w & wire_w_lg_w_man_a_or_w_range98w100w & wire_w_lg_w_man_a_or_w_range95w97w & wire_w_lg_w_man_a_or_w_range92w94w & wire_w_lg_w_man_a_or_w_range89w91w & wire_w_lg_w_man_a_or_w_range85w88w & man_a_bus_w(0));
	man_a_w <= ( "1" & man_a_int_w);
	man_a_zero_w <= wire_man_a_or_dffe_w_lg_q635w(0);
	man_b_and_msb2_w <= and_or_dffe3a_w(0);
	man_b_and_msb_w <= man_b_and_w(22);
	man_b_and_mux_w <= ((datab_S0 AND zero_bit_w) OR wire_w_lg_w_lg_datab_S0339w347w(0));
	man_b_and_w <= ( wire_w_lg_w_man_b_and_w_range312w313w & wire_w_lg_w_man_b_and_w_range310w311w & wire_w_lg_w_man_b_and_w_range308w309w & wire_w_lg_w_man_b_and_w_range306w307w & wire_w_lg_w_man_b_and_w_range304w305w & wire_w_lg_w_man_b_and_w_range302w303w & wire_w_lg_w_man_b_and_w_range300w301w & wire_w_lg_w_man_b_and_w_range298w299w & wire_w_lg_w_man_b_and_w_range296w297w & wire_w_lg_w_man_b_and_w_range294w295w & wire_w_lg_w_man_b_and_w_range292w293w & wire_w_lg_w_man_b_and_w_range290w291w & wire_w_lg_w_man_b_and_w_range288w289w & wire_w_lg_w_man_b_and_w_range286w287w & wire_w_lg_w_man_b_and_w_range284w285w & wire_w_lg_w_man_b_and_w_range282w283w & wire_w_lg_w_man_b_and_w_range280w281w & wire_w_lg_w_man_b_and_w_range278w279w & wire_w_lg_w_man_b_and_w_range276w277w & wire_w_lg_w_man_b_and_w_range274w275w & wire_w_lg_w_man_b_and_w_range272w273w & wire_w_lg_w_man_b_and_w_range269w271w & man_b_bus_w(0));
	man_b_bus_w <= datab_man_bus_w;
	man_b_int_w <= man_b_dffe;
	man_b_non_zero_w <= man_b_or_dffe;
	man_b_one_w <= man_b_and_dffe;
	man_b_or_msb2_w <= and_or_dffe3a_w(1);
	man_b_or_msb_w <= man_b_or_w(22);
	man_b_or_mux_w <= ((datab_S0 AND zero_bit_w) OR wire_w_lg_w_lg_datab_S0339w345w(0));
	man_b_or_w <= ( wire_w_lg_w_man_b_or_w_range265w267w & wire_w_lg_w_man_b_or_w_range262w264w & wire_w_lg_w_man_b_or_w_range259w261w & wire_w_lg_w_man_b_or_w_range256w258w & wire_w_lg_w_man_b_or_w_range253w255w & wire_w_lg_w_man_b_or_w_range250w252w & wire_w_lg_w_man_b_or_w_range247w249w & wire_w_lg_w_man_b_or_w_range244w246w & wire_w_lg_w_man_b_or_w_range241w243w & wire_w_lg_w_man_b_or_w_range238w240w & wire_w_lg_w_man_b_or_w_range235w237w & wire_w_lg_w_man_b_or_w_range232w234w & wire_w_lg_w_man_b_or_w_range229w231w & wire_w_lg_w_man_b_or_w_range226w228w & wire_w_lg_w_man_b_or_w_range223w225w & wire_w_lg_w_man_b_or_w_range220w222w & wire_w_lg_w_man_b_or_w_range217w219w & wire_w_lg_w_man_b_or_w_range214w216w & wire_w_lg_w_man_b_or_w_range211w213w & wire_w_lg_w_man_b_or_w_range208w210w & wire_w_lg_w_man_b_or_w_range205w207w & wire_w_lg_w_man_b_or_w_range201w204w & man_b_bus_w(0));
	man_b_w <= ( "1" & man_b_int_w);
	man_b_zero_w <= wire_man_b_or_dffe_w_lg_q638w(0);
	man_exc_nan_w <= ( "1" & man_exc_zeros_w(21 DOWNTO 0));
	man_exc_zeros_w <= (OTHERS => '0');
	man_res_bus_w <= man_res_w(22 DOWNTO 0);
	man_res_int2_w <= man_res_pipe3;
	man_res_int_w <= mux_zero_non_zero_w;
	man_res_or_w <= ( wire_w_lg_w_man_res_or_w_range769w771w & wire_w_lg_w_man_res_or_w_range766w768w & wire_w_lg_w_man_res_or_w_range763w765w & wire_w_lg_w_man_res_or_w_range760w762w & wire_w_lg_w_man_res_or_w_range757w759w & wire_w_lg_w_man_res_or_w_range754w756w & wire_w_lg_w_man_res_or_w_range751w753w & wire_w_lg_w_man_res_or_w_range748w750w & wire_w_lg_w_man_res_or_w_range745w747w & wire_w_lg_w_man_res_or_w_range742w744w & wire_w_lg_w_man_res_or_w_range739w741w & wire_w_lg_w_man_res_or_w_range736w738w & wire_w_lg_w_man_res_or_w_range733w735w & wire_w_lg_w_man_res_or_w_range730w732w & wire_w_lg_w_man_res_or_w_range727w729w & wire_w_lg_w_man_res_or_w_range724w726w & wire_w_lg_w_man_res_or_w_range721w723w & wire_w_lg_w_man_res_or_w_range718w720w & wire_w_lg_w_man_res_or_w_range715w717w & wire_w_lg_w_man_res_or_w_range712w714w & wire_w_lg_w_man_res_or_w_range709w711w & wire_w_lg_w_man_res_or_w_range705w708w & man_res_bus_w(0));
	man_res_w <= (wire_w_lg_not_exp_res_int2_or_res_w625w OR wire_w_lg_w_lg_not_exp_res_int2_or_res_w620w624w);
	mux1_exp_s0a <= rnd_add_overf_w;
	mux1_exp_s1a <= implied_bit2a;
	mux_1_res_w <= (wire_w_lg_infinite_w802w OR wire_w_lg_w_lg_infinite_w800w801w);
	mux_2_res_w <= (wire_w_lg_zero_w806w OR wire_w_lg_w_lg_zero_w804w805w);
	mux_3_res_w <= (wire_w_lg_nan_w809w OR wire_w_lg_w_lg_nan_w780w808w);
	mux_zero_non_zero_S0 <= (wire_w_lg_w_lg_exp_zero_bus_w587w588w(0) OR wire_w_lg_exp_infi_bus_w586w(0));
	mux_zero_non_zero_w <= (wire_w_lg_mux_zero_non_zero_S0592w OR wire_w_lg_w_lg_mux_zero_non_zero_S0590w591w);
	nan_dataa_w <= (exp_a_one_w AND (man_a_non_zero_w OR man_a_one_w));
	nan_datab_w <= (exp_b_one_w AND (man_b_non_zero_w OR man_b_one_w));
	nan_res_w <= ( sign_exc_bit_w & exp_exc_ones_w & man_exc_nan_w);
	nan_w <= (((nan_dataa_w OR nan_datab_w) OR (zero_dataa_w AND zero_datab_w)) OR (infi_dataa_w AND infi_datab_w));
	norm_dataa_w <= (wire_w_lg_exp_a_non_zero_w643w(0) AND wire_w_lg_exp_a_one_w640w(0));
	norm_datab_w <= (wire_w_lg_exp_b_non_zero_w652w(0) AND wire_w_lg_exp_b_one_w649w(0));
	norm_infi_and_w <= ( wire_w_lg_w_norm_infi_and_w_range581w583w & wire_w_lg_w_norm_infi_and_w_range578w580w & wire_w_lg_w_norm_infi_and_w_range575w577w & wire_w_lg_w_norm_infi_and_w_range572w574w & wire_w_lg_w_norm_infi_and_w_range569w571w & wire_w_lg_w_norm_infi_and_w_range566w568w & wire_w_lg_w_norm_infi_and_w_range562w565w & norm_infi_bus_w(0));
	norm_infi_bus_w <= bias_addition_w;
	norm_res_int_w <= ( sign_pipe3a & exp_res_w(7 DOWNTO 0) & man_res_w(22 DOWNTO 0));
	norm_zero_bus_w <= bias_addition_w;
	norm_zero_or_w <= ( wire_w_lg_w_norm_zero_or_w_range556w558w & wire_w_lg_w_norm_zero_or_w_range553w555w & wire_w_lg_w_norm_zero_or_w_range550w552w & wire_w_lg_w_norm_zero_or_w_range547w549w & wire_w_lg_w_norm_zero_or_w_range544w546w & wire_w_lg_w_norm_zero_or_w_range541w543w & wire_w_lg_w_norm_zero_or_w_range537w540w & norm_zero_bus_w(0));
	not_bias_addition_w <= (NOT bias_addition_w);
	not_exp_res_int2_or_res_w <= (NOT exp_res_int2_or_w(7));
	overflow_int_w <= ((wire_bias_addition_overf_dffe_w_lg_q781w(0) AND wire_w_lg_infi_combi_w779w(0)) AND (NOT ((norm_dataa_w AND wire_w_lg_zero_dataa_w775w(0)) AND zero_datab_w)));
	overflow_man_w <= ( "1" & "00000000000000000000000");
	overflow_ones_w <= (OTHERS => '1');
	quo_msb_m1_compare_dataa <= ( remainder_srt_w & "00000000000000000000000000000");
	quo_msb_m1_compare_datab <= ( "00000000000000000000000000000" & divider_srt_w);
	quo_msb_m1_compare_w <= ((wire_w412w(0) OR (sticky_quo_msb_m1_comparator_upper_lower_aeb_w AND sticky_quo_msb_m1_comparator_lower_upper_agb_w)) OR (sticky_quo_msb_m1_comparator_lower_upper_aeb_w AND sticky_quo_msb_m1_comparator_lower_lower_ageb_w));
	quo_msb_m1_w <= quotient_w(26);
	quo_msb_m2_compare_dataa <= ( remainder_srt_w & "000000000000000000000000000000");
	quo_msb_m2_compare_datab <= ( "000000000000000000000000000000" & divider_srt_w);
	quo_msb_m2_compare_w <= (sticky_quo_msb_m2_comparator_upper_agb_w OR (sticky_quo_msb_m2_comparator_upper_aeb_w AND sticky_quo_msb_m2_comparator_lower_ageb_w));
	quotient_msb_m1_w <= quotient_w(26 DOWNTO 3);
	quotient_msb_m2_w <= quotient_w(25 DOWNTO 2);
	quotient_w <= quotient_pipe1a;
	remainder_srt_w <= remainder_pipe1a;
	res_rnded_man_w <= rnded_man_pipe2a;
	result <= result_output_dffe;
	rnd_add_overf_w <= rnd_overflow_dffe;
	rnd_overflow <= wire_altfp_div_csa8_cout;
	rnded_man_w <= (wire_w_lg_rnd_overflow459w OR wire_w_lg_w_lg_rnd_overflow457w458w);
	round_bit_dffe1a_w <= round_bit_w;
	round_bit_quo_msb_m1 <= quotient_w(2);
	round_bit_quo_msb_m2 <= quotient_w(1);
	round_bit_w <= ((quo_msb_m1_w AND round_bit_quo_msb_m1) OR wire_w_lg_w_lg_quo_msb_m1_w380w439w(0));
	sign_a_w <= sign_a_dffe;
	sign_b_w <= sign_b_dffe;
	sign_div <= (sign_a_w XOR sign_b_w);
	sign_div_pipeline_w <= sign_div_pipeline27c;
	sign_exc_bit_w <= sign_pipe3a;
	signed_N_exp_h_or <= (exp_sign_w AND exp_higher_or(1));
	sticky_bit_dffe1a_w <= sticky_bit_w;
	sticky_bit_quo_msb_m1 <= (quo_msb_m1_compare_w OR sticky_bit_quo_msb_m1_or(1));
	sticky_bit_quo_msb_m1_bit <= sticky_bit_quo_msb_m1_tmp;
	sticky_bit_quo_msb_m1_or <= ( wire_w_lg_w_sticky_bit_quo_msb_m1_or_range388w391w & sticky_bit_quo_msb_m1_bit(0));
	sticky_bit_quo_msb_m1_tmp <= quotient_w(1 DOWNTO 0);
	sticky_bit_quo_msb_m2 <= (quo_msb_m2_compare_w OR sticky_bit_quo_msb_m2_or(0));
	sticky_bit_quo_msb_m2_bit <= sticky_bit_quo_msb_m2_tmp;
	sticky_bit_quo_msb_m2_or(0) <= ( sticky_bit_quo_msb_m2_bit(0));
	sticky_bit_quo_msb_m2_tmp(0) <= quotient_w(0);
	sticky_bit_w <= ((quo_msb_m1_w AND sticky_bit_quo_msb_m1) OR wire_w_lg_w_lg_quo_msb_m1_w380w442w(0));
	sticky_quo_msb_m1_comparator_lower_lower_ageb_w <= wire_cmpr5_ageb;
	sticky_quo_msb_m1_comparator_lower_upper_aeb_w <= wire_cmpr4_aeb;
	sticky_quo_msb_m1_comparator_lower_upper_agb_w <= wire_cmpr4_agb;
	sticky_quo_msb_m1_comparator_upper_lower_aeb_w <= wire_cmpr3_aeb;
	sticky_quo_msb_m1_comparator_upper_lower_agb_w <= wire_cmpr3_agb;
	sticky_quo_msb_m1_comparator_upper_upper_aeb_w <= wire_cmpr2_aeb;
	sticky_quo_msb_m1_comparator_upper_upper_agb_w <= wire_cmpr2_agb;
	sticky_quo_msb_m2_comparator_lower_ageb_w <= wire_cmpr7_ageb;
	sticky_quo_msb_m2_comparator_upper_aeb_w <= wire_cmpr6_aeb;
	sticky_quo_msb_m2_comparator_upper_agb_w <= wire_cmpr6_agb;
	underflow_zeros_w <= (OTHERS => '0');
	value_add_1_w <= "010000000";
	value_minus_1_w <= "001111110";
	value_normal_w <= "001111111";
	value_zero_w <= (OTHERS => '0');
	zero_bit_23_w <= (OTHERS => '0');
	zero_bit_31_w <= (OTHERS => '0');
	zero_bit_8_w <= (OTHERS => '0');
	zero_bit_w <= '0';
	zero_dataa_w <= (exp_a_zero_w AND man_a_zero_w);
	zero_datab_w <= (exp_b_zero_w AND man_b_zero_w);
	zero_res_w <= ( sign_exc_bit_w & exp_exc_zeros_w & man_exc_zeros_w);
	zero_w <= (((zero_dataa_w AND norm_datab_w) OR (norm_dataa_w AND infi_datab_w)) OR (zero_dataa_w AND infi_datab_w));
	wire_w_dataa_range352w <= dataa(30 DOWNTO 0);
	wire_w_dataa_int_range366w <= dataa_int(22 DOWNTO 0);
	wire_w_dataa_int_range365w <= dataa_int(30 DOWNTO 23);
	wire_w_datab_range360w <= datab(30 DOWNTO 0);
	wire_w_datab_int_range368w <= datab_int(22 DOWNTO 0);
	wire_w_datab_int_range367w <= datab_int(30 DOWNTO 23);
	wire_w_exp_a_and_w_range26w(0) <= exp_a_and_w(0);
	wire_w_exp_a_and_w_range29w(0) <= exp_a_and_w(1);
	wire_w_exp_a_and_w_range31w(0) <= exp_a_and_w(2);
	wire_w_exp_a_and_w_range33w(0) <= exp_a_and_w(3);
	wire_w_exp_a_and_w_range35w(0) <= exp_a_and_w(4);
	wire_w_exp_a_and_w_range37w(0) <= exp_a_and_w(5);
	wire_w_exp_a_and_w_range39w(0) <= exp_a_and_w(6);
	wire_w_exp_a_bus_w_range5w(0) <= exp_a_bus_w(1);
	wire_w_exp_a_bus_w_range8w(0) <= exp_a_bus_w(2);
	wire_w_exp_a_bus_w_range11w(0) <= exp_a_bus_w(3);
	wire_w_exp_a_bus_w_range14w(0) <= exp_a_bus_w(4);
	wire_w_exp_a_bus_w_range17w(0) <= exp_a_bus_w(5);
	wire_w_exp_a_bus_w_range20w(0) <= exp_a_bus_w(6);
	wire_w_exp_a_bus_w_range23w(0) <= exp_a_bus_w(7);
	wire_w_exp_a_or_w_range3w(0) <= exp_a_or_w(0);
	wire_w_exp_a_or_w_range7w(0) <= exp_a_or_w(1);
	wire_w_exp_a_or_w_range10w(0) <= exp_a_or_w(2);
	wire_w_exp_a_or_w_range13w(0) <= exp_a_or_w(3);
	wire_w_exp_a_or_w_range16w(0) <= exp_a_or_w(4);
	wire_w_exp_a_or_w_range19w(0) <= exp_a_or_w(5);
	wire_w_exp_a_or_w_range22w(0) <= exp_a_or_w(6);
	wire_w_exp_b_and_w_range67w(0) <= exp_b_and_w(0);
	wire_w_exp_b_and_w_range70w(0) <= exp_b_and_w(1);
	wire_w_exp_b_and_w_range72w(0) <= exp_b_and_w(2);
	wire_w_exp_b_and_w_range74w(0) <= exp_b_and_w(3);
	wire_w_exp_b_and_w_range76w(0) <= exp_b_and_w(4);
	wire_w_exp_b_and_w_range78w(0) <= exp_b_and_w(5);
	wire_w_exp_b_and_w_range80w(0) <= exp_b_and_w(6);
	wire_w_exp_b_bus_w_range46w(0) <= exp_b_bus_w(1);
	wire_w_exp_b_bus_w_range49w(0) <= exp_b_bus_w(2);
	wire_w_exp_b_bus_w_range52w(0) <= exp_b_bus_w(3);
	wire_w_exp_b_bus_w_range55w(0) <= exp_b_bus_w(4);
	wire_w_exp_b_bus_w_range58w(0) <= exp_b_bus_w(5);
	wire_w_exp_b_bus_w_range61w(0) <= exp_b_bus_w(6);
	wire_w_exp_b_bus_w_range64w(0) <= exp_b_bus_w(7);
	wire_w_exp_b_or_w_range44w(0) <= exp_b_or_w(0);
	wire_w_exp_b_or_w_range48w(0) <= exp_b_or_w(1);
	wire_w_exp_b_or_w_range51w(0) <= exp_b_or_w(2);
	wire_w_exp_b_or_w_range54w(0) <= exp_b_or_w(3);
	wire_w_exp_b_or_w_range57w(0) <= exp_b_or_w(4);
	wire_w_exp_b_or_w_range60w(0) <= exp_b_or_w(5);
	wire_w_exp_b_or_w_range63w(0) <= exp_b_or_w(6);
	wire_w_exp_bias_and_w_range492w(0) <= exp_bias_and_w(0);
	wire_w_exp_bias_and_w_range496w(0) <= exp_bias_and_w(1);
	wire_w_exp_bias_and_w_range499w(0) <= exp_bias_and_w(2);
	wire_w_exp_bias_and_w_range502w(0) <= exp_bias_and_w(3);
	wire_w_exp_bias_and_w_range505w(0) <= exp_bias_and_w(4);
	wire_w_exp_bias_and_w_range508w(0) <= exp_bias_and_w(5);
	wire_w_exp_bias_and_w_range511w(0) <= exp_bias_and_w(6);
	wire_w_exp_bias_bus_w_range494w(0) <= exp_bias_bus_w(1);
	wire_w_exp_bias_bus_w_range497w(0) <= exp_bias_bus_w(2);
	wire_w_exp_bias_bus_w_range500w(0) <= exp_bias_bus_w(3);
	wire_w_exp_bias_bus_w_range503w(0) <= exp_bias_bus_w(4);
	wire_w_exp_bias_bus_w_range506w(0) <= exp_bias_bus_w(5);
	wire_w_exp_bias_bus_w_range509w(0) <= exp_bias_bus_w(6);
	wire_w_exp_bias_bus_w_range512w(0) <= exp_bias_bus_w(7);
	wire_w_exp_higher_bit_range533w(0) <= exp_higher_bit(1);
	wire_w_exp_higher_or_range531w(0) <= exp_higher_or(0);
	wire_w_exp_res_and_w_range680w(0) <= exp_res_and_w(0);
	wire_w_exp_res_and_w_range684w(0) <= exp_res_and_w(1);
	wire_w_exp_res_and_w_range687w(0) <= exp_res_and_w(2);
	wire_w_exp_res_and_w_range690w(0) <= exp_res_and_w(3);
	wire_w_exp_res_and_w_range693w(0) <= exp_res_and_w(4);
	wire_w_exp_res_and_w_range696w(0) <= exp_res_and_w(5);
	wire_w_exp_res_and_w_range699w(0) <= exp_res_and_w(6);
	wire_w_exp_res_and_w_range702w(0) <= exp_res_and_w(7);
	wire_w_exp_res_bus_w_range682w(0) <= exp_res_bus_w(1);
	wire_w_exp_res_bus_w_range685w(0) <= exp_res_bus_w(2);
	wire_w_exp_res_bus_w_range688w(0) <= exp_res_bus_w(3);
	wire_w_exp_res_bus_w_range691w(0) <= exp_res_bus_w(4);
	wire_w_exp_res_bus_w_range694w(0) <= exp_res_bus_w(5);
	wire_w_exp_res_bus_w_range697w(0) <= exp_res_bus_w(6);
	wire_w_exp_res_bus_w_range700w(0) <= exp_res_bus_w(7);
	wire_w_exp_res_int2_bus_w_range598w(0) <= exp_res_int2_bus_w(1);
	wire_w_exp_res_int2_bus_w_range601w(0) <= exp_res_int2_bus_w(2);
	wire_w_exp_res_int2_bus_w_range604w(0) <= exp_res_int2_bus_w(3);
	wire_w_exp_res_int2_bus_w_range607w(0) <= exp_res_int2_bus_w(4);
	wire_w_exp_res_int2_bus_w_range610w(0) <= exp_res_int2_bus_w(5);
	wire_w_exp_res_int2_bus_w_range613w(0) <= exp_res_int2_bus_w(6);
	wire_w_exp_res_int2_bus_w_range616w(0) <= exp_res_int2_bus_w(7);
	wire_w_exp_res_int2_or_w_range596w(0) <= exp_res_int2_or_w(0);
	wire_w_exp_res_int2_or_w_range600w(0) <= exp_res_int2_or_w(1);
	wire_w_exp_res_int2_or_w_range603w(0) <= exp_res_int2_or_w(2);
	wire_w_exp_res_int2_or_w_range606w(0) <= exp_res_int2_or_w(3);
	wire_w_exp_res_int2_or_w_range609w(0) <= exp_res_int2_or_w(4);
	wire_w_exp_res_int2_or_w_range612w(0) <= exp_res_int2_or_w(5);
	wire_w_exp_res_int2_or_w_range615w(0) <= exp_res_int2_or_w(6);
	wire_w_man_a_and_w_range153w(0) <= man_a_and_w(0);
	wire_w_man_a_and_w_range174w(0) <= man_a_and_w(10);
	wire_w_man_a_and_w_range176w(0) <= man_a_and_w(11);
	wire_w_man_a_and_w_range178w(0) <= man_a_and_w(12);
	wire_w_man_a_and_w_range180w(0) <= man_a_and_w(13);
	wire_w_man_a_and_w_range182w(0) <= man_a_and_w(14);
	wire_w_man_a_and_w_range184w(0) <= man_a_and_w(15);
	wire_w_man_a_and_w_range186w(0) <= man_a_and_w(16);
	wire_w_man_a_and_w_range188w(0) <= man_a_and_w(17);
	wire_w_man_a_and_w_range190w(0) <= man_a_and_w(18);
	wire_w_man_a_and_w_range192w(0) <= man_a_and_w(19);
	wire_w_man_a_and_w_range156w(0) <= man_a_and_w(1);
	wire_w_man_a_and_w_range194w(0) <= man_a_and_w(20);
	wire_w_man_a_and_w_range196w(0) <= man_a_and_w(21);
	wire_w_man_a_and_w_range158w(0) <= man_a_and_w(2);
	wire_w_man_a_and_w_range160w(0) <= man_a_and_w(3);
	wire_w_man_a_and_w_range162w(0) <= man_a_and_w(4);
	wire_w_man_a_and_w_range164w(0) <= man_a_and_w(5);
	wire_w_man_a_and_w_range166w(0) <= man_a_and_w(6);
	wire_w_man_a_and_w_range168w(0) <= man_a_and_w(7);
	wire_w_man_a_and_w_range170w(0) <= man_a_and_w(8);
	wire_w_man_a_and_w_range172w(0) <= man_a_and_w(9);
	wire_w_man_a_bus_w_range114w(0) <= man_a_bus_w(10);
	wire_w_man_a_bus_w_range117w(0) <= man_a_bus_w(11);
	wire_w_man_a_bus_w_range120w(0) <= man_a_bus_w(12);
	wire_w_man_a_bus_w_range123w(0) <= man_a_bus_w(13);
	wire_w_man_a_bus_w_range126w(0) <= man_a_bus_w(14);
	wire_w_man_a_bus_w_range129w(0) <= man_a_bus_w(15);
	wire_w_man_a_bus_w_range132w(0) <= man_a_bus_w(16);
	wire_w_man_a_bus_w_range135w(0) <= man_a_bus_w(17);
	wire_w_man_a_bus_w_range138w(0) <= man_a_bus_w(18);
	wire_w_man_a_bus_w_range141w(0) <= man_a_bus_w(19);
	wire_w_man_a_bus_w_range87w(0) <= man_a_bus_w(1);
	wire_w_man_a_bus_w_range144w(0) <= man_a_bus_w(20);
	wire_w_man_a_bus_w_range147w(0) <= man_a_bus_w(21);
	wire_w_man_a_bus_w_range150w(0) <= man_a_bus_w(22);
	wire_w_man_a_bus_w_range90w(0) <= man_a_bus_w(2);
	wire_w_man_a_bus_w_range93w(0) <= man_a_bus_w(3);
	wire_w_man_a_bus_w_range96w(0) <= man_a_bus_w(4);
	wire_w_man_a_bus_w_range99w(0) <= man_a_bus_w(5);
	wire_w_man_a_bus_w_range102w(0) <= man_a_bus_w(6);
	wire_w_man_a_bus_w_range105w(0) <= man_a_bus_w(7);
	wire_w_man_a_bus_w_range108w(0) <= man_a_bus_w(8);
	wire_w_man_a_bus_w_range111w(0) <= man_a_bus_w(9);
	wire_w_man_a_or_w_range85w(0) <= man_a_or_w(0);
	wire_w_man_a_or_w_range116w(0) <= man_a_or_w(10);
	wire_w_man_a_or_w_range119w(0) <= man_a_or_w(11);
	wire_w_man_a_or_w_range122w(0) <= man_a_or_w(12);
	wire_w_man_a_or_w_range125w(0) <= man_a_or_w(13);
	wire_w_man_a_or_w_range128w(0) <= man_a_or_w(14);
	wire_w_man_a_or_w_range131w(0) <= man_a_or_w(15);
	wire_w_man_a_or_w_range134w(0) <= man_a_or_w(16);
	wire_w_man_a_or_w_range137w(0) <= man_a_or_w(17);
	wire_w_man_a_or_w_range140w(0) <= man_a_or_w(18);
	wire_w_man_a_or_w_range143w(0) <= man_a_or_w(19);
	wire_w_man_a_or_w_range89w(0) <= man_a_or_w(1);
	wire_w_man_a_or_w_range146w(0) <= man_a_or_w(20);
	wire_w_man_a_or_w_range149w(0) <= man_a_or_w(21);
	wire_w_man_a_or_w_range92w(0) <= man_a_or_w(2);
	wire_w_man_a_or_w_range95w(0) <= man_a_or_w(3);
	wire_w_man_a_or_w_range98w(0) <= man_a_or_w(4);
	wire_w_man_a_or_w_range101w(0) <= man_a_or_w(5);
	wire_w_man_a_or_w_range104w(0) <= man_a_or_w(6);
	wire_w_man_a_or_w_range107w(0) <= man_a_or_w(7);
	wire_w_man_a_or_w_range110w(0) <= man_a_or_w(8);
	wire_w_man_a_or_w_range113w(0) <= man_a_or_w(9);
	wire_w_man_b_and_w_range269w(0) <= man_b_and_w(0);
	wire_w_man_b_and_w_range290w(0) <= man_b_and_w(10);
	wire_w_man_b_and_w_range292w(0) <= man_b_and_w(11);
	wire_w_man_b_and_w_range294w(0) <= man_b_and_w(12);
	wire_w_man_b_and_w_range296w(0) <= man_b_and_w(13);
	wire_w_man_b_and_w_range298w(0) <= man_b_and_w(14);
	wire_w_man_b_and_w_range300w(0) <= man_b_and_w(15);
	wire_w_man_b_and_w_range302w(0) <= man_b_and_w(16);
	wire_w_man_b_and_w_range304w(0) <= man_b_and_w(17);
	wire_w_man_b_and_w_range306w(0) <= man_b_and_w(18);
	wire_w_man_b_and_w_range308w(0) <= man_b_and_w(19);
	wire_w_man_b_and_w_range272w(0) <= man_b_and_w(1);
	wire_w_man_b_and_w_range310w(0) <= man_b_and_w(20);
	wire_w_man_b_and_w_range312w(0) <= man_b_and_w(21);
	wire_w_man_b_and_w_range274w(0) <= man_b_and_w(2);
	wire_w_man_b_and_w_range276w(0) <= man_b_and_w(3);
	wire_w_man_b_and_w_range278w(0) <= man_b_and_w(4);
	wire_w_man_b_and_w_range280w(0) <= man_b_and_w(5);
	wire_w_man_b_and_w_range282w(0) <= man_b_and_w(6);
	wire_w_man_b_and_w_range284w(0) <= man_b_and_w(7);
	wire_w_man_b_and_w_range286w(0) <= man_b_and_w(8);
	wire_w_man_b_and_w_range288w(0) <= man_b_and_w(9);
	wire_w_man_b_bus_w_range230w(0) <= man_b_bus_w(10);
	wire_w_man_b_bus_w_range233w(0) <= man_b_bus_w(11);
	wire_w_man_b_bus_w_range236w(0) <= man_b_bus_w(12);
	wire_w_man_b_bus_w_range239w(0) <= man_b_bus_w(13);
	wire_w_man_b_bus_w_range242w(0) <= man_b_bus_w(14);
	wire_w_man_b_bus_w_range245w(0) <= man_b_bus_w(15);
	wire_w_man_b_bus_w_range248w(0) <= man_b_bus_w(16);
	wire_w_man_b_bus_w_range251w(0) <= man_b_bus_w(17);
	wire_w_man_b_bus_w_range254w(0) <= man_b_bus_w(18);
	wire_w_man_b_bus_w_range257w(0) <= man_b_bus_w(19);
	wire_w_man_b_bus_w_range203w(0) <= man_b_bus_w(1);
	wire_w_man_b_bus_w_range260w(0) <= man_b_bus_w(20);
	wire_w_man_b_bus_w_range263w(0) <= man_b_bus_w(21);
	wire_w_man_b_bus_w_range266w(0) <= man_b_bus_w(22);
	wire_w_man_b_bus_w_range206w(0) <= man_b_bus_w(2);
	wire_w_man_b_bus_w_range209w(0) <= man_b_bus_w(3);
	wire_w_man_b_bus_w_range212w(0) <= man_b_bus_w(4);
	wire_w_man_b_bus_w_range215w(0) <= man_b_bus_w(5);
	wire_w_man_b_bus_w_range218w(0) <= man_b_bus_w(6);
	wire_w_man_b_bus_w_range221w(0) <= man_b_bus_w(7);
	wire_w_man_b_bus_w_range224w(0) <= man_b_bus_w(8);
	wire_w_man_b_bus_w_range227w(0) <= man_b_bus_w(9);
	wire_w_man_b_or_w_range201w(0) <= man_b_or_w(0);
	wire_w_man_b_or_w_range232w(0) <= man_b_or_w(10);
	wire_w_man_b_or_w_range235w(0) <= man_b_or_w(11);
	wire_w_man_b_or_w_range238w(0) <= man_b_or_w(12);
	wire_w_man_b_or_w_range241w(0) <= man_b_or_w(13);
	wire_w_man_b_or_w_range244w(0) <= man_b_or_w(14);
	wire_w_man_b_or_w_range247w(0) <= man_b_or_w(15);
	wire_w_man_b_or_w_range250w(0) <= man_b_or_w(16);
	wire_w_man_b_or_w_range253w(0) <= man_b_or_w(17);
	wire_w_man_b_or_w_range256w(0) <= man_b_or_w(18);
	wire_w_man_b_or_w_range259w(0) <= man_b_or_w(19);
	wire_w_man_b_or_w_range205w(0) <= man_b_or_w(1);
	wire_w_man_b_or_w_range262w(0) <= man_b_or_w(20);
	wire_w_man_b_or_w_range265w(0) <= man_b_or_w(21);
	wire_w_man_b_or_w_range208w(0) <= man_b_or_w(2);
	wire_w_man_b_or_w_range211w(0) <= man_b_or_w(3);
	wire_w_man_b_or_w_range214w(0) <= man_b_or_w(4);
	wire_w_man_b_or_w_range217w(0) <= man_b_or_w(5);
	wire_w_man_b_or_w_range220w(0) <= man_b_or_w(6);
	wire_w_man_b_or_w_range223w(0) <= man_b_or_w(7);
	wire_w_man_b_or_w_range226w(0) <= man_b_or_w(8);
	wire_w_man_b_or_w_range229w(0) <= man_b_or_w(9);
	wire_w_man_res_bus_w_range734w(0) <= man_res_bus_w(10);
	wire_w_man_res_bus_w_range737w(0) <= man_res_bus_w(11);
	wire_w_man_res_bus_w_range740w(0) <= man_res_bus_w(12);
	wire_w_man_res_bus_w_range743w(0) <= man_res_bus_w(13);
	wire_w_man_res_bus_w_range746w(0) <= man_res_bus_w(14);
	wire_w_man_res_bus_w_range749w(0) <= man_res_bus_w(15);
	wire_w_man_res_bus_w_range752w(0) <= man_res_bus_w(16);
	wire_w_man_res_bus_w_range755w(0) <= man_res_bus_w(17);
	wire_w_man_res_bus_w_range758w(0) <= man_res_bus_w(18);
	wire_w_man_res_bus_w_range761w(0) <= man_res_bus_w(19);
	wire_w_man_res_bus_w_range707w(0) <= man_res_bus_w(1);
	wire_w_man_res_bus_w_range764w(0) <= man_res_bus_w(20);
	wire_w_man_res_bus_w_range767w(0) <= man_res_bus_w(21);
	wire_w_man_res_bus_w_range770w(0) <= man_res_bus_w(22);
	wire_w_man_res_bus_w_range710w(0) <= man_res_bus_w(2);
	wire_w_man_res_bus_w_range713w(0) <= man_res_bus_w(3);
	wire_w_man_res_bus_w_range716w(0) <= man_res_bus_w(4);
	wire_w_man_res_bus_w_range719w(0) <= man_res_bus_w(5);
	wire_w_man_res_bus_w_range722w(0) <= man_res_bus_w(6);
	wire_w_man_res_bus_w_range725w(0) <= man_res_bus_w(7);
	wire_w_man_res_bus_w_range728w(0) <= man_res_bus_w(8);
	wire_w_man_res_bus_w_range731w(0) <= man_res_bus_w(9);
	wire_w_man_res_or_w_range705w(0) <= man_res_or_w(0);
	wire_w_man_res_or_w_range736w(0) <= man_res_or_w(10);
	wire_w_man_res_or_w_range739w(0) <= man_res_or_w(11);
	wire_w_man_res_or_w_range742w(0) <= man_res_or_w(12);
	wire_w_man_res_or_w_range745w(0) <= man_res_or_w(13);
	wire_w_man_res_or_w_range748w(0) <= man_res_or_w(14);
	wire_w_man_res_or_w_range751w(0) <= man_res_or_w(15);
	wire_w_man_res_or_w_range754w(0) <= man_res_or_w(16);
	wire_w_man_res_or_w_range757w(0) <= man_res_or_w(17);
	wire_w_man_res_or_w_range760w(0) <= man_res_or_w(18);
	wire_w_man_res_or_w_range763w(0) <= man_res_or_w(19);
	wire_w_man_res_or_w_range709w(0) <= man_res_or_w(1);
	wire_w_man_res_or_w_range766w(0) <= man_res_or_w(20);
	wire_w_man_res_or_w_range769w(0) <= man_res_or_w(21);
	wire_w_man_res_or_w_range772w(0) <= man_res_or_w(22);
	wire_w_man_res_or_w_range712w(0) <= man_res_or_w(2);
	wire_w_man_res_or_w_range715w(0) <= man_res_or_w(3);
	wire_w_man_res_or_w_range718w(0) <= man_res_or_w(4);
	wire_w_man_res_or_w_range721w(0) <= man_res_or_w(5);
	wire_w_man_res_or_w_range724w(0) <= man_res_or_w(6);
	wire_w_man_res_or_w_range727w(0) <= man_res_or_w(7);
	wire_w_man_res_or_w_range730w(0) <= man_res_or_w(8);
	wire_w_man_res_or_w_range733w(0) <= man_res_or_w(9);
	wire_w_norm_infi_and_w_range562w(0) <= norm_infi_and_w(0);
	wire_w_norm_infi_and_w_range566w(0) <= norm_infi_and_w(1);
	wire_w_norm_infi_and_w_range569w(0) <= norm_infi_and_w(2);
	wire_w_norm_infi_and_w_range572w(0) <= norm_infi_and_w(3);
	wire_w_norm_infi_and_w_range575w(0) <= norm_infi_and_w(4);
	wire_w_norm_infi_and_w_range578w(0) <= norm_infi_and_w(5);
	wire_w_norm_infi_and_w_range581w(0) <= norm_infi_and_w(6);
	wire_w_norm_infi_bus_w_range564w(0) <= norm_infi_bus_w(1);
	wire_w_norm_infi_bus_w_range567w(0) <= norm_infi_bus_w(2);
	wire_w_norm_infi_bus_w_range570w(0) <= norm_infi_bus_w(3);
	wire_w_norm_infi_bus_w_range573w(0) <= norm_infi_bus_w(4);
	wire_w_norm_infi_bus_w_range576w(0) <= norm_infi_bus_w(5);
	wire_w_norm_infi_bus_w_range579w(0) <= norm_infi_bus_w(6);
	wire_w_norm_infi_bus_w_range582w(0) <= norm_infi_bus_w(7);
	wire_w_norm_zero_bus_w_range539w(0) <= norm_zero_bus_w(1);
	wire_w_norm_zero_bus_w_range542w(0) <= norm_zero_bus_w(2);
	wire_w_norm_zero_bus_w_range545w(0) <= norm_zero_bus_w(3);
	wire_w_norm_zero_bus_w_range548w(0) <= norm_zero_bus_w(4);
	wire_w_norm_zero_bus_w_range551w(0) <= norm_zero_bus_w(5);
	wire_w_norm_zero_bus_w_range554w(0) <= norm_zero_bus_w(6);
	wire_w_norm_zero_bus_w_range557w(0) <= norm_zero_bus_w(7);
	wire_w_norm_zero_or_w_range537w(0) <= norm_zero_or_w(0);
	wire_w_norm_zero_or_w_range541w(0) <= norm_zero_or_w(1);
	wire_w_norm_zero_or_w_range544w(0) <= norm_zero_or_w(2);
	wire_w_norm_zero_or_w_range547w(0) <= norm_zero_or_w(3);
	wire_w_norm_zero_or_w_range550w(0) <= norm_zero_or_w(4);
	wire_w_norm_zero_or_w_range553w(0) <= norm_zero_or_w(5);
	wire_w_norm_zero_or_w_range556w(0) <= norm_zero_or_w(6);
	wire_w_sticky_bit_quo_msb_m1_bit_range390w(0) <= sticky_bit_quo_msb_m1_bit(1);
	wire_w_sticky_bit_quo_msb_m1_or_range388w(0) <= sticky_bit_quo_msb_m1_or(0);
	altfp_div_csa8 :  cpu_fpoint_div_single_altfp_div_csa_vhf
	  PORT MAP ( 
		cin => add_1_w,
		cout => wire_altfp_div_csa8_cout,
		dataa => add_1_dataa_w,
		datab => add_1_datab_w,
		result => wire_altfp_div_csa8_result
	  );
	altfp_div_srt_ext1 :  cpu_fpoint_div_single_altfp_div_srt_ext_mkh
	  PORT MAP ( 
		aclr => aclr,
		clken => clk_en,
		clock => clock,
		denom => man_b_w,
		divider => wire_altfp_div_srt_ext1_divider,
		numer => man_a_w,
		quotient => wire_altfp_div_srt_ext1_quotient,
		remain => wire_altfp_div_srt_ext1_remain
	  );
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_dffe <= exp_man_and_or_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_dffe1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_dffe1a <= and_or_pipeline_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_dffe3a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_dffe3a <= and_or_int_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline0c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline0c <= and_or_dffe_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline10c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline10c <= and_or_pipeline9c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline11c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline11c <= and_or_pipeline10c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline12c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline12c <= and_or_pipeline11c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline13c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline13c <= and_or_pipeline12c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline14c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline14c <= and_or_pipeline13c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline15c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline15c <= and_or_pipeline14c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline16c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline16c <= and_or_pipeline15c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline17c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline17c <= and_or_pipeline16c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline18c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline18c <= and_or_pipeline17c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline19c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline19c <= and_or_pipeline18c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline1c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline1c <= and_or_pipeline0c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline20c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline20c <= and_or_pipeline19c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline21c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline21c <= and_or_pipeline20c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline22c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline22c <= and_or_pipeline21c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline23c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline23c <= and_or_pipeline22c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline24c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline24c <= and_or_pipeline23c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline25c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline25c <= and_or_pipeline24c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline26c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline26c <= and_or_pipeline25c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline27c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline27c <= and_or_pipeline26c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline2c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline2c <= and_or_pipeline1c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline3c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline3c <= and_or_pipeline2c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline4c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline4c <= and_or_pipeline3c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline5c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline5c <= and_or_pipeline4c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline6c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline6c <= and_or_pipeline5c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline7c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline7c <= and_or_pipeline6c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline8c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline8c <= and_or_pipeline7c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN and_or_pipeline9c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN and_or_pipeline9c <= and_or_pipeline8c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN bias_addition_overf_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN bias_addition_overf_dffe <= bias_addition_overf_w;
			END IF;
		END IF;
	END PROCESS;
	wire_bias_addition_overf_dffe_w_lg_q781w(0) <= bias_addition_overf_dffe AND wire_w_lg_nan_w780w(0);
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN divider_pipe1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN divider_pipe1a <= wire_altfp_div_srt_ext1_divider;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_a_and_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_a_and_dffe <= exp_a_and_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_a_b_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_a_b_dffe <= exp_or_result_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_a_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_a_dffe <= wire_w_dataa_int_range365w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_a_or_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_a_or_dffe <= exp_a_or_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	wire_exp_a_or_dffe_w_lg_q629w(0) <= NOT exp_a_or_dffe;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_b_and_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_b_and_dffe <= exp_b_and_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_b_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_b_dffe <= wire_w_datab_int_range367w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_b_or_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_b_or_dffe <= exp_b_or_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	wire_exp_b_or_dffe_w_lg_q632w(0) <= NOT exp_b_or_dffe;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_dffe1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_dffe1a <= exp_pipeline_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_dffe2a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_dffe2a <= exp_dffe1a_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline0c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline0c <= exp_sub_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline10c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline10c <= exp_pipeline9c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline11c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline11c <= exp_pipeline10c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline12c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline12c <= exp_pipeline11c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline13c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline13c <= exp_pipeline12c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline14c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline14c <= exp_pipeline13c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline15c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline15c <= exp_pipeline14c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline16c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline16c <= exp_pipeline15c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline17c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline17c <= exp_pipeline16c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline18c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline18c <= exp_pipeline17c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline19c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline19c <= exp_pipeline18c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline1c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline1c <= exp_pipeline0c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline20c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline20c <= exp_pipeline19c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline21c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline21c <= exp_pipeline20c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline22c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline22c <= exp_pipeline21c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline23c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline23c <= exp_pipeline22c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline24c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline24c <= exp_pipeline23c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline25c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline25c <= exp_pipeline24c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline26c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline26c <= exp_pipeline25c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline2c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline2c <= exp_pipeline1c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline3c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline3c <= exp_pipeline2c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline4c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline4c <= exp_pipeline3c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline5c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline5c <= exp_pipeline4c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline6c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline6c <= exp_pipeline5c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline7c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline7c <= exp_pipeline6c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline8c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline8c <= exp_pipeline7c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_pipeline9c <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_pipeline9c <= exp_pipeline8c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN exp_res_pipe3 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN exp_res_pipe3 <= exp_res_int_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN implied_bit <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN implied_bit <= wire_altfp_div_srt_ext1_quotient(26);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN implied_bit2a <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN implied_bit2a <= implied_bit;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_a_and_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_a_and_dffe <= man_a_and_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_a_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_a_dffe <= wire_w_dataa_int_range366w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_a_or_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_a_or_dffe <= man_a_or_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	wire_man_a_or_dffe_w_lg_q635w(0) <= NOT man_a_or_dffe;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_b_and_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_b_and_dffe <= man_b_and_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_b_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_b_dffe <= wire_w_datab_int_range368w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_b_or_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_b_or_dffe <= man_b_or_msb2_w;
			END IF;
		END IF;
	END PROCESS;
	wire_man_b_or_dffe_w_lg_q638w(0) <= NOT man_b_or_dffe;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN man_res_pipe3 <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN man_res_pipe3 <= man_res_int_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN quotient_pipe1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN quotient_pipe1a <= wire_altfp_div_srt_ext1_quotient;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN remainder_pipe1a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN remainder_pipe1a <= wire_altfp_div_srt_ext1_remain;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN result_output_dffe <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN result_output_dffe <= mux_3_res_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rnd_overflow_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN rnd_overflow_dffe <= rnd_overflow;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN rnded_man_pipe2a <= (OTHERS => '0');
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN rnded_man_pipe2a <= rnded_man_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_a_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_a_dffe <= dataa_int(31);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_b_dffe <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_b_dffe <= datab_int(31);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline0c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline0c <= sign_div;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline10c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline10c <= sign_div_pipeline9c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline11c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline11c <= sign_div_pipeline10c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline12c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline12c <= sign_div_pipeline11c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline13c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline13c <= sign_div_pipeline12c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline14c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline14c <= sign_div_pipeline13c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline15c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline15c <= sign_div_pipeline14c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline16c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline16c <= sign_div_pipeline15c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline17c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline17c <= sign_div_pipeline16c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline18c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline18c <= sign_div_pipeline17c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline19c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline19c <= sign_div_pipeline18c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline1c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline1c <= sign_div_pipeline0c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline20c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline20c <= sign_div_pipeline19c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline21c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline21c <= sign_div_pipeline20c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline22c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline22c <= sign_div_pipeline21c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline23c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline23c <= sign_div_pipeline22c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline24c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline24c <= sign_div_pipeline23c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline25c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline25c <= sign_div_pipeline24c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline26c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline26c <= sign_div_pipeline25c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline27c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline27c <= sign_div_pipeline26c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline2c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline2c <= sign_div_pipeline1c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline3c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline3c <= sign_div_pipeline2c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline4c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline4c <= sign_div_pipeline3c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline5c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline5c <= sign_div_pipeline4c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline6c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline6c <= sign_div_pipeline5c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline7c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline7c <= sign_div_pipeline6c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline8c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline8c <= sign_div_pipeline7c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_div_pipeline9c <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_div_pipeline9c <= sign_div_pipeline8c;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_pipe1a <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_pipe1a <= sign_div_pipeline_w;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_pipe2a <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_pipe2a <= sign_pipe1a;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, aclr)
	BEGIN
		IF (aclr = '1') THEN sign_pipe3a <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (clk_en = '1') THEN sign_pipe3a <= sign_pipe2a;
			END IF;
		END IF;
	END PROCESS;
	add_sub10 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		dataa => exp_dffe2a_w,
		datab => bias_add_w,
		overflow => wire_add_sub10_overflow,
		result => wire_add_sub10_result
	  );
	add_sub9 :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "SUB",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 9
	  )
	  PORT MAP ( 
		aclr => aclr,
		clken => clk_en,
		clock => clock,
		dataa => exp_sub_a_w,
		datab => exp_sub_b_w,
		result => wire_add_sub9_result
	  );
	cmpr2 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 14
	  )
	  PORT MAP ( 
		aeb => wire_cmpr2_aeb,
		agb => wire_cmpr2_agb,
		dataa => quo_msb_m1_compare_dataa(52 DOWNTO 39),
		datab => quo_msb_m1_compare_datab(52 DOWNTO 39)
	  );
	cmpr3 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		aeb => wire_cmpr3_aeb,
		agb => wire_cmpr3_agb,
		dataa => quo_msb_m1_compare_dataa(38 DOWNTO 26),
		datab => quo_msb_m1_compare_datab(38 DOWNTO 26)
	  );
	cmpr4 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		aeb => wire_cmpr4_aeb,
		agb => wire_cmpr4_agb,
		dataa => quo_msb_m1_compare_dataa(25 DOWNTO 13),
		datab => quo_msb_m1_compare_datab(25 DOWNTO 13)
	  );
	cmpr5 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 13
	  )
	  PORT MAP ( 
		ageb => wire_cmpr5_ageb,
		dataa => quo_msb_m1_compare_dataa(12 DOWNTO 0),
		datab => quo_msb_m1_compare_datab(12 DOWNTO 0)
	  );
	cmpr6 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 27
	  )
	  PORT MAP ( 
		aeb => wire_cmpr6_aeb,
		agb => wire_cmpr6_agb,
		dataa => quo_msb_m2_compare_dataa(53 DOWNTO 27),
		datab => quo_msb_m2_compare_datab(53 DOWNTO 27)
	  );
	cmpr7 :  lpm_compare
	  GENERIC MAP (
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 27
	  )
	  PORT MAP ( 
		ageb => wire_cmpr7_ageb,
		dataa => quo_msb_m2_compare_dataa(26 DOWNTO 0),
		datab => quo_msb_m2_compare_datab(26 DOWNTO 0)
	  );

 END RTL; --cpu_fpoint_div_single
--VALID FILE

--Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_fpoint is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal clk_en : IN STD_LOGIC;
                 signal dataa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal datab : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal n : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal reset : IN STD_LOGIC;
                 signal start : IN STD_LOGIC;

              -- outputs:
                 signal done : OUT STD_LOGIC;
                 signal result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity cpu_fpoint;


architecture europa of cpu_fpoint is
  component cpu_fpoint_mult_single is
PORT (
    signal result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal aclr : IN STD_LOGIC;
        signal clock : IN STD_LOGIC;
        signal dataa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal clk_en : IN STD_LOGIC;
        signal datab : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component cpu_fpoint_mult_single;
  component cpu_fpoint_addsub_single is
PORT (
    signal result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal aclr : IN STD_LOGIC;
        signal add_sub : IN STD_LOGIC;
        signal clock : IN STD_LOGIC;
        signal dataa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal clk_en : IN STD_LOGIC;
        signal datab : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component cpu_fpoint_addsub_single;
  component cpu_fpoint_div_single is
PORT (
    signal result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal aclr : IN STD_LOGIC;
        signal clock : IN STD_LOGIC;
        signal dataa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        signal clk_en : IN STD_LOGIC;
        signal datab : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
      );
  end component cpu_fpoint_div_single;
                signal add_sub :  STD_LOGIC;
                signal counter_in :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal counter_out :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal dataa_regout :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal datab_regout :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal load_data :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal local_reset_n :  STD_LOGIC;
                signal result_addsub :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal result_div :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal result_mult :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  --register the input for dataa
  process (clk, local_reset_n)
  begin
    if local_reset_n = '0' then
      dataa_regout <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        dataa_regout <= dataa;
      end if;
    end if;

  end process;

  --register the input for datab
  process (clk, local_reset_n)
  begin
    if local_reset_n = '0' then
      datab_regout <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        datab_regout <= datab;
      end if;
    end if;

  end process;

  the_fp_mult : cpu_fpoint_mult_single
    port map(
            aclr => reset,
            clk_en => clk_en,
            clock => clk,
            dataa => dataa_regout,
            datab => datab_regout,
            result => result_mult
    );

  the_fp_addsub : cpu_fpoint_addsub_single
    port map(
            aclr => reset,
            add_sub => add_sub,
            clk_en => clk_en,
            clock => clk,
            dataa => dataa_regout,
            datab => datab_regout,
            result => result_addsub
    );

  the_fp_div : cpu_fpoint_div_single
    port map(
            aclr => reset,
            clk_en => clk_en,
            clock => clk,
            dataa => dataa_regout,
            datab => datab_regout,
            result => result_div
    );

  --s1, which is an e_custom_instruction_slave
  --down_counter to signal done
  process (clk, local_reset_n)
  begin
    if local_reset_n = '0' then
      counter_out <= std_logic_vector'("100001");
    elsif clk'event and clk = '1' then
      if std_logic'(clk_en) = '1' then 
        counter_out <= counter_in;
      end if;
    end if;

  end process;

  --decrement or load the counter based on start
  counter_in <= A_EXT (A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(start))) = std_logic_vector'("00000000000000000000000000000000"))), ((std_logic_vector'("0") & (counter_out)) - (std_logic_vector'("000000") & (A_TOSTDLOGICVECTOR(std_logic'('1'))))), (std_logic_vector'("0") & (load_data))), 6);
  add_sub <= n(0);
  local_reset_n <= NOT reset;
  done <= (clk_en AND nor_reduce(counter_out)) AND NOT start;
  --select load value of counter based on n
  load_data <= A_EXT (A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (n)) = std_logic_vector'("00000000000000000000000000000000"))), std_logic_vector'("00000000000000000000000000001010"), A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (n)) = std_logic_vector'("00000000000000000000000000000001"))), std_logic_vector'("00000000000000000000000000001000"), A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (n)) = std_logic_vector'("00000000000000000000000000000010"))), std_logic_vector'("00000000000000000000000000001000"), std_logic_vector'("00000000000000000000000000100001")))), 6);
  --multiplex output based on n
  result <= A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (n)) = std_logic_vector'("00000000000000000000000000000000"))), result_mult, A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (n)) = std_logic_vector'("00000000000000000000000000000001"))), result_addsub, A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (n)) = std_logic_vector'("00000000000000000000000000000010"))), result_addsub, result_div)));

end europa;

