library verilog;
use verilog.vl_types.all;
entity wordle_vlg_sample_tst is
    port(
        switch_input    : in     vl_logic_vector(9 downto 0);
        sampler_tx      : out    vl_logic
    );
end wordle_vlg_sample_tst;
