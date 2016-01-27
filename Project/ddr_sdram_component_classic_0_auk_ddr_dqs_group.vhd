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

library altera_mf;
use altera_mf.all;

library cycloneii;
use cycloneii.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--------------------------------------------------------------------------------
--Parameters:
--Device Family                      : Cyclone II
--DQ_PER_DQS                         : 8
--NON-DQS MODE                       : false
--use Resynch clock                  : true
--Resynch clock edge                 : falling
--Postamble Clock Edge               : falling
--Postamble Clock Cycle              : 0
--Intermediate Resynch               : true
--Intermediate Postamble             : false
--Pipeline read Data                 : true
--Enable Postamble Logic             : true
--Postamble Regs Per DQS             : 1
--Stratix Insert DQS delay buffers   : 0
--------------------------------------------------------------------------------
entity ddr_sdram_component_classic_0_auk_ddr_dqs_group is 
        port (
              -- inputs:
                 signal capture_clk : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal control_be : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal control_doing_rd : IN STD_LOGIC;
                 signal control_doing_wr : IN STD_LOGIC;
                 signal control_dqs_burst : IN STD_LOGIC;
                 signal control_wdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal control_wdata_valid : IN STD_LOGIC;
                 signal postamble_clk : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal resynch_clk : IN STD_LOGIC;
                 signal write_clk : IN STD_LOGIC;

              -- outputs:
                 signal control_rdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal ddr_dm : OUT STD_LOGIC;
                 signal ddr_dq : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal ddr_dqs : INOUT STD_LOGIC
              );
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of ddr_sdram_component_classic_0_auk_ddr_dqs_group : entity is "MESSAGE_DISABLE=14130;SUPPRESS_DA_RULE_INTERNAL=C101;SUPPRESS_DA_RULE_INTERNAL=C103;SUPPRESS_DA_RULE_INTERNAL=C105;SUPPRESS_DA_RULE_INTERNAL=C106;SUPPRESS_DA_RULE_INTERNAL=R104;SUPPRESS_DA_RULE_INTERNAL=A102;SUPPRESS_DA_RULE_INTERNAL=A103;SUPPRESS_DA_RULE_INTERNAL=C104;SUPPRESS_DA_RULE_INTERNAL=D101;SUPPRESS_DA_RULE_INTERNAL=D102;SUPPRESS_DA_RULE_INTERNAL=D103;SUPPRESS_DA_RULE_INTERNAL=R102;SUPPRESS_DA_RULE_INTERNAL=R105";
end entity ddr_sdram_component_classic_0_auk_ddr_dqs_group;


architecture europa of ddr_sdram_component_classic_0_auk_ddr_dqs_group is

	component altddio_bidir
	    generic(
		width                    : positive; 
		power_up_high            : string := "OFF";
		oe_reg                   : string := "UNUSED";
		extend_oe_disable        : string := "UNUSED";
		implement_input_in_lcell : string := "UNUSED";
		invert_output            : string := "OFF";
		intended_device_family   : string := "MERCURY";
		lpm_hint                 : string := "UNUSED";
		lpm_type                 : string := "altddio_bidir" );
	    port (
		datain_h   : in std_logic_vector(width-1 downto 0);
		datain_l   : in std_logic_vector(width-1 downto 0);
		inclock    : in std_logic := '0';
		inclocken  : in std_logic := '1';
		outclock   : in std_logic;
		outclocken : in std_logic := '1';
		aset       : in std_logic := '0';
		aclr       : in std_logic := '0';
		oe         : in std_logic := '1';
		dataout_h  : out std_logic_vector(width-1 downto 0);
		dataout_l  : out std_logic_vector(width-1 downto 0);
		combout    : out std_logic_vector(width-1 downto 0);
        dqsundelayedout : out std_logic_vector(width-1 downto 0);
		padio      : inout std_logic_vector(width-1 downto 0) );
	end component;
	  component cycloneii_clk_delay_ctrl is
