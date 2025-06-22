library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ALU_2 is -- ALU unit includes Reg. 3
    port (
        clk    : in std_logic;
        Reg1, Reg2 : in std_logic_vector(7 downto 0);  -- 8-bit inputs A & B from Reg. 1 & Reg. 2
        opcode : in std_logic_vector(15 downto 0);      -- 8-bit opcode from Decoder
        Result : out std_logic_vector(7 downto 0)      -- 8-bit Result
    );
end ALU_2;

architecture calculation of ALU_2 is
begin
    process (clk)
    begin
        if rising_edge(clk) then -- (clk'EVENT AND clk = '1')
            case opcode is
                -- 1. Increment A by 2 (does this work??)
					when "0000000000000001" =>
						 Result <= Reg1 + 2;

					-- 2. Shift B to right by 2 bits (insert 0s and cut original)
					when "0000000000000010" =>
						 Result <= "00" & Reg2(7 downto 2);

					-- 3. Shift A to right by 4 bits, insert 1s and cut
					when "0000000000000100" =>
						 Result <= "1111" & Reg1(7 downto 4);

					-- 4. Min(A, B)
					when "0000000000001000" =>
						 if Reg1 < Reg2 then
							  Result <= Reg1;
						 else
							  Result <= Reg2;
						 end if;

					-- 5. Rotate A right by 2 bits (ROR) (11111100 becomes 00111111)
					when "0000000000010000" =>
						 Result <= Reg1(1 downto 0) & Reg1(7 downto 2);

					-- 6. Invert bit-significance order of B (bit reversal) (1234 becomes 4321)
					when "0000000000100000" =>
						 Result(7) <= Reg2(0);
						 Result(6) <= Reg2(1);
						 Result(5) <= Reg2(2);
						 Result(4) <= Reg2(3);
						 Result(3) <= Reg2(4);
						 Result(2) <= Reg2(5);
						 Result(1) <= Reg2(6);
						 Result(0) <= Reg2(7);

					-- 7. XOR A and B
					when "0000000001000000" =>
						 Result <= Reg1 xor Reg2;

					-- 8. A + B - 4
					when "0000000010000000" =>
						 Result <= Reg1 + Reg2 - 4;

                when others =>
                    -- Don't care, do nothing // Result <= (others => '0');
						  Result <= "00000000";
            end case;
        end if;
    end process;
end calculation;
