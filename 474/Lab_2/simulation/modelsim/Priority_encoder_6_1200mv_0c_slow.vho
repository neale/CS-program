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

-- DATE "04/08/2016 11:37:50"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Priority_encoder IS
    PORT (
	\in\ : IN std_logic_vector(7 DOWNTO 0);
	\out\ : OUT std_logic_vector(2 DOWNTO 0)
	);
END Priority_encoder;

-- Design Ports Information
-- out[0]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out[1]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out[2]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[1]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[3]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[2]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[0]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[5]	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[7]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[6]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in[4]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Priority_encoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \ww_in\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ww_out\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \out[0]~output_o\ : std_logic;
SIGNAL \out[1]~output_o\ : std_logic;
SIGNAL \out[2]~output_o\ : std_logic;
SIGNAL \in[7]~input_o\ : std_logic;
SIGNAL \in[6]~input_o\ : std_logic;
SIGNAL \in[5]~input_o\ : std_logic;
SIGNAL \in[4]~input_o\ : std_logic;
SIGNAL \out~4_combout\ : std_logic;
SIGNAL \in[2]~input_o\ : std_logic;
SIGNAL \in[0]~input_o\ : std_logic;
SIGNAL \in[3]~input_o\ : std_logic;
SIGNAL \in[1]~input_o\ : std_logic;
SIGNAL \out~2_combout\ : std_logic;
SIGNAL \out~10_combout\ : std_logic;
SIGNAL \out~5_combout\ : std_logic;
SIGNAL \out~6_combout\ : std_logic;
SIGNAL \out~7_combout\ : std_logic;
SIGNAL \out~8_combout\ : std_logic;
SIGNAL \out~3_combout\ : std_logic;
SIGNAL \out~9_combout\ : std_logic;

BEGIN

\ww_in\ <= \in\;
\out\ <= \ww_out\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X13_Y0_N16
\out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \out~10_combout\,
	devoe => ww_devoe,
	o => \out[0]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \out~7_combout\,
	devoe => ww_devoe,
	o => \out[1]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \out~9_combout\,
	devoe => ww_devoe,
	o => \out[2]~output_o\);

-- Location: IOIBUF_X0_Y8_N15
\in[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(7),
	o => \in[7]~input_o\);

-- Location: IOIBUF_X0_Y6_N22
\in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(6),
	o => \in[6]~input_o\);

-- Location: IOIBUF_X0_Y5_N15
\in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(5),
	o => \in[5]~input_o\);

-- Location: IOIBUF_X7_Y0_N1
\in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(4),
	o => \in[4]~input_o\);

-- Location: LCCOMB_X7_Y8_N12
\out~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~4_combout\ = (!\in[4]~input_o\ & ((\in[5]~input_o\) # ((\in[7]~input_o\ & !\in[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in[7]~input_o\,
	datab => \in[6]~input_o\,
	datac => \in[5]~input_o\,
	datad => \in[4]~input_o\,
	combout => \out~4_combout\);

-- Location: IOIBUF_X0_Y7_N1
\in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(2),
	o => \in[2]~input_o\);

-- Location: IOIBUF_X18_Y24_N22
\in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(0),
	o => \in[0]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(3),
	o => \in[3]~input_o\);

-- Location: IOIBUF_X34_Y12_N8
\in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \ww_in\(1),
	o => \in[1]~input_o\);

-- Location: LCCOMB_X7_Y8_N16
\out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~2_combout\ = (!\in[0]~input_o\ & ((\in[1]~input_o\) # ((\in[3]~input_o\ & !\in[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in[3]~input_o\,
	datab => \in[2]~input_o\,
	datac => \in[0]~input_o\,
	datad => \in[1]~input_o\,
	combout => \out~2_combout\);

-- Location: LCCOMB_X7_Y8_N0
\out~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~10_combout\ = (\out~2_combout\) # ((\out~4_combout\ & (!\in[2]~input_o\ & !\in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out~4_combout\,
	datab => \in[2]~input_o\,
	datac => \in[0]~input_o\,
	datad => \out~2_combout\,
	combout => \out~10_combout\);

-- Location: LCCOMB_X7_Y8_N6
\out~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~5_combout\ = (!\in[5]~input_o\ & (!\in[4]~input_o\ & ((\in[7]~input_o\) # (\in[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in[7]~input_o\,
	datab => \in[6]~input_o\,
	datac => \in[5]~input_o\,
	datad => \in[4]~input_o\,
	combout => \out~5_combout\);

-- Location: LCCOMB_X7_Y8_N24
\out~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~6_combout\ = (\in[2]~input_o\) # (\in[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \in[2]~input_o\,
	datac => \in[3]~input_o\,
	combout => \out~6_combout\);

-- Location: LCCOMB_X7_Y8_N10
\out~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~7_combout\ = (!\in[0]~input_o\ & (!\in[1]~input_o\ & ((\out~5_combout\) # (\out~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \out~5_combout\,
	datab => \out~6_combout\,
	datac => \in[0]~input_o\,
	datad => \in[1]~input_o\,
	combout => \out~7_combout\);

-- Location: LCCOMB_X7_Y8_N4
\out~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~8_combout\ = (\in[7]~input_o\) # ((\in[6]~input_o\) # ((\in[5]~input_o\) # (\in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in[7]~input_o\,
	datab => \in[6]~input_o\,
	datac => \in[5]~input_o\,
	datad => \in[4]~input_o\,
	combout => \out~8_combout\);

-- Location: LCCOMB_X7_Y8_N26
\out~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~3_combout\ = (!\in[0]~input_o\ & !\in[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \in[0]~input_o\,
	datad => \in[2]~input_o\,
	combout => \out~3_combout\);

-- Location: LCCOMB_X7_Y8_N14
\out~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \out~9_combout\ = (!\in[3]~input_o\ & (\out~8_combout\ & (\out~3_combout\ & !\in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in[3]~input_o\,
	datab => \out~8_combout\,
	datac => \out~3_combout\,
	datad => \in[1]~input_o\,
	combout => \out~9_combout\);

\ww_out\(0) <= \out[0]~output_o\;

\ww_out\(1) <= \out[1]~output_o\;

\ww_out\(2) <= \out[2]~output_o\;
END structure;