GENERIC (
      delay_chain : STRING;
        delay_chain_mode : STRING;
        lpm_type : STRING
      );
    PORT (
    signal clkout : OUT STD_LOGIC;
        signal clk : IN STD_LOGIC
      );
  end component cycloneii_clk_delay_ctrl;

		component altddio_out
		 generic (
			width                  : positive;  
			power_up_high          : string := "OFF";
			oe_reg                 : string := "UNUSED";
			extend_oe_disable      : string := "UNUSED";
			invert_output          : string := "OFF";
			intended_device_family : string := "MERCURY";
			lpm_hint               : string := "UNUSED";
			lpm_type               : string := "altddio_out" 
		);
		 port (
			datain_h   : in std_logic_vector(width-1 downto 0);
			datain_l   : in std_logic_vector(width-1 downto 0);
			outclock   : in std_logic;
			outclocken : in std_logic := '1';
			aset       : in std_logic := '0';
			aclr       : in std_logic := '0';
			oe         : in std_logic := '1';
			dataout    : out std_logic_vector(width-1 downto 0) 
		 );
		end component;
		--synthesis translate_off
  component cycloneii_clkctrl is
GENERIC (
      ena_register_mode : STRING;
        lpm_type : STRING
      );
    PORT (
    signal outclk : OUT STD_LOGIC;
        signal clkselect : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        signal ena : IN STD_LOGIC;
        signal inclk : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
      );
  end component cycloneii_clkctrl;
--synthesis translate_on
--synthesis read_comments_as_HDL on
--  component cycloneii_clkctrl is
--GENERIC (
--      ena_register_mode : STRING;
--        lpm_type : STRING
--      );
--    PORT (
--    signal outclk : OUT STD_LOGIC;
--        signal clkselect : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
--        signal ena : IN STD_LOGIC;
--        signal inclk : IN STD_LOGIC_VECTOR (3 DOWNTO 0)
--      );
--  end component cycloneii_clkctrl;
--synthesis read_comments_as_HDL off
                signal ONE :  STD_LOGIC;
                signal ZERO :  STD_LOGIC;
                signal ZEROS :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal ZEROS_14 :  STD_LOGIC_VECTOR (13 DOWNTO 0);
                signal be :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal delayed_dq_captured :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal delayed_dqs :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal dm_out :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal doing_rd :  STD_LOGIC;
                signal doing_rd_delayed :  STD_LOGIC;
                signal doing_rd_pipe :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal doing_wr :  STD_LOGIC;
                signal doing_wr_r :  STD_LOGIC;
                signal dq_capture_clk :  STD_LOGIC;
                signal dq_captured_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal dq_captured_falling :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dq_captured_rising :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dq_enable :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal dq_enable_reset :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal dq_oe :  STD_LOGIC;
                signal dqs_burst :  STD_LOGIC;
                signal dqs_clk :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal dqs_oe :  STD_LOGIC;
                signal dqs_oe_r :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal dqs_oe_vector :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal dqs_postamble_clk :  STD_LOGIC;
                signal dqs_twpst_ctrl :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal inter_rdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal internal_ddr_dm :  STD_LOGIC;
                signal not_dqs_clk :  STD_LOGIC_VECTOR (0 DOWNTO 0);
                signal rdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal reset :  STD_LOGIC;
                signal resynched_data :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal tmp_dmout0 :  STD_LOGIC;
                signal tmp_dmout1 :  STD_LOGIC;
                signal wdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal wdata_r :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal wdata_valid :  STD_LOGIC;
                signal wire_dqs_clkctrl_outclk :  STD_LOGIC_VECTOR (0 DOWNTO 0);

