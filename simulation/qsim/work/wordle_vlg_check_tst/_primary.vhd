library verilog;
use verilog.vl_types.all;
entity wordle_vlg_check_tst is
    port(
        LED1            : in     vl_logic;
        LED2            : in     vl_logic;
        LED3            : in     vl_logic;
        LED4            : in     vl_logic;
        SS1             : in     vl_logic_vector(6 downto 0);
        SS2             : in     vl_logic_vector(6 downto 0);
        SS3             : in     vl_logic_vector(6 downto 0);
        SS4             : in     vl_logic_vector(6 downto 0);
        count           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end wordle_vlg_check_tst;
