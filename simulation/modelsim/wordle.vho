-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/20/2024 15:44:01"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	wordle IS
    PORT (
	switch_input : IN std_logic_vector(9 DOWNTO 0);
	sevenSegmentActiveLow : OUT std_logic_vector(6 DOWNTO 0)
	);
END wordle;

-- Design Ports Information
-- sevenSegmentActiveLow[0]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sevenSegmentActiveLow[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sevenSegmentActiveLow[2]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sevenSegmentActiveLow[3]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sevenSegmentActiveLow[4]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sevenSegmentActiveLow[5]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sevenSegmentActiveLow[6]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[9]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[6]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[8]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[2]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[7]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[3]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[4]	=>  Location: PIN_H9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[0]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switch_input[5]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF wordle IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_switch_input : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_sevenSegmentActiveLow : std_logic_vector(6 DOWNTO 0);
SIGNAL \WideNor0~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sevenSegmentActiveLow[0]~output_o\ : std_logic;
SIGNAL \sevenSegmentActiveLow[1]~output_o\ : std_logic;
SIGNAL \sevenSegmentActiveLow[2]~output_o\ : std_logic;
SIGNAL \sevenSegmentActiveLow[3]~output_o\ : std_logic;
SIGNAL \sevenSegmentActiveLow[4]~output_o\ : std_logic;
SIGNAL \sevenSegmentActiveLow[5]~output_o\ : std_logic;
SIGNAL \sevenSegmentActiveLow[6]~output_o\ : std_logic;
SIGNAL \switch_input[8]~input_o\ : std_logic;
SIGNAL \switch_input[9]~input_o\ : std_logic;
SIGNAL \switch_input[6]~input_o\ : std_logic;
SIGNAL \switch_input[5]~input_o\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \switch_input[4]~input_o\ : std_logic;
SIGNAL \switch_input[7]~input_o\ : std_logic;
SIGNAL \switch_input[1]~input_o\ : std_logic;
SIGNAL \switch_input[3]~input_o\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \switch_input[2]~input_o\ : std_logic;
SIGNAL \switch_input[0]~input_o\ : std_logic;
SIGNAL \Equal8~0_combout\ : std_logic;
SIGNAL \Equal21~3_combout\ : std_logic;
SIGNAL \Equal22~0_combout\ : std_logic;
SIGNAL \Equal21~4_combout\ : std_logic;
SIGNAL \WideOr13~11_combout\ : std_logic;
SIGNAL \WideOr13~12_combout\ : std_logic;
SIGNAL \WideOr13~15_combout\ : std_logic;
SIGNAL \WideOr13~23_combout\ : std_logic;
SIGNAL \WideOr13~24_combout\ : std_logic;
SIGNAL \WideOr13~22_combout\ : std_logic;
SIGNAL \WideOr13~combout\ : std_logic;
SIGNAL \Equal21~2_combout\ : std_logic;
SIGNAL \Equal16~0_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \WideNor0~24_combout\ : std_logic;
SIGNAL \WideNor0~9_combout\ : std_logic;
SIGNAL \WideNor0~12_combout\ : std_logic;
SIGNAL \WideNor0~26_combout\ : std_logic;
SIGNAL \WideNor0~10_combout\ : std_logic;
SIGNAL \WideNor0~27_combout\ : std_logic;
SIGNAL \WideNor0~25_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal3~1_combout\ : std_logic;
SIGNAL \WideOr11~1_combout\ : std_logic;
SIGNAL \Equal9~0_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Equal9~1_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \Equal19~0_combout\ : std_logic;
SIGNAL \WideOr9~0_combout\ : std_logic;
SIGNAL \WideOr11~0_combout\ : std_logic;
SIGNAL \Equal16~1_combout\ : std_logic;
SIGNAL \Equal17~0_combout\ : std_logic;
SIGNAL \WideOr11~2_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal7~2_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Equal7~3_combout\ : std_logic;
SIGNAL \WideNor0~20_combout\ : std_logic;
SIGNAL \Equal25~0_combout\ : std_logic;
SIGNAL \Equal24~0_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \WideOr7~0_combout\ : std_logic;
SIGNAL \Equal23~0_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \WideNor0~21_combout\ : std_logic;
SIGNAL \WideNor0~22_combout\ : std_logic;
SIGNAL \WideNor0~combout\ : std_logic;
SIGNAL \WideNor0~clkctrl_outclk\ : std_logic;
SIGNAL \Equal16~2_combout\ : std_logic;
SIGNAL \WideOr9~combout\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \Equal4~1_combout\ : std_logic;
SIGNAL \WideOr7~1_combout\ : std_logic;
SIGNAL \WideOr7~2_combout\ : std_logic;
SIGNAL \Equal13~0_combout\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \Equal15~0_combout\ : std_logic;
SIGNAL \WideOr5~0_combout\ : std_logic;
SIGNAL \WideOr5~combout\ : std_logic;
SIGNAL \Equal18~0_combout\ : std_logic;
SIGNAL \Equal18~1_combout\ : std_logic;
SIGNAL \WideOr3~1_combout\ : std_logic;
SIGNAL \WideOr3~2_combout\ : std_logic;
SIGNAL \WideNor0~23_combout\ : std_logic;
SIGNAL sevenSegment : std_logic_vector(6 DOWNTO 0);

BEGIN

ww_switch_input <= switch_input;
sevenSegmentActiveLow <= ww_sevenSegmentActiveLow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\WideNor0~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \WideNor0~combout\);

