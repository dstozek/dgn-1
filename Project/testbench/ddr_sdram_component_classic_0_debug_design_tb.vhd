--------------------------------------------------------------------------------
-- This confidential and proprietary software may be used only as authorized by
-- a licensing agreement from Altera Corporation.
--
-- (C) COPYRIGHT 2005 ALTERA CORPORATION
-- ALL RIGHTS RESERVED
--
-- The entire notice above must be reproduced on all authorized copies and any
-- such reproduction must be pursuant to a licensing agreement from Altera.
--
-- Title        : Example top level testbench for ddr_sdram_component_classic_0 DDR SDRAM Controller
-- Project      : DDR SDRAM Controller
--
-- File         : ddr_sdram_component_classic_0_debug_design_tb.vhd
--
-- Revision     : V9.1
--
-- Abstract:
-- Automatically generated testbench for the example top level design to allow
-- functional and timing simulation.
--
--------------------------------------------------------------------------------
--
-- *************** This is a MegaWizard generated file ****************
--
-- If you need to edit this file make sure the edits are not inside any 'MEGAWIZARD'
-- text insertion areas.
-- (between "<< START MEGAWIZARD INSERT" and "<< END MEGAWIZARD INSERT" comments)
--
-- Any edits inside these delimiters will be overwritten by the megawizard if you
-- re-run it.
--
-- If you really need to make changes inside these delimiters then delete
-- both 'START' and 'END' delimiters.  This will stop the megawizard updating this
-- section again.
--
------------------------------------------------------------------------------------
-- << START MEGAWIZARD INSERT PARAMETER_LIST
-- Parameters:
--
-- Device Family                      : Cyclone II
-- local Interface Data Width         : 32
-- MEM_CHIPSELS                       : 1
-- MEM_BANK_BITS                      : 2
-- MEM_ROW_BITS                       : 12
-- MEM_COL_BITS                       : 10
-- LOCAL_DATA_BITS                    : 32
-- NUM_CLOCK_PAIRS                    : 1
-- RTL_ROUNDTRIP_CLOCKS               : 0.25
-- CLOCK_TICK_IN_PS                   : 20000
-- REGISTERED_DIMM                    : false
-- BOARD_DQS_DELAY                    : 1000
-- BOARD_CLK_DELAY                    : 1000
-- TINIT_CLOCKS                       : 9999
-- << END MEGAWIZARD INSERT PARAMETER_LIST
------------------------------------------------------------------------------------
-- << MEGAWIZARD PARSE FILE DDR9.1



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

-- << START MEGAWIZARD INSERT ENTITY
entity ddr_sdram_component_classic_0_debug_design_tb is
-- << END MEGAWIZARD INSERT ENTITY
    generic (

-- << START MEGAWIZARD INSERT GENERICS
        gMEM_CHIPSELS          : in integer := 1;
        gMEM_BANK_BITS         : in integer := 2;
        gMEM_ROW_BITS          : in integer := 12;
        gMEM_COL_BITS          : in integer := 10;
        gMEM_DQ_PER_DQS        : in integer := 8;
        gLOCAL_DATA_BITS       : in integer := 32;
        gNUM_CLOCK_PAIRS       : in integer := 1;
        RTL_ROUNDTRIP_CLOCKS   : in real    := 0.25;
        CLOCK_TICK_IN_PS       : in integer := 20000;
        REGISTERED_DIMM        : in boolean := false;
        BOARD_DQS_DELAY        : in integer := 1000;
        BOARD_CLK_DELAY        : in integer := 1000;
        BOARD_FEDBACKCLK_DELAY : in integer := 2000;

        TINIT_CLOCKS           : in integer := 9999;
-- << END MEGAWIZARD INSERT GENERICS

        RTL_DELAYS             : in integer := 1;  -- set to zero for Gatelevel
        USE_GENERIC_MEMORY_MODEL : in boolean := FALSE;

        REF_CLOCK_TICK_IN_PS   : in integer := 20000  --edit if you change your PLL reference clock frequency

    );
end;

