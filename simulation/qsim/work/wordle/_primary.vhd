library verilog;
use verilog.vl_types.all;
entity wordle is
    port(
        switch_input    : in     vl_logic_vector(9 downto 0);
        sevenSegmentActiveLow: out    vl_logic_vector(6 downto 0)
    );
end wordle;