-- Location: IOOBUF_X3_Y29_N30
\sevenSegmentActiveLow[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(0),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[0]~output_o\);

-- Location: IOOBUF_X3_Y29_N9
\sevenSegmentActiveLow[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(1),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[1]~output_o\);

-- Location: IOOBUF_X3_Y29_N2
\sevenSegmentActiveLow[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(2),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[2]~output_o\);

-- Location: IOOBUF_X1_Y29_N2
\sevenSegmentActiveLow[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(3),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[3]~output_o\);

-- Location: IOOBUF_X9_Y29_N16
\sevenSegmentActiveLow[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(4),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[4]~output_o\);

-- Location: IOOBUF_X1_Y29_N16
\sevenSegmentActiveLow[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(5),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[5]~output_o\);

-- Location: IOOBUF_X3_Y29_N16
\sevenSegmentActiveLow[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sevenSegment(6),
	devoe => ww_devoe,
	o => \sevenSegmentActiveLow[6]~output_o\);

-- Location: IOIBUF_X7_Y29_N29
\switch_input[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(8),
	o => \switch_input[8]~input_o\);

-- Location: IOIBUF_X5_Y29_N29
\switch_input[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(9),
	o => \switch_input[9]~input_o\);

-- Location: IOIBUF_X5_Y29_N15
\switch_input[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(6),
	o => \switch_input[6]~input_o\);

-- Location: IOIBUF_X5_Y29_N8
\switch_input[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(5),
	o => \switch_input[5]~input_o\);

