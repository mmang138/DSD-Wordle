library verilog;
use verilog.vl_types.all;
entity wordle_vlg_check_tst is
    port(
        LED0            : in     vl_logic;
        LED1            : in     vl_logic;
        LED2            : in     vl_logic;
        LED3            : in     vl_logic;
        LED4            : in     vl_logic;
        LED5            : in     vl_logic;
        LED6            : in     vl_logic;
        LED7            : in     vl_logic;
        LED8            : in     vl_logic;
        LED9            : in     vl_logic;
        SS1             : in     vl_logic_vector(6 downto 0);
        SS2             : in     vl_logic_vector(6 downto 0);
        SS3             : in     vl_logic_vector(6 downto 0);
        SS4             : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end wordle_vlg_check_tst;
