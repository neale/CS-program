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

-- DATE "06/01/2016 09:20:34"

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

ENTITY 	UART IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	d_out : IN std_logic;
	d_in : OUT std_logic;
	cs_n : OUT std_logic;
	sclk : OUT std_logic;
	segments : OUT std_logic_vector(6 DOWNTO 0);
	dp : OUT std_logic;
	\select\ : OUT std_logic_vector(2 DOWNTO 0);
	display_clk : OUT std_logic;
	pwm : OUT std_logic;
	tx_clk : OUT std_logic;
	tx_send : OUT std_logic
	);
END UART;

-- Design Ports Information
-- reset	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d_in	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- cs_n	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sclk	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- segments[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dp	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[0]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[1]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[2]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_clk	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_clk	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_send	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d_out	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF UART IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_d_out : std_logic;
SIGNAL ww_d_in : std_logic;
SIGNAL ww_cs_n : std_logic;
SIGNAL ww_sclk : std_logic;
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dp : std_logic;
SIGNAL \ww_select\ : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_display_clk : std_logic;
SIGNAL ww_pwm : std_logic;
SIGNAL ww_tx_clk : std_logic;
SIGNAL ww_tx_send : std_logic;
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \display0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \display0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \display0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \count_posedge[0]~3_combout\ : std_logic;
SIGNAL \count_posedge[1]~0_combout\ : std_logic;
SIGNAL \count_posedge[2]~1_combout\ : std_logic;
SIGNAL \count_posedge[3]~2_combout\ : std_logic;
SIGNAL \d_in~0_combout\ : std_logic;
SIGNAL \d_in~1_combout\ : std_logic;
SIGNAL \d_in~reg0_q\ : std_logic;
SIGNAL \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \select_state.001~0_combout\ : std_logic;
SIGNAL \select_state.001~q\ : std_logic;
SIGNAL \select_state.010~0_combout\ : std_logic;
SIGNAL \select_state.010~q\ : std_logic;
SIGNAL \select_state.100~feeder_combout\ : std_logic;
SIGNAL \select_state.100~q\ : std_logic;
SIGNAL \select_state.111~feeder_combout\ : std_logic;
SIGNAL \select_state.111~q\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \d_out~input_o\ : std_logic;
SIGNAL \Decoder0~0_combout\ : std_logic;
SIGNAL \d_out_buffer[0]~0_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \update_counter~5_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \update_counter~4_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \update_counter~3_combout\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \update_counter~2_combout\ : std_logic;
SIGNAL \Add2~17\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \update_counter~1_combout\ : std_logic;
SIGNAL \Add2~19\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \Add2~21\ : std_logic;
SIGNAL \Add2~22_combout\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \update_counter~0_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal1~3_combout\ : std_logic;
SIGNAL \adc_data[0]~_wirecell_combout\ : std_logic;
SIGNAL \Decoder0~1_combout\ : std_logic;
SIGNAL \d_out_buffer[1]~1_combout\ : std_logic;
SIGNAL \Decoder0~2_combout\ : std_logic;
SIGNAL \d_out_buffer[2]~2_combout\ : std_logic;
SIGNAL \adc_data[2]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~3_combout\ : std_logic;
SIGNAL \d_out_buffer[3]~3_combout\ : std_logic;
SIGNAL \Decoder0~4_combout\ : std_logic;
SIGNAL \d_out_buffer[4]~4_combout\ : std_logic;
SIGNAL \adc_data[4]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~5_combout\ : std_logic;
SIGNAL \d_out_buffer[5]~5_combout\ : std_logic;
SIGNAL \Decoder0~6_combout\ : std_logic;
SIGNAL \d_out_buffer[6]~6_combout\ : std_logic;
SIGNAL \Decoder0~7_combout\ : std_logic;
SIGNAL \d_out_buffer[7]~7_combout\ : std_logic;
SIGNAL \adc_data[7]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~8_combout\ : std_logic;
SIGNAL \d_out_buffer[8]~8_combout\ : std_logic;
SIGNAL \adc_data[8]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~9_combout\ : std_logic;
SIGNAL \d_out_buffer[9]~9_combout\ : std_logic;
SIGNAL \adc_data[9]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~10_combout\ : std_logic;
SIGNAL \d_out_buffer[10]~10_combout\ : std_logic;
SIGNAL \adc_data[10]~feeder_combout\ : std_logic;
SIGNAL \Decoder0~11_combout\ : std_logic;
SIGNAL \d_out_buffer[11]~11_combout\ : std_logic;
SIGNAL \ones~2_combout\ : std_logic;
SIGNAL \ones~1_combout\ : std_logic;
SIGNAL \ones~0_combout\ : std_logic;
SIGNAL \ones~5_combout\ : std_logic;
SIGNAL \ones~4_combout\ : std_logic;
SIGNAL \ones~3_combout\ : std_logic;
SIGNAL \ones~11_combout\ : std_logic;
SIGNAL \ones~9_combout\ : std_logic;
SIGNAL \ones~10_combout\ : std_logic;
SIGNAL \ones~12_combout\ : std_logic;
SIGNAL \ones~6_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \ones~8_combout\ : std_logic;
SIGNAL \ones~7_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \LessThan7~0_combout\ : std_logic;
SIGNAL \tens~3_combout\ : std_logic;
SIGNAL \tens~24_combout\ : std_logic;
SIGNAL \tens~7_combout\ : std_logic;
SIGNAL \tens~8_combout\ : std_logic;
SIGNAL \tens~9_combout\ : std_logic;
SIGNAL \tens~6_combout\ : std_logic;
SIGNAL \tens~15_combout\ : std_logic;
SIGNAL \hundreds~2_combout\ : std_logic;
SIGNAL \hundreds~3_combout\ : std_logic;
SIGNAL \LessThan9~0_combout\ : std_logic;
SIGNAL \hundreds~1_combout\ : std_logic;
SIGNAL \tens~13_combout\ : std_logic;
SIGNAL \tens~12_combout\ : std_logic;
SIGNAL \ones~14_combout\ : std_logic;
SIGNAL \ones~15_combout\ : std_logic;
SIGNAL \ones~13_combout\ : std_logic;
SIGNAL \ones~16_combout\ : std_logic;
SIGNAL \tens~10_combout\ : std_logic;
SIGNAL \tens~11_combout\ : std_logic;
SIGNAL \tens~14_combout\ : std_logic;
SIGNAL \hundreds~0_combout\ : std_logic;
SIGNAL \LessThan12~1_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \tens~17_combout\ : std_logic;
SIGNAL \tens~18_combout\ : std_logic;
SIGNAL \tens~16_combout\ : std_logic;
SIGNAL \ones~17_combout\ : std_logic;
SIGNAL \ones~18_combout\ : std_logic;
SIGNAL \ones~19_combout\ : std_logic;
SIGNAL \ones~20_combout\ : std_logic;
SIGNAL \tens~19_combout\ : std_logic;
SIGNAL \LessThan12~0_combout\ : std_logic;
SIGNAL \hundreds~5_combout\ : std_logic;
SIGNAL \hundreds~6_combout\ : std_logic;
SIGNAL \hundreds~7_combout\ : std_logic;
SIGNAL \hundreds~4_combout\ : std_logic;
SIGNAL \thousands[0]~0_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \tens~21_combout\ : std_logic;
SIGNAL \tens~22_combout\ : std_logic;
SIGNAL \tens~20_combout\ : std_logic;
SIGNAL \Add14~0_combout\ : std_logic;
SIGNAL \LessThan11~0_combout\ : std_logic;
SIGNAL \Add17~0_combout\ : std_logic;
SIGNAL \ones~21_combout\ : std_logic;
SIGNAL \hundreds[0]~8_combout\ : std_logic;
SIGNAL \Mux8~5_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \ones~23_combout\ : std_logic;
SIGNAL \ones~24_combout\ : std_logic;
SIGNAL \ones~26_combout\ : std_logic;
SIGNAL \Add20~0_combout\ : std_logic;
SIGNAL \ones~22_combout\ : std_logic;
SIGNAL \ones~25_combout\ : std_logic;
SIGNAL \tens[0]~23_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \Add19~0_combout\ : std_logic;
SIGNAL \Mux8~3_combout\ : std_logic;
SIGNAL \Mux8~4_combout\ : std_logic;
SIGNAL \Mux8~6_combout\ : std_logic;
SIGNAL \Add18~0_combout\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Mux8~7_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \ones~27_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \WideOr12~0_combout\ : std_logic;
SIGNAL \WideOr10~0_combout\ : std_logic;
SIGNAL \Decoder2~0_combout\ : std_logic;
SIGNAL \WideOr8~0_combout\ : std_logic;
SIGNAL \WideOr6~0_combout\ : std_logic;
SIGNAL \WideOr4~0_combout\ : std_logic;
SIGNAL \WideOr2~0_combout\ : std_logic;
SIGNAL \Mux8~8_combout\ : std_logic;
SIGNAL update_counter : std_logic_vector(12 DOWNTO 0);
SIGNAL d_out_buffer : std_logic_vector(11 DOWNTO 0);
SIGNAL adc_data : std_logic_vector(11 DOWNTO 0);
SIGNAL count_posedge : std_logic_vector(3 DOWNTO 0);
SIGNAL \display0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ADC0|altsyncram_component|auto_generated|q_a\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ALT_INV_select_state.111~q\ : std_logic;
SIGNAL \ALT_INV_select_state.001~q\ : std_logic;
SIGNAL \ALT_INV_WideOr2~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_d_out <= d_out;
d_in <= ww_d_in;
cs_n <= ww_cs_n;
sclk <= ww_sclk;
segments <= ww_segments;
dp <= ww_dp;
\select\ <= \ww_select\;
display_clk <= ww_display_clk;
pwm <= ww_pwm;
tx_clk <= ww_tx_clk;
tx_send <= ww_tx_send;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (adc_data(11) & adc_data(10) & adc_data(9) & adc_data(8) & adc_data(7) & adc_data(6) & adc_data(5) & adc_data(4) & adc_data(3) & adc_data(2) & adc_data(1) & 
\adc_data[0]~_wirecell_combout\);

\ADC0|altsyncram_component|auto_generated|q_a\(10) <= \ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(11) <= \ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(1);

\ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (adc_data(11) & adc_data(10) & adc_data(9) & adc_data(8) & adc_data(7) & adc_data(6) & adc_data(5) & adc_data(4) & adc_data(3) & adc_data(2) & adc_data(1) & 
\adc_data[0]~_wirecell_combout\);

\ADC0|altsyncram_component|auto_generated|q_a\(8) <= \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(9) <= \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(1);

\ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (adc_data(11) & adc_data(10) & adc_data(9) & adc_data(8) & adc_data(7) & adc_data(6) & adc_data(5) & adc_data(4) & adc_data(3) & adc_data(2) & adc_data(1) & 
\adc_data[0]~_wirecell_combout\);

\ADC0|altsyncram_component|auto_generated|q_a\(6) <= \ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(7) <= \ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(1);

\ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (adc_data(11) & adc_data(10) & adc_data(9) & adc_data(8) & adc_data(7) & adc_data(6) & adc_data(5) & adc_data(4) & adc_data(3) & adc_data(2) & adc_data(1) & 
\adc_data[0]~_wirecell_combout\);

\ADC0|altsyncram_component|auto_generated|q_a\(4) <= \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(5) <= \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(1);

\ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (adc_data(11) & adc_data(10) & adc_data(9) & adc_data(8) & adc_data(7) & adc_data(6) & adc_data(5) & adc_data(4) & adc_data(3) & adc_data(2) & adc_data(1) & 
\adc_data[0]~_wirecell_combout\);

\ADC0|altsyncram_component|auto_generated|q_a\(2) <= \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(3) <= \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(1);

\ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (adc_data(11) & adc_data(10) & adc_data(9) & adc_data(8) & adc_data(7) & adc_data(6) & adc_data(5) & adc_data(4) & adc_data(3) & adc_data(2) & adc_data(1) & 
\adc_data[0]~_wirecell_combout\);

\ADC0|altsyncram_component|auto_generated|q_a\(0) <= \ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\ADC0|altsyncram_component|auto_generated|q_a\(1) <= \ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);

