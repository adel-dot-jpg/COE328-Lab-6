library verilog;
use verilog.vl_types.all;
entity lab6_Part3_vlg_check_tst is
    port(
        decout          : in     vl_logic_vector(15 downto 0);
        fsmid           : in     vl_logic_vector(3 downto 0);
        fsmstate        : in     vl_logic_vector(3 downto 0);
        leds            : in     vl_logic_vector(1 to 7);
        Q1              : in     vl_logic_vector(7 downto 0);
        Result_odd      : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end lab6_Part3_vlg_check_tst;