begin

  --


  ONE <= std_logic'('1');
  ZERO <= std_logic'('0');
  ZEROS <= std_logic_vector'("00000000");
  ZEROS_14 <= std_logic_vector'("00000000000000");
  reset <= NOT reset_n;
  not_dqs_clk <= NOT dqs_clk;
  -- rename user i/f signals, outputs
  control_rdata <= rdata;
  -- rename user i/f signals, inputs
  wdata <= control_wdata;
  wdata_valid <= control_wdata_valid;
  doing_wr <= control_doing_wr;
  doing_rd <= control_doing_rd;
  be <= control_be;
  dqs_burst <= control_dqs_burst;
  -------------------------------------------------------------------------------
  --DQS pin and its logic
  --Generate the output enable for DQS from the signal that indicates we're
  --doing a write. The DQS burst signal is generated by the controller to keep
  --the DQS toggling for the required burst length.
  -------------------------------------------------------------------------------

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dqs_oe_r(0) <= std_logic'('0');
      doing_wr_r <= std_logic'('0');
    elsif clk'event and clk = '1' then
      dqs_oe_r(0) <= dqs_oe;
      doing_wr_r <= doing_wr;
    end if;

  end process;

  dqs_oe <= doing_wr OR dqs_burst;
  dqs_oe_vector(0) <= dqs_oe;
  --Gate off the DQS at the end of a write burst to improve tWPST
  dqs_twpst_ctrl <= dqs_oe_vector AND dqs_oe_r;
  --

  dqs_io : altddio_bidir
    generic map(
      extend_oe_disable => "ON",
      implement_input_in_lcell => "UNUSED",
      intended_device_family => "Cyclone II",
      invert_output => "OFF",
      lpm_hint => "UNUSED",
      lpm_type => "altddio_bidir",
      oe_reg => "REGISTERED",
      power_up_high => "OFF",
      width => 1
    )
    port map(
            aclr => reset,
            aset => open,
            combout(0) => dqs_clk(0),
            datain_h => A_TOSTDLOGICVECTOR(dqs_twpst_ctrl(0)),
            datain_l => A_TOSTDLOGICVECTOR(ZEROS(0)),
            dataout_h => open,
            dataout_l => open,
            dqsundelayedout => open,
            inclock => ONE,
            inclocken => ONE,
            oe => dqs_oe,
            outclock => clk,
            outclocken => ONE,
            padio(0) => ddr_dqs
    );

  dqs_delay_ctrl : cycloneii_clk_delay_ctrl
    generic map(
      delay_chain => "63",
      delay_chain_mode => "static",
      lpm_type => "cycloneii_clk_delay_ctrl"
    )
    port map(
            clk => dqs_clk(0),
            clkout => delayed_dqs(0)
    );

  delayed_dqs(3 DOWNTO 1) <= Std_Logic_Vector'(A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')));
  -------------------------------------------------------------------------------
  --DM pins and their logic
  --Although these don't get tristated like DQ, they do share the same IO timing.
  -------------------------------------------------------------------------------
  tmp_dmout0 <= dm_out(0);
  tmp_dmout1 <= dm_out(1);
  dm_pin : altddio_out
    generic map(
      extend_oe_disable => "UNUSED",
      intended_device_family => "Cyclone II",
      invert_output => "OFF",
      lpm_hint => "UNUSED",
      lpm_type => "altddio_out",
      oe_reg => "UNUSED",
      power_up_high => "OFF",
      width => 1
    )
    port map(
            aclr => reset,
            aset => open,
            datain_h => A_TOSTDLOGICVECTOR(tmp_dmout0),
            datain_l => A_TOSTDLOGICVECTOR(tmp_dmout1),
            dataout(0) => internal_ddr_dm,
            oe => ONE,
            outclock => write_clk,
            outclocken => ONE
    );

  -------------------------------------------------------------------------------
  --Data mask registers
  --These are the last registers before the registers in the altddio_out. They
  --are clocked off the system clock but feed registers which are clocked off the
  --write clock, so their output is the beginning of 3/4 cycle path.
  -------------------------------------------------------------------------------
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dm_out <= A_REP(std_logic'('1'), 2);
    elsif clk'event and clk = '1' then
      if std_logic'(doing_wr) = '1' then 
        -- don't latch in data unless it's valid
        dm_out <= NOT be;
      else
        dm_out <= A_REP(std_logic'('1'), 2);
      end if;
    end if;

  end process;

  -------------------------------------------------------------------------------
  --Logic to disable the capture registers (particularly during DQS postamble)
  --The output of the dq_enable_reset register holds the dq_enable register in
  --reset (which *enables* the dq capture registers). The controller releases
  --the dq_enable register so that it is clocked by the last falling edge of the
  --read dqs signal. This disables the dq capture registers during and after the
  --dqs postamble so that the output of the dq capture registers can be safely
  --resynchronised.
  --Postamble Clock Cycle  : 0
  --Postamble Clock Edge   : falling
  --Postamble Regs Per DQS : 1
  -------------------------------------------------------------------------------

  --Critical registers clocked on the falling edge of the DQS to
  --disable the DQ capture registers during the DQS postamble
  process (dqs_postamble_clk, dq_enable_reset)
  begin
    if dq_enable_reset(0) = '1' then
      dq_enable(0) <= std_logic'('1');
    elsif dqs_postamble_clk'event and dqs_postamble_clk = '1' then
      dq_enable(0) <= std_logic'('0');
    end if;

  end process;

  --Use a falling edge for postamble
  --The registers which generate the reset signal to the above registers
  --Can be clocked off the resynch or system clock
  process (postamble_clk, reset_n)
  begin
    if reset_n = '0' then
      dq_enable_reset(0) <= std_logic'('0');
    elsif postamble_clk'event and postamble_clk = '0' then
      dq_enable_reset(0) <= doing_rd_delayed;
    end if;

  end process;

  --pipeline the doing_rd signal to enable and disable the DQ capture regs at the right time
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      doing_rd_pipe <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      --shift bits up
      doing_rd_pipe <= Std_Logic_Vector'(A_ToStdLogicVector(doing_rd_pipe(0)) & A_ToStdLogicVector(doing_rd));
    end if;

  end process;

  --It's safe to clock from falling edge of clk to postamble_clk, so use falling edge clock
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      doing_rd_delayed <= std_logic'('0');
    elsif clk'event and clk = '0' then
      doing_rd_delayed <= doing_rd_pipe(0);
    end if;

  end process;

  --This copes with DQS mode
  dqs_postamble_clk <= dq_capture_clk;
  -------------------------------------------------------------------------------
  --Decide which clock to use for capturing the DQ data
  -------------------------------------------------------------------------------
  --Use DQS to capture DQ read data
  dq_capture_clk <= NOT wire_dqs_clkctrl_outclk(0);
  -------------------------------------------------------------------------------
  --DQ pins and their logic
  -------------------------------------------------------------------------------
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dq_oe <= std_logic'('0');
    elsif clk'event and clk = '1' then
      dq_oe <= doing_wr;
    end if;

  end process;

  -------------------------------------------------------------------------------
  --Write data registers
  --These are the last registers before the registers in the altddio_bidir. They
  --are clocked off the system clock but feed registers which are clocked off the
  --write clock, so their output is the beginning of 3/4 cycle path.
  -------------------------------------------------------------------------------
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      wdata_r <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'(wdata_valid) = '1' then 
        --don't latch in data unless it's valid
        wdata_r <= wdata;
      end if;
    end if;

  end process;

  --Concatenate the rising and falling edge data to make a single bus
  dq_captured_0 <= dq_captured_falling & dq_captured_rising;
  --Apply delays in 1 chunks to avoid having to use transport delays
  delayed_dq_captured <=  transport dq_captured_0 after 5000 ps ;
  -------------------------------------------------------------------------------
  --Resynchronisation registers
  --These registers resychronise the captured read data from the DQS clock
  --domain back into an internal PLL clock domain. 
  -------------------------------------------------------------------------------
  --Use a falling edge for resynch
  process (resynch_clk, reset_n)
  begin
    if reset_n = '0' then
      resynched_data <= std_logic_vector'("0000000000000000");
    elsif resynch_clk'event and resynch_clk = '0' then
      resynched_data <= delayed_dq_captured;
    end if;

  end process;

  -------------------------------------------------------------------------------
  --Post-resynch negedge registers
  --These optional registers can be inserted to make it easier to resynch between
  --the resynch clock and the system clock by optionally inserting a negedge
  --system clock register stage.
  --Note that the rdata_valid signal is also pipelined if this is set.
  -------------------------------------------------------------------------------
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      inter_rdata <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '0' then
      inter_rdata <= resynched_data;
    end if;

  end process;

  -------------------------------------------------------------------------------
  --Pipeline read data registers
  --These optional registers can be inserted to make it easier to meet timing
  --coming out of the local_rdata port of the core. It's especially necessary
  --if a falling edge resynch edge is being used..
  --Note that the rdata_valid signal is also pipelined if this is set.
  -------------------------------------------------------------------------------

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      rdata <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      rdata <= inter_rdata;
    end if;

  end process;

  --vhdl renameroo for output signals
  ddr_dm <= internal_ddr_dm;
--synthesis translate_off
    dqs_clkctrl : cycloneii_clkctrl
      generic map(
        ena_register_mode => "none",
        lpm_type => "cycloneii_clkctrl"
      )
      port map(
                clkselect => std_logic_vector'("00"),
                ena => ONE,
                inclk => delayed_dqs,
                outclk => wire_dqs_clkctrl_outclk(0)
      );

    \g_dq_io:0:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(0)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(8)),
                dataout_h(0) => dq_captured_falling(0),
                dataout_l(0) => dq_captured_rising(0),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(0)
      );

    \g_dq_io:1:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(1)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(9)),
                dataout_h(0) => dq_captured_falling(1),
                dataout_l(0) => dq_captured_rising(1),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(1)
      );

    \g_dq_io:2:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(2)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(10)),
                dataout_h(0) => dq_captured_falling(2),
                dataout_l(0) => dq_captured_rising(2),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(2)
      );

    \g_dq_io:3:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(3)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(11)),
                dataout_h(0) => dq_captured_falling(3),
                dataout_l(0) => dq_captured_rising(3),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(3)
      );

    \g_dq_io:4:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(4)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(12)),
                dataout_h(0) => dq_captured_falling(4),
                dataout_l(0) => dq_captured_rising(4),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(4)
      );

    \g_dq_io:5:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(5)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(13)),
                dataout_h(0) => dq_captured_falling(5),
                dataout_l(0) => dq_captured_rising(5),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(5)
      );

    \g_dq_io:6:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(6)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(14)),
                dataout_h(0) => dq_captured_falling(6),
                dataout_l(0) => dq_captured_rising(6),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(6)
      );

    \g_dq_io:7:dq_io\ : altddio_bidir
      generic map(
        extend_oe_disable => "UNUSED",
        implement_input_in_lcell => "UNUSED",
        intended_device_family => "Cyclone II",
        invert_output => "OFF",
        lpm_hint => "UNUSED",
        lpm_type => "altddio_bidir",
        oe_reg => "REGISTERED",
        power_up_high => "OFF",
        width => 1
      )
      port map(
                aclr => reset,
                aset => open,
                combout => open,
                datain_h => A_TOSTDLOGICVECTOR(wdata_r(7)),
                datain_l => A_TOSTDLOGICVECTOR(wdata_r(15)),
                dataout_h(0) => dq_captured_falling(7),
                dataout_l(0) => dq_captured_rising(7),
                dqsundelayedout => open,
                inclock => dq_capture_clk,
                inclocken => ONE,
                oe => dq_oe,
                outclock => write_clk,
                outclocken => ONE,
                padio(0) => ddr_dq(7)
      );