\display0|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\display0|altpll_component|auto_generated|wire_pll1_clk\(0) <= \display0|altpll_component|auto_generated|pll1_CLK_bus\(0);
\display0|altpll_component|auto_generated|wire_pll1_clk\(1) <= \display0|altpll_component|auto_generated|pll1_CLK_bus\(1);
\display0|altpll_component|auto_generated|wire_pll1_clk\(2) <= \display0|altpll_component|auto_generated|pll1_CLK_bus\(2);
\display0|altpll_component|auto_generated|wire_pll1_clk\(3) <= \display0|altpll_component|auto_generated|pll1_CLK_bus\(3);
\display0|altpll_component|auto_generated|wire_pll1_clk\(4) <= \display0|altpll_component|auto_generated|pll1_CLK_bus\(4);

\display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \display0|altpll_component|auto_generated|wire_pll1_clk\(0));

\display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \display0|altpll_component|auto_generated|wire_pll1_clk\(1));

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_select_state.111~q\ <= NOT \select_state.111~q\;
\ALT_INV_select_state.001~q\ <= NOT \select_state.001~q\;
\ALT_INV_WideOr2~0_combout\ <= NOT \WideOr2~0_combout\;

-- Location: IOOBUF_X34_Y34_N16
\d_in~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d_in~reg0_q\,
	devoe => ww_devoe,
	o => ww_d_in);

-- Location: IOOBUF_X34_Y34_N9
\cs_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_cs_n);

-- Location: IOOBUF_X45_Y34_N2
\sclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_sclk);

-- Location: IOOBUF_X53_Y21_N23
\segments[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideOr12~0_combout\,
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
	i => \WideOr10~0_combout\,
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
	i => \WideOr8~0_combout\,
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
	i => \WideOr6~0_combout\,
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
	i => \WideOr4~0_combout\,
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
	i => \ALT_INV_WideOr2~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(6));

-- Location: IOOBUF_X38_Y0_N9
\dp~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_select_state.111~q\,
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
	i => \Mux8~8_combout\,
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
	i => \ALT_INV_select_state.001~q\,
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
	i => \select_state.111~q\,
	devoe => ww_devoe,
	o => \ww_select\(2));

-- Location: IOOBUF_X49_Y0_N9
\display_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
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

-- Location: IOOBUF_X14_Y34_N23
\tx_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_tx_clk);

-- Location: IOOBUF_X7_Y34_N16
\tx_send~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_tx_send);

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
\display0|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 150,
	c0_initial => 1,
	c0_low => 150,
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
	clk0_counter => "c1",
	clk0_divide_by => 5000,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 1,
	clk0_phase_shift => "0",
	clk1_counter => "c0",
	clk1_divide_by => 25,
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
	fbin => \display0|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \display0|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \display0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \display0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G18
\display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X28_Y26_N10
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

-- Location: FF_X28_Y26_N11
\count_posedge[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count_posedge[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(0));

-- Location: LCCOMB_X28_Y26_N12
\count_posedge[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[1]~0_combout\ = count_posedge(0) $ (count_posedge(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(0),
	datac => count_posedge(1),
	combout => \count_posedge[1]~0_combout\);

-- Location: FF_X28_Y26_N13
\count_posedge[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count_posedge[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(1));

-- Location: LCCOMB_X28_Y26_N6
\count_posedge[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[2]~1_combout\ = count_posedge(2) $ (((count_posedge(0) & count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count_posedge(0),
	datac => count_posedge(2),
	datad => count_posedge(1),
	combout => \count_posedge[2]~1_combout\);

-- Location: FF_X28_Y26_N7
\count_posedge[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count_posedge[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(2));

-- Location: LCCOMB_X28_Y26_N24
\count_posedge[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \count_posedge[3]~2_combout\ = count_posedge(3) $ (((count_posedge(2) & (count_posedge(0) & count_posedge(1)))))

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
	combout => \count_posedge[3]~2_combout\);

-- Location: FF_X28_Y26_N25
\count_posedge[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count_posedge[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count_posedge(3));

-- Location: LCCOMB_X28_Y26_N26
\d_in~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_in~0_combout\ = (count_posedge(2)) # (count_posedge(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datad => count_posedge(3),
	combout => \d_in~0_combout\);

-- Location: LCCOMB_X28_Y26_N0
\d_in~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_in~1_combout\ = (\d_in~0_combout\ & (((\d_in~reg0_q\)))) # (!\d_in~0_combout\ & ((count_posedge(0) & ((count_posedge(1)))) # (!count_posedge(0) & (\d_in~reg0_q\ & !count_posedge(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_in~0_combout\,
	datab => count_posedge(0),
	datac => \d_in~reg0_q\,
	datad => count_posedge(1),
	combout => \d_in~1_combout\);

-- Location: FF_X28_Y26_N1
\d_in~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_in~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \d_in~reg0_q\);

-- Location: CLKCTRL_G19
\display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: LCCOMB_X32_Y18_N16
\select_state.001~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \select_state.001~0_combout\ = !\select_state.111~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \select_state.111~q\,
	combout => \select_state.001~0_combout\);

-- Location: FF_X32_Y18_N17
\select_state.001\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \select_state.001~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.001~q\);

-- Location: LCCOMB_X32_Y18_N12
\select_state.010~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \select_state.010~0_combout\ = !\select_state.001~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \select_state.001~q\,
	combout => \select_state.010~0_combout\);

-- Location: FF_X32_Y18_N13
\select_state.010\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \select_state.010~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.010~q\);

-- Location: LCCOMB_X32_Y18_N20
\select_state.100~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \select_state.100~feeder_combout\ = \select_state.010~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \select_state.010~q\,
	combout => \select_state.100~feeder_combout\);

-- Location: FF_X32_Y18_N21
\select_state.100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \select_state.100~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.100~q\);

-- Location: LCCOMB_X32_Y18_N10
\select_state.111~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \select_state.111~feeder_combout\ = \select_state.100~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \select_state.100~q\,
	combout => \select_state.111~feeder_combout\);

-- Location: FF_X32_Y18_N11
\select_state.111\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \select_state.111~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.111~q\);

-- Location: LCCOMB_X32_Y18_N14
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\select_state.111~q\ & (!\select_state.100~q\ & \select_state.001~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \select_state.111~q\,
	datab => \select_state.100~q\,
	datad => \select_state.001~q\,
	combout => \Mux8~0_combout\);

-- Location: CLKCTRL_G15
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X25_Y34_N1
\d_out~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d_out,
	o => \d_out~input_o\);