-- << START MEGAWIZARD INSERT ARCHITECTURE
architecture rtl of ddr_sdram_component_classic_0_debug_design_tb is
-- << END MEGAWIZARD INSERT ARCHITECTURE

    -------------------------------------------------------------------------------
    -- Functions needed in VHDL 
    function auk_to_integer (value: std_logic_vector) return integer is
    constant V: std_logic_vector(1 to value'length) := value;
    variable result: integer := 0;
    variable bit0: integer := 0;
    variable err: integer := 0;
    begin
        for i in 1 to value'length loop
            case V(i) is
            when '0' => bit0 := 0;
            when '1' => bit0 := 1;
            when others => err := 1;
            end case;
            result := (result * 2) + bit0;
        end loop;
        if (err = 0) then return result;
        else
            assert false report "auk_to_integer:: There is an 'U'|'X'|'W'|'Z'|'-' in an arithmetic operand, and it has been converted to 0." severity warning;
            return 0;
        end if;
    end auk_to_integer;

    function auk_to_string (value: integer; base: integer; size: integer) return string is
        variable V: integer := value;
        variable Result: string(1 to size);
        variable Width: natural := 0;
        constant MAX: INTEGER := 2147483647;
    begin
        assert ((base = 2) or (base=10) or (base=16))
            report "invalid base"
            severity ERROR;
        if V < 0 then
            V := (V + MAX) + 1;
        end if;
        for I in Result'Reverse_range loop
            case V mod base is
            when 0 => Result(I) := '0';
            when 1 => Result(I) := '1';
            when 2 => Result(I) := '2';
            when 3 => Result(I) := '3';
            when 4 => Result(I) := '4';
            when 5 => Result(I) := '5';
            when 6 => Result(I) := '6';
            when 7 => Result(I) := '7';
            when 8 => Result(I) := '8';
            when 9 => Result(I) := '9';
            when 10 => Result(I) := 'a';
            when 11 => Result(I) := 'b';
            when 12 => Result(I) := 'c';
            when 13 => Result(I) := 'd';
            when 14 => Result(I) := 'e';
            when 15 => Result(I) := 'f';
            when others =>
                      Result(I) := '?';
            end case;
            if V > 0 then
                Width := Width + 1;
            end if;
            V := V / base;
        end loop;
        if value < 0 then
            Result(Result'Length - Width) := '-';
            Width := Width + 1;
        end if;
        if Width = 0 then
            Width := 1;
        end if;
        -- pad to at least size wide
        if (Width < size) then
            Width := size;
        end if;

        return Result(Result'Length - Width + 1 to Result'Length);
    end auk_to_string;
    
    function auk_to_string (value: std_logic_vector; base: integer; size: integer) return string is
        variable ivalue : integer;
    begin
        ivalue := auk_to_integer(value);
        return auk_to_string(ivalue, base, size);
    end auk_to_string;

    -- override the "=" function because it doesn't work very well when comparing 'Z's
    function "=" (a, b : std_logic_vector) return boolean is
        variable a_bit, b_bit : std_logic;
        variable result : boolean;
    begin
        result := true;

        for i in a'reverse_range loop
            a_bit := a(i);
            b_bit := b(i);

            if (a_bit /= b_bit) then
                result := false;
            end if;

        end loop;

        return result;
    end; -- overridden "=" function

    
    
    -------------------------------------------------------------------------------
    -- Component for the generic memory model - you should replace this with the model you are using
    component generic_ddr_sdram_rtl is
    generic (                                  
        ROWBITS  : integer := 12;
        DATABITS : integer :=  8;
        COLBITS  : integer := 10;
        BANKBITS : integer :=  2
    );
    PORT (     
        Dq    : inout std_logic_vector (DATABITS - 1 downto 0);
        Dqs   : inout std_logic;
        Addr  : in    std_logic_vector (ROWBITS - 1 downto 0);
        Ba    : in    std_logic_vector (1 downto 0);
        Clk   : in    std_logic;
        Clk_n : in    std_logic;
        Cke   : in    std_logic;
        Cs_n  : in    std_logic;
        Ras_n : in    std_logic;
        Cas_n : in    std_logic;
        We_n  : in    std_logic;
        Dm    : in    std_logic
    );
    end component generic_ddr_sdram_rtl;

    
    -------------------------------------------------------------------------------


    -- Delay the incoming DQ & DQS to mimic the SDRAM round trip delay
    -- The round trip delay is now modeled inside the datapath (<your core name>_auk_ddr_dqs_group.v/vhd) for RTL simulation.
    constant SAMPLE_DELAY : integer := 0; -- RTL only

    constant GATE_BOARD_DQS_DELAY  : integer := BOARD_DQS_DELAY * abs(RTL_DELAYS-1);            -- Gate level timing only
    constant GATE_BOARD_CLK_DELAY  : integer := BOARD_CLK_DELAY * abs(RTL_DELAYS-1);            -- Gate level timing only
    constant GATE_BOARD_FEDBACKCLK_DELAY  : integer := BOARD_FEDBACKCLK_DELAY * abs(RTL_DELAYS-1);            -- Gate level timing only

    signal cmd_bus_watcher_enabled  : std_logic := '0';

    signal   clk         : std_logic := '0';
    signal   clk_n       : std_logic := '1';

    signal   reset_n        : std_logic;
    signal   a              : std_logic_vector(gMEM_ROW_BITS - 1 downto 0);
    signal   ba             : std_logic_vector(gMEM_BANK_BITS - 1 downto 0);
    signal   cs_n           : std_logic_vector(gMEM_CHIPSELS - 1 downto 0);
    signal   cke            : std_logic_vector(gMEM_CHIPSELS - 1 downto 0);
    signal   odt            : std_logic_vector(gMEM_CHIPSELS - 1 downto 0);
    signal   ras_n          : std_logic;
    signal   cas_n          : std_logic;
    signal   we_n           : std_logic;

    signal   dm             : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0);

    signal stratix_dqs_ref_clk    : std_logic;  -- only used on stratix to provide external dll reference clock
    signal fedback_clk            : std_logic;  -- only used in fedback clock mode
    signal fedback_clk_out        : std_logic;  -- only used in fedback clock mode

    signal clk_to_sdram    : std_logic_vector(gNUM_CLOCK_PAIRS-1 downto 0);
    signal clk_to_sdram_n  : std_logic_vector(gNUM_CLOCK_PAIRS-1 downto 0);

    signal clk_to_ram      : std_logic;
    signal clk_to_ram_n    : std_logic;

    signal a_delayed       : std_logic_vector(gMEM_ROW_BITS - 1 downto 0);
    signal ba_delayed      : std_logic_vector(gMEM_BANK_BITS - 1 downto 0);
    signal cke_delayed     : std_logic_vector(gMEM_CHIPSELS - 1 downto 0);
    signal odt_delayed     : std_logic_vector(gMEM_CHIPSELS - 1 downto 0);
    signal cs_n_delayed    : std_logic_vector(gMEM_CHIPSELS - 1 downto 0);
    signal ras_n_delayed   : std_logic;
    signal cas_n_delayed   : std_logic;
    signal we_n_delayed    : std_logic;
    signal dm_delayed      : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0);

    signal fpga_dq        : std_logic_vector(gLOCAL_DATA_BITS / 2 - 1 downto 0) := (others => 'Z');
    signal mem_dq         : std_logic_vector(gLOCAL_DATA_BITS / 2 - 1 downto 0) := (others => 'Z');
    signal fpga_dqs       : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0) := (others => 'Z');
    signal mem_dqs        : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0) := (others => 'Z');
    signal mem_dqsn       : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0) := (others => 'Z');
    signal mem_rdqsn_unused : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0) := (others => 'Z');
    signal dq_lock          : std_logic := 'Z';
    signal dqs_lock         : std_logic := 'Z';

    signal all_dq_z        : std_logic_vector(gLOCAL_DATA_BITS / 2 - 1 downto 0) := (others => 'Z');
    signal all_dqs_z       : std_logic_vector(gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1 downto 0) := (others => 'Z');

    signal zero_one        : std_logic_vector(gMEM_BANK_BITS - 1 downto 0) := (others => '0'); 

    signal test_complete   : std_logic;
    -- counter to count the number of sucessful read and write loops
    signal test_complete_count : integer;

    signal pnf             : std_logic;
    signal pnf_per_byte    : std_logic_vector(gLOCAL_DATA_BITS/8 - 1 downto 0);

    signal clk_to_buf       : std_logic;
    signal clk_from_buf     : std_logic;

