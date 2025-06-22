library verilog;
use verilog.vl_types.all;
entity lab6_Part3_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        enableDec       : in     vl_logic;
        fsmreset        : in     vl_logic;
        resA            : in     vl_logic;
        resB            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab6_Part3_vlg_sample_tst;