--synthesis translate_on
--synthesis read_comments_as_HDL on
--    dqs_clkctrl : cycloneii_clkctrl
--      generic map(
--        ena_register_mode => "none",
--        lpm_type => "cycloneii_clkctrl"
--      )
--      port map(
--                clkselect => std_logic_vector'("00"),
--                ena => dq_enable(0),
--                inclk => delayed_dqs,
--                outclk => wire_dqs_clkctrl_outclk(0)
--      );
--
--    \g_dq_io:0:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(0)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(8)),
--                dataout_h(0) => dq_captured_falling(0),
--                dataout_l(0) => dq_captured_rising(0),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(0)
--      );
--
--    \g_dq_io:1:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(1)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(9)),
--                dataout_h(0) => dq_captured_falling(1),
--                dataout_l(0) => dq_captured_rising(1),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(1)
--      );
--
--    \g_dq_io:2:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(2)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(10)),
--                dataout_h(0) => dq_captured_falling(2),
--                dataout_l(0) => dq_captured_rising(2),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(2)
--      );
--
--    \g_dq_io:3:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(3)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(11)),
--                dataout_h(0) => dq_captured_falling(3),
--                dataout_l(0) => dq_captured_rising(3),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(3)
--      );
--
--    \g_dq_io:4:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(4)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(12)),
--                dataout_h(0) => dq_captured_falling(4),
--                dataout_l(0) => dq_captured_rising(4),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(4)
--      );
--
--    \g_dq_io:5:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(5)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(13)),
--                dataout_h(0) => dq_captured_falling(5),
--                dataout_l(0) => dq_captured_rising(5),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(5)
--      );
--
--    \g_dq_io:6:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(6)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(14)),
--                dataout_h(0) => dq_captured_falling(6),
--                dataout_l(0) => dq_captured_rising(6),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(6)
--      );
--
--    \g_dq_io:7:dq_io\ : altddio_bidir
--      generic map(
--        extend_oe_disable => "UNUSED",
--        implement_input_in_lcell => "UNUSED",
--        intended_device_family => "Cyclone II",
--        invert_output => "OFF",
--        lpm_hint => "UNUSED",
--        lpm_type => "altddio_bidir",
--        oe_reg => "REGISTERED",
--        power_up_high => "OFF",
--        width => 1
--      )
--      port map(
--                aclr => reset,
--                aset => open,
--                combout => open,
--                datain_h => A_TOSTDLOGICVECTOR(wdata_r(7)),
--                datain_l => A_TOSTDLOGICVECTOR(wdata_r(15)),
--                dataout_h(0) => dq_captured_falling(7),
--                dataout_l(0) => dq_captured_rising(7),
--                dqsundelayedout => open,
--                inclock => dq_capture_clk,
--                inclocken => dq_enable(0),
--                oe => dq_oe,
--                outclock => write_clk,
--                outclocken => ONE,
--                padio(0) => ddr_dq(7)
--      );
--
--synthesis read_comments_as_HDL off

end europa;

