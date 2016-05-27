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

-- DATE "05/27/2016 01:32:59"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ROM IS
    PORT (
	buttons : IN std_logic_vector(7 DOWNTO 0);
	encoder0 : IN std_logic;
	encoder1 : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	d_out : IN std_logic;
	d_in : OUT std_logic;
	\_sclk\ : OUT std_logic;
	segments : OUT std_logic_vector(6 DOWNTO 0);
	dp : OUT std_logic;
	\select\ : OUT std_logic_vector(2 DOWNTO 0);
	display_clk : OUT std_logic;
	pwm : OUT std_logic
	);
END ROM;

-- Design Ports Information
-- buttons[0]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[2]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[3]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[4]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[5]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[6]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[7]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- encoder0	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- encoder1	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d_in	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- _sclk	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[0]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[1]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[2]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_clk	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d_out	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ROM IS
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
SIGNAL ww_encoder0 : std_logic;
SIGNAL ww_encoder1 : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_d_out : std_logic;
SIGNAL ww_d_in : std_logic;
SIGNAL \ww__sclk\ : std_logic;
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dp : std_logic;
SIGNAL \ww_select\ : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_display_clk : std_logic;
SIGNAL ww_pwm : std_logic;
SIGNAL \sclk_0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \buttons[0]~input_o\ : std_logic;
SIGNAL \buttons[1]~input_o\ : std_logic;
SIGNAL \buttons[2]~input_o\ : std_logic;
SIGNAL \buttons[3]~input_o\ : std_logic;
SIGNAL \buttons[4]~input_o\ : std_logic;
SIGNAL \buttons[5]~input_o\ : std_logic;
SIGNAL \buttons[6]~input_o\ : std_logic;
SIGNAL \buttons[7]~input_o\ : std_logic;
SIGNAL \encoder0~input_o\ : std_logic;
SIGNAL \encoder1~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \sclk_0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk_outclk\ : std_logic;
SIGNAL \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \count_posedge[0]~3_combout\ : std_logic;
SIGNAL \count_posedge[1]~2_combout\ : std_logic;
SIGNAL \count_posedge[2]~0_combout\ : std_logic;
SIGNAL \count_posedge[3]~1_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \d_out~input_o\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \d_out_buffer[10]~0_combout\ : std_logic;
SIGNAL \d_out_buffer[10]~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \ones~2_combout\ : std_logic;
SIGNAL \ones~0_combout\ : std_logic;
SIGNAL \ones~1_combout\ : std_logic;
SIGNAL \ones~15_combout\ : std_logic;
SIGNAL \tenth~7_combout\ : std_logic;
SIGNAL \tenth~8_combout\ : std_logic;
SIGNAL \tenth~3_combout\ : std_logic;
SIGNAL \tenth~20_combout\ : std_logic;
SIGNAL \ones~14_combout\ : std_logic;
SIGNAL \ones~4_combout\ : std_logic;
SIGNAL \ones~3_combout\ : std_logic;
SIGNAL \ones~5_combout\ : std_logic;
SIGNAL \ones~13_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \tenth~9_combout\ : std_logic;
SIGNAL \tenth~6_combout\ : std_logic;
SIGNAL \ones~7_combout\ : std_logic;
SIGNAL \ones~8_combout\ : std_logic;
SIGNAL \ones~6_combout\ : std_logic;
SIGNAL \ones~16_combout\ : std_logic;
SIGNAL \LessThan7~0_combout\ : std_logic;
SIGNAL \tenth~18_combout\ : std_logic;
SIGNAL \hundredth~14_combout\ : std_logic;
SIGNAL \tenth~17_combout\ : std_logic;
SIGNAL \hundredth~7_combout\ : std_logic;
SIGNAL \hundredth~6_combout\ : std_logic;
SIGNAL \tenth~11_combout\ : std_logic;
SIGNAL \LessThan7~1_combout\ : std_logic;
SIGNAL \tenth~12_combout\ : std_logic;
SIGNAL \tenth~10_combout\ : std_logic;
SIGNAL \ones~9_combout\ : std_logic;
SIGNAL \ones~11_combout\ : std_logic;
SIGNAL \ones~10_combout\ : std_logic;
SIGNAL \ones~12_combout\ : std_logic;
SIGNAL \tenth~19_combout\ : std_logic;
SIGNAL \hundredth~10_combout\ : std_logic;
SIGNAL \tenth~14_combout\ : std_logic;
SIGNAL \tenth~13_combout\ : std_logic;
SIGNAL \ones~19_combout\ : std_logic;
SIGNAL \ones~18_combout\ : std_logic;
SIGNAL \ones~17_combout\ : std_logic;
SIGNAL \ones~20_combout\ : std_logic;
SIGNAL \tenth~15_combout\ : std_logic;
SIGNAL \tenth~16_combout\ : std_logic;
SIGNAL \hundredth~8_combout\ : std_logic;
SIGNAL \hundredth~9_combout\ : std_logic;
SIGNAL \hundredth[1]~11_combout\ : std_logic;
SIGNAL \hundredth[3]~13_combout\ : std_logic;
SIGNAL \LessThan11~0_combout\ : std_logic;
SIGNAL \hundredth[0]~3_combout\ : std_logic;
SIGNAL \LessThan8~0_combout\ : std_logic;
SIGNAL \Add13~0_combout\ : std_logic;
SIGNAL \hundredth[0]~2_combout\ : std_logic;
SIGNAL \LessThan13~0_combout\ : std_logic;
SIGNAL \hundredth[0]~4_combout\ : std_logic;
SIGNAL \hundredth[0]~5_combout\ : std_logic;
SIGNAL \hundredth[2]~12_combout\ : std_logic;
SIGNAL \WideOr11~0_combout\ : std_logic;
SIGNAL \WideOr9~0_combout\ : std_logic;
SIGNAL \Decoder2~0_combout\ : std_logic;
SIGNAL \WideOr7~0_combout\ : std_logic;
SIGNAL \WideOr5~0_combout\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL count_posedge : std_logic_vector(3 DOWNTO 0);
SIGNAL d_out_buffer : std_logic_vector(11 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|q_a\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \sclk_0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_WideOr3~0_combout\ : std_logic;

BEGIN

ww_buttons <= buttons;
ww_encoder0 <= encoder0;
ww_encoder1 <= encoder1;
ww_clk <= clk;
ww_reset <= reset;
ww_d_out <= d_out;
d_in <= ww_d_in;
\_sclk\ <= \ww__sclk\;
segments <= ww_segments;
dp <= ww_dp;
\select\ <= \ww_select\;
display_clk <= ww_display_clk;
pwm <= ww_pwm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\sclk_0|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\sclk_0|altpll_component|auto_generated|wire_pll1_clk\(0) <= \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\(0);
\sclk_0|altpll_component|auto_generated|wire_pll1_clk\(1) <= \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\(1);
\sclk_0|altpll_component|auto_generated|wire_pll1_clk\(2) <= \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\(2);
\sclk_0|altpll_component|auto_generated|wire_pll1_clk\(3) <= \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\(3);
\sclk_0|altpll_component|auto_generated|wire_pll1_clk\(4) <= \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\(4);

\ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (d_out_buffer(10) & d_out_buffer(9) & d_out_buffer(8) & d_out_buffer(7) & d_out_buffer(6) & d_out_buffer(5) & d_out_buffer(4) & d_out_buffer(3) & d_out_buffer(2) & 
d_out_buffer(1) & d_out_buffer(0));

\ADC0|altsyncram_component|auto_generated|q_a\(8) <= \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(9) <= \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(1);
\ADC0|altsyncram_component|auto_generated|q_a\(10) <= \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(2);
\ADC0|altsyncram_component|auto_generated|q_a\(11) <= \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(3);

\ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (d_out_buffer(10) & d_out_buffer(9) & d_out_buffer(8) & d_out_buffer(7) & d_out_buffer(6) & d_out_buffer(5) & d_out_buffer(4) & d_out_buffer(3) & d_out_buffer(2) & 
d_out_buffer(1) & d_out_buffer(0));

\ADC0|altsyncram_component|auto_generated|q_a\(4) <= \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(5) <= \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);
\ADC0|altsyncram_component|auto_generated|q_a\(6) <= \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(2);
\ADC0|altsyncram_component|auto_generated|q_a\(7) <= \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(3);

\ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (d_out_buffer(10) & d_out_buffer(9) & d_out_buffer(8) & d_out_buffer(7) & d_out_buffer(6) & d_out_buffer(5) & d_out_buffer(4) & d_out_buffer(3) & d_out_buffer(2) & 
d_out_buffer(1) & d_out_buffer(0));

\ADC0|altsyncram_component|auto_generated|q_a\(2) <= \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(3) <= \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(1);

\frame_rate0|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(0) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(0);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(1) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(1);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(2) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(2);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(3) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(3);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(4) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(4);

\frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(1));

\sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \sclk_0|altpll_component|auto_generated|wire_pll1_clk\(0));

\sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk_INCLK_bus\ <= (vcc & vcc & vcc & \sclk_0|altpll_component|auto_generated|wire_pll1_clk\(0));
\ALT_INV_WideOr3~0_combout\ <= NOT \WideOr3~0_combout\;

-- Location: IOOBUF_X31_Y34_N9
\d_in~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_d_in);

-- Location: IOOBUF_X49_Y0_N9
\_sclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk_outclk\,
	devoe => ww_devoe,
	o => \ww__sclk\);

-- Location: IOOBUF_X53_Y21_N23
\segments[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr11~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(0));

-- Location: IOOBUF_X45_Y0_N16
\segments[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr9~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(1));

-- Location: IOOBUF_X40_Y0_N16
\segments[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Decoder2~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(2));

-- Location: IOOBUF_X36_Y0_N9
\segments[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr7~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(3));

-- Location: IOOBUF_X36_Y0_N23
\segments[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(4));

-- Location: IOOBUF_X34_Y0_N2
\segments[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(5));

-- Location: IOOBUF_X34_Y0_N23
\segments[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(6));

-- Location: IOOBUF_X53_Y8_N23
\dp~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_dp);

-- Location: IOOBUF_X40_Y0_N23
\select[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_select\(0));

-- Location: IOOBUF_X36_Y0_N16
\select[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_select\(1));

-- Location: IOOBUF_X34_Y0_N16
\select[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ww_select\(2));

-- Location: IOOBUF_X5_Y0_N23
\display_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_display_clk);

-- Location: IOOBUF_X53_Y11_N2
\pwm~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pwm);

-- Location: IOIBUF_X27_Y0_N22
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: PLL_4
\sclk_0|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 150,
	c0_initial => 1,
	c0_low => 150,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 25,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => GND,
	fbin => \sclk_0|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \sclk_0|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \sclk_0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \sclk_0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_PLL4E0
\sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "external clock output",
	ena_register_mode => "double register")
-- pragma translate_on
PORT MAP (
	inclk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_e__sclk_outclk\);