-- Location: LCCOMB_X4_Y28_N12
\Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (\switch_input[8]~input_o\ & (!\switch_input[9]~input_o\ & (!\switch_input[6]~input_o\ & !\switch_input[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[8]~input_o\,
	datab => \switch_input[9]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \switch_input[5]~input_o\,
	combout => \Equal1~0_combout\);

-- Location: IOIBUF_X7_Y29_N1
\switch_input[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(4),
	o => \switch_input[4]~input_o\);

-- Location: IOIBUF_X5_Y29_N1
\switch_input[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(7),
	o => \switch_input[7]~input_o\);

-- Location: IOIBUF_X7_Y29_N8
\switch_input[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(1),
	o => \switch_input[1]~input_o\);

-- Location: IOIBUF_X7_Y29_N22
\switch_input[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(3),
	o => \switch_input[3]~input_o\);

-- Location: LCCOMB_X5_Y27_N20
\Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\switch_input[4]~input_o\ & (!\switch_input[7]~input_o\ & (!\switch_input[1]~input_o\ & !\switch_input[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[4]~input_o\,
	datab => \switch_input[7]~input_o\,
	datac => \switch_input[1]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: IOIBUF_X7_Y29_N15
\switch_input[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(2),
	o => \switch_input[2]~input_o\);

-- Location: IOIBUF_X5_Y29_N22
\switch_input[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switch_input(0),
	o => \switch_input[0]~input_o\);

-- Location: LCCOMB_X4_Y27_N20
\Equal8~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal8~0_combout\ = (\Equal1~0_combout\ & (\Equal0~0_combout\ & (!\switch_input[2]~input_o\ & \switch_input[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \Equal0~0_combout\,
	datac => \switch_input[2]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal8~0_combout\);

-- Location: LCCOMB_X4_Y28_N10
\Equal21~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal21~3_combout\ = (\switch_input[2]~input_o\ & (!\switch_input[5]~input_o\ & (!\switch_input[0]~input_o\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[2]~input_o\,
	datab => \switch_input[5]~input_o\,
	datac => \switch_input[0]~input_o\,
	datad => \Equal0~0_combout\,
	combout => \Equal21~3_combout\);

-- Location: LCCOMB_X4_Y28_N24
\Equal22~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal22~0_combout\ = (\switch_input[8]~input_o\ & (!\switch_input[9]~input_o\ & (!\switch_input[6]~input_o\ & \Equal21~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[8]~input_o\,
	datab => \switch_input[9]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \Equal21~3_combout\,
	combout => \Equal22~0_combout\);

-- Location: LCCOMB_X4_Y28_N2
\Equal21~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal21~4_combout\ = (!\switch_input[8]~input_o\ & (\switch_input[9]~input_o\ & (!\switch_input[6]~input_o\ & \Equal21~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[8]~input_o\,
	datab => \switch_input[9]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \Equal21~3_combout\,
	combout => \Equal21~4_combout\);

-- Location: LCCOMB_X5_Y27_N18
\WideOr13~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~11_combout\ = (\switch_input[1]~input_o\ & ((\switch_input[7]~input_o\) # (\switch_input[9]~input_o\ $ (!\switch_input[3]~input_o\)))) # (!\switch_input[1]~input_o\ & (((\switch_input[9]~input_o\) # (\switch_input[3]~input_o\)) # 
-- (!\switch_input[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \switch_input[7]~input_o\,
	datac => \switch_input[9]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \WideOr13~11_combout\);

-- Location: LCCOMB_X5_Y27_N14
\WideOr13~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~12_combout\ = (\switch_input[1]~input_o\) # (((\switch_input[9]~input_o\) # (\switch_input[3]~input_o\)) # (!\switch_input[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \switch_input[7]~input_o\,
	datac => \switch_input[9]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \WideOr13~12_combout\);

-- Location: LCCOMB_X4_Y28_N26
\WideOr13~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~15_combout\ = (\switch_input[7]~input_o\) # ((\switch_input[9]~input_o\) # ((\switch_input[1]~input_o\) # (\switch_input[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[7]~input_o\,
	datab => \switch_input[9]~input_o\,
	datac => \switch_input[1]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \WideOr13~15_combout\);

-- Location: LCCOMB_X4_Y28_N28
\WideOr13~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~23_combout\ = (\switch_input[0]~input_o\ & ((\switch_input[5]~input_o\ & ((\WideOr13~15_combout\))) # (!\switch_input[5]~input_o\ & (\WideOr13~12_combout\)))) # (!\switch_input[0]~input_o\ & (((\switch_input[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[0]~input_o\,
	datab => \WideOr13~12_combout\,
	datac => \WideOr13~15_combout\,
	datad => \switch_input[5]~input_o\,
	combout => \WideOr13~23_combout\);

-- Location: LCCOMB_X4_Y28_N14
\WideOr13~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~24_combout\ = (\switch_input[4]~input_o\) # ((\WideOr13~23_combout\) # ((\WideOr13~11_combout\ & !\switch_input[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[4]~input_o\,
	datab => \WideOr13~11_combout\,
	datac => \switch_input[0]~input_o\,
	datad => \WideOr13~23_combout\,
	combout => \WideOr13~24_combout\);

-- Location: LCCOMB_X4_Y28_N8
\WideOr13~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~22_combout\ = (\switch_input[2]~input_o\) # ((\switch_input[6]~input_o\) # ((\switch_input[8]~input_o\) # (\WideOr13~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[2]~input_o\,
	datab => \switch_input[6]~input_o\,
	datac => \switch_input[8]~input_o\,
	datad => \WideOr13~24_combout\,
	combout => \WideOr13~22_combout\);

-- Location: LCCOMB_X4_Y28_N16
WideOr13 : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr13~combout\ = (\Equal8~0_combout\) # ((\Equal22~0_combout\) # ((\Equal21~4_combout\) # (!\WideOr13~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal8~0_combout\,
	datab => \Equal22~0_combout\,
	datac => \Equal21~4_combout\,
	datad => \WideOr13~22_combout\,
	combout => \WideOr13~combout\);

-- Location: LCCOMB_X4_Y27_N10
\Equal21~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal21~2_combout\ = (!\switch_input[6]~input_o\ & !\switch_input[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \switch_input[6]~input_o\,
	datad => \switch_input[8]~input_o\,
	combout => \Equal21~2_combout\);

-- Location: LCCOMB_X5_Y27_N8
\Equal16~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal16~0_combout\ = (!\switch_input[5]~input_o\ & (\Equal21~2_combout\ & (!\switch_input[9]~input_o\ & !\switch_input[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[5]~input_o\,
	datab => \Equal21~2_combout\,
	datac => \switch_input[9]~input_o\,
	datad => \switch_input[2]~input_o\,
	combout => \Equal16~0_combout\);

-- Location: LCCOMB_X6_Y27_N0
\Equal6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (\Equal16~0_combout\ & (!\switch_input[4]~input_o\ & (!\switch_input[7]~input_o\ & \switch_input[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal16~0_combout\,
	datab => \switch_input[4]~input_o\,
	datac => \switch_input[7]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X4_Y28_N30
\WideNor0~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~24_combout\ = (!\Equal22~0_combout\ & (((\switch_input[0]~input_o\) # (!\Equal6~0_combout\)) # (!\switch_input[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \Equal6~0_combout\,
	datac => \switch_input[0]~input_o\,
	datad => \Equal22~0_combout\,
	combout => \WideNor0~24_combout\);

-- Location: LCCOMB_X5_Y27_N4
\WideNor0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~9_combout\ = (\switch_input[8]~input_o\ & (!\switch_input[9]~input_o\ & (\switch_input[1]~input_o\ & !\switch_input[5]~input_o\))) # (!\switch_input[8]~input_o\ & (\switch_input[9]~input_o\ $ (((\switch_input[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[9]~input_o\,
	datab => \switch_input[8]~input_o\,
	datac => \switch_input[1]~input_o\,
	datad => \switch_input[5]~input_o\,
	combout => \WideNor0~9_combout\);

-- Location: LCCOMB_X5_Y27_N26
\WideNor0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~12_combout\ = (!\switch_input[9]~input_o\ & (!\switch_input[8]~input_o\ & (!\switch_input[1]~input_o\ & !\switch_input[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[9]~input_o\,
	datab => \switch_input[8]~input_o\,
	datac => \switch_input[1]~input_o\,
	datad => \switch_input[5]~input_o\,
	combout => \WideNor0~12_combout\);

-- Location: LCCOMB_X5_Y27_N12
\WideNor0~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~26_combout\ = (\switch_input[4]~input_o\ & (((!\switch_input[7]~input_o\ & \WideNor0~12_combout\)))) # (!\switch_input[4]~input_o\ & ((\WideNor0~9_combout\) # ((\switch_input[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[4]~input_o\,
	datab => \WideNor0~9_combout\,
	datac => \switch_input[7]~input_o\,
	datad => \WideNor0~12_combout\,
	combout => \WideNor0~26_combout\);

-- Location: LCCOMB_X5_Y27_N2
\WideNor0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~10_combout\ = (!\switch_input[5]~input_o\ & (!\switch_input[9]~input_o\ & !\switch_input[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[5]~input_o\,
	datac => \switch_input[9]~input_o\,
	datad => \switch_input[8]~input_o\,
	combout => \WideNor0~10_combout\);

-- Location: LCCOMB_X5_Y27_N16
\WideNor0~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~27_combout\ = (\WideNor0~26_combout\ & (!\switch_input[0]~input_o\ & ((\WideNor0~10_combout\) # (!\switch_input[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideNor0~26_combout\,
	datab => \WideNor0~10_combout\,
	datac => \switch_input[7]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \WideNor0~27_combout\);

-- Location: LCCOMB_X5_Y27_N0
\WideNor0~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~25_combout\ = (!\switch_input[3]~input_o\ & (!\switch_input[2]~input_o\ & (!\switch_input[6]~input_o\ & \WideNor0~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[3]~input_o\,
	datab => \switch_input[2]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \WideNor0~27_combout\,
	combout => \WideNor0~25_combout\);

-- Location: LCCOMB_X5_Y27_N28
\Equal3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (\switch_input[6]~input_o\ & (!\switch_input[8]~input_o\ & (!\switch_input[9]~input_o\ & !\switch_input[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[6]~input_o\,
	datab => \switch_input[8]~input_o\,
	datac => \switch_input[9]~input_o\,
	datad => \switch_input[5]~input_o\,
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X6_Y28_N20
\Equal3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal3~1_combout\ = (\Equal0~0_combout\ & (\Equal3~0_combout\ & (!\switch_input[2]~input_o\ & !\switch_input[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal3~0_combout\,
	datac => \switch_input[2]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal3~1_combout\);

-- Location: LCCOMB_X5_Y28_N10
\WideOr11~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr11~1_combout\ = (!\Equal3~1_combout\ & ((\switch_input[1]~input_o\) # (!\Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \Equal6~0_combout\,
	datac => \Equal3~1_combout\,
	combout => \WideOr11~1_combout\);

-- Location: LCCOMB_X5_Y27_N22
\Equal9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal9~0_combout\ = (!\switch_input[4]~input_o\ & (\switch_input[7]~input_o\ & (!\switch_input[1]~input_o\ & !\switch_input[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[4]~input_o\,
	datab => \switch_input[7]~input_o\,
	datac => \switch_input[1]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \Equal9~0_combout\);

-- Location: LCCOMB_X4_Y27_N28
\Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!\switch_input[2]~input_o\ & (!\switch_input[9]~input_o\ & (!\switch_input[6]~input_o\ & !\switch_input[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[2]~input_o\,
	datab => \switch_input[9]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \switch_input[8]~input_o\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X4_Y27_N30
\Equal9~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal9~1_combout\ = (\Equal9~0_combout\ & (\Equal2~0_combout\ & (!\switch_input[5]~input_o\ & \switch_input[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal9~0_combout\,
	datab => \Equal2~0_combout\,
	datac => \switch_input[5]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal9~1_combout\);

-- Location: LCCOMB_X6_Y27_N22
\Equal5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (\Equal16~0_combout\ & (\switch_input[4]~input_o\ & (!\switch_input[7]~input_o\ & !\switch_input[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal16~0_combout\,
	datab => \switch_input[4]~input_o\,
	datac => \switch_input[7]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X4_Y27_N22
\Equal19~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal19~0_combout\ = (\switch_input[1]~input_o\ & !\switch_input[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \switch_input[1]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal19~0_combout\);

-- Location: LCCOMB_X4_Y27_N26
\WideOr9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr9~0_combout\ = (!\Equal9~1_combout\ & (!\Equal8~0_combout\ & ((!\Equal19~0_combout\) # (!\Equal5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal9~1_combout\,
	datab => \Equal5~0_combout\,
	datac => \Equal19~0_combout\,
	datad => \Equal8~0_combout\,
	combout => \WideOr9~0_combout\);

-- Location: LCCOMB_X4_Y28_N6
\WideOr11~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr11~0_combout\ = (!\Equal21~4_combout\ & ((\switch_input[1]~input_o\) # ((!\switch_input[0]~input_o\) # (!\Equal5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \switch_input[0]~input_o\,
	datad => \Equal21~4_combout\,
	combout => \WideOr11~0_combout\);

-- Location: LCCOMB_X6_Y28_N8
\Equal16~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal16~1_combout\ = (\switch_input[1]~input_o\ & (!\switch_input[3]~input_o\ & (!\switch_input[4]~input_o\ & !\switch_input[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \switch_input[3]~input_o\,
	datac => \switch_input[4]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal16~1_combout\);

-- Location: LCCOMB_X6_Y28_N2
\Equal17~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal17~0_combout\ = (!\switch_input[2]~input_o\ & (!\switch_input[7]~input_o\ & (\Equal16~1_combout\ & \Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[2]~input_o\,
	datab => \switch_input[7]~input_o\,
	datac => \Equal16~1_combout\,
	datad => \Equal3~0_combout\,
	combout => \Equal17~0_combout\);

-- Location: LCCOMB_X5_Y28_N12
\WideOr11~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr11~2_combout\ = (\WideOr11~1_combout\ & (\WideOr9~0_combout\ & (\WideOr11~0_combout\ & !\Equal17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr11~1_combout\,
	datab => \WideOr9~0_combout\,
	datac => \WideOr11~0_combout\,
	datad => \Equal17~0_combout\,
	combout => \WideOr11~2_combout\);

-- Location: LCCOMB_X4_Y28_N0
\Equal0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Equal21~2_combout\ & (!\switch_input[5]~input_o\ & (!\switch_input[2]~input_o\ & \switch_input[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal21~2_combout\,
	datab => \switch_input[5]~input_o\,
	datac => \switch_input[2]~input_o\,
	datad => \switch_input[9]~input_o\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X5_Y28_N6
\Equal7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal7~2_combout\ = (\Equal0~0_combout\ & (\Equal0~1_combout\ & \switch_input[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal7~2_combout\);

-- Location: LCCOMB_X5_Y27_N30
\Equal4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (\Equal2~0_combout\ & \switch_input[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal2~0_combout\,
	datad => \switch_input[5]~input_o\,
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X5_Y28_N16
\Equal7~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal7~3_combout\ = (\Equal0~0_combout\ & \switch_input[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal0~0_combout\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal7~3_combout\);

-- Location: LCCOMB_X5_Y28_N14
\WideNor0~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~20_combout\ = ((!\Equal4~0_combout\ & ((\switch_input[2]~input_o\) # (!\Equal3~0_combout\)))) # (!\Equal7~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \Equal4~0_combout\,
	datac => \switch_input[2]~input_o\,
	datad => \Equal7~3_combout\,
	combout => \WideNor0~20_combout\);

-- Location: LCCOMB_X4_Y28_N18
\Equal25~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal25~0_combout\ = (!\switch_input[8]~input_o\ & (!\switch_input[9]~input_o\ & (!\switch_input[6]~input_o\ & \switch_input[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[8]~input_o\,
	datab => \switch_input[9]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \switch_input[5]~input_o\,
	combout => \Equal25~0_combout\);

-- Location: LCCOMB_X5_Y28_N22
\Equal24~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal24~0_combout\ = (\switch_input[2]~input_o\ & (\Equal0~0_combout\ & !\switch_input[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[2]~input_o\,
	datac => \Equal0~0_combout\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal24~0_combout\);

-- Location: LCCOMB_X5_Y28_N20
\Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (\Equal1~0_combout\ & (\Equal0~0_combout\ & (!\switch_input[2]~input_o\ & !\switch_input[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => \Equal0~0_combout\,
	datac => \switch_input[2]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X5_Y28_N30
\WideOr7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr7~0_combout\ = (!\Equal1~1_combout\ & ((!\Equal24~0_combout\) # (!\Equal25~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal25~0_combout\,
	datac => \Equal24~0_combout\,
	datad => \Equal1~1_combout\,
	combout => \WideOr7~0_combout\);

-- Location: LCCOMB_X5_Y27_N24
\Equal23~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal23~0_combout\ = (!\switch_input[9]~input_o\ & (\switch_input[2]~input_o\ & (!\switch_input[6]~input_o\ & !\switch_input[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[9]~input_o\,
	datab => \switch_input[2]~input_o\,
	datac => \switch_input[6]~input_o\,
	datad => \switch_input[8]~input_o\,
	combout => \Equal23~0_combout\);

-- Location: LCCOMB_X5_Y28_N2
\Equal2~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (\Equal9~0_combout\ & (!\switch_input[5]~input_o\ & !\switch_input[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal9~0_combout\,
	datac => \switch_input[5]~input_o\,
	datad => \switch_input[0]~input_o\,
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X5_Y28_N0
\WideNor0~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~21_combout\ = (\Equal3~0_combout\ & (!\Equal24~0_combout\ & ((!\Equal2~1_combout\) # (!\Equal23~0_combout\)))) # (!\Equal3~0_combout\ & (((!\Equal2~1_combout\)) # (!\Equal23~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~0_combout\,
	datab => \Equal23~0_combout\,
	datac => \Equal24~0_combout\,
	datad => \Equal2~1_combout\,
	combout => \WideNor0~21_combout\);

-- Location: LCCOMB_X5_Y28_N4
\WideNor0~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~22_combout\ = (!\Equal7~2_combout\ & (\WideNor0~20_combout\ & (\WideOr7~0_combout\ & \WideNor0~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal7~2_combout\,
	datab => \WideNor0~20_combout\,
	datac => \WideOr7~0_combout\,
	datad => \WideNor0~21_combout\,
	combout => \WideNor0~22_combout\);

-- Location: LCCOMB_X4_Y28_N20
WideNor0 : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~combout\ = ((\WideNor0~25_combout\) # ((!\WideNor0~22_combout\) # (!\WideOr11~2_combout\))) # (!\WideNor0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideNor0~24_combout\,
	datab => \WideNor0~25_combout\,
	datac => \WideOr11~2_combout\,
	datad => \WideNor0~22_combout\,
	combout => \WideNor0~combout\);

-- Location: CLKCTRL_G4
\WideNor0~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \WideNor0~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \WideNor0~clkctrl_outclk\);

-- Location: LCCOMB_X4_Y28_N4
\sevenSegment[0]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(0) = (GLOBAL(\WideNor0~clkctrl_outclk\) & ((\WideOr13~combout\))) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & (sevenSegment(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sevenSegment(0),
	datac => \WideOr13~combout\,
	datad => \WideNor0~clkctrl_outclk\,
	combout => sevenSegment(0));

-- Location: LCCOMB_X5_Y28_N24
\sevenSegment[1]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(1) = (GLOBAL(\WideNor0~clkctrl_outclk\) & ((!\WideOr11~2_combout\))) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & (sevenSegment(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sevenSegment(1),
	datac => \WideOr11~2_combout\,
	datad => \WideNor0~clkctrl_outclk\,
	combout => sevenSegment(1));

-- Location: LCCOMB_X6_Y28_N28
\Equal16~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal16~2_combout\ = (\Equal16~1_combout\ & (\Equal2~0_combout\ & (!\switch_input[5]~input_o\ & \switch_input[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal16~1_combout\,
	datab => \Equal2~0_combout\,
	datac => \switch_input[5]~input_o\,
	datad => \switch_input[7]~input_o\,
	combout => \Equal16~2_combout\);

-- Location: LCCOMB_X5_Y28_N28
WideOr9 : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr9~combout\ = (\Equal16~2_combout\) # (((\Equal24~0_combout\ & \Equal25~0_combout\)) # (!\WideOr9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal16~2_combout\,
	datab => \WideOr9~0_combout\,
	datac => \Equal24~0_combout\,
	datad => \Equal25~0_combout\,
	combout => \WideOr9~combout\);

-- Location: LCCOMB_X5_Y28_N8
\sevenSegment[2]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(2) = (GLOBAL(\WideNor0~clkctrl_outclk\) & (\WideOr9~combout\)) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & ((sevenSegment(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr9~combout\,
	datac => sevenSegment(2),
	datad => \WideNor0~clkctrl_outclk\,
	combout => sevenSegment(2));

-- Location: LCCOMB_X6_Y28_N4
\Equal5~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = (!\switch_input[0]~input_o\ & !\switch_input[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \switch_input[0]~input_o\,
	datad => \switch_input[1]~input_o\,
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X6_Y28_N22
\Equal4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal4~1_combout\ = (\switch_input[5]~input_o\ & (!\switch_input[0]~input_o\ & (\Equal2~0_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[5]~input_o\,
	datab => \switch_input[0]~input_o\,
	datac => \Equal2~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal4~1_combout\);

-- Location: LCCOMB_X6_Y28_N18
\WideOr7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr7~1_combout\ = (\Equal3~1_combout\) # ((\Equal4~1_combout\) # ((\Equal6~0_combout\ & \Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal3~1_combout\,
	datab => \Equal6~0_combout\,
	datac => \Equal5~1_combout\,
	datad => \Equal4~1_combout\,
	combout => \WideOr7~1_combout\);

-- Location: LCCOMB_X3_Y28_N8
\WideOr7~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr7~2_combout\ = ((\WideOr7~1_combout\) # (!\WideOr13~22_combout\)) # (!\WideOr7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr7~0_combout\,
	datac => \WideOr13~22_combout\,
	datad => \WideOr7~1_combout\,
	combout => \WideOr7~2_combout\);

-- Location: LCCOMB_X3_Y28_N14
\sevenSegment[3]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(3) = (GLOBAL(\WideNor0~clkctrl_outclk\) & ((!\WideOr7~2_combout\))) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & (sevenSegment(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sevenSegment(3),
	datac => \WideNor0~clkctrl_outclk\,
	datad => \WideOr7~2_combout\,
	combout => sevenSegment(3));

-- Location: LCCOMB_X6_Y28_N0
\Equal13~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal13~0_combout\ = (!\switch_input[1]~input_o\ & (\switch_input[0]~input_o\ & \Equal6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datac => \switch_input[0]~input_o\,
	datad => \Equal6~0_combout\,
	combout => \Equal13~0_combout\);

-- Location: LCCOMB_X6_Y28_N12
\WideOr3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = (!\Equal4~1_combout\ & (!\Equal17~0_combout\ & ((!\Equal5~0_combout\) # (!\Equal5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~1_combout\,
	datab => \Equal17~0_combout\,
	datac => \Equal5~1_combout\,
	datad => \Equal5~0_combout\,
	combout => \WideOr3~0_combout\);

-- Location: LCCOMB_X6_Y28_N26
\Equal15~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal15~0_combout\ = (!\switch_input[2]~input_o\ & (\Equal1~0_combout\ & (!\switch_input[7]~input_o\ & \Equal16~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[2]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \switch_input[7]~input_o\,
	datad => \Equal16~1_combout\,
	combout => \Equal15~0_combout\);

-- Location: LCCOMB_X6_Y28_N10
\WideOr5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr5~0_combout\ = (\Equal15~0_combout\) # ((\Equal2~0_combout\ & \Equal2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal2~0_combout\,
	datac => \Equal2~1_combout\,
	datad => \Equal15~0_combout\,
	combout => \WideOr5~0_combout\);

-- Location: LCCOMB_X6_Y28_N14
WideOr5 : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr5~combout\ = ((\Equal13~0_combout\) # ((\WideOr5~0_combout\) # (!\WideOr3~0_combout\))) # (!\WideNor0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideNor0~20_combout\,
	datab => \Equal13~0_combout\,
	datac => \WideOr3~0_combout\,
	datad => \WideOr5~0_combout\,
	combout => \WideOr5~combout\);

-- Location: LCCOMB_X6_Y28_N6
\sevenSegment[4]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(4) = (GLOBAL(\WideNor0~clkctrl_outclk\) & ((\WideOr5~combout\))) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & (sevenSegment(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sevenSegment(4),
	datac => \WideNor0~clkctrl_outclk\,
	datad => \WideOr5~combout\,
	combout => sevenSegment(4));

-- Location: LCCOMB_X5_Y27_N10
\Equal18~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal18~0_combout\ = (!\switch_input[4]~input_o\ & !\switch_input[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \switch_input[4]~input_o\,
	datad => \switch_input[3]~input_o\,
	combout => \Equal18~0_combout\);

-- Location: LCCOMB_X4_Y28_N22
\Equal18~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Equal18~1_combout\ = (\switch_input[1]~input_o\ & (\Equal18~0_combout\ & (!\switch_input[0]~input_o\ & !\switch_input[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \switch_input[1]~input_o\,
	datab => \Equal18~0_combout\,
	datac => \switch_input[0]~input_o\,
	datad => \switch_input[7]~input_o\,
	combout => \Equal18~1_combout\);

-- Location: LCCOMB_X6_Y28_N24
\WideOr3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr3~1_combout\ = (\Equal1~1_combout\) # ((\Equal7~2_combout\) # ((\Equal4~0_combout\ & \Equal18~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~0_combout\,
	datab => \Equal18~1_combout\,
	datac => \Equal1~1_combout\,
	datad => \Equal7~2_combout\,
	combout => \WideOr3~1_combout\);

-- Location: LCCOMB_X6_Y28_N16
\WideOr3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideOr3~2_combout\ = (\WideOr3~1_combout\) # (((!\WideNor0~20_combout\) # (!\WideOr11~0_combout\)) # (!\WideOr3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr3~1_combout\,
	datab => \WideOr3~0_combout\,
	datac => \WideOr11~0_combout\,
	datad => \WideNor0~20_combout\,
	combout => \WideOr3~2_combout\);

-- Location: LCCOMB_X6_Y28_N30
\sevenSegment[5]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(5) = (GLOBAL(\WideNor0~clkctrl_outclk\) & ((\WideOr3~2_combout\))) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & (sevenSegment(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sevenSegment(5),
	datac => \WideOr3~2_combout\,
	datad => \WideNor0~clkctrl_outclk\,
	combout => sevenSegment(5));

-- Location: LCCOMB_X5_Y28_N18
\WideNor0~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \WideNor0~23_combout\ = (\WideNor0~24_combout\ & (\WideNor0~22_combout\ & \WideOr11~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideNor0~24_combout\,
	datac => \WideNor0~22_combout\,
	datad => \WideOr11~2_combout\,
	combout => \WideNor0~23_combout\);

-- Location: LCCOMB_X5_Y28_N26
\sevenSegment[6]\ : cycloneiii_lcell_comb
-- Equation(s):
-- sevenSegment(6) = (GLOBAL(\WideNor0~clkctrl_outclk\) & ((!\WideNor0~23_combout\))) # (!GLOBAL(\WideNor0~clkctrl_outclk\) & (sevenSegment(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => sevenSegment(6),
	datac => \WideNor0~clkctrl_outclk\,
	datad => \WideNor0~23_combout\,
	combout => sevenSegment(6));

ww_sevenSegmentActiveLow(0) <= \sevenSegmentActiveLow[0]~output_o\;

ww_sevenSegmentActiveLow(1) <= \sevenSegmentActiveLow[1]~output_o\;

ww_sevenSegmentActiveLow(2) <= \sevenSegmentActiveLow[2]~output_o\;

ww_sevenSegmentActiveLow(3) <= \sevenSegmentActiveLow[3]~output_o\;

ww_sevenSegmentActiveLow(4) <= \sevenSegmentActiveLow[4]~output_o\;

ww_sevenSegmentActiveLow(5) <= \sevenSegmentActiveLow[5]~output_o\;

ww_sevenSegmentActiveLow(6) <= \sevenSegmentActiveLow[6]~output_o\;
END structure;