-- Location: LCCOMB_X28_Y26_N4
\Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~0_combout\ = (count_posedge(2) & (count_posedge(3) & (count_posedge(0) & count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~0_combout\);

-- Location: LCCOMB_X27_Y26_N14
\d_out_buffer[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[0]~0_combout\ = (\Decoder0~0_combout\ & (!\d_out~input_o\)) # (!\Decoder0~0_combout\ & ((d_out_buffer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d_out~input_o\,
	datac => d_out_buffer(0),
	datad => \Decoder0~0_combout\,
	combout => \d_out_buffer[0]~0_combout\);

-- Location: FF_X27_Y26_N15
\d_out_buffer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(0));

-- Location: LCCOMB_X18_Y21_N6
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = update_counter(0) $ (VCC)
-- \Add2~1\ = CARRY(update_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(0),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCCOMB_X19_Y21_N2
\update_counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_counter~5_combout\ = (\Add2~0_combout\ & !\Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~0_combout\,
	datad => \Equal1~3_combout\,
	combout => \update_counter~5_combout\);

-- Location: FF_X19_Y21_N3
\update_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \update_counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(0));

-- Location: LCCOMB_X18_Y21_N8
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (update_counter(1) & (!\Add2~1\)) # (!update_counter(1) & ((\Add2~1\) # (GND)))
-- \Add2~3\ = CARRY((!\Add2~1\) # (!update_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(1),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: FF_X18_Y21_N9
\update_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(1));

-- Location: LCCOMB_X18_Y21_N10
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (update_counter(2) & (\Add2~3\ $ (GND))) # (!update_counter(2) & (!\Add2~3\ & VCC))
-- \Add2~5\ = CARRY((update_counter(2) & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(2),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: FF_X18_Y21_N11
\update_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(2));

-- Location: LCCOMB_X18_Y21_N12
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (update_counter(3) & (!\Add2~5\)) # (!update_counter(3) & ((\Add2~5\) # (GND)))
-- \Add2~7\ = CARRY((!\Add2~5\) # (!update_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(3),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X19_Y21_N24
\update_counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_counter~4_combout\ = (\Add2~6_combout\ & !\Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~6_combout\,
	datad => \Equal1~3_combout\,
	combout => \update_counter~4_combout\);

-- Location: FF_X19_Y21_N25
\update_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \update_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(3));

-- Location: LCCOMB_X18_Y21_N14
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (update_counter(4) & (\Add2~7\ $ (GND))) # (!update_counter(4) & (!\Add2~7\ & VCC))
-- \Add2~9\ = CARRY((update_counter(4) & !\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(4),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: FF_X18_Y21_N15
\update_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(4));

-- Location: LCCOMB_X18_Y21_N16
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (update_counter(5) & (!\Add2~9\)) # (!update_counter(5) & ((\Add2~9\) # (GND)))
-- \Add2~11\ = CARRY((!\Add2~9\) # (!update_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(5),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: FF_X18_Y21_N17
\update_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(5));

-- Location: LCCOMB_X18_Y21_N18
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = (update_counter(6) & (\Add2~11\ $ (GND))) # (!update_counter(6) & (!\Add2~11\ & VCC))
-- \Add2~13\ = CARRY((update_counter(6) & !\Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(6),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: FF_X18_Y21_N19
\update_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(6));

-- Location: LCCOMB_X18_Y21_N20
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (update_counter(7) & (!\Add2~13\)) # (!update_counter(7) & ((\Add2~13\) # (GND)))
-- \Add2~15\ = CARRY((!\Add2~13\) # (!update_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(7),
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X19_Y21_N6
\update_counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_counter~3_combout\ = (\Add2~14_combout\ & !\Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~14_combout\,
	datad => \Equal1~3_combout\,
	combout => \update_counter~3_combout\);

-- Location: FF_X19_Y21_N7
\update_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \update_counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(7));

-- Location: LCCOMB_X18_Y21_N22
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = (update_counter(8) & (\Add2~15\ $ (GND))) # (!update_counter(8) & (!\Add2~15\ & VCC))
-- \Add2~17\ = CARRY((update_counter(8) & !\Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(8),
	datad => VCC,
	cin => \Add2~15\,
	combout => \Add2~16_combout\,
	cout => \Add2~17\);

-- Location: LCCOMB_X19_Y21_N20
\update_counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_counter~2_combout\ = (\Add2~16_combout\ & !\Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~16_combout\,
	datad => \Equal1~3_combout\,
	combout => \update_counter~2_combout\);

-- Location: FF_X19_Y21_N21
\update_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \update_counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(8));

-- Location: LCCOMB_X18_Y21_N24
\Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (update_counter(9) & (!\Add2~17\)) # (!update_counter(9) & ((\Add2~17\) # (GND)))
-- \Add2~19\ = CARRY((!\Add2~17\) # (!update_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(9),
	datad => VCC,
	cin => \Add2~17\,
	combout => \Add2~18_combout\,
	cout => \Add2~19\);

-- Location: LCCOMB_X19_Y21_N18
\update_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_counter~1_combout\ = (\Add2~18_combout\ & !\Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~18_combout\,
	datad => \Equal1~3_combout\,
	combout => \update_counter~1_combout\);

-- Location: FF_X19_Y21_N19
\update_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \update_counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(9));

-- Location: LCCOMB_X18_Y21_N26
\Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = (update_counter(10) & (\Add2~19\ $ (GND))) # (!update_counter(10) & (!\Add2~19\ & VCC))
-- \Add2~21\ = CARRY((update_counter(10) & !\Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(10),
	datad => VCC,
	cin => \Add2~19\,
	combout => \Add2~20_combout\,
	cout => \Add2~21\);

-- Location: FF_X18_Y21_N27
\update_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(10));

-- Location: LCCOMB_X18_Y21_N28
\Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~22_combout\ = (update_counter(11) & (!\Add2~21\)) # (!update_counter(11) & ((\Add2~21\) # (GND)))
-- \Add2~23\ = CARRY((!\Add2~21\) # (!update_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => update_counter(11),
	datad => VCC,
	cin => \Add2~21\,
	combout => \Add2~22_combout\,
	cout => \Add2~23\);

-- Location: FF_X18_Y21_N29
\update_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \Add2~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(11));

-- Location: LCCOMB_X18_Y21_N30
\Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = \Add2~23\ $ (!update_counter(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => update_counter(12),
	cin => \Add2~23\,
	combout => \Add2~24_combout\);

-- Location: LCCOMB_X19_Y21_N16
\update_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \update_counter~0_combout\ = (\Add2~24_combout\ & !\Equal1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~24_combout\,
	datad => \Equal1~3_combout\,
	combout => \update_counter~0_combout\);

-- Location: FF_X19_Y21_N17
\update_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \update_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => update_counter(12));

-- Location: LCCOMB_X18_Y21_N0
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!update_counter(11) & (update_counter(9) & (!update_counter(10) & update_counter(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(11),
	datab => update_counter(9),
	datac => update_counter(10),
	datad => update_counter(12),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X18_Y21_N4
\Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (!update_counter(2) & (!update_counter(4) & (!update_counter(1) & update_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(2),
	datab => update_counter(4),
	datac => update_counter(1),
	datad => update_counter(3),
	combout => \Equal1~2_combout\);

-- Location: LCCOMB_X18_Y21_N2
\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (update_counter(7) & (!update_counter(5) & (update_counter(8) & !update_counter(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => update_counter(7),
	datab => update_counter(5),
	datac => update_counter(8),
	datad => update_counter(6),
	combout => \Equal1~1_combout\);

-- Location: LCCOMB_X19_Y21_N12
\Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~3_combout\ = (\Equal1~0_combout\ & (!update_counter(0) & (\Equal1~2_combout\ & \Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => update_counter(0),
	datac => \Equal1~2_combout\,
	datad => \Equal1~1_combout\,
	combout => \Equal1~3_combout\);

-- Location: FF_X27_Y26_N13
\adc_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => d_out_buffer(0),
	sload => VCC,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(0));

-- Location: LCCOMB_X27_Y26_N12
\adc_data[0]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[0]~_wirecell_combout\ = !adc_data(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => adc_data(0),
	combout => \adc_data[0]~_wirecell_combout\);

-- Location: LCCOMB_X28_Y26_N22
\Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~1_combout\ = (count_posedge(2) & (count_posedge(3) & (!count_posedge(0) & count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~1_combout\);

-- Location: LCCOMB_X27_Y26_N26
\d_out_buffer[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[1]~1_combout\ = (\Decoder0~1_combout\ & (\d_out~input_o\)) # (!\Decoder0~1_combout\ & ((d_out_buffer(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d_out~input_o\,
	datac => d_out_buffer(1),
	datad => \Decoder0~1_combout\,
	combout => \d_out_buffer[1]~1_combout\);

-- Location: FF_X27_Y26_N27
\d_out_buffer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(1));

-- Location: FF_X27_Y26_N3
\adc_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => d_out_buffer(1),
	sload => VCC,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(1));

-- Location: LCCOMB_X28_Y26_N8
\Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~2_combout\ = (count_posedge(2) & (count_posedge(3) & (count_posedge(0) & !count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~2_combout\);

-- Location: LCCOMB_X27_Y26_N28
\d_out_buffer[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[2]~2_combout\ = (\Decoder0~2_combout\ & ((\d_out~input_o\))) # (!\Decoder0~2_combout\ & (d_out_buffer(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Decoder0~2_combout\,
	datac => d_out_buffer(2),
	datad => \d_out~input_o\,
	combout => \d_out_buffer[2]~2_combout\);

-- Location: FF_X27_Y26_N29
\d_out_buffer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(2));

-- Location: LCCOMB_X27_Y26_N30
\adc_data[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[2]~feeder_combout\ = d_out_buffer(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => d_out_buffer(2),
	combout => \adc_data[2]~feeder_combout\);

-- Location: FF_X27_Y26_N31
\adc_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \adc_data[2]~feeder_combout\,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(2));

-- Location: LCCOMB_X28_Y26_N2
\Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~3_combout\ = (count_posedge(2) & (count_posedge(3) & (!count_posedge(0) & !count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~3_combout\);

-- Location: LCCOMB_X27_Y26_N22
\d_out_buffer[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[3]~3_combout\ = (\Decoder0~3_combout\ & (\d_out~input_o\)) # (!\Decoder0~3_combout\ & ((d_out_buffer(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d_out~input_o\,
	datac => d_out_buffer(3),
	datad => \Decoder0~3_combout\,
	combout => \d_out_buffer[3]~3_combout\);

-- Location: FF_X27_Y26_N23
\d_out_buffer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(3));

-- Location: FF_X27_Y26_N11
\adc_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => d_out_buffer(3),
	sload => VCC,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(3));

-- Location: LCCOMB_X28_Y26_N28
\Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~4_combout\ = (!count_posedge(2) & (count_posedge(3) & (count_posedge(0) & count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~4_combout\);

-- Location: LCCOMB_X27_Y26_N0
\d_out_buffer[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[4]~4_combout\ = (\Decoder0~4_combout\ & (\d_out~input_o\)) # (!\Decoder0~4_combout\ & ((d_out_buffer(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d_out~input_o\,
	datac => d_out_buffer(4),
	datad => \Decoder0~4_combout\,
	combout => \d_out_buffer[4]~4_combout\);

-- Location: FF_X27_Y26_N1
\d_out_buffer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(4));

-- Location: LCCOMB_X27_Y26_N8
\adc_data[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[4]~feeder_combout\ = d_out_buffer(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => d_out_buffer(4),
	combout => \adc_data[4]~feeder_combout\);

-- Location: FF_X27_Y26_N9
\adc_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \adc_data[4]~feeder_combout\,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(4));

-- Location: LCCOMB_X27_Y26_N18
\Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~5_combout\ = (!count_posedge(2) & (count_posedge(1) & (!count_posedge(0) & count_posedge(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(1),
	datac => count_posedge(0),
	datad => count_posedge(3),
	combout => \Decoder0~5_combout\);

-- Location: LCCOMB_X27_Y25_N4
\d_out_buffer[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[5]~5_combout\ = (\Decoder0~5_combout\ & (\d_out~input_o\)) # (!\Decoder0~5_combout\ & ((d_out_buffer(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datac => d_out_buffer(5),
	datad => \Decoder0~5_combout\,
	combout => \d_out_buffer[5]~5_combout\);

-- Location: FF_X27_Y25_N5
\d_out_buffer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(5));

-- Location: FF_X27_Y25_N1
\adc_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => d_out_buffer(5),
	sload => VCC,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(5));

-- Location: LCCOMB_X27_Y26_N6
\Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~6_combout\ = (!count_posedge(2) & (!count_posedge(1) & (count_posedge(0) & count_posedge(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(1),
	datac => count_posedge(0),
	datad => count_posedge(3),
	combout => \Decoder0~6_combout\);

-- Location: LCCOMB_X27_Y25_N22
\d_out_buffer[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[6]~6_combout\ = (\Decoder0~6_combout\ & (\d_out~input_o\)) # (!\Decoder0~6_combout\ & ((d_out_buffer(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datac => d_out_buffer(6),
	datad => \Decoder0~6_combout\,
	combout => \d_out_buffer[6]~6_combout\);

-- Location: FF_X27_Y25_N23
\d_out_buffer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(6));

-- Location: FF_X27_Y25_N27
\adc_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => d_out_buffer(6),
	sload => VCC,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(6));

-- Location: LCCOMB_X28_Y26_N14
\Decoder0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~7_combout\ = (!count_posedge(2) & (count_posedge(3) & (!count_posedge(0) & !count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~7_combout\);

-- Location: LCCOMB_X27_Y25_N16
\d_out_buffer[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[7]~7_combout\ = (\Decoder0~7_combout\ & (\d_out~input_o\)) # (!\Decoder0~7_combout\ & ((d_out_buffer(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datac => d_out_buffer(7),
	datad => \Decoder0~7_combout\,
	combout => \d_out_buffer[7]~7_combout\);

-- Location: FF_X27_Y25_N17
\d_out_buffer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(7));

-- Location: LCCOMB_X27_Y25_N12
\adc_data[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[7]~feeder_combout\ = d_out_buffer(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => d_out_buffer(7),
	combout => \adc_data[7]~feeder_combout\);

-- Location: FF_X27_Y25_N13
\adc_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \adc_data[7]~feeder_combout\,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(7));

-- Location: LCCOMB_X28_Y26_N16
\Decoder0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~8_combout\ = (count_posedge(2) & (!count_posedge(3) & (count_posedge(0) & count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~8_combout\);

-- Location: LCCOMB_X27_Y25_N18
\d_out_buffer[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[8]~8_combout\ = (\Decoder0~8_combout\ & (\d_out~input_o\)) # (!\Decoder0~8_combout\ & ((d_out_buffer(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datac => d_out_buffer(8),
	datad => \Decoder0~8_combout\,
	combout => \d_out_buffer[8]~8_combout\);

-- Location: FF_X27_Y25_N19
\d_out_buffer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[8]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(8));

-- Location: LCCOMB_X27_Y25_N30
\adc_data[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[8]~feeder_combout\ = d_out_buffer(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => d_out_buffer(8),
	combout => \adc_data[8]~feeder_combout\);

-- Location: FF_X27_Y25_N31
\adc_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \adc_data[8]~feeder_combout\,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(8));

-- Location: LCCOMB_X27_Y26_N16
\Decoder0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~9_combout\ = (count_posedge(2) & (count_posedge(1) & (!count_posedge(0) & !count_posedge(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(1),
	datac => count_posedge(0),
	datad => count_posedge(3),
	combout => \Decoder0~9_combout\);

-- Location: LCCOMB_X27_Y25_N28
\d_out_buffer[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[9]~9_combout\ = (\Decoder0~9_combout\ & (\d_out~input_o\)) # (!\Decoder0~9_combout\ & ((d_out_buffer(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datab => \Decoder0~9_combout\,
	datac => d_out_buffer(9),
	combout => \d_out_buffer[9]~9_combout\);

-- Location: FF_X27_Y25_N29
\d_out_buffer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[9]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(9));

-- Location: LCCOMB_X27_Y25_N24
\adc_data[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[9]~feeder_combout\ = d_out_buffer(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => d_out_buffer(9),
	combout => \adc_data[9]~feeder_combout\);

-- Location: FF_X27_Y25_N25
\adc_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \adc_data[9]~feeder_combout\,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(9));

-- Location: LCCOMB_X27_Y26_N20
\Decoder0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~10_combout\ = (count_posedge(2) & (!count_posedge(1) & (count_posedge(0) & !count_posedge(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(1),
	datac => count_posedge(0),
	datad => count_posedge(3),
	combout => \Decoder0~10_combout\);

-- Location: LCCOMB_X27_Y25_N6
\d_out_buffer[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[10]~10_combout\ = (\Decoder0~10_combout\ & (\d_out~input_o\)) # (!\Decoder0~10_combout\ & ((d_out_buffer(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d_out~input_o\,
	datac => d_out_buffer(10),
	datad => \Decoder0~10_combout\,
	combout => \d_out_buffer[10]~10_combout\);

-- Location: FF_X27_Y25_N7
\d_out_buffer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[10]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(10));

-- Location: LCCOMB_X27_Y25_N2
\adc_data[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \adc_data[10]~feeder_combout\ = d_out_buffer(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => d_out_buffer(10),
	combout => \adc_data[10]~feeder_combout\);

-- Location: FF_X27_Y25_N3
\adc_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \adc_data[10]~feeder_combout\,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(10));

-- Location: LCCOMB_X28_Y26_N18
\Decoder0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder0~11_combout\ = (count_posedge(2) & (!count_posedge(3) & (!count_posedge(0) & !count_posedge(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count_posedge(2),
	datab => count_posedge(3),
	datac => count_posedge(0),
	datad => count_posedge(1),
	combout => \Decoder0~11_combout\);

-- Location: LCCOMB_X27_Y26_N4
\d_out_buffer[11]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \d_out_buffer[11]~11_combout\ = (\Decoder0~11_combout\ & (\d_out~input_o\)) # (!\Decoder0~11_combout\ & ((d_out_buffer(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d_out~input_o\,
	datac => d_out_buffer(11),
	datad => \Decoder0~11_combout\,
	combout => \d_out_buffer[11]~11_combout\);

-- Location: FF_X27_Y26_N5
\d_out_buffer[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \d_out_buffer[11]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => d_out_buffer(11));

-- Location: FF_X27_Y26_N25
\adc_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \display0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => d_out_buffer(11),
	sload => VCC,
	ena => \Equal1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => adc_data(11));

-- Location: M9K_X22_Y23_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"FFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555555555555555540000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5555555555555555555555555555555555555554000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA95555555555555555555555555555555555555554000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAA",
	mem_init2 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAA95555555555555555555555555555555555555550000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA95555555555555555555555555555555555555550000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555555555555555550000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555",
	mem_init1 => X"555555555555555555555555555555540000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5555555555555555555555555555555555555554000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA95555555555555555555555555555555555555554000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA95555555555555555555555555555555555555550000",
	mem_init0 => X"000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA95555555555555555555555555555555555555550000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA55555555555555555555555555555555555555550000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5555555555555555555555555555555555555554000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Conversion_ROM:ADC0|altsyncram:altsyncram_component|altsyncram_v591:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y24_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA5555555555555555555555555555555555555555555555555555",
	mem_init2 => X"55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
	mem_init1 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
	mem_init0 => X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA955555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Conversion_ROM:ADC0|altsyncram:altsyncram_component|altsyncram_v591:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y23_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
	mem_init2 => X"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA9555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555",
	mem_init1 => X"55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Conversion_ROM:ADC0|altsyncram:altsyncram_component|altsyncram_v591:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

-- Location: LCCOMB_X29_Y20_N20
\ones~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~2_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(10) & ((\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((\ADC0|altsyncram_component|auto_generated|q_a\(11)) # (\ADC0|altsyncram_component|auto_generated|q_a\(8)))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((!\ADC0|altsyncram_component|auto_generated|q_a\(8)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11)))))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(10) & 
-- (\ADC0|altsyncram_component|auto_generated|q_a\(8) $ (((\ADC0|altsyncram_component|auto_generated|q_a\(9)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	combout => \ones~2_combout\);

-- Location: LCCOMB_X29_Y20_N26
\ones~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~1_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (!\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((\ADC0|altsyncram_component|auto_generated|q_a\(8)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(10))))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((\ADC0|altsyncram_component|auto_generated|q_a\(10)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	combout => \ones~1_combout\);

-- Location: LCCOMB_X29_Y20_N0
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

-- Location: LCCOMB_X29_Y20_N18
\ones~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~5_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(7) & (((\ones~1_combout\) # (\ones~0_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(7) & (!\ones~0_combout\ & ((\ones~2_combout\) # (!\ones~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	datab => \ones~2_combout\,
	datac => \ones~1_combout\,
	datad => \ones~0_combout\,
	combout => \ones~5_combout\);

-- Location: LCCOMB_X29_Y20_N24
\ones~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~4_combout\ = (\ones~1_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(7) & (\ones~2_combout\))) # (!\ones~1_combout\ & (\ones~0_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(7)) # (!\ones~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	datab => \ones~2_combout\,
	datac => \ones~1_combout\,
	datad => \ones~0_combout\,
	combout => \ones~4_combout\);

-- Location: LCCOMB_X29_Y20_N22
\ones~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~3_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(7) & (!\ones~2_combout\)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(7) & ((\ones~2_combout\ & ((\ones~0_combout\))) # (!\ones~2_combout\ & (!\ones~1_combout\ & 
-- !\ones~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	datab => \ones~2_combout\,
	datac => \ones~1_combout\,
	datad => \ones~0_combout\,
	combout => \ones~3_combout\);

-- Location: LCCOMB_X28_Y20_N6
\ones~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~11_combout\ = (\ones~4_combout\ & (((\ADC0|altsyncram_component|auto_generated|q_a\(6))))) # (!\ones~4_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(6) & ((\ones~3_combout\))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(6) & 
-- ((\ones~5_combout\) # (!\ones~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~5_combout\,
	datab => \ones~4_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datad => \ones~3_combout\,
	combout => \ones~11_combout\);

-- Location: M9K_X22_Y24_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"AAA95555555554000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555540000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000003FFFFFFFFFEAA",
	mem_init2 => X"AAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555554000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFF",
	mem_init1 => X"FFAAAAAAAAAA55555555540000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555554000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555540000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555550000000000FFFF",
	mem_init0 => X"FFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000003FFFFFFFFFEAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555550000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAA955555555540000000003FFFFFFFFFEAAAAAAAAA95555555554000000000FFFFFFFFFFAAAAAAAAAA55555555550000000000FFFFFFFFFFAAAAAAAAAA55555555540000000003FFFFFFFFFEAAAAAAAAA95555555554000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Conversion_ROM:ADC0|altsyncram:altsyncram_component|altsyncram_v591:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCCOMB_X28_Y20_N26
\ones~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~9_combout\ = (\ones~5_combout\ & (\ones~4_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(6)))) # (!\ones~5_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(6)) # ((!\ones~4_combout\ & !\ones~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100001011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~5_combout\,
	datab => \ones~4_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datad => \ones~3_combout\,
	combout => \ones~9_combout\);

-- Location: LCCOMB_X28_Y20_N12
\ones~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~10_combout\ = (\ones~3_combout\ & (\ones~5_combout\ & ((!\ADC0|altsyncram_component|auto_generated|q_a\(6))))) # (!\ones~3_combout\ & (\ones~4_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(6)) # (!\ones~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~5_combout\,
	datab => \ones~4_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datad => \ones~3_combout\,
	combout => \ones~10_combout\);

-- Location: LCCOMB_X28_Y20_N0
\ones~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~12_combout\ = \ones~10_combout\ $ ((((\ones~11_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(5))) # (!\ones~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~11_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datac => \ones~9_combout\,
	datad => \ones~10_combout\,
	combout => \ones~12_combout\);

-- Location: LCCOMB_X28_Y20_N8
\ones~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~6_combout\ = \ones~4_combout\ $ ((((\ones~5_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(6))) # (!\ones~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~5_combout\,
	datab => \ones~4_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datad => \ones~3_combout\,
	combout => \ones~6_combout\);

-- Location: LCCOMB_X29_Y20_N8
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(11) & ((\ADC0|altsyncram_component|auto_generated|q_a\(9)) # (\ADC0|altsyncram_component|auto_generated|q_a\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X29_Y20_N30
\ones~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~8_combout\ = \ones~0_combout\ $ ((((!\ADC0|altsyncram_component|auto_generated|q_a\(7) & \ones~2_combout\)) # (!\ones~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000001001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	datab => \ones~2_combout\,
	datac => \ones~1_combout\,
	datad => \ones~0_combout\,
	combout => \ones~8_combout\);

-- Location: LCCOMB_X29_Y20_N12
\ones~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~7_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(10) & ((\ADC0|altsyncram_component|auto_generated|q_a\(8)) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11))))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((\ADC0|altsyncram_component|auto_generated|q_a\(11) & (!\ADC0|altsyncram_component|auto_generated|q_a\(10))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(11) & 
-- (\ADC0|altsyncram_component|auto_generated|q_a\(10) & \ADC0|altsyncram_component|auto_generated|q_a\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	combout => \ones~7_combout\);

-- Location: LCCOMB_X29_Y19_N10
\LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (\LessThan3~0_combout\ & ((\ones~8_combout\ & ((\ones~7_combout\))) # (!\ones~8_combout\ & ((\ones~6_combout\) # (!\ones~7_combout\))))) # (!\LessThan3~0_combout\ & (((\ones~6_combout\ & \ones~8_combout\)) # (!\ones~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~6_combout\,
	datab => \LessThan3~0_combout\,
	datac => \ones~8_combout\,
	datad => \ones~7_combout\,
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X29_Y19_N0
\LessThan7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~0_combout\ = (\ones~6_combout\ $ (\LessThan5~0_combout\)) # (!\ones~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~12_combout\,
	datac => \ones~6_combout\,
	datad => \LessThan5~0_combout\,
	combout => \LessThan7~0_combout\);

-- Location: LCCOMB_X29_Y20_N4
\tens~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~3_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (((!\ADC0|altsyncram_component|auto_generated|q_a\(7) & !\ADC0|altsyncram_component|auto_generated|q_a\(6))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(8)))) # 
-- (!\ADC0|altsyncram_component|auto_generated|q_a\(9) & ((\ADC0|altsyncram_component|auto_generated|q_a\(8)) # ((\ADC0|altsyncram_component|auto_generated|q_a\(7) & \ADC0|altsyncram_component|auto_generated|q_a\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(7),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(6),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	combout => \tens~3_combout\);

-- Location: LCCOMB_X29_Y20_N14
\tens~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~24_combout\ = (\tens~3_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(10) & \ADC0|altsyncram_component|auto_generated|q_a\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tens~3_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	combout => \tens~24_combout\);

-- Location: LCCOMB_X29_Y20_N10
\tens~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~7_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(9) & (\ADC0|altsyncram_component|auto_generated|q_a\(11) & (\ADC0|altsyncram_component|auto_generated|q_a\(10) & \ADC0|altsyncram_component|auto_generated|q_a\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(8),
	combout => \tens~7_combout\);

-- Location: LCCOMB_X29_Y20_N28
\tens~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~8_combout\ = (\tens~7_combout\) # ((!\LessThan3~0_combout\ & !\ones~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~7_combout\,
	datab => \LessThan3~0_combout\,
	datac => \ones~8_combout\,
	combout => \tens~8_combout\);

-- Location: LCCOMB_X29_Y20_N6
\tens~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~9_combout\ = (\tens~24_combout\) # ((\LessThan5~0_combout\ & \tens~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan5~0_combout\,
	datac => \tens~24_combout\,
	datad => \tens~8_combout\,
	combout => \tens~9_combout\);

-- Location: LCCOMB_X29_Y19_N16
\tens~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~6_combout\ = (\ones~6_combout\ & (\ones~7_combout\ & (\LessThan3~0_combout\ $ (\ones~8_combout\)))) # (!\ones~6_combout\ & (\LessThan3~0_combout\ & (\ones~8_combout\ & !\ones~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~6_combout\,
	datab => \LessThan3~0_combout\,
	datac => \ones~8_combout\,
	datad => \ones~7_combout\,
	combout => \tens~6_combout\);

-- Location: LCCOMB_X29_Y19_N24
\tens~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~15_combout\ = \tens~6_combout\ $ (((!\tens~9_combout\) # (!\LessThan7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan7~0_combout\,
	datac => \tens~9_combout\,
	datad => \tens~6_combout\,
	combout => \tens~15_combout\);

-- Location: LCCOMB_X29_Y20_N16
\hundreds~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~2_combout\ = (\ones~7_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(10)) # ((\ADC0|altsyncram_component|auto_generated|q_a\(9))))) # (!\ones~7_combout\ & (!\ones~8_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(10)) # 
-- (\ADC0|altsyncram_component|auto_generated|q_a\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~7_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(10),
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(9),
	datad => \ones~8_combout\,
	combout => \hundreds~2_combout\);

-- Location: LCCOMB_X29_Y20_N2
\hundreds~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~3_combout\ = (\tens~15_combout\ & (\hundreds~2_combout\ & (\LessThan5~0_combout\ & \ADC0|altsyncram_component|auto_generated|q_a\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~15_combout\,
	datab => \hundreds~2_combout\,
	datac => \LessThan5~0_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(11),
	combout => \hundreds~3_combout\);

-- Location: LCCOMB_X29_Y19_N26
\LessThan9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~0_combout\ = (\LessThan3~0_combout\ & ((\ones~7_combout\) # (!\ones~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan3~0_combout\,
	datac => \ones~8_combout\,
	datad => \ones~7_combout\,
	combout => \LessThan9~0_combout\);

-- Location: LCCOMB_X30_Y18_N26
\hundreds~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~1_combout\ = (!\LessThan5~0_combout\ & ((!\LessThan9~0_combout\) # (!\tens~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~15_combout\,
	datab => \LessThan5~0_combout\,
	datac => \LessThan9~0_combout\,
	combout => \hundreds~1_combout\);

-- Location: LCCOMB_X29_Y19_N12
\tens~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~13_combout\ = (\LessThan7~0_combout\ & (!\tens~9_combout\ & \tens~6_combout\)) # (!\LessThan7~0_combout\ & (\tens~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan7~0_combout\,
	datac => \tens~9_combout\,
	datad => \tens~6_combout\,
	combout => \tens~13_combout\);

-- Location: LCCOMB_X29_Y19_N18
\tens~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~12_combout\ = \ones~12_combout\ $ (((!\tens~6_combout\ & ((!\tens~9_combout\) # (!\LessThan7~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~12_combout\,
	datab => \LessThan7~0_combout\,
	datac => \tens~9_combout\,
	datad => \tens~6_combout\,
	combout => \tens~12_combout\);

-- Location: LCCOMB_X28_Y20_N20
\ones~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~14_combout\ = (\ones~9_combout\ & (\ones~11_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(5)))) # (!\ones~9_combout\ & (\ones~10_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(5)) # (!\ones~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~11_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datac => \ones~9_combout\,
	datad => \ones~10_combout\,
	combout => \ones~14_combout\);

-- Location: LCCOMB_X28_Y20_N14
\ones~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~15_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(5) & (((\ones~9_combout\) # (\ones~10_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(5) & (!\ones~10_combout\ & ((\ones~11_combout\) # (!\ones~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~11_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datac => \ones~9_combout\,
	datad => \ones~10_combout\,
	combout => \ones~15_combout\);

-- Location: LCCOMB_X28_Y20_N18
\ones~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~13_combout\ = (\ones~11_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(5) & ((\ones~10_combout\)))) # (!\ones~11_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(5)) # ((!\ones~9_combout\ & !\ones~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~11_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(5),
	datac => \ones~9_combout\,
	datad => \ones~10_combout\,
	combout => \ones~13_combout\);

-- Location: LCCOMB_X28_Y20_N24
\ones~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~16_combout\ = \ones~14_combout\ $ ((((!\ADC0|altsyncram_component|auto_generated|q_a\(4) & \ones~15_combout\)) # (!\ones~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	datad => \ones~13_combout\,
	combout => \ones~16_combout\);

-- Location: LCCOMB_X29_Y19_N28
\tens~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~10_combout\ = (\ones~6_combout\ & ((\LessThan3~0_combout\ & (\ones~8_combout\ & !\ones~7_combout\)) # (!\LessThan3~0_combout\ & (!\ones~8_combout\ & \ones~7_combout\)))) # (!\ones~6_combout\ & (\ones~7_combout\ $ (((!\ones~8_combout\) # 
-- (!\LessThan3~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001010010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~6_combout\,
	datab => \LessThan3~0_combout\,
	datac => \ones~8_combout\,
	datad => \ones~7_combout\,
	combout => \tens~10_combout\);

-- Location: LCCOMB_X29_Y19_N6
\tens~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~11_combout\ = (\ones~12_combout\ & ((\tens~10_combout\ & (!\tens~9_combout\ & !\tens~6_combout\)) # (!\tens~10_combout\ & ((\tens~6_combout\))))) # (!\ones~12_combout\ & (\tens~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~12_combout\,
	datab => \tens~10_combout\,
	datac => \tens~9_combout\,
	datad => \tens~6_combout\,
	combout => \tens~11_combout\);

-- Location: LCCOMB_X29_Y19_N30
\tens~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~14_combout\ = \tens~13_combout\ $ ((((!\tens~12_combout\ & \ones~16_combout\)) # (!\tens~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datab => \tens~12_combout\,
	datac => \ones~16_combout\,
	datad => \tens~11_combout\,
	combout => \tens~14_combout\);

-- Location: LCCOMB_X30_Y18_N16
\hundreds~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~0_combout\ = (\tens~15_combout\ & ((\LessThan5~0_combout\) # (!\LessThan9~0_combout\))) # (!\tens~15_combout\ & ((\LessThan9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~15_combout\,
	datab => \LessThan5~0_combout\,
	datac => \LessThan9~0_combout\,
	combout => \hundreds~0_combout\);

-- Location: LCCOMB_X30_Y18_N4
\LessThan12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan12~1_combout\ = ((\tens~14_combout\ & \hundreds~0_combout\)) # (!\hundreds~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~1_combout\,
	datac => \tens~14_combout\,
	datad => \hundreds~0_combout\,
	combout => \LessThan12~1_combout\);

-- Location: LCCOMB_X30_Y18_N6
\Mux7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\Mux8~0_combout\ & (\hundreds~3_combout\ $ (!\LessThan12~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux8~0_combout\,
	datab => \hundreds~3_combout\,
	datac => \LessThan12~1_combout\,
	combout => \Mux7~3_combout\);

-- Location: LCCOMB_X29_Y19_N22
\tens~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~17_combout\ = (\tens~13_combout\ & (((\ones~16_combout\)))) # (!\tens~13_combout\ & ((\ones~16_combout\ & (\tens~12_combout\ & \tens~11_combout\)) # (!\ones~16_combout\ & ((!\tens~11_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datab => \tens~12_combout\,
	datac => \ones~16_combout\,
	datad => \tens~11_combout\,
	combout => \tens~17_combout\);

-- Location: LCCOMB_X29_Y19_N8
\tens~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~18_combout\ = (\tens~11_combout\ & (((!\tens~12_combout\ & \ones~16_combout\)))) # (!\tens~11_combout\ & (\tens~13_combout\ & ((\tens~12_combout\) # (!\ones~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datab => \tens~12_combout\,
	datac => \ones~16_combout\,
	datad => \tens~11_combout\,
	combout => \tens~18_combout\);

-- Location: LCCOMB_X29_Y19_N20
\tens~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~16_combout\ = (\tens~13_combout\ & (\tens~12_combout\ $ ((\ones~16_combout\)))) # (!\tens~13_combout\ & (\tens~12_combout\ & ((!\tens~11_combout\) # (!\ones~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datab => \tens~12_combout\,
	datac => \ones~16_combout\,
	datad => \tens~11_combout\,
	combout => \tens~16_combout\);

-- Location: LCCOMB_X28_Y20_N10
\ones~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~17_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(4) & (((!\ones~15_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(4) & ((\ones~14_combout\ & (\ones~15_combout\)) # (!\ones~14_combout\ & (!\ones~15_combout\ & 
-- !\ones~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	datad => \ones~13_combout\,
	combout => \ones~17_combout\);

-- Location: LCCOMB_X28_Y20_N4
\ones~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~18_combout\ = (\ones~13_combout\ & (!\ADC0|altsyncram_component|auto_generated|q_a\(4) & ((\ones~15_combout\)))) # (!\ones~13_combout\ & (\ones~14_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(4)) # (!\ones~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	datad => \ones~13_combout\,
	combout => \ones~18_combout\);

-- Location: LCCOMB_X28_Y20_N22
\ones~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~19_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(4) & ((\ones~14_combout\) # ((\ones~13_combout\)))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(4) & (!\ones~14_combout\ & ((\ones~15_combout\) # (!\ones~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(4),
	datab => \ones~14_combout\,
	datac => \ones~15_combout\,
	datad => \ones~13_combout\,
	combout => \ones~19_combout\);

-- Location: M9K_X33_Y26_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"5003FFAA955003FFAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95500FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55403FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55003FFAA955003FF",
	mem_init2 => X"AA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95500FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55403FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA554",
	mem_init1 => X"00FFEAA55400FFEAA55003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95500FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55403FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95400FFEAA55400FFEA",
	mem_init0 => X"A55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA955003FFAA95500FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55400FFEAA55403FFAA955003FFAA955003FFAA955003FFAA955003FFAA95500",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Conversion_ROM:ADC0|altsyncram:altsyncram_component|altsyncram_v591:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y22_N16
\ones~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~20_combout\ = \ones~18_combout\ $ ((((\ones~19_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(3))) # (!\ones~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~17_combout\,
	datab => \ones~18_combout\,
	datac => \ones~19_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	combout => \ones~20_combout\);

-- Location: LCCOMB_X29_Y18_N8
\tens~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~19_combout\ = \tens~18_combout\ $ ((((!\tens~17_combout\ & \ones~20_combout\)) # (!\tens~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~17_combout\,
	datab => \tens~18_combout\,
	datac => \tens~16_combout\,
	datad => \ones~20_combout\,
	combout => \tens~19_combout\);

-- Location: LCCOMB_X30_Y18_N30
\LessThan12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan12~0_combout\ = (!\hundreds~3_combout\ & (((\tens~14_combout\ & \hundreds~0_combout\)) # (!\hundreds~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~1_combout\,
	datab => \hundreds~3_combout\,
	datac => \tens~14_combout\,
	datad => \hundreds~0_combout\,
	combout => \LessThan12~0_combout\);

-- Location: LCCOMB_X30_Y18_N10
\hundreds~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~5_combout\ = (\tens~15_combout\ & (!\LessThan5~0_combout\ & \LessThan9~0_combout\)) # (!\tens~15_combout\ & ((!\LessThan9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010100100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~15_combout\,
	datab => \LessThan5~0_combout\,
	datac => \LessThan9~0_combout\,
	combout => \hundreds~5_combout\);

-- Location: LCCOMB_X30_Y18_N28
\hundreds~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~6_combout\ = (\LessThan12~0_combout\ & (((\hundreds~5_combout\)))) # (!\LessThan12~0_combout\ & (\hundreds~0_combout\ $ ((!\tens~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101101000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan12~0_combout\,
	datab => \hundreds~0_combout\,
	datac => \tens~14_combout\,
	datad => \hundreds~5_combout\,
	combout => \hundreds~6_combout\);

-- Location: LCCOMB_X30_Y18_N22
\hundreds~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~7_combout\ = (\hundreds~1_combout\ & (\tens~14_combout\ & ((\hundreds~3_combout\) # (!\hundreds~0_combout\)))) # (!\hundreds~1_combout\ & (\hundreds~3_combout\ $ ((!\tens~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000111100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~1_combout\,
	datab => \hundreds~3_combout\,
	datac => \tens~14_combout\,
	datad => \hundreds~0_combout\,
	combout => \hundreds~7_combout\);

-- Location: LCCOMB_X30_Y18_N12
\hundreds~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~4_combout\ = (\hundreds~1_combout\ & (((\tens~14_combout\ & \hundreds~0_combout\)))) # (!\hundreds~1_combout\ & (\hundreds~3_combout\ & ((!\hundreds~0_combout\) # (!\tens~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~1_combout\,
	datab => \hundreds~3_combout\,
	datac => \tens~14_combout\,
	datad => \hundreds~0_combout\,
	combout => \hundreds~4_combout\);

-- Location: LCCOMB_X30_Y18_N0
\thousands[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \thousands[0]~0_combout\ = (!\hundreds~4_combout\ & (((\tens~19_combout\ & !\hundreds~7_combout\)) # (!\hundreds~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~19_combout\,
	datab => \hundreds~6_combout\,
	datac => \hundreds~7_combout\,
	datad => \hundreds~4_combout\,
	combout => \thousands[0]~0_combout\);

-- Location: LCCOMB_X32_Y18_N2
\Mux8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~2_combout\ = (!\select_state.111~q\ & (!\select_state.100~q\ & !\select_state.001~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \select_state.111~q\,
	datab => \select_state.100~q\,
	datad => \select_state.001~q\,
	combout => \Mux8~2_combout\);

-- Location: LCCOMB_X30_Y18_N18
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Mux8~2_combout\ & (\tens~19_combout\ $ (\thousands[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~19_combout\,
	datab => \thousands[0]~0_combout\,
	datac => \Mux8~2_combout\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X29_Y18_N12
\tens~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~21_combout\ = (\tens~18_combout\ & (((\ones~20_combout\)))) # (!\tens~18_combout\ & ((\tens~16_combout\ & (\tens~17_combout\ & \ones~20_combout\)) # (!\tens~16_combout\ & ((!\ones~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~17_combout\,
	datab => \tens~18_combout\,
	datac => \tens~16_combout\,
	datad => \ones~20_combout\,
	combout => \tens~21_combout\);

-- Location: LCCOMB_X29_Y18_N16
\tens~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~22_combout\ = (\tens~17_combout\ & (((!\tens~18_combout\ & !\tens~16_combout\)) # (!\ones~20_combout\))) # (!\tens~17_combout\ & (\tens~18_combout\ & ((\ones~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~17_combout\,
	datab => \tens~18_combout\,
	datac => \tens~16_combout\,
	datad => \ones~20_combout\,
	combout => \tens~22_combout\);

-- Location: LCCOMB_X29_Y18_N10
\tens~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~20_combout\ = (\tens~16_combout\ & (!\tens~17_combout\ & ((\ones~20_combout\)))) # (!\tens~16_combout\ & (\tens~18_combout\ & ((\tens~17_combout\) # (!\ones~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~17_combout\,
	datab => \tens~18_combout\,
	datac => \tens~16_combout\,
	datad => \ones~20_combout\,
	combout => \tens~20_combout\);

-- Location: LCCOMB_X32_Y22_N14
\Add14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add14~0_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(3)) # (!\ones~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ones~19_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	combout => \Add14~0_combout\);

-- Location: LCCOMB_X32_Y22_N26
\LessThan11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan11~0_combout\ = (!\ones~18_combout\ & (((\ones~19_combout\ & !\ADC0|altsyncram_component|auto_generated|q_a\(3))) # (!\ones~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~17_combout\,
	datab => \ones~18_combout\,
	datac => \ones~19_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	combout => \LessThan11~0_combout\);

-- Location: LCCOMB_X32_Y22_N4
\Add17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add17~0_combout\ = (\LessThan11~0_combout\ & (!\ones~19_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(3)) # (\ADC0|altsyncram_component|auto_generated|q_a\(2))))) # (!\LessThan11~0_combout\ & 
-- ((\ADC0|altsyncram_component|auto_generated|q_a\(3) & (!\ones~19_combout\ & \ADC0|altsyncram_component|auto_generated|q_a\(2))) # (!\ADC0|altsyncram_component|auto_generated|q_a\(3) & (\ones~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan11~0_combout\,
	datab => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	datac => \ones~19_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(2),
	combout => \Add17~0_combout\);

-- Location: LCCOMB_X32_Y22_N8
\ones~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~21_combout\ = \ones~17_combout\ $ (\Add17~0_combout\ $ (((\LessThan11~0_combout\) # (!\Add14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011001011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~17_combout\,
	datab => \Add14~0_combout\,
	datac => \LessThan11~0_combout\,
	datad => \Add17~0_combout\,
	combout => \ones~21_combout\);

-- Location: LCCOMB_X29_Y18_N28
\hundreds[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[0]~8_combout\ = (!\tens~20_combout\ & (((!\tens~21_combout\ & \ones~21_combout\)) # (!\tens~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~21_combout\,
	datab => \tens~22_combout\,
	datac => \tens~20_combout\,
	datad => \ones~21_combout\,
	combout => \hundreds[0]~8_combout\);

-- Location: LCCOMB_X32_Y18_N22
\Mux8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~5_combout\ = (!\select_state.111~q\ & (!\select_state.100~q\ & \select_state.001~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \select_state.111~q\,
	datab => \select_state.100~q\,
	datad => \select_state.001~q\,
	combout => \Mux8~5_combout\);

-- Location: LCCOMB_X29_Y18_N14
\Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Mux8~5_combout\ & (\hundreds[0]~8_combout\ $ (\ones~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hundreds[0]~8_combout\,
	datac => \Mux8~5_combout\,
	datad => \ones~21_combout\,
	combout => \Mux7~1_combout\);

-- Location: M9K_X33_Y25_N0
\ADC0|altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E4E93A4E93A4E93A4E5394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E4E93A4E93A4E93A4E5394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4",
	mem_init2 => X"E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E4E93A4E93A4E93A4E5394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E4E93A4E93A4E93A4E5394E5394E5394E53",
	mem_init1 => X"90E4390E4390E4390E4F93E4F93E4F93E4E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E4E93A4E93A4E93A4E5394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E",
	mem_init0 => X"4E93A4E93A4E93A4E5394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93E4E93A4E93A4E93A4E5394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4E93A4E93A4E93A4E9394E5394E5394E5390E4390E4390E4390E4F93E4F93E4F93E4F93A4E93A4E93A4E9394E5394E5394E5394E4390E4390E4390E4393E4F93E4F93E4F93A4E93A4E93A4E93A4E5394E5394E5394E4",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../ADC.mif",
	init_file_layout => "port_a",
	logical_ram_name => "Conversion_ROM:ADC0|altsyncram:altsyncram_component|altsyncram_v591:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 12,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 2,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 4095,
	port_a_logical_ram_depth => 4096,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 12,
	port_b_data_width => 2,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portaaddr => \ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \ADC0|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y22_N28
\ones~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~23_combout\ = (!\Add17~0_combout\ & (\ones~17_combout\ $ (((\LessThan11~0_combout\) # (!\Add14~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~17_combout\,
	datab => \Add14~0_combout\,
	datac => \LessThan11~0_combout\,
	datad => \Add17~0_combout\,
	combout => \ones~23_combout\);

-- Location: LCCOMB_X32_Y22_N22
\ones~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~24_combout\ = (\ones~17_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(3)) # ((!\ones~18_combout\ & \ones~19_combout\)))) # (!\ones~17_combout\ & (\ones~18_combout\ $ (((!\ADC0|altsyncram_component|auto_generated|q_a\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~17_combout\,
	datab => \ones~18_combout\,
	datac => \ones~19_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	combout => \ones~24_combout\);

-- Location: LCCOMB_X32_Y22_N12
\ones~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~26_combout\ = \ones~24_combout\ $ (((\ones~23_combout\) # (\ADC0|altsyncram_component|auto_generated|q_a\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~23_combout\,
	datac => \ones~24_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(2),
	combout => \ones~26_combout\);

-- Location: LCCOMB_X32_Y22_N2
\Add20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add20~0_combout\ = (\ADC0|altsyncram_component|auto_generated|q_a\(1)) # (\ones~23_combout\ $ (!\ADC0|altsyncram_component|auto_generated|q_a\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~23_combout\,
	datac => \ADC0|altsyncram_component|auto_generated|q_a\(1),
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(2),
	combout => \Add20~0_combout\);

-- Location: LCCOMB_X32_Y22_N10
\ones~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~22_combout\ = (\ones~18_combout\ & ((\ones~19_combout\ $ (\ADC0|altsyncram_component|auto_generated|q_a\(3))))) # (!\ones~18_combout\ & (!\ones~19_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(3)) # (!\ones~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~17_combout\,
	datab => \ones~18_combout\,
	datac => \ones~19_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(3),
	combout => \ones~22_combout\);

-- Location: LCCOMB_X32_Y22_N24
\ones~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~25_combout\ = \ones~22_combout\ $ (((!\ones~23_combout\ & ((\ADC0|altsyncram_component|auto_generated|q_a\(2)) # (!\ones~24_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~22_combout\,
	datab => \ones~23_combout\,
	datac => \ones~24_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(2),
	combout => \ones~25_combout\);

-- Location: LCCOMB_X32_Y22_N30
\tens[0]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[0]~23_combout\ = (!\ones~25_combout\ & ((!\Add20~0_combout\) # (!\ones~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~26_combout\,
	datab => \Add20~0_combout\,
	datad => \ones~25_combout\,
	combout => \tens[0]~23_combout\);

-- Location: LCCOMB_X32_Y22_N0
\Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\select_state.100~q\ & (\ADC0|altsyncram_component|auto_generated|q_a\(1) $ (!\tens[0]~23_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(1),
	datab => \select_state.100~q\,
	datac => \tens[0]~23_combout\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X30_Y18_N8
\Mux7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = (\Mux7~3_combout\) # ((\Mux7~0_combout\) # ((\Mux7~1_combout\) # (\Mux7~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~3_combout\,
	datab => \Mux7~0_combout\,
	datac => \Mux7~1_combout\,
	datad => \Mux7~2_combout\,
	combout => \Mux7~4_combout\);

-- Location: LCCOMB_X29_Y18_N6
\Add19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add19~0_combout\ = (\tens~21_combout\) # (!\ones~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~21_combout\,
	datad => \ones~21_combout\,
	combout => \Add19~0_combout\);

-- Location: LCCOMB_X29_Y18_N26
\Mux8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~3_combout\ = (\Mux8~2_combout\ & (\tens~20_combout\ $ (((\tens~22_combout\ & \Add19~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~20_combout\,
	datab => \tens~22_combout\,
	datac => \Mux8~2_combout\,
	datad => \Add19~0_combout\,
	combout => \Mux8~3_combout\);

-- Location: LCCOMB_X32_Y18_N28
\Mux8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~4_combout\ = (\select_state.100~q\ & \ADC0|altsyncram_component|auto_generated|q_a\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \select_state.100~q\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(0),
	combout => \Mux8~4_combout\);

-- Location: LCCOMB_X32_Y18_N8
\Mux8~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~6_combout\ = (\Mux8~5_combout\ & (\ones~25_combout\ $ (((\ones~26_combout\ & \Add20~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux8~5_combout\,
	datab => \ones~26_combout\,
	datac => \Add20~0_combout\,
	datad => \ones~25_combout\,
	combout => \Mux8~6_combout\);

-- Location: LCCOMB_X30_Y18_N24
\Add18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add18~0_combout\ = (\tens~14_combout\ $ (\LessThan12~0_combout\)) # (!\tens~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110101111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~19_combout\,
	datab => \tens~14_combout\,
	datac => \LessThan12~0_combout\,
	combout => \Add18~0_combout\);

-- Location: LCCOMB_X32_Y18_N0
\Mux8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Mux8~0_combout\ & (\hundreds~4_combout\ $ (((\Add18~0_combout\ & \hundreds~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add18~0_combout\,
	datab => \hundreds~6_combout\,
	datac => \Mux8~0_combout\,
	datad => \hundreds~4_combout\,
	combout => \Mux8~1_combout\);

-- Location: LCCOMB_X32_Y18_N18
\Mux8~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~7_combout\ = (\Mux8~3_combout\) # ((\Mux8~4_combout\) # ((\Mux8~6_combout\) # (\Mux8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux8~3_combout\,
	datab => \Mux8~4_combout\,
	datac => \Mux8~6_combout\,
	datad => \Mux8~1_combout\,
	combout => \Mux8~7_combout\);

-- Location: LCCOMB_X30_Y18_N20
\Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\LessThan9~0_combout\ & (\Mux8~0_combout\ & ((!\LessThan5~0_combout\) # (!\tens~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~15_combout\,
	datab => \LessThan5~0_combout\,
	datac => \LessThan9~0_combout\,
	datad => \Mux8~0_combout\,
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X30_Y18_N2
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Mux8~2_combout\ & (\hundreds~7_combout\ $ (((!\thousands[0]~0_combout\ & \tens~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~7_combout\,
	datab => \thousands[0]~0_combout\,
	datac => \Mux8~2_combout\,
	datad => \tens~19_combout\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X29_Y18_N24
\Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Mux8~5_combout\ & (\tens~21_combout\ $ (((!\hundreds[0]~8_combout\ & \ones~21_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~21_combout\,
	datab => \hundreds[0]~8_combout\,
	datac => \Mux8~5_combout\,
	datad => \ones~21_combout\,
	combout => \Mux6~1_combout\);

-- Location: LCCOMB_X32_Y22_N18
\ones~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~27_combout\ = \ones~23_combout\ $ (\ADC0|altsyncram_component|auto_generated|q_a\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~23_combout\,
	datad => \ADC0|altsyncram_component|auto_generated|q_a\(2),
	combout => \ones~27_combout\);

-- Location: LCCOMB_X32_Y22_N20
\Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\select_state.100~q\ & (\ones~27_combout\ $ (((\ADC0|altsyncram_component|auto_generated|q_a\(1)) # (\tens[0]~23_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC0|altsyncram_component|auto_generated|q_a\(1),
	datab => \ones~27_combout\,
	datac => \tens[0]~23_combout\,
	datad => \select_state.100~q\,
	combout => \Mux6~3_combout\);

-- Location: LCCOMB_X30_Y18_N14
\Mux6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = (\Mux6~2_combout\) # ((\Mux6~0_combout\) # ((\Mux6~1_combout\) # (\Mux6~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~2_combout\,
	datab => \Mux6~0_combout\,
	datac => \Mux6~1_combout\,
	datad => \Mux6~3_combout\,
	combout => \Mux6~4_combout\);

-- Location: LCCOMB_X32_Y18_N30
\Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\select_state.100~q\ & ((\ones~26_combout\ & (!\Add20~0_combout\)) # (!\ones~26_combout\ & (\Add20~0_combout\ & \ones~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \select_state.100~q\,
	datab => \ones~26_combout\,
	datac => \Add20~0_combout\,
	datad => \ones~25_combout\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X32_Y18_N4
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Mux8~2_combout\ & ((\hundreds~6_combout\ & ((!\Add18~0_combout\))) # (!\hundreds~6_combout\ & (\hundreds~4_combout\ & \Add18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~4_combout\,
	datab => \hundreds~6_combout\,
	datac => \Add18~0_combout\,
	datad => \Mux8~2_combout\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X29_Y18_N2
\Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\Mux8~5_combout\ & (\tens~22_combout\ $ (((\Add19~0_combout\ & !\hundreds[0]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add19~0_combout\,
	datab => \hundreds[0]~8_combout\,
	datac => \Mux8~5_combout\,
	datad => \tens~22_combout\,
	combout => \Mux5~2_combout\);

-- Location: LCCOMB_X32_Y18_N24
\Mux5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\Mux5~1_combout\) # ((\Mux5~0_combout\) # (\Mux5~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~1_combout\,
	datab => \Mux5~0_combout\,
	datac => \Mux5~2_combout\,
	combout => \Mux5~3_combout\);

-- Location: LCCOMB_X31_Y18_N8
\WideOr12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr12~0_combout\ = (\Mux7~4_combout\ & (((\Mux5~3_combout\)))) # (!\Mux7~4_combout\ & (\Mux6~4_combout\ $ (((\Mux8~7_combout\ & !\Mux5~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Mux8~7_combout\,
	datac => \Mux6~4_combout\,
	datad => \Mux5~3_combout\,
	combout => \WideOr12~0_combout\);

-- Location: LCCOMB_X31_Y18_N10
\WideOr10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr10~0_combout\ = (\Mux6~4_combout\ & ((\Mux5~3_combout\) # (\Mux7~4_combout\ $ (\Mux8~7_combout\)))) # (!\Mux6~4_combout\ & (\Mux7~4_combout\ & ((\Mux5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Mux8~7_combout\,
	datac => \Mux6~4_combout\,
	datad => \Mux5~3_combout\,
	combout => \WideOr10~0_combout\);

-- Location: LCCOMB_X31_Y18_N4
\Decoder2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder2~0_combout\ = (!\Mux6~4_combout\ & (!\Mux8~7_combout\ & \Mux7~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~4_combout\,
	datab => \Mux8~7_combout\,
	datad => \Mux7~4_combout\,
	combout => \Decoder2~0_combout\);

-- Location: LCCOMB_X31_Y18_N6
\WideOr8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr8~0_combout\ = (\Mux7~4_combout\ & ((\Mux5~3_combout\) # ((\Mux8~7_combout\ & \Mux6~4_combout\)))) # (!\Mux7~4_combout\ & (\Mux6~4_combout\ $ (((\Mux8~7_combout\ & !\Mux5~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Mux8~7_combout\,
	datac => \Mux6~4_combout\,
	datad => \Mux5~3_combout\,
	combout => \WideOr8~0_combout\);

-- Location: LCCOMB_X31_Y18_N16
\WideOr6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr6~0_combout\ = (\Mux8~7_combout\) # ((\Mux7~4_combout\ & ((\Mux5~3_combout\))) # (!\Mux7~4_combout\ & (\Mux6~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Mux8~7_combout\,
	datac => \Mux6~4_combout\,
	datad => \Mux5~3_combout\,
	combout => \WideOr6~0_combout\);

-- Location: LCCOMB_X31_Y18_N26
\WideOr4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr4~0_combout\ = (\Mux8~7_combout\ & ((\Mux7~4_combout\) # (\Mux6~4_combout\ $ (!\Mux5~3_combout\)))) # (!\Mux8~7_combout\ & ((\Mux6~4_combout\ & ((\Mux5~3_combout\))) # (!\Mux6~4_combout\ & (\Mux7~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Mux8~7_combout\,
	datac => \Mux6~4_combout\,
	datad => \Mux5~3_combout\,
	combout => \WideOr4~0_combout\);

-- Location: LCCOMB_X31_Y18_N20
\WideOr2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr2~0_combout\ = (\Mux7~4_combout\ & (!\Mux5~3_combout\ & ((!\Mux6~4_combout\) # (!\Mux8~7_combout\)))) # (!\Mux7~4_combout\ & ((\Mux6~4_combout\ $ (\Mux5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux7~4_combout\,
	datab => \Mux8~7_combout\,
	datac => \Mux6~4_combout\,
	datad => \Mux5~3_combout\,
	combout => \WideOr2~0_combout\);

-- Location: LCCOMB_X32_Y18_N26
\Mux8~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~8_combout\ = (!\select_state.100~q\ & !\select_state.111~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \select_state.100~q\,
	datad => \select_state.111~q\,
	combout => \Mux8~8_combout\);

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


