LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY final_sseg IS
PORT (
  Result_odd : IN  STD_LOGIC;                  -- 1 if even → 'n'; 0 if odd → 'y'
  leds        : OUT STD_LOGIC_VECTOR(1 TO 7)    -- 7-segment display output
);
END final_sseg;

ARCHITECTURE Behavior OF final_sseg IS
BEGIN
  PROCESS (Result_odd)
  BEGIN
    CASE Result_odd IS -- is odd?
      WHEN '1' => leds <= "1000100"; -- 'y'
      WHEN '0' => leds <= "1101010"; -- 'n'
      WHEN OTHERS => leds <= "1111111"; -- all off/error
    END CASE;
  END PROCESS;
END Behavior;
