-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "04/21/2016 14:50:30"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	seven_seg IS
    PORT (
	buttons : IN std_logic_vector(7 DOWNTO 0);
	\select\ : OUT std_logic_vector(2 DOWNTO 0);
	segments : OUT std_logic_vector(6 DOWNTO 0);
	en_n : OUT std_logic
	);
END seven_seg;

-- Design Ports Information
-- select[0]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[1]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[2]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en_n	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[0]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[2]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[3]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[4]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[5]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[6]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[7]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF seven_seg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_buttons : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_select\ : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_en_n : std_logic;
SIGNAL \select[0]~output_o\ : std_logic;
SIGNAL \select[1]~output_o\ : std_logic;
SIGNAL \select[2]~output_o\ : std_logic;
SIGNAL \segments[0]~output_o\ : std_logic;
SIGNAL \segments[1]~output_o\ : std_logic;
SIGNAL \segments[2]~output_o\ : std_logic;
SIGNAL \segments[3]~output_o\ : std_logic;
SIGNAL \segments[4]~output_o\ : std_logic;
SIGNAL \segments[5]~output_o\ : std_logic;
SIGNAL \segments[6]~output_o\ : std_logic;
SIGNAL \en_n~output_o\ : std_logic;
SIGNAL \buttons[4]~input_o\ : std_logic;
SIGNAL \buttons[6]~input_o\ : std_logic;
SIGNAL \buttons[5]~input_o\ : std_logic;
SIGNAL \buttons[7]~input_o\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \buttons[0]~input_o\ : std_logic;
SIGNAL \buttons[1]~input_o\ : std_logic;
SIGNAL \buttons[3]~input_o\ : std_logic;
SIGNAL \buttons[2]~input_o\ : std_logic;
SIGNAL \select~0_combout\ : std_logic;
SIGNAL \select~1_combout\ : std_logic;
SIGNAL \WideOr1~1_combout\ : std_logic;
SIGNAL \WideOr1~2_combout\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \WideOr0~1_combout\ : std_logic;
SIGNAL \Decoder3~0_combout\ : std_logic;
SIGNAL \Decoder3~1_combout\ : std_logic;
SIGNAL \Decoder2~0_combout\ : std_logic;
SIGNAL \segments~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr0~1_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr1~2_combout\ : std_logic;
SIGNAL \ALT_INV_select~1_combout\ : std_logic;
SIGNAL \ALT_INV_Decoder2~0_combout\ : std_logic;

BEGIN

ww_buttons <= buttons;
\select\ <= \ww_select\;
segments <= ww_segments;
en_n <= ww_en_n;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_WideOr0~1_combout\ <= NOT \WideOr0~1_combout\;
\ALT_INV_WideOr1~2_combout\ <= NOT \WideOr1~2_combout\;
\ALT_INV_select~1_combout\ <= NOT \select~1_combout\;
\ALT_INV_Decoder2~0_combout\ <= NOT \Decoder2~0_combout\;

-- Location: IOOBUF_X40_Y0_N23
\select[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_select~1_combout\,
	devoe => ww_devoe,
	o => \select[0]~output_o\);

-- Location: IOOBUF_X36_Y0_N16
\select[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr1~2_combout\,
	devoe => ww_devoe,
	o => \select[1]~output_o\);

-- Location: IOOBUF_X34_Y0_N16
\select[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr0~1_combout\,
	devoe => ww_devoe,
	o => \select[2]~output_o\);

