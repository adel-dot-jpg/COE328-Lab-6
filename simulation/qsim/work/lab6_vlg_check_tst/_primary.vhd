library verilog;
use verilog.vl_types.all;
entity lab6_vlg_check_tst is
    port(
        decout          : in     vl_logic_vector(15 downto 0);
        fsmid           : in     vl_logic_vector(3 downto 0);
        fsmstate        : in     vl_logic_vector(3 downto 0);
        leds            : in     vl_logic_vector(1 to 7);
        leds_mag        : in     vl_logic_vector(1 to 7);
        leds_mag_right  : in     vl_logic_vector(1 to 7);
        leds_sign_right : in     vl_logic_vector(1 to 7);
        Q1              : in     vl_logic_vector(7 downto 0);
        test_result     : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab6_vlg_check_tst;