begin

    zero_one(0) <= '1';
    
-- << START MEGAWIZARD INSERT DUT_INSTANCE_NAME
dut : entity work.ddr_sdram_component_classic_0_debug_design
-- << END MEGAWIZARD INSERT DUT_INSTANCE_NAME
    port map
    (
        -- clocks and reset
        clock_source    =>  clk,          -- PLD input clock source from which all clocks are derived.
        reset_n         => reset_n,

-- << START MEGAWIZARD INSERT PORT_MAP
        clk_to_sdram  =>  clk_to_sdram, 
        clk_to_sdram_n  =>  clk_to_sdram_n,



        -- ddr sdram interface

        ddr_cke       => cke,
        ddr_cs_n      => cs_n,
        ddr_ras_n     => ras_n,
        ddr_cas_n     => cas_n,
        ddr_we_n      => we_n,
        ddr_ba        => ba,
        ddr_a         => a,
        ddr_dq        => fpga_dq,
        ddr_dqs       => fpga_dqs,
        ddr_dm        => dm,
-- << END MEGAWIZARD INSERT PORT_MAP

        test_complete   => test_complete,
        pnf_per_byte    => pnf_per_byte,
        pnf             => pnf


    );

    -- Generic memory model instantiation - you must edit this to match the memory model that you are using 
       chipsel : for i in 0 to (gMEM_CHIPSELS - 1) generate
            device : for j in 0 to (gLOCAL_DATA_BITS / 2 / gMEM_DQ_PER_DQS - 1) generate
                mem : generic_ddr_sdram_rtl
                    generic map(
                        BANKBITS    => gMEM_BANK_BITS,
                        ROWBITS     => gMEM_ROW_BITS,
                        COLBITS     => gMEM_COL_BITS,
                        DATABITS    => gMEM_DQ_PER_DQS
                    )
                    port map (
                        clk    => clk_to_ram,
                        clk_n  => clk_to_ram_n,
                        cke    => cke_delayed(i),
                        cs_n   => cs_n_delayed(i),
                        ras_n  => ras_n_delayed,
                        cas_n  => cas_n_delayed,
                        we_n   => we_n_delayed,
                        dm     => dm_delayed(j),
                        ba     => ba_delayed,
                        addr   => a_delayed(gMEM_ROW_BITS - 1 downto 0),
                        dq     => mem_dq(gMEM_DQ_PER_DQS * (j + 1) - 1 downto gMEM_DQ_PER_DQS * j),
                        dqs    => mem_dqs(j)
                    );
            end generate; -- all chips
        end generate; -- all sides


    process
    begin
       clk <= '0';
       clk_n <= '1';
       while (true) loop
           --wait for 10 ns;
           wait for (REF_CLOCK_TICK_IN_PS/2) * 1 ps;
           clk <= not clk;
           clk_n <= not clk_n;
       end loop;
       wait;
    end process;


    clk_to_ram      <= transport clk_to_sdram(0)   after GATE_BOARD_CLK_DELAY * 1 ps;
    clk_to_ram_n    <= NOT clk_to_ram;      -- mem model ignores clk_n ?

    -- << START MEGAWIZARD INSERT FEDBACK_CLOCK_DELAY

    -- << END MEGAWIZARD INSERT FEDBACK_CLOCK_DELAY


    process
    begin
        reset_n <= '1';
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        reset_n <= '0';
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        wait until (clk'event and clk = '1');
        reset_n <= '1';
        wait;
    end process;



    -- control and data lines = 3 inches
    a_delayed       <=   transport a      after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    ba_delayed      <=   transport ba     after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    cke_delayed     <=   transport cke    after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    odt_delayed     <=   transport odt    after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;  -- ddr2 only
    cs_n_delayed    <=   transport cs_n   after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    ras_n_delayed   <=   transport ras_n  after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    cas_n_delayed   <=   transport cas_n  after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    we_n_delayed    <=   transport we_n   after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;
    dm_delayed      <=   transport dm     after GATE_BOARD_CLK_DELAY * 1 ps + 1 ps;



-- ---------------------------------------------------------------

    endit : process
    variable count          : integer := 0;
    variable ln : line;

    begin
        -- Stop simulation after test_complete or TINIT + 20000 clocks
        while ((count < (TINIT_CLOCKS+20000) ) and (test_complete /= '1')) loop
            count := count + 1;
            wait until clk_to_sdram(0)'event and clk_to_sdram(0) = '0';
        end loop;
        if (test_complete = '1') then
            if (pnf = '1') then
                write(ln, now);
                write(ln, string'("          --- SIMULATION PASSED --- "));
                writeline(output, ln);
                ASSERT false REPORT "--- SIMULATION PASSED ---" SEVERITY FAILURE ;
            else
                write(ln, now);
                write(ln, string'("          --- SIMULATION FAILED --- "));
                writeline(output, ln);
                ASSERT false REPORT "--- SIMULATION FAILED ---" SEVERITY FAILURE ;
            end if;
        else
                write(ln, now);
                write(ln, string'("          --- SIMULATION FAILED, DID NOT COMPLETE --- "));
                writeline(output, ln);
                ASSERT false REPORT "--- SIMULATION FAILED, DID NOT COMPLETE ---" SEVERITY FAILURE ;
        end if;
        wait;
    end process;

    process(clk_to_sdram(0), reset_n)
    begin
        if (reset_n = '0') then
            test_complete_count <= 0;
        elsif (clk_to_sdram(0)'event and clk_to_sdram(0) = '1') then
                if (test_complete = '1') then
                    test_complete_count <= test_complete_count + 1;
                end if;
        end if;

    end process;






-- ---------------------------------------------------------------
--******************************* DQ  ****************************
    process(mem_dq, dq_lock)
    begin
        if (dq_lock = '0') then
            fpga_dq <= transport mem_dq after (GATE_BOARD_DQS_DELAY + SAMPLE_DELAY)* 1 ps + 1 ps;
        end if;
    end process;

    process(fpga_dq, dq_lock)
    begin
        if (dq_lock = '1') then
            mem_dq <= transport fpga_dq after GATE_BOARD_DQS_DELAY * 1 ps + 1 ps;
        end if;
    end process;

    process(mem_dq, fpga_dq, dq_lock)
    begin
         if (mem_dq /= all_dq_z) and (fpga_dq = all_dq_z) and (dq_lock = 'Z') then
            dq_lock <= '0';
         elsif (mem_dq = all_dq_z) and (fpga_dq /= all_dq_z) and (dq_lock = 'Z') then
            dq_lock <= '1';
         elsif (mem_dq = all_dq_z) and (fpga_dq = all_dq_z) then
            dq_lock <= 'Z';
         end if;
    end process;
--******************************* DQ  ****************************




--******************************* DQS ****************************
    process(mem_dqs, dqs_lock)
    begin
        if (dqs_lock = '0') then
            fpga_dqs <= transport mem_dqs after ((GATE_BOARD_DQS_DELAY )+ SAMPLE_DELAY) * 1 ps + 1 ps;
        end if;
    end process;

    process(fpga_dqs, dqs_lock)
    begin
        if (dqs_lock = '1') then
            mem_dqs <= transport fpga_dqs after ((GATE_BOARD_DQS_DELAY)) * 1 ps + 1 ps;
        end if;
    end process;

    process(mem_dqs, fpga_dqs, dqs_lock)
    begin
         if (mem_dqs /= all_dqs_z) and (fpga_dqs = all_dqs_z) and (dqs_lock = 'Z') then
            dqs_lock <= '0';
         elsif (mem_dqs = all_dqs_z) and (fpga_dqs /= all_dqs_z) and (dqs_lock = 'Z') then
            dqs_lock <= '1';
         elsif (mem_dqs = all_dqs_z) and (fpga_dqs = all_dqs_z) then
            dqs_lock <= 'Z';
         end if;
    end process;
--******************************* DQS ****************************






    -- Watch the SDRAM command bus
    process (clk_to_ram)
        variable cmd_bus : std_logic_vector(2 downto 0);
        variable ln : line;
    begin
    if (clk_to_ram'event and clk_to_ram = '1') then
        if (TRUE) then

            cmd_bus := (ras_n_delayed, cas_n_delayed, we_n_delayed);
            case cmd_bus is
                when "000" =>       -- LMR command
                    write(ln, now);

                    if (ba_delayed = zero_one) then
                        write(ln, string'("          ELMR     settings = "));

                        if (a_delayed(0) = '0') then
                            write(ln, string'("DLL enable"));
                        end if;
                    else
                        write(ln, string'("          LMR      settings = "));

                        case a_delayed(2 downto 0) is
                            when "001" => write(ln, string'("BL = 2,"));
                            when "010" => write(ln, string'("BL = 4,"));
                            when "011" => write(ln, string'("BL = 8,"));
                            when others => write(ln, string'("BL = ??,"));
                        end case;

                        case a_delayed(6 downto 4) is
                            when "010" => write(ln, string'(" CL = 2.0,"));
                            when "110" => write(ln, string'(" CL = 2.5,"));
                            when "011" => write(ln, string'(" CL = 3.0,"));
                            when "100" => write(ln, string'(" CL = 4.0,"));
                            when "101" => write(ln, string'(" CL = 5.0,"));
                            when others => write(ln, string'(" CL = ??,"));
                        end case;

                        if (a_delayed(8) = '1') then
                            write(ln, string'(" DLL reset"));
                        end if;

                    end if;

                    writeline(output, ln);
                when "001" =>       -- ARF command
                    write(ln, now);
                    write(ln, string'("          ARF "));
                    writeline(output, ln);
                when "010" =>       -- PCH command
                    write(ln, now);
                    write(ln, string'("          PCH"));
                    if (a_delayed(10) = '1') then
                        write(ln, string'(" all banks "));
                    else
                        write(ln, string'(" bank "));
                        write(ln, auk_to_string(ba_delayed,16,gMEM_BANK_BITS));
                    end if;
                    writeline(output, ln);
                when "011" =>       -- ACT command
                    write(ln, now);
                    write(ln, string'("          ACT     row address "));
                    write(ln, auk_to_string(a_delayed,16,gMEM_ROW_BITS));
                    write(ln, string'(                               " bank "));
                    write(ln, auk_to_string(ba_delayed,16,gMEM_BANK_BITS));
                    writeline(output, ln);
                when "100" =>       -- WR command
                    write(ln, now);
                    write(ln, string'("          WR to   col address "));
                    write(ln, auk_to_string(a_delayed,16,gMEM_ROW_BITS));
                    write(ln, string'(                               " bank "));
                    write(ln, auk_to_string(ba_delayed,16,gMEM_BANK_BITS));
                    writeline(output, ln);
                when "101" =>       -- RD command
                    write(ln, now);
                    write(ln, string'("          RD from col address "));
                    write(ln, auk_to_string(a_delayed,16,gMEM_ROW_BITS));
                    write(ln, string'(                               " bank "));
                    write(ln, auk_to_string(ba_delayed,16,gMEM_BANK_BITS));
                    writeline(output, ln);
                when "110" =>       -- BT command
                    write(ln, now);
                    write(ln, string'("          BT "));
                    writeline(output, ln);
                when "111" => null; -- NOP command
                when others => null;
            end case;
        else
        end if; -- if enabled
    end if;

    end process;


end rtl;





