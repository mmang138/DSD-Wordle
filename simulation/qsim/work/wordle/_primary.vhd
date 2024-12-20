library verilog;
use verilog.vl_types.all;
entity wordle is
    port(
        switch_input    : in     vl_logic_vector(9 downto 0);
        clk             : in     vl_logic;
        enter           : in     vl_logic;
        SS1             : out    vl_logic_vector(6 downto 0);
        SS2             : out    vl_logic_vector(6 downto 0);
        SS3             : out    vl_logic_vector(6 downto 0);
        SS4             : out    vl_logic_vector(6 downto 0);
        LED1            : out    vl_logic;
        LED2            : out    vl_logic;
        LED3            : out    vl_logic;
        LED4            : out    vl_logic;
        LED5            : out    vl_logic;
        LED6            : out    vl_logic;
        LED7            : out    vl_logic;
        LED8            : out    vl_logic;
        LED9            : out    vl_logic;
        LED0            : out    vl_logic;
        reset           : in     vl_logic
    );
end wordle;
