-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
-- $Header: //acds/rel/9.1sp2/ip/mem/ddr_sdram/refdesign/example_instance/auk_ddr_tb_functions.vhd#1 $
--
-- Title        :  Useful functions
-- Project      :  Altera DDR SDRAM Controller
--
-- Description  : Functions VHDL should already have...
--
-- Copyright 2002 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package auk_ddr_tb_functions is

    function auk_to_integer (value: std_logic_vector) return integer;
    function auk_to_string (value: integer; base: integer; size: integer) return string;
    function auk_to_string (value: std_logic_vector; base: integer; size: integer) return string;
    function auk_to_legal_width     (value : integer) return integer;

end auk_ddr_tb_functions;


package body auk_ddr_tb_functions is

    --
    -- convert a std_logic_vector to an integer
    --
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
--
--
    --
    -- convert an integer to a string
    --
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
--        V := abs value;
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



    --
    -- convert a std_logic_vector to a string
    --
    function auk_to_string (value: std_logic_vector; base: integer; size: integer) return string is
    variable ivalue : integer;
    begin
        ivalue := auk_to_integer(value);
        return auk_to_string(ivalue, base, size);
    end auk_to_string;

    function auk_to_legal_width(value : integer) return integer is
    begin
        if (value > 0) then
            return value;
        else
            return 1;
        end if;
    end auk_to_legal_width;


end auk_ddr_tb_functions;


