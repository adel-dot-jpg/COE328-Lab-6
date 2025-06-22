library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU_3 is -- ALU unit includes Reg. 3
    port (
        clk    : in std_logic;
		  student_id : in std_logic_vector(3 downto 0);
        Reg1, Reg2 : in std_logic_vector(7 downto 0);  -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0);      -- 8-bit opcode from Decoder
        Result_odd : out std_logic				      -- result even signal. true if even.
    );
end ALU_3;

architecture calculation of ALU_3 is
begin
    process (clk)
    begin
        if rising_edge(clk) then -- (clk'EVENT AND clk = '1')
            Result_odd <= student_id(0);
        end if;
    end process;
end calculation;