-- Location: IOOBUF_X53_Y21_N23
\segments[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Decoder3~1_combout\,
	devoe => ww_devoe,
	o => \segments[0]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\segments[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Decoder3~1_combout\,
	devoe => ww_devoe,
	o => \segments[1]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\segments[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_select~1_combout\,
	devoe => ww_devoe,
	o => \segments[2]~output_o\);

-- Location: IOOBUF_X36_Y0_N23
\segments[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Decoder3~1_combout\,
	devoe => ww_devoe,
	o => \segments[3]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\segments[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Decoder2~0_combout\,
	devoe => ww_devoe,
	o => \segments[4]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\segments[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \segments~0_combout\,
	devoe => ww_devoe,
	o => \segments[5]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\segments[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \segments[6]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\en_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \en_n~output_o\);

-- Location: IOIBUF_X16_Y34_N8
\buttons[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(4),
	o => \buttons[4]~input_o\);

-- Location: IOIBUF_X20_Y34_N22
\buttons[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(6),
	o => \buttons[6]~input_o\);

-- Location: IOIBUF_X18_Y34_N1
\buttons[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(5),
	o => \buttons[5]~input_o\);

-- Location: IOIBUF_X23_Y34_N15
\buttons[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(7),
	o => \buttons[7]~input_o\);

-- Location: LCCOMB_X20_Y33_N0
\WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (\buttons[4]~input_o\ & (\buttons[6]~input_o\ & (\buttons[5]~input_o\ & \buttons[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[4]~input_o\,
	datab => \buttons[6]~input_o\,
	datac => \buttons[5]~input_o\,
	datad => \buttons[7]~input_o\,
	combout => \WideOr1~0_combout\);

-- Location: IOIBUF_X7_Y34_N8
\buttons[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(0),
	o => \buttons[0]~input_o\);

-- Location: IOIBUF_X3_Y34_N1
\buttons[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(1),
	o => \buttons[1]~input_o\);

-- Location: IOIBUF_X14_Y34_N22
\buttons[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(3),
	o => \buttons[3]~input_o\);

-- Location: IOIBUF_X9_Y34_N22
\buttons[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(2),
	o => \buttons[2]~input_o\);

-- Location: LCCOMB_X23_Y27_N24
\select~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \select~0_combout\ = (\buttons[1]~input_o\ & (\buttons[2]~input_o\ & (\buttons[0]~input_o\ $ (\buttons[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[0]~input_o\,
	datab => \buttons[1]~input_o\,
	datac => \buttons[3]~input_o\,
	datad => \buttons[2]~input_o\,
	combout => \select~0_combout\);

-- Location: LCCOMB_X23_Y27_N26
\select~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \select~1_combout\ = (\WideOr1~0_combout\ & \select~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr1~0_combout\,
	datad => \select~0_combout\,
	combout => \select~1_combout\);

-- Location: LCCOMB_X23_Y27_N12
\WideOr1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~1_combout\ = (\buttons[1]~input_o\ & ((\buttons[0]~input_o\ & (\buttons[3]~input_o\ $ (\buttons[2]~input_o\))) # (!\buttons[0]~input_o\ & (\buttons[3]~input_o\ & \buttons[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[0]~input_o\,
	datab => \buttons[1]~input_o\,
	datac => \buttons[3]~input_o\,
	datad => \buttons[2]~input_o\,
	combout => \WideOr1~1_combout\);

-- Location: LCCOMB_X23_Y27_N30
\WideOr1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~2_combout\ = (\WideOr1~0_combout\ & \WideOr1~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr1~0_combout\,
	datad => \WideOr1~1_combout\,
	combout => \WideOr1~2_combout\);

-- Location: LCCOMB_X23_Y27_N8
\WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = (\buttons[0]~input_o\ & ((\buttons[1]~input_o\ & (\buttons[3]~input_o\ $ (\buttons[2]~input_o\))) # (!\buttons[1]~input_o\ & (\buttons[3]~input_o\ & \buttons[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[0]~input_o\,
	datab => \buttons[1]~input_o\,
	datac => \buttons[3]~input_o\,
	datad => \buttons[2]~input_o\,
	combout => \WideOr0~0_combout\);

-- Location: LCCOMB_X23_Y27_N2
\WideOr0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr0~1_combout\ = (\WideOr1~0_combout\ & \WideOr0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr1~0_combout\,
	datac => \WideOr0~0_combout\,
	combout => \WideOr0~1_combout\);

-- Location: LCCOMB_X23_Y27_N4
\Decoder3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder3~0_combout\ = (\buttons[0]~input_o\ & (\buttons[1]~input_o\ & (\buttons[3]~input_o\ & !\buttons[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[0]~input_o\,
	datab => \buttons[1]~input_o\,
	datac => \buttons[3]~input_o\,
	datad => \buttons[2]~input_o\,
	combout => \Decoder3~0_combout\);

-- Location: LCCOMB_X23_Y27_N22
\Decoder3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder3~1_combout\ = (\WideOr1~0_combout\ & (\Decoder3~0_combout\ & !\select~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr1~0_combout\,
	datac => \Decoder3~0_combout\,
	datad => \select~0_combout\,
	combout => \Decoder3~1_combout\);

-- Location: LCCOMB_X23_Y27_N0
\Decoder2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder2~0_combout\ = ((!\select~0_combout\) # (!\WideOr0~0_combout\)) # (!\WideOr1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \WideOr1~0_combout\,
	datac => \WideOr0~0_combout\,
	datad => \select~0_combout\,
	combout => \Decoder2~0_combout\);

-- Location: LCCOMB_X23_Y27_N10
\segments~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \segments~0_combout\ = (\WideOr1~0_combout\ & (\WideOr0~0_combout\ & (\WideOr1~1_combout\ $ (!\select~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr1~1_combout\,
	datab => \WideOr1~0_combout\,
	datac => \WideOr0~0_combout\,
	datad => \select~0_combout\,
	combout => \segments~0_combout\);

\ww_select\(0) <= \select[0]~output_o\;

\ww_select\(1) <= \select[1]~output_o\;

\ww_select\(2) <= \select[2]~output_o\;

ww_segments(0) <= \segments[0]~output_o\;

ww_segments(1) <= \segments[1]~output_o\;

ww_segments(2) <= \segments[2]~output_o\;

ww_segments(3) <= \segments[3]~output_o\;

ww_segments(4) <= \segments[4]~output_o\;

ww_segments(5) <= \segments[5]~output_o\;

ww_segments(6) <= \segments[6]~output_o\;

ww_en_n <= \en_n~output_o\;
END structure;


