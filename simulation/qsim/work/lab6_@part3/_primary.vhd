library verilog;
use verilog.vl_types.all;
entity lab6_Part3 is
    port(
        Result_odd      : out    vl_logic;
        clk             : in     vl_logic;
        enableDec       : in     vl_logic;
        data_in         : in     vl_logic;
        fsmreset        : in     vl_logic;
        resA            : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        resB            : in     vl_logic;
        B               : in     vl_logic_vector(7 downto 0);
        decout          : out    vl_logic_vector(15 downto 0);
        fsmid           : out    vl_logic_vector(3 downto 0);
        fsmstate        : out    vl_logic_vector(3 downto 0);
        leds            : out    vl_logic_vector(1 to 7);
        Q1              : out    vl_logic_vector(7 downto 0)
    );
end lab6_Part3;
