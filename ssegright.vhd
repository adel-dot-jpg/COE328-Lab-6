LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY ssegright IS
PORT (
  bcd      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- signed input
  leds_mag_right : OUT STD_LOGIC_VECTOR(1 TO 7);     -- magnitude display
  leds_sign_right: OUT STD_LOGIC_VECTOR(1 TO 7)      -- sign display
);
END ssegright;

ARCHITECTURE Behavior OF ssegright IS
  SIGNAL magnitude : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL bcdright: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  PROCESS (bcd)
  BEGIN
	 bcdright <= bcd(3 DOWNTO 0);
    -- Sign logic
    IF bcdright(3) = '1' THEN  -- Negative number
      leds_sign_right <= "0000001";  -- Dash (only g is ON)
      magnitude <= NOT(bcdright) + 1;  -- Two's complement to get magnitude
    ELSE
      leds_sign_right <= "0000000";  -- No segments ON
      magnitude <= bcdright;
    END IF;

    -- Magnitude to 7-seg
    CASE magnitude IS
		 WHEN "0000" => leds_mag_right <= "0000001"; -- 0
		 WHEN "0001" => leds_mag_right <= "1001111"; -- 1
		 WHEN "0010" => leds_mag_right <= "1001000"; -- 2
		 WHEN "0011" => leds_mag_right <= "0000110"; -- 3
		 WHEN "0100" => leds_mag_right <= "1001100"; -- 4
		 WHEN "0101" => leds_mag_right <= "0100100"; -- 5
		 WHEN "0110" => leds_mag_right <= "0100000"; -- 6
		 WHEN "0111" => leds_mag_right <= "0001111"; -- 7
		 WHEN "1000" => leds_mag_right <= "0000000"; -- 8
		 WHEN "1001" => leds_mag_right <= "0000100"; -- 9
		 WHEN OTHERS => leds_mag_right <= "1111111"; -- off/error?
	END CASE;
  END PROCESS;
END Behavior;
