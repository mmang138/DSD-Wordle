library verilog;
use verilog.vl_types.all;
entity wordle_vlg_check_tst is
    port(
        sevenSegmentActiveLow: in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end wordle_vlg_check_tst;