-- Location: CLKCTRL_G18
\sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X32_Y8_N12
\count_posedge[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[0]~3_combout\ = !count_posedge(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count_posedge(0),
	combout => \count_posedge[0]~3_combout\);

-- Location: FF_X32_Y8_N13
\count_posedge[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \count_posedge[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(0));

-- Location: LCCOMB_X32_Y7_N10
\count_posedge[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[1]~2_combout\ = count_posedge(1) $ (count_posedge(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count_posedge(1),
	datad => count_posedge(0),
	combout => \count_posedge[1]~2_combout\);

-- Location: FF_X32_Y7_N11
\count_posedge[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \count_posedge[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(1));

-- Location: LCCOMB_X32_Y7_N22
\count_posedge[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[2]~0_combout\ = count_posedge(2) $ (((count_posedge(1) & count_posedge(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(1),
	datac => count_posedge(2),
	datad => count_posedge(0),
	combout => \count_posedge[2]~0_combout\);

-- Location: FF_X32_Y7_N23
\count_posedge[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \count_posedge[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(2));

-- Location: LCCOMB_X32_Y7_N24
\count_posedge[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[3]~1_combout\ = count_posedge(3) $ (((count_posedge(2) & (count_posedge(0) & count_posedge(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(0),
	datac => count_posedge(3),
	datad => count_posedge(1),
	combout => \count_posedge[3]~1_combout\);

-- Location: FF_X32_Y7_N25
\count_posedge[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \count_posedge[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(3));

-- Location: LCCOMB_X32_Y7_N28
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (count_posedge(3) & (count_posedge(2) & count_posedge(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux11~0_combout\);

-- Location: IOIBUF_X27_Y0_N1
\d_out~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d_out,
	o => \d_out~input_o\);

-- Location: LCCOMB_X32_Y6_N8
\Mux11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (\Mux11~0_combout\ & ((count_posedge(0) & (\d_out~input_o\)) # (!count_posedge(0) & ((d_out_buffer(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux11~0_combout\,
	datab => \d_out~input_o\,
	datac => d_out_buffer(0),
	datad => count_posedge(0),
	combout => \Mux11~1_combout\);

-- Location: LCCOMB_X32_Y7_N30
\Mux11~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~2_combout\ = (count_posedge(3) & (count_posedge(2) & count_posedge(1))) # (!count_posedge(3) & (!count_posedge(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux11~2_combout\);

-- Location: FF_X32_Y6_N9
\d_out_buffer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux11~1_combout\,
	ena => \Mux11~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(0));

-- Location: LCCOMB_X32_Y6_N18
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Mux11~0_combout\ & ((count_posedge(0) & ((d_out_buffer(1)))) # (!count_posedge(0) & (\d_out~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux11~0_combout\,
	datab => \d_out~input_o\,
	datac => d_out_buffer(1),
	datad => count_posedge(0),
	combout => \Mux10~0_combout\);

-- Location: FF_X32_Y6_N19
\d_out_buffer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux10~0_combout\,
	ena => \Mux11~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(1));

-- Location: LCCOMB_X32_Y7_N16
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (count_posedge(3) & (count_posedge(2) & !count_posedge(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X32_Y6_N20
\Mux9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = (\Mux9~0_combout\ & ((count_posedge(0) & (\d_out~input_o\)) # (!count_posedge(0) & ((d_out_buffer(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \d_out~input_o\,
	datac => d_out_buffer(2),
	datad => count_posedge(0),
	combout => \Mux9~1_combout\);

-- Location: LCCOMB_X32_Y7_N18
\Mux9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = (count_posedge(3) & (count_posedge(2) & !count_posedge(1))) # (!count_posedge(3) & (!count_posedge(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux9~2_combout\);

-- Location: FF_X32_Y6_N21
\d_out_buffer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux9~1_combout\,
	ena => \Mux9~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(2));

-- Location: LCCOMB_X32_Y6_N22
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\Mux9~0_combout\ & ((count_posedge(0) & ((d_out_buffer(3)))) # (!count_posedge(0) & (\d_out~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \d_out~input_o\,
	datac => d_out_buffer(3),
	datad => count_posedge(0),
	combout => \Mux8~0_combout\);

-- Location: FF_X32_Y6_N23
\d_out_buffer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux8~0_combout\,
	ena => \Mux9~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(3));

-- Location: LCCOMB_X32_Y7_N12
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (count_posedge(3) & (!count_posedge(2) & count_posedge(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X34_Y7_N16
\Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Mux7~0_combout\ & ((count_posedge(0) & (\d_out~input_o\)) # (!count_posedge(0) & ((d_out_buffer(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datab => \Mux7~0_combout\,
	datac => d_out_buffer(4),
	datad => count_posedge(0),
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X32_Y7_N6
\Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (!count_posedge(2) & ((count_posedge(1)) # (!count_posedge(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux7~2_combout\);

-- Location: FF_X34_Y7_N17
\d_out_buffer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux7~1_combout\,
	ena => \Mux7~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(4));

-- Location: LCCOMB_X34_Y7_N10
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Mux7~0_combout\ & ((count_posedge(0) & ((d_out_buffer(5)))) # (!count_posedge(0) & (\d_out~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datab => \Mux7~0_combout\,
	datac => d_out_buffer(5),
	datad => count_posedge(0),
	combout => \Mux6~0_combout\);

-- Location: FF_X34_Y7_N11
\d_out_buffer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux6~0_combout\,
	ena => \Mux7~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(5));

-- Location: LCCOMB_X32_Y7_N8
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (count_posedge(3) & (!count_posedge(2) & !count_posedge(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X32_Y7_N0
\Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Mux5~0_combout\ & ((count_posedge(0) & (\d_out~input_o\)) # (!count_posedge(0) & ((d_out_buffer(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datab => \Mux5~0_combout\,
	datac => d_out_buffer(6),
	datad => count_posedge(0),
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X32_Y7_N2
\Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (!count_posedge(2) & ((!count_posedge(1)) # (!count_posedge(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux5~2_combout\);

-- Location: FF_X32_Y7_N1
\d_out_buffer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux5~1_combout\,
	ena => \Mux5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(6));

-- Location: LCCOMB_X32_Y7_N26
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Mux5~0_combout\ & ((count_posedge(0) & ((d_out_buffer(7)))) # (!count_posedge(0) & (\d_out~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datab => \Mux5~0_combout\,
	datac => d_out_buffer(7),
	datad => count_posedge(0),
	combout => \Mux4~0_combout\);

-- Location: FF_X32_Y7_N27
\d_out_buffer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux4~0_combout\,
	ena => \Mux5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(7));

-- Location: LCCOMB_X32_Y7_N4
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!count_posedge(3) & (count_posedge(2) & count_posedge(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X32_Y8_N8
\Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux3~0_combout\ & ((count_posedge(0) & (\d_out~input_o\)) # (!count_posedge(0) & ((d_out_buffer(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \d_out~input_o\,
	datac => d_out_buffer(8),
	datad => count_posedge(0),
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X32_Y7_N14
\Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (!count_posedge(3) & ((count_posedge(1)) # (!count_posedge(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(3),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \Mux3~2_combout\);

-- Location: FF_X32_Y8_N9
\d_out_buffer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux3~1_combout\,
	ena => \Mux3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(8));

-- Location: LCCOMB_X32_Y8_N18
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Mux3~0_combout\ & ((count_posedge(0) & ((d_out_buffer(9)))) # (!count_posedge(0) & (\d_out~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \d_out~input_o\,
	datac => d_out_buffer(9),
	datad => count_posedge(0),
	combout => \Mux2~0_combout\);

-- Location: FF_X32_Y8_N19
\d_out_buffer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Mux2~0_combout\,
	ena => \Mux3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(9));

-- Location: LCCOMB_X34_Y7_N20
\d_out_buffer[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[10]~0_combout\ = (!count_posedge(1) & (count_posedge(0) & (\d_out~input_o\ $ (d_out_buffer(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datab => d_out_buffer(10),
	datac => count_posedge(1),
	datad => count_posedge(0),
	combout => \d_out_buffer[10]~0_combout\);

-- Location: LCCOMB_X32_Y7_N20
\d_out_buffer[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[10]~1_combout\ = (count_posedge(3) & (((d_out_buffer(10))))) # (!count_posedge(3) & (count_posedge(2) & (d_out_buffer(10) $ (\d_out_buffer[10]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => d_out_buffer(10),
	datad => \d_out_buffer[10]~0_combout\,
	combout => \d_out_buffer[10]~1_combout\);

-- Location: FF_X32_Y7_N21
\d_out_buffer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \d_out_buffer[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(10));

-- Location: M9K_X33_Y6_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555554444444444444444444444444444444444444444444444444444",
	mem_init2 => X"44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333",
	mem_init1 => X"33333333333333333333333333333333333333333333333333333333333333333333333322222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111",
	mem_init0 => X"11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "ADC:ADC0|altsyncram:altsyncram_component|altsyncram_e191:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 4,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y4_N22
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((\ADC0|altsyncram_component|auto_generated|q_a\(9)) # (\ADC0|altsyncram_component|auto_generated|q_a\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X34_Y4_N12
\ones~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~2_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (!\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((\ADC0|altsyncram_component|auto_generated|q_a\(8)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(10))))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((\ADC0|altsyncram_component|auto_generated|q_a\(10)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100000011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	combout => \ones~2_combout\);

-- Location: LCCOMB_X34_Y4_N16
\ones~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~0_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(10) & (!\ADC0|altsyncram_component|auto_generated|q_a\(8) & (\ADC0|altsyncram_component|auto_generated|q_a\(9) $ (!\ADC0|altsyncram_component|auto_generated|q_a\(11))))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(10) & (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(11) & \ADC0|altsyncram_component|auto_generated|q_a\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	combout => \ones~0_combout\);

-- Location: LCCOMB_X34_Y4_N26
\ones~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~1_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(8) & (\ADC0|altsyncram_component|auto_generated|q_a\(10) $ (((!\ADC0|altsyncram_component|auto_generated|q_a\(9) & \ADC0|altsyncram_component|auto_generated|q_a\(11)))))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(8) & ((\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((\ADC0|altsyncram_component|auto_generated|q_a\(11)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(10)))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((\ADC0|altsyncram_component|auto_generated|q_a\(10)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110101100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	combout => \ones~1_combout\);

-- Location: M9K_X33_Y7_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"77776666666666666666666655555555555555555554444444444444444444433333333333333333333222222222222222222221111111111111111111100000000000000000000FFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA999999999999999999998888888888888888888877777777777777777776666666666666666666655555555555555555555444444444444444444443333333333333333333322222222222222222222111111111111111111110000000000000000000FFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDD",
	mem_init2 => X"DDDDDDDDCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA999999999999999999988888888888888888888777777777777777777776666666666666666666655555555555555555555444444444444444444443333333333333333333222222222222222222221111111111111111111100000000000000000000FFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA9999999999999999999988888888888888888888777777777777777777776666666666666666666655555555555555555554444444444444444444433333333",
	mem_init1 => X"333333333333222222222222222222221111111111111111111100000000000000000000FFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA999999999999999999998888888888888888888877777777777777777776666666666666666666655555555555555555555444444444444444444443333333333333333333322222222222222222222111111111111111111110000000000000000000FFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA999",
	mem_init0 => X"999999999999999988888888888888888888777777777777777777776666666666666666666655555555555555555555444444444444444444443333333333333333333322222222222222222221111111111111111111100000000000000000000FFFFFFFFFFFFFFFFFFFFEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDDDDDDDDDCCCCCCCCCCCCCCCCCCCBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAA999999999999999999998888888888888888888877777777777777777777666666666666666666665555555555555555555444444444444444444443333333333333333333322222222222222222222111111111111111111110000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "ADC:ADC0|altsyncram:altsyncram_component|altsyncram_e191:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 4,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y4_N24
\ones~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~15_combout\ = \ones~0_combout\ $ ((((\ones~1_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(7))) # (!\ones~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~2_combout\,
	datab => \ones~0_combout\,
	datac => \ones~1_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	combout => \ones~15_combout\);

-- Location: LCCOMB_X34_Y4_N2
\tenth~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~7_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(8) & (\ADC0|altsyncram_component|auto_generated|q_a\(11) & \ADC0|altsyncram_component|auto_generated|q_a\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	combout => \tenth~7_combout\);

-- Location: LCCOMB_X32_Y4_N12
\tenth~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~8_combout\ = (\tenth~7_combout\) # ((!\ones~15_combout\ & !\LessThan0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~15_combout\,
	datab => \tenth~7_combout\,
	datac => \LessThan0~0_combout\,
	combout => \tenth~8_combout\);

-- Location: LCCOMB_X34_Y4_N28
\tenth~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~3_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(8) & (((!\ADC0|altsyncram_component|auto_generated|q_a\(6) & !\ADC0|altsyncram_component|auto_generated|q_a\(7))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(9)))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(8) & ((\ADC0|altsyncram_component|auto_generated|q_a\(9)) # ((\ADC0|altsyncram_component|auto_generated|q_a\(6) & \ADC0|altsyncram_component|auto_generated|q_a\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	combout => \tenth~3_combout\);

-- Location: LCCOMB_X34_Y4_N6
\tenth~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~20_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(11) & (!\ADC0|altsyncram_component|auto_generated|q_a\(10) & \tenth~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \tenth~3_combout\,
	combout => \tenth~20_combout\);

-- Location: LCCOMB_X34_Y4_N4
\ones~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~14_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(10) & ((\ADC0|altsyncram_component|auto_generated|q_a\(8)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11))))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((!\ADC0|altsyncram_component|auto_generated|q_a\(10)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11) & 
-- (\ADC0|altsyncram_component|auto_generated|q_a\(8) & \ADC0|altsyncram_component|auto_generated|q_a\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	combout => \ones~14_combout\);

-- Location: LCCOMB_X34_Y4_N0
\ones~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~4_combout\ = (\ones~2_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(7)) # ((!\ones~0_combout\ & \ones~1_combout\)))) # (!\ones~2_combout\ & (\ones~0_combout\ $ (((!\ADC0|altsyncram_component|auto_generated|q_a\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~2_combout\,
	datab => \ones~0_combout\,
	datac => \ones~1_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	combout => \ones~4_combout\);

-- Location: LCCOMB_X34_Y4_N30
\ones~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~3_combout\ = (\ones~2_combout\ & (((\ones~1_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(7))))) # (!\ones~2_combout\ & (\ones~0_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(7)) # (!\ones~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~2_combout\,
	datab => \ones~0_combout\,
	datac => \ones~1_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	combout => \ones~3_combout\);

-- Location: LCCOMB_X34_Y4_N18
\ones~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~5_combout\ = (\ones~0_combout\ & ((\ones~1_combout\ $ (\ADC0|altsyncram_component|auto_generated|q_a\(7))))) # (!\ones~0_combout\ & (!\ones~1_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(7)) # (!\ones~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~2_combout\,
	datab => \ones~0_combout\,
	datac => \ones~1_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	combout => \ones~5_combout\);

-- Location: LCCOMB_X34_Y4_N10
\ones~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~13_combout\ = \ones~3_combout\ $ ((((!\ADC0|altsyncram_component|auto_generated|q_a\(6) & \ones~4_combout\)) # (!\ones~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datab => \ones~4_combout\,
	datac => \ones~3_combout\,
	datad => \ones~5_combout\,
	combout => \ones~13_combout\);

-- Location: LCCOMB_X32_Y4_N2
\LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (\LessThan0~0_combout\ & ((\ones~14_combout\ & ((\ones~15_combout\) # (\ones~13_combout\))) # (!\ones~14_combout\ & (!\ones~15_combout\)))) # (!\LessThan0~0_combout\ & (((\ones~15_combout\ & \ones~13_combout\)) # 
-- (!\ones~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101110010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	datad => \ones~13_combout\,
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X32_Y4_N22
\tenth~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~9_combout\ = (\tenth~20_combout\) # ((\tenth~8_combout\ & \LessThan5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~8_combout\,
	datac => \tenth~20_combout\,
	datad => \LessThan5~0_combout\,
	combout => \tenth~9_combout\);

-- Location: LCCOMB_X32_Y4_N16
\tenth~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~6_combout\ = (\ones~14_combout\ & (\ones~13_combout\ & (\LessThan0~0_combout\ $ (\ones~15_combout\)))) # (!\ones~14_combout\ & (\LessThan0~0_combout\ & (\ones~15_combout\ & !\ones~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	datad => \ones~13_combout\,
	combout => \tenth~6_combout\);

-- Location: LCCOMB_X34_Y4_N14
\ones~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~7_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(6) & (!\ones~4_combout\)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(6) & ((\ones~4_combout\ & (\ones~3_combout\)) # (!\ones~4_combout\ & (!\ones~3_combout\ & !\ones~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datab => \ones~4_combout\,
	datac => \ones~3_combout\,
	datad => \ones~5_combout\,
	combout => \ones~7_combout\);

-- Location: LCCOMB_X34_Y4_N8
\ones~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~8_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(6) & (((\ones~3_combout\) # (\ones~5_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(6) & (!\ones~3_combout\ & ((\ones~4_combout\) # (!\ones~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datab => \ones~4_combout\,
	datac => \ones~3_combout\,
	datad => \ones~5_combout\,
	combout => \ones~8_combout\);

-- Location: LCCOMB_X34_Y4_N20
\ones~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~6_combout\ = (\ones~5_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(6) & (\ones~4_combout\))) # (!\ones~5_combout\ & (\ones~3_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(6)) # (!\ones~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datab => \ones~4_combout\,
	datac => \ones~3_combout\,
	datad => \ones~5_combout\,
	combout => \ones~6_combout\);

-- Location: LCCOMB_X35_Y4_N24
\ones~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~16_combout\ = \ones~6_combout\ $ ((((\ones~8_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(5))) # (!\ones~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001001011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~7_combout\,
	datab => \ones~8_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datad => \ones~6_combout\,
	combout => \ones~16_combout\);

-- Location: LCCOMB_X32_Y4_N8
\LessThan7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~0_combout\ = (\ones~13_combout\ $ (\LessThan5~0_combout\)) # (!\ones~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~13_combout\,
	datab => \LessThan5~0_combout\,
	datad => \ones~16_combout\,
	combout => \LessThan7~0_combout\);

-- Location: LCCOMB_X32_Y4_N28
\tenth~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~18_combout\ = \tenth~6_combout\ $ (((!\LessThan7~0_combout\) # (!\tenth~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001110010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~9_combout\,
	datab => \tenth~6_combout\,
	datac => \LessThan7~0_combout\,
	combout => \tenth~18_combout\);

-- Location: LCCOMB_X32_Y4_N26
\hundredth~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth~14_combout\ = (!\tenth~18_combout\ & (((!\ones~14_combout\ & \ones~15_combout\)) # (!\LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~0_combout\,
	datab => \tenth~18_combout\,
	datac => \ones~14_combout\,
	datad => \ones~15_combout\,
	combout => \hundredth~14_combout\);

-- Location: LCCOMB_X32_Y4_N18
\tenth~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~17_combout\ = (\ones~14_combout\) # (!\ones~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	combout => \tenth~17_combout\);

-- Location: LCCOMB_X32_Y4_N24
\hundredth~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth~7_combout\ = (!\LessThan5~0_combout\ & (((!\LessThan0~0_combout\) # (!\tenth~18_combout\)) # (!\tenth~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~17_combout\,
	datab => \tenth~18_combout\,
	datac => \LessThan0~0_combout\,
	datad => \LessThan5~0_combout\,
	combout => \hundredth~7_combout\);

-- Location: LCCOMB_X32_Y4_N30
\hundredth~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth~6_combout\ = (\tenth~17_combout\ & (\tenth~18_combout\ & (\LessThan0~0_combout\ & \LessThan5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~17_combout\,
	datab => \tenth~18_combout\,
	datac => \LessThan0~0_combout\,
	datad => \LessThan5~0_combout\,
	combout => \hundredth~6_combout\);

-- Location: LCCOMB_X32_Y4_N4
\tenth~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~11_combout\ = \ones~16_combout\ $ (((!\tenth~6_combout\ & ((!\LessThan7~0_combout\) # (!\tenth~9_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~9_combout\,
	datab => \tenth~6_combout\,
	datac => \LessThan7~0_combout\,
	datad => \ones~16_combout\,
	combout => \tenth~11_combout\);

-- Location: LCCOMB_X32_Y4_N6
\LessThan7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~1_combout\ = (!\tenth~6_combout\ & ((!\LessThan7~0_combout\) # (!\tenth~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~9_combout\,
	datab => \tenth~6_combout\,
	datac => \LessThan7~0_combout\,
	combout => \LessThan7~1_combout\);

-- Location: LCCOMB_X32_Y4_N0
\tenth~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~12_combout\ = \LessThan5~0_combout\ $ (\ones~13_combout\ $ (((!\LessThan7~1_combout\ & \ones~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan7~1_combout\,
	datab => \LessThan5~0_combout\,
	datac => \ones~13_combout\,
	datad => \ones~16_combout\,
	combout => \tenth~12_combout\);

-- Location: LCCOMB_X32_Y4_N10
\tenth~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~10_combout\ = (\tenth~9_combout\ & ((!\LessThan7~0_combout\))) # (!\tenth~9_combout\ & (\tenth~6_combout\ & \LessThan7~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~9_combout\,
	datab => \tenth~6_combout\,
	datac => \LessThan7~0_combout\,
	combout => \tenth~10_combout\);

-- Location: LCCOMB_X35_Y4_N0
\ones~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~9_combout\ = (\ones~8_combout\ & (((!\ADC0|altsyncram_component|auto_generated|q_a\(5) & \ones~6_combout\)))) # (!\ones~8_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(5)) # ((!\ones~7_combout\ & !\ones~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~7_combout\,
	datab => \ones~8_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datad => \ones~6_combout\,
	combout => \ones~9_combout\);

-- Location: LCCOMB_X35_Y4_N4
\ones~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~11_combout\ = (\ones~7_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(5)) # ((\ones~8_combout\ & !\ones~6_combout\)))) # (!\ones~7_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(5) $ (!\ones~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~7_combout\,
	datab => \ones~8_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datad => \ones~6_combout\,
	combout => \ones~11_combout\);

-- Location: LCCOMB_X35_Y4_N10
\ones~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~10_combout\ = (\ones~7_combout\ & (\ones~8_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(5)))) # (!\ones~7_combout\ & (\ones~6_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(5)) # (!\ones~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~7_combout\,
	datab => \ones~8_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datad => \ones~6_combout\,
	combout => \ones~10_combout\);

-- Location: LCCOMB_X35_Y4_N14
\ones~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~12_combout\ = \ones~10_combout\ $ ((((!\ADC0|altsyncram_component|auto_generated|q_a\(4) & \ones~11_combout\)) # (!\ones~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110001110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~9_combout\,
	datac => \ones~11_combout\,
	datad => \ones~10_combout\,
	combout => \ones~12_combout\);

-- Location: LCCOMB_X36_Y4_N28
\tenth~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~19_combout\ = \tenth~10_combout\ $ ((((!\tenth~11_combout\ & \ones~12_combout\)) # (!\tenth~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~11_combout\,
	datab => \tenth~12_combout\,
	datac => \tenth~10_combout\,
	datad => \ones~12_combout\,
	combout => \tenth~19_combout\);

-- Location: LCCOMB_X37_Y3_N12
\hundredth~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth~10_combout\ = (\hundredth~14_combout\ & (((!\hundredth~7_combout\ & !\hundredth~6_combout\)) # (!\tenth~19_combout\))) # (!\hundredth~14_combout\ & (((\hundredth~6_combout\ & \tenth~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth~14_combout\,
	datab => \hundredth~7_combout\,
	datac => \hundredth~6_combout\,
	datad => \tenth~19_combout\,
	combout => \hundredth~10_combout\);

-- Location: LCCOMB_X36_Y4_N10
\tenth~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~14_combout\ = (\tenth~11_combout\ & (((!\tenth~12_combout\ & !\tenth~10_combout\)) # (!\ones~12_combout\))) # (!\tenth~11_combout\ & (((\tenth~10_combout\ & \ones~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~11_combout\,
	datab => \tenth~12_combout\,
	datac => \tenth~10_combout\,
	datad => \ones~12_combout\,
	combout => \tenth~14_combout\);

-- Location: LCCOMB_X36_Y4_N24
\tenth~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~13_combout\ = (\tenth~12_combout\ & (\ones~12_combout\ & ((\tenth~11_combout\) # (\tenth~10_combout\)))) # (!\tenth~12_combout\ & ((\tenth~10_combout\ $ (!\ones~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~11_combout\,
	datab => \tenth~12_combout\,
	datac => \tenth~10_combout\,
	datad => \ones~12_combout\,
	combout => \tenth~13_combout\);

-- Location: LCCOMB_X35_Y4_N6
\ones~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~19_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(4) & ((\ones~9_combout\) # ((\ones~10_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(4) & (!\ones~10_combout\ & ((\ones~11_combout\) # (!\ones~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~9_combout\,
	datac => \ones~11_combout\,
	datad => \ones~10_combout\,
	combout => \ones~19_combout\);

-- Location: LCCOMB_X35_Y4_N20
\ones~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~18_combout\ = (\ones~9_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(4) & (\ones~11_combout\))) # (!\ones~9_combout\ & (\ones~10_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(4)) # (!\ones~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~9_combout\,
	datac => \ones~11_combout\,
	datad => \ones~10_combout\,
	combout => \ones~18_combout\);

-- Location: M9K_X33_Y8_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00003333322222111110000033333222221111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033332222211111000003333322222111110000033333222221111100000333332222211",
	mem_init2 => X"11100000333332222211111000003333322222111110000033333222221111100000333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111000003333322222111110000033333222",
	mem_init1 => X"22111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333",
	mem_init0 => X"32222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100003333322222111110000033333222221111100000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000333332222211111000003333322222111110000033333222221111100000333332222211111000003333322222111110000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "ADC:ADC0|altsyncram:altsyncram_component|altsyncram_e191:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 11,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 4,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 2047,
	port_a_logical_ram_depth => 2048,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 11,
	port_b_data_width => 4,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \sclk_0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X35_Y4_N2
\ones~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~17_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(4) & (((!\ones~11_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(4) & ((\ones~11_combout\ & ((\ones~10_combout\))) # (!\ones~11_combout\ & (!\ones~9_combout\ & 
-- !\ones~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~9_combout\,
	datac => \ones~11_combout\,
	datad => \ones~10_combout\,
	combout => \ones~17_combout\);

-- Location: LCCOMB_X35_Y4_N8
\ones~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~20_combout\ = \ones~18_combout\ $ ((((\ones~19_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(3))) # (!\ones~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~19_combout\,
	datab => \ones~18_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	datad => \ones~17_combout\,
	combout => \ones~20_combout\);

-- Location: LCCOMB_X36_Y4_N12
\tenth~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~15_combout\ = (\tenth~12_combout\ & (!\tenth~11_combout\ & ((\ones~12_combout\)))) # (!\tenth~12_combout\ & (\tenth~10_combout\ & ((\tenth~11_combout\) # (!\ones~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~11_combout\,
	datab => \tenth~12_combout\,
	datac => \tenth~10_combout\,
	datad => \ones~12_combout\,
	combout => \tenth~15_combout\);

-- Location: LCCOMB_X36_Y4_N18
\tenth~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \tenth~16_combout\ = \tenth~15_combout\ $ ((((!\tenth~13_combout\ & \ones~20_combout\)) # (!\tenth~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101001110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~14_combout\,
	datab => \tenth~13_combout\,
	datac => \ones~20_combout\,
	datad => \tenth~15_combout\,
	combout => \tenth~16_combout\);

-- Location: LCCOMB_X37_Y3_N8
\hundredth~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth~8_combout\ = (\tenth~19_combout\ & (!\hundredth~14_combout\ & (\hundredth~7_combout\))) # (!\tenth~19_combout\ & (((\hundredth~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth~14_combout\,
	datab => \hundredth~7_combout\,
	datac => \hundredth~6_combout\,
	datad => \tenth~19_combout\,
	combout => \hundredth~8_combout\);

-- Location: LCCOMB_X37_Y3_N10
\hundredth~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth~9_combout\ = (\hundredth~7_combout\ & (\tenth~19_combout\ & ((\hundredth~14_combout\) # (\hundredth~6_combout\)))) # (!\hundredth~7_combout\ & ((\hundredth~6_combout\ $ (!\tenth~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth~14_combout\,
	datab => \hundredth~7_combout\,
	datac => \hundredth~6_combout\,
	datad => \tenth~19_combout\,
	combout => \hundredth~9_combout\);

-- Location: LCCOMB_X37_Y3_N6
\hundredth[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[1]~11_combout\ = (\hundredth~10_combout\ & (\tenth~16_combout\ & ((\hundredth~8_combout\) # (\hundredth~9_combout\)))) # (!\hundredth~10_combout\ & (\tenth~16_combout\ $ ((!\hundredth~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth~10_combout\,
	datab => \tenth~16_combout\,
	datac => \hundredth~8_combout\,
	datad => \hundredth~9_combout\,
	combout => \hundredth[1]~11_combout\);

-- Location: LCCOMB_X37_Y3_N18
\hundredth[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[3]~13_combout\ = (\hundredth~10_combout\ & (\tenth~16_combout\ & ((!\hundredth~9_combout\)))) # (!\hundredth~10_combout\ & (\hundredth~8_combout\ & ((\hundredth~9_combout\) # (!\tenth~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth~10_combout\,
	datab => \tenth~16_combout\,
	datac => \hundredth~8_combout\,
	datad => \hundredth~9_combout\,
	combout => \hundredth[3]~13_combout\);

-- Location: LCCOMB_X35_Y4_N26
\LessThan11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan11~0_combout\ = (!\ones~18_combout\ & (((\ones~19_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(3))) # (!\ones~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~19_combout\,
	datab => \ones~18_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	datad => \ones~17_combout\,
	combout => \LessThan11~0_combout\);

-- Location: LCCOMB_X35_Y4_N18
\hundredth[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[0]~3_combout\ = (\LessThan11~0_combout\ & (!\ones~19_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(2)) # (\ADC0|altsyncram_component|auto_generated|q_a\(3))))) # (!\LessThan11~0_combout\ & 
-- ((\ADC0|altsyncram_component|auto_generated|q_a\(3) & (\ADC0|altsyncram_component|auto_generated|q_a\(2) & !\ones~19_combout\)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(3) & ((\ones~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan11~0_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(2),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	datad => \ones~19_combout\,
	combout => \hundredth[0]~3_combout\);

-- Location: LCCOMB_X35_Y4_N28
\LessThan8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~0_combout\ = (!\ones~10_combout\ & (((!\ADC0|altsyncram_component|auto_generated|q_a\(4) & \ones~11_combout\)) # (!\ones~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~9_combout\,
	datac => \ones~11_combout\,
	datad => \ones~10_combout\,
	combout => \LessThan8~0_combout\);

-- Location: LCCOMB_X35_Y4_N30
\Add13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add13~0_combout\ = \ones~11_combout\ $ (((\ADC0|altsyncram_component|auto_generated|q_a\(3) & (!\LessThan8~0_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(4))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(3) & 
-- ((!\ADC0|altsyncram_component|auto_generated|q_a\(4)) # (!\LessThan8~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000110000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	datab => \LessThan8~0_combout\,
	datac => \ones~11_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	combout => \Add13~0_combout\);

-- Location: LCCOMB_X35_Y4_N16
\hundredth[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[0]~2_combout\ = (\LessThan11~0_combout\ & ((\ones~17_combout\))) # (!\LessThan11~0_combout\ & (\Add13~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan11~0_combout\,
	datac => \Add13~0_combout\,
	datad => \ones~17_combout\,
	combout => \hundredth[0]~2_combout\);

-- Location: LCCOMB_X36_Y4_N22
\LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~0_combout\ = (!\tenth~15_combout\ & (((!\tenth~13_combout\ & \ones~20_combout\)) # (!\tenth~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tenth~14_combout\,
	datab => \tenth~13_combout\,
	datac => \ones~20_combout\,
	datad => \tenth~15_combout\,
	combout => \LessThan13~0_combout\);

-- Location: LCCOMB_X35_Y4_N12
\hundredth[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[0]~4_combout\ = (\ones~20_combout\ & (\LessThan13~0_combout\ & (\hundredth[0]~3_combout\ $ (!\hundredth[0]~2_combout\)))) # (!\ones~20_combout\ & (!\LessThan13~0_combout\ & (\hundredth[0]~3_combout\ $ (\hundredth[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[0]~3_combout\,
	datab => \hundredth[0]~2_combout\,
	datac => \ones~20_combout\,
	datad => \LessThan13~0_combout\,
	combout => \hundredth[0]~4_combout\);

-- Location: LCCOMB_X36_Y4_N8
\hundredth[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[0]~5_combout\ = \tenth~14_combout\ $ (((\tenth~13_combout\ & (\hundredth[0]~4_combout\)) # (!\tenth~13_combout\ & ((\LessThan13~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[0]~4_combout\,
	datab => \tenth~13_combout\,
	datac => \LessThan13~0_combout\,
	datad => \tenth~14_combout\,
	combout => \hundredth[0]~5_combout\);

-- Location: LCCOMB_X37_Y3_N24
\hundredth[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundredth[2]~12_combout\ = (\tenth~16_combout\ & ((\hundredth~8_combout\ & ((!\hundredth~9_combout\))) # (!\hundredth~8_combout\ & (!\hundredth~10_combout\ & \hundredth~9_combout\)))) # (!\tenth~16_combout\ & (((\hundredth~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth~10_combout\,
	datab => \tenth~16_combout\,
	datac => \hundredth~8_combout\,
	datad => \hundredth~9_combout\,
	combout => \hundredth[2]~12_combout\);

-- Location: LCCOMB_X37_Y3_N4
\WideOr11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr11~0_combout\ = (\hundredth[1]~11_combout\ & (\hundredth[3]~13_combout\)) # (!\hundredth[1]~11_combout\ & (\hundredth[2]~12_combout\ $ (((!\hundredth[3]~13_combout\ & !\hundredth[0]~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[3]~13_combout\,
	datac => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \WideOr11~0_combout\);

-- Location: LCCOMB_X37_Y3_N30
\WideOr9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr9~0_combout\ = (\hundredth[3]~13_combout\ & ((\hundredth[1]~11_combout\) # ((\hundredth[2]~12_combout\)))) # (!\hundredth[3]~13_combout\ & (\hundredth[2]~12_combout\ & (\hundredth[1]~11_combout\ $ (!\hundredth[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[3]~13_combout\,
	datac => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \WideOr9~0_combout\);

-- Location: LCCOMB_X37_Y3_N0
\Decoder2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder2~0_combout\ = (\hundredth[1]~11_combout\ & (\hundredth[0]~5_combout\ & !\hundredth[2]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \Decoder2~0_combout\);

-- Location: LCCOMB_X37_Y3_N26
\WideOr7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr7~0_combout\ = (\hundredth[1]~11_combout\ & ((\hundredth[3]~13_combout\) # ((!\hundredth[0]~5_combout\ & \hundredth[2]~12_combout\)))) # (!\hundredth[1]~11_combout\ & (\hundredth[2]~12_combout\ $ (((!\hundredth[3]~13_combout\ & 
-- !\hundredth[0]~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111010001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[3]~13_combout\,
	datac => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \WideOr7~0_combout\);

-- Location: LCCOMB_X37_Y3_N20
\WideOr5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr5~0_combout\ = ((\hundredth[1]~11_combout\ & (\hundredth[3]~13_combout\)) # (!\hundredth[1]~11_combout\ & ((\hundredth[2]~12_combout\)))) # (!\hundredth[0]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[3]~13_combout\,
	datac => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \WideOr5~0_combout\);

-- Location: LCCOMB_X37_Y3_N22
\WideOr3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = (\hundredth[0]~5_combout\ & ((\hundredth[2]~12_combout\ & ((!\hundredth[3]~13_combout\))) # (!\hundredth[2]~12_combout\ & (!\hundredth[1]~11_combout\)))) # (!\hundredth[0]~5_combout\ & (!\hundredth[1]~11_combout\ & 
-- (\hundredth[3]~13_combout\ $ (\hundredth[2]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[3]~13_combout\,
	datac => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \WideOr3~0_combout\);

-- Location: LCCOMB_X37_Y3_N16
\WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (\hundredth[1]~11_combout\ & ((\hundredth[3]~13_combout\) # ((!\hundredth[0]~5_combout\ & \hundredth[2]~12_combout\)))) # (!\hundredth[1]~11_combout\ & (\hundredth[3]~13_combout\ $ (((!\hundredth[2]~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundredth[1]~11_combout\,
	datab => \hundredth[3]~13_combout\,
	datac => \hundredth[0]~5_combout\,
	datad => \hundredth[2]~12_combout\,
	combout => \WideOr1~0_combout\);

-- Location: PLL_1
\frame_rate0|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 60,
	c0_initial => 1,
	c0_low => 60,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 250,
	c1_initial => 1,
	c1_low => 250,
	c1_mode => "even",
	c1_ph => 0,
	c1_use_casc_in => "on",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "unused",
	clk0_divide_by => 0,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 0,
	clk0_phase_shift => "0",
	clk1_counter => "c1",
	clk1_divide_by => 5000,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 1,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock1",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 12,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "on",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 208,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \frame_rate0|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \frame_rate0|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \frame_rate0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G4
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

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

-- Location: IOIBUF_X43_Y0_N15
\encoder0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_encoder0,
	o => \encoder0~input_o\);

-- Location: IOIBUF_X53_Y12_N1
\encoder1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_encoder1,
	o => \encoder1~input_o\);

-- Location: IOIBUF_X27_Y0_N8
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);
END structure;


