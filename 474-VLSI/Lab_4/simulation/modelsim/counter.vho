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

-- DATE "04/28/2016 01:49:06"

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

ENTITY 	counter IS
    PORT (
	encoder0 : IN std_logic;
	encoder1 : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	lock : IN std_logic;
	segments : OUT std_logic_vector(6 DOWNTO 0);
	\select\ : OUT std_logic_vector(2 DOWNTO 0);
	button_clk : OUT std_logic;
	display_clk : OUT std_logic;
	pwm : OUT std_logic
	);
END counter;

-- Design Ports Information
-- lock	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[0]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[0]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[1]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[2]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button_clk	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_clk	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- encoder0	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- encoder1	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF counter IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_encoder0 : std_logic;
SIGNAL ww_encoder1 : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_lock : std_logic;
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL \ww_select\ : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_button_clk : std_logic;
SIGNAL ww_display_clk : std_logic;
SIGNAL ww_pwm : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \display_clk0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \lock~input_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \cnt[0]~10_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \digit_counter~5_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \digit_counter~4_combout\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \Add2~17\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \digit_counter~3_combout\ : std_logic;
SIGNAL \Add2~19\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \digit_counter~2_combout\ : std_logic;
SIGNAL \Add2~21\ : std_logic;
SIGNAL \Add2~22_combout\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \Add2~25\ : std_logic;
SIGNAL \Add2~26_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add2~27\ : std_logic;
SIGNAL \Add2~28_combout\ : std_logic;
SIGNAL \Add2~29\ : std_logic;
SIGNAL \Add2~30_combout\ : std_logic;
SIGNAL \digit_counter~1_combout\ : std_logic;
SIGNAL \Add2~31\ : std_logic;
SIGNAL \Add2~32_combout\ : std_logic;
SIGNAL \digit_counter~0_combout\ : std_logic;
SIGNAL \Add2~33\ : std_logic;
SIGNAL \Add2~34_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add2~35\ : std_logic;
SIGNAL \Add2~36_combout\ : std_logic;
SIGNAL \Add2~37\ : std_logic;
SIGNAL \Add2~38_combout\ : std_logic;
SIGNAL \Add2~39\ : std_logic;
SIGNAL \Add2~40_combout\ : std_logic;
SIGNAL \Add2~41\ : std_logic;
SIGNAL \Add2~42_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \digit_counter~6_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \encoder1~input_o\ : std_logic;
SIGNAL \encoder1_last[0]~feeder_combout\ : std_logic;
SIGNAL \encoder1_last[1]~feeder_combout\ : std_logic;
SIGNAL \encoder0~input_o\ : std_logic;
SIGNAL \encoder0_last[1]~feeder_combout\ : std_logic;
SIGNAL \encoder_turning~0_combout\ : std_logic;
SIGNAL \cnt[9]~12_combout\ : std_logic;
SIGNAL \cnt[9]~13_combout\ : std_logic;
SIGNAL \cnt[0]~11\ : std_logic;
SIGNAL \cnt[1]~14_combout\ : std_logic;
SIGNAL \cnt[1]~15\ : std_logic;
SIGNAL \cnt[2]~16_combout\ : std_logic;
SIGNAL \cnt[2]~17\ : std_logic;
SIGNAL \cnt[3]~18_combout\ : std_logic;
SIGNAL \cnt[3]~19\ : std_logic;
SIGNAL \cnt[4]~20_combout\ : std_logic;
SIGNAL \cnt[4]~21\ : std_logic;
SIGNAL \cnt[5]~22_combout\ : std_logic;
SIGNAL \cnt[5]~23\ : std_logic;
SIGNAL \cnt[6]~24_combout\ : std_logic;
SIGNAL \cnt[6]~25\ : std_logic;
SIGNAL \cnt[7]~26_combout\ : std_logic;
SIGNAL \cnt[7]~27\ : std_logic;
SIGNAL \cnt[8]~28_combout\ : std_logic;
SIGNAL \cnt[8]~29\ : std_logic;
SIGNAL \cnt[9]~30_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~57_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~56_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~58_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~59_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~61_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~60_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~63_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~62_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~64_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[23]~98_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~65_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~99_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~67_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~66_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~68_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~69_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[33]~37_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[33]~36_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[28]~94_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[28]~70_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~100_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[27]~71_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~72_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[26]~73_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~74_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[25]~75_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[30]~43_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[30]~42_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[38]~44_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[33]~95_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[33]~76_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[32]~101_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[32]~77_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[31]~79_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[31]~78_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[30]~81_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[30]~80_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[35]~48_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[35]~47_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[38]~82_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[38]~96_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[37]~102_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[37]~83_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[36]~84_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[36]~85_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[35]~86_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[35]~87_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[0]~10_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[43]~49_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[43]~58_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~7\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\ : std_logic;
SIGNAL \select_state.010~0_combout\ : std_logic;
SIGNAL \select_state.010~q\ : std_logic;
SIGNAL \select_state.100~q\ : std_logic;
SIGNAL \select_state.001~0_combout\ : std_logic;
SIGNAL \select_state.001~q\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[43]~88_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[43]~97_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[42]~103_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[42]~89_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[41]~91_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[41]~90_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[40]~93_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[40]~92_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~9\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[54]~55_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[54]~54_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[53]~57_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[53]~56_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[52]~58_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[52]~59_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[51]~60_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[51]~61_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[50]~63_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[50]~62_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[49]~65_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[49]~64_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~9\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[7]~11_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[62]~88_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[62]~66_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[61]~89_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[61]~67_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[60]~90_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[60]~68_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[59]~91_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[59]~69_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[58]~70_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[58]~71_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[57]~72_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[48]~74_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[48]~73_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[57]~75_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~9\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[7]~11_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[70]~76_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[70]~85_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[69]~86_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[69]~77_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[68]~87_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[68]~78_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[67]~79_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[67]~92_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[66]~80_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[66]~93_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[65]~81_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[56]~83_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[56]~82_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_8_result_int[1]~14_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|StageOut[65]~84_combout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[2]~1_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[3]~3_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[4]~5_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[5]~7_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[6]~9_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[7]~11_cout\ : std_logic;
SIGNAL \Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~7\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\ : std_logic;
SIGNAL \Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[15]~63_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[15]~62_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~56_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~57_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~64_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~98_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~68_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[20]~69_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~74_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[25]~75_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~70_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~94_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[33]~76_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[33]~95_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~81_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~80_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[38]~96_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[38]~82_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~87_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[35]~86_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~89_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[40]~88_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~97_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~90_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \segments~0_combout\ : std_logic;
SIGNAL \segments~1_combout\ : std_logic;
SIGNAL \Decoder1~0_combout\ : std_logic;
SIGNAL \WideOr6~0_combout\ : std_logic;
SIGNAL \WideOr4~0_combout\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \display_clk0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL encoder1_last : std_logic_vector(2 DOWNTO 0);
SIGNAL encoder0_last : std_logic_vector(2 DOWNTO 0);
SIGNAL \display_clk0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL digit_counter : std_logic_vector(21 DOWNTO 0);
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL cnt : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_WideOr1~0_combout\ : std_logic;
SIGNAL \ALT_INV_select_state.100~q\ : std_logic;

BEGIN

ww_encoder0 <= encoder0;
ww_encoder1 <= encoder1;
ww_clk <= clk;
ww_reset <= reset;
ww_lock <= lock;
segments <= ww_segments;
\select\ <= \ww_select\;
button_clk <= ww_button_clk;
display_clk <= ww_display_clk;
pwm <= ww_pwm;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\button_clk0|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\button_clk0|altpll_component|auto_generated|wire_pll1_clk\(0) <= \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\(0);
\button_clk0|altpll_component|auto_generated|wire_pll1_clk\(1) <= \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\(1);
\button_clk0|altpll_component|auto_generated|wire_pll1_clk\(2) <= \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\(2);
\button_clk0|altpll_component|auto_generated|wire_pll1_clk\(3) <= \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\(3);
\button_clk0|altpll_component|auto_generated|wire_pll1_clk\(4) <= \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\(4);

\display_clk0|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\display_clk0|altpll_component|auto_generated|wire_pll1_clk\(0) <= \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\(0);
\display_clk0|altpll_component|auto_generated|wire_pll1_clk\(1) <= \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\(1);
\display_clk0|altpll_component|auto_generated|wire_pll1_clk\(2) <= \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\(2);
\display_clk0|altpll_component|auto_generated|wire_pll1_clk\(3) <= \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\(3);
\display_clk0|altpll_component|auto_generated|wire_pll1_clk\(4) <= \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\(4);

\display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \display_clk0|altpll_component|auto_generated|wire_pll1_clk\(1));

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \button_clk0|altpll_component|auto_generated|wire_pll1_clk\(0));

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_WideOr1~0_combout\ <= NOT \WideOr1~0_combout\;
\ALT_INV_select_state.100~q\ <= NOT \select_state.100~q\;

-- Location: IOOBUF_X53_Y21_N23
\segments[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \segments~0_combout\,
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
	i => \segments~1_combout\,
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
	i => \Decoder1~0_combout\,
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
	i => \WideOr6~0_combout\,
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
	i => \WideOr4~0_combout\,
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
	i => \WideOr3~0_combout\,
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
	i => \ALT_INV_WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_segments(6));

-- Location: IOOBUF_X40_Y0_N23
\select[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_select_state.100~q\,
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
	i => \Selector5~2_combout\,
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
	i => \Selector4~0_combout\,
	devoe => ww_devoe,
	o => \ww_select\(2));

-- Location: IOOBUF_X49_Y0_N9
\button_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_button_clk);

-- Location: IOOBUF_X5_Y0_N23
\display_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
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

-- Location: CLKCTRL_G18
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

-- Location: LCCOMB_X40_Y19_N4
\cnt[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[0]~10_combout\ = cnt(0) $ (VCC)
-- \cnt[0]~11\ = CARRY(cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(0),
	datad => VCC,
	combout => \cnt[0]~10_combout\,
	cout => \cnt[0]~11\);

-- Location: LCCOMB_X39_Y19_N10
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = digit_counter(0) $ (GND)
-- \Add2~1\ = CARRY(!digit_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(0),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCCOMB_X39_Y19_N18
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (digit_counter(4) & (\Add2~7\ $ (GND))) # (!digit_counter(4) & (!\Add2~7\ & VCC))
-- \Add2~9\ = CARRY((digit_counter(4) & !\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(4),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: LCCOMB_X39_Y19_N20
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (digit_counter(5) & (!\Add2~9\)) # (!digit_counter(5) & ((\Add2~9\) # (GND)))
-- \Add2~11\ = CARRY((!\Add2~9\) # (!digit_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(5),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: LCCOMB_X39_Y19_N4
\digit_counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~5_combout\ = (\Add2~10_combout\ & !\Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~10_combout\,
	datad => \Equal0~6_combout\,
	combout => \digit_counter~5_combout\);

-- Location: FF_X39_Y19_N5
\digit_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(5));

-- Location: LCCOMB_X39_Y19_N22
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = (digit_counter(6) & (\Add2~11\ $ (GND))) # (!digit_counter(6) & (!\Add2~11\ & VCC))
-- \Add2~13\ = CARRY((digit_counter(6) & !\Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(6),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: FF_X39_Y19_N23
\digit_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(6));

-- Location: LCCOMB_X39_Y19_N24
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (digit_counter(7) & (!\Add2~13\)) # (!digit_counter(7) & ((\Add2~13\) # (GND)))
-- \Add2~15\ = CARRY((!\Add2~13\) # (!digit_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(7),
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X38_Y19_N2
\digit_counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~4_combout\ = (\Add2~14_combout\ & !\Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~14_combout\,
	datad => \Equal0~6_combout\,
	combout => \digit_counter~4_combout\);

-- Location: FF_X38_Y19_N3
\digit_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(7));

-- Location: LCCOMB_X39_Y19_N26
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = (digit_counter(8) & (\Add2~15\ $ (GND))) # (!digit_counter(8) & (!\Add2~15\ & VCC))
-- \Add2~17\ = CARRY((digit_counter(8) & !\Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(8),
	datad => VCC,
	cin => \Add2~15\,
	combout => \Add2~16_combout\,
	cout => \Add2~17\);

-- Location: FF_X39_Y19_N27
\digit_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(8));

-- Location: LCCOMB_X39_Y19_N28
\Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (digit_counter(9) & (!\Add2~17\)) # (!digit_counter(9) & ((\Add2~17\) # (GND)))
-- \Add2~19\ = CARRY((!\Add2~17\) # (!digit_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(9),
	datad => VCC,
	cin => \Add2~17\,
	combout => \Add2~18_combout\,
	cout => \Add2~19\);

-- Location: LCCOMB_X39_Y19_N0
\digit_counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~3_combout\ = (\Add2~18_combout\ & !\Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~18_combout\,
	datad => \Equal0~6_combout\,
	combout => \digit_counter~3_combout\);

-- Location: FF_X39_Y19_N1
\digit_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(9));

-- Location: LCCOMB_X39_Y19_N30
\Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = (digit_counter(10) & (\Add2~19\ $ (GND))) # (!digit_counter(10) & (!\Add2~19\ & VCC))
-- \Add2~21\ = CARRY((digit_counter(10) & !\Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(10),
	datad => VCC,
	cin => \Add2~19\,
	combout => \Add2~20_combout\,
	cout => \Add2~21\);

-- Location: LCCOMB_X38_Y19_N16
\digit_counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~2_combout\ = (\Add2~20_combout\ & !\Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~20_combout\,
	datad => \Equal0~6_combout\,
	combout => \digit_counter~2_combout\);

-- Location: FF_X38_Y19_N17
\digit_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(10));

-- Location: LCCOMB_X39_Y18_N0
\Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~22_combout\ = (digit_counter(11) & (!\Add2~21\)) # (!digit_counter(11) & ((\Add2~21\) # (GND)))
-- \Add2~23\ = CARRY((!\Add2~21\) # (!digit_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(11),
	datad => VCC,
	cin => \Add2~21\,
	combout => \Add2~22_combout\,
	cout => \Add2~23\);

-- Location: FF_X39_Y18_N1
\digit_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(11));

-- Location: LCCOMB_X39_Y18_N2
\Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = (digit_counter(12) & (\Add2~23\ $ (GND))) # (!digit_counter(12) & (!\Add2~23\ & VCC))
-- \Add2~25\ = CARRY((digit_counter(12) & !\Add2~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(12),
	datad => VCC,
	cin => \Add2~23\,
	combout => \Add2~24_combout\,
	cout => \Add2~25\);

-- Location: FF_X39_Y18_N3
\digit_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(12));

-- Location: LCCOMB_X39_Y18_N4
\Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~26_combout\ = (digit_counter(13) & (!\Add2~25\)) # (!digit_counter(13) & ((\Add2~25\) # (GND)))
-- \Add2~27\ = CARRY((!\Add2~25\) # (!digit_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(13),
	datad => VCC,
	cin => \Add2~25\,
	combout => \Add2~26_combout\,
	cout => \Add2~27\);

-- Location: FF_X39_Y18_N5
\digit_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(13));

-- Location: LCCOMB_X39_Y18_N26
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (digit_counter(10) & (!digit_counter(12) & (!digit_counter(13) & !digit_counter(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(10),
	datab => digit_counter(12),
	datac => digit_counter(13),
	datad => digit_counter(11),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X39_Y18_N6
\Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~28_combout\ = (digit_counter(14) & (\Add2~27\ $ (GND))) # (!digit_counter(14) & (!\Add2~27\ & VCC))
-- \Add2~29\ = CARRY((digit_counter(14) & !\Add2~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(14),
	datad => VCC,
	cin => \Add2~27\,
	combout => \Add2~28_combout\,
	cout => \Add2~29\);

-- Location: FF_X39_Y18_N7
\digit_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(14));

-- Location: LCCOMB_X39_Y18_N8
\Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~30_combout\ = (digit_counter(15) & (!\Add2~29\)) # (!digit_counter(15) & ((\Add2~29\) # (GND)))
-- \Add2~31\ = CARRY((!\Add2~29\) # (!digit_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(15),
	datad => VCC,
	cin => \Add2~29\,
	combout => \Add2~30_combout\,
	cout => \Add2~31\);

-- Location: LCCOMB_X38_Y18_N6
\digit_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~1_combout\ = (\Add2~30_combout\ & !\Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~30_combout\,
	datac => \Equal0~6_combout\,
	combout => \digit_counter~1_combout\);

-- Location: FF_X38_Y18_N7
\digit_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(15));

-- Location: LCCOMB_X39_Y18_N10
\Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~32_combout\ = (digit_counter(16) & (\Add2~31\ $ (GND))) # (!digit_counter(16) & (!\Add2~31\ & VCC))
-- \Add2~33\ = CARRY((digit_counter(16) & !\Add2~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(16),
	datad => VCC,
	cin => \Add2~31\,
	combout => \Add2~32_combout\,
	cout => \Add2~33\);

-- Location: LCCOMB_X39_Y18_N24
\digit_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~0_combout\ = (\Add2~32_combout\ & !\Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~32_combout\,
	datac => \Equal0~6_combout\,
	combout => \digit_counter~0_combout\);

-- Location: FF_X39_Y18_N25
\digit_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(16));

-- Location: LCCOMB_X39_Y18_N12
\Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~34_combout\ = (digit_counter(17) & (!\Add2~33\)) # (!digit_counter(17) & ((\Add2~33\) # (GND)))
-- \Add2~35\ = CARRY((!\Add2~33\) # (!digit_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(17),
	datad => VCC,
	cin => \Add2~33\,
	combout => \Add2~34_combout\,
	cout => \Add2~35\);

-- Location: FF_X39_Y18_N13
\digit_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(17));

-- Location: LCCOMB_X38_Y18_N14
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (digit_counter(15) & (digit_counter(16) & (!digit_counter(17) & !digit_counter(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(15),
	datab => digit_counter(16),
	datac => digit_counter(17),
	datad => digit_counter(14),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X39_Y18_N14
\Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~36_combout\ = (digit_counter(18) & (\Add2~35\ $ (GND))) # (!digit_counter(18) & (!\Add2~35\ & VCC))
-- \Add2~37\ = CARRY((digit_counter(18) & !\Add2~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(18),
	datad => VCC,
	cin => \Add2~35\,
	combout => \Add2~36_combout\,
	cout => \Add2~37\);

-- Location: FF_X39_Y18_N15
\digit_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(18));

-- Location: LCCOMB_X39_Y18_N16
\Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~38_combout\ = (digit_counter(19) & (!\Add2~37\)) # (!digit_counter(19) & ((\Add2~37\) # (GND)))
-- \Add2~39\ = CARRY((!\Add2~37\) # (!digit_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(19),
	datad => VCC,
	cin => \Add2~37\,
	combout => \Add2~38_combout\,
	cout => \Add2~39\);

-- Location: FF_X39_Y18_N17
\digit_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(19));

-- Location: LCCOMB_X39_Y18_N18
\Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~40_combout\ = (digit_counter(20) & (\Add2~39\ $ (GND))) # (!digit_counter(20) & (!\Add2~39\ & VCC))
-- \Add2~41\ = CARRY((digit_counter(20) & !\Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(20),
	datad => VCC,
	cin => \Add2~39\,
	combout => \Add2~40_combout\,
	cout => \Add2~41\);

-- Location: FF_X39_Y18_N19
\digit_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(20));

-- Location: LCCOMB_X39_Y18_N20
\Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~42_combout\ = \Add2~41\ $ (digit_counter(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => digit_counter(21),
	cin => \Add2~41\,
	combout => \Add2~42_combout\);

-- Location: FF_X39_Y18_N21
\digit_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(21));

-- Location: LCCOMB_X39_Y18_N30
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!digit_counter(20) & (!digit_counter(21) & (!digit_counter(18) & !digit_counter(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(20),
	datab => digit_counter(21),
	datac => digit_counter(18),
	datad => digit_counter(19),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X39_Y19_N2
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!digit_counter(8) & (digit_counter(9) & (!digit_counter(6) & digit_counter(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(8),
	datab => digit_counter(9),
	datac => digit_counter(6),
	datad => digit_counter(7),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X39_Y18_N28
\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~2_combout\ & (\Equal0~1_combout\ & (\Equal0~0_combout\ & \Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X40_Y19_N30
\Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!digit_counter(1) & (\Equal0~4_combout\ & (digit_counter(0) & \Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(1),
	datab => \Equal0~4_combout\,
	datac => digit_counter(0),
	datad => \Equal0~5_combout\,
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X38_Y19_N12
\digit_counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \digit_counter~6_combout\ = (\Equal0~6_combout\) # (!\Add2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~0_combout\,
	datad => \Equal0~6_combout\,
	combout => \digit_counter~6_combout\);

-- Location: FF_X38_Y19_N13
\digit_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \digit_counter~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(0));

-- Location: LCCOMB_X39_Y19_N12
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (digit_counter(1) & (!\Add2~1\)) # (!digit_counter(1) & ((\Add2~1\) # (GND)))
-- \Add2~3\ = CARRY((!\Add2~1\) # (!digit_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(1),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: FF_X39_Y19_N13
\digit_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(1));

-- Location: LCCOMB_X39_Y19_N14
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (digit_counter(2) & (\Add2~3\ $ (GND))) # (!digit_counter(2) & (!\Add2~3\ & VCC))
-- \Add2~5\ = CARRY((digit_counter(2) & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(2),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: FF_X39_Y19_N15
\digit_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(2));

-- Location: LCCOMB_X39_Y19_N16
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (digit_counter(3) & (!\Add2~5\)) # (!digit_counter(3) & ((\Add2~5\) # (GND)))
-- \Add2~7\ = CARRY((!\Add2~5\) # (!digit_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => digit_counter(3),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: FF_X39_Y19_N17
\digit_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(3));

-- Location: FF_X39_Y19_N19
\digit_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Add2~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => digit_counter(4));

-- Location: LCCOMB_X39_Y19_N6
\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!digit_counter(4) & (!digit_counter(2) & (digit_counter(5) & !digit_counter(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(4),
	datab => digit_counter(2),
	datac => digit_counter(5),
	datad => digit_counter(3),
	combout => \Equal0~5_combout\);

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

-- Location: LCCOMB_X43_Y18_N0
\encoder1_last[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder1_last[0]~feeder_combout\ = \encoder1~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \encoder1~input_o\,
	combout => \encoder1_last[0]~feeder_combout\);

-- Location: FF_X43_Y18_N1
\encoder1_last[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoder1_last[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder1_last(0));

-- Location: LCCOMB_X40_Y19_N0
\encoder1_last[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder1_last[1]~feeder_combout\ = encoder1_last(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => encoder1_last(0),
	combout => \encoder1_last[1]~feeder_combout\);

-- Location: FF_X40_Y19_N1
\encoder1_last[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoder1_last[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder1_last(1));

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

-- Location: FF_X40_Y19_N3
\encoder0_last[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \encoder0~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder0_last(0));

-- Location: LCCOMB_X40_Y19_N26
\encoder0_last[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder0_last[1]~feeder_combout\ = encoder0_last(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => encoder0_last(0),
	combout => \encoder0_last[1]~feeder_combout\);

-- Location: FF_X40_Y19_N27
\encoder0_last[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoder0_last[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder0_last(1));

-- Location: FF_X40_Y19_N25
\encoder0_last[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => encoder0_last(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder0_last(2));

-- Location: FF_X39_Y19_N9
\encoder1_last[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => encoder1_last(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder1_last(2));

-- Location: LCCOMB_X39_Y19_N8
\encoder_turning~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_turning~0_combout\ = encoder1_last(2) $ (encoder0_last(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => encoder1_last(2),
	datad => encoder0_last(1),
	combout => \encoder_turning~0_combout\);

-- Location: LCCOMB_X40_Y19_N24
\cnt[9]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[9]~12_combout\ = (!digit_counter(1) & (encoder1_last(1) $ (encoder0_last(2) $ (\encoder_turning~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => digit_counter(1),
	datab => encoder1_last(1),
	datac => encoder0_last(2),
	datad => \encoder_turning~0_combout\,
	combout => \cnt[9]~12_combout\);

-- Location: LCCOMB_X40_Y19_N28
\cnt[9]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[9]~13_combout\ = (\Equal0~5_combout\ & (\Equal0~4_combout\ & (digit_counter(0) & \cnt[9]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \Equal0~4_combout\,
	datac => digit_counter(0),
	datad => \cnt[9]~12_combout\,
	combout => \cnt[9]~13_combout\);

-- Location: FF_X40_Y19_N5
\cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[0]~10_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(0));

-- Location: LCCOMB_X40_Y19_N6
\cnt[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[1]~14_combout\ = (\encoder_turning~0_combout\ & ((cnt(1) & (!\cnt[0]~11\)) # (!cnt(1) & ((\cnt[0]~11\) # (GND))))) # (!\encoder_turning~0_combout\ & ((cnt(1) & (\cnt[0]~11\ & VCC)) # (!cnt(1) & (!\cnt[0]~11\))))
-- \cnt[1]~15\ = CARRY((\encoder_turning~0_combout\ & ((!\cnt[0]~11\) # (!cnt(1)))) # (!\encoder_turning~0_combout\ & (!cnt(1) & !\cnt[0]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(1),
	datad => VCC,
	cin => \cnt[0]~11\,
	combout => \cnt[1]~14_combout\,
	cout => \cnt[1]~15\);

-- Location: FF_X40_Y19_N7
\cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[1]~14_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(1));

-- Location: LCCOMB_X40_Y19_N8
\cnt[2]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[2]~16_combout\ = ((\encoder_turning~0_combout\ $ (cnt(2) $ (\cnt[1]~15\)))) # (GND)
-- \cnt[2]~17\ = CARRY((\encoder_turning~0_combout\ & (cnt(2) & !\cnt[1]~15\)) # (!\encoder_turning~0_combout\ & ((cnt(2)) # (!\cnt[1]~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(2),
	datad => VCC,
	cin => \cnt[1]~15\,
	combout => \cnt[2]~16_combout\,
	cout => \cnt[2]~17\);

-- Location: FF_X40_Y19_N9
\cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[2]~16_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(2));

-- Location: LCCOMB_X40_Y19_N10
\cnt[3]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[3]~18_combout\ = (\encoder_turning~0_combout\ & ((cnt(3) & (!\cnt[2]~17\)) # (!cnt(3) & ((\cnt[2]~17\) # (GND))))) # (!\encoder_turning~0_combout\ & ((cnt(3) & (\cnt[2]~17\ & VCC)) # (!cnt(3) & (!\cnt[2]~17\))))
-- \cnt[3]~19\ = CARRY((\encoder_turning~0_combout\ & ((!\cnt[2]~17\) # (!cnt(3)))) # (!\encoder_turning~0_combout\ & (!cnt(3) & !\cnt[2]~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(3),
	datad => VCC,
	cin => \cnt[2]~17\,
	combout => \cnt[3]~18_combout\,
	cout => \cnt[3]~19\);

-- Location: FF_X40_Y19_N11
\cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[3]~18_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(3));

-- Location: LCCOMB_X40_Y19_N12
\cnt[4]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[4]~20_combout\ = ((\encoder_turning~0_combout\ $ (cnt(4) $ (\cnt[3]~19\)))) # (GND)
-- \cnt[4]~21\ = CARRY((\encoder_turning~0_combout\ & (cnt(4) & !\cnt[3]~19\)) # (!\encoder_turning~0_combout\ & ((cnt(4)) # (!\cnt[3]~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(4),
	datad => VCC,
	cin => \cnt[3]~19\,
	combout => \cnt[4]~20_combout\,
	cout => \cnt[4]~21\);

-- Location: FF_X40_Y19_N13
\cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[4]~20_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(4));

-- Location: LCCOMB_X40_Y19_N14
\cnt[5]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[5]~22_combout\ = (\encoder_turning~0_combout\ & ((cnt(5) & (!\cnt[4]~21\)) # (!cnt(5) & ((\cnt[4]~21\) # (GND))))) # (!\encoder_turning~0_combout\ & ((cnt(5) & (\cnt[4]~21\ & VCC)) # (!cnt(5) & (!\cnt[4]~21\))))
-- \cnt[5]~23\ = CARRY((\encoder_turning~0_combout\ & ((!\cnt[4]~21\) # (!cnt(5)))) # (!\encoder_turning~0_combout\ & (!cnt(5) & !\cnt[4]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(5),
	datad => VCC,
	cin => \cnt[4]~21\,
	combout => \cnt[5]~22_combout\,
	cout => \cnt[5]~23\);

-- Location: FF_X40_Y19_N15
\cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[5]~22_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(5));

-- Location: LCCOMB_X40_Y19_N16
\cnt[6]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[6]~24_combout\ = ((\encoder_turning~0_combout\ $ (cnt(6) $ (\cnt[5]~23\)))) # (GND)
-- \cnt[6]~25\ = CARRY((\encoder_turning~0_combout\ & (cnt(6) & !\cnt[5]~23\)) # (!\encoder_turning~0_combout\ & ((cnt(6)) # (!\cnt[5]~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(6),
	datad => VCC,
	cin => \cnt[5]~23\,
	combout => \cnt[6]~24_combout\,
	cout => \cnt[6]~25\);

-- Location: FF_X40_Y19_N17
\cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[6]~24_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(6));

-- Location: LCCOMB_X40_Y19_N18
\cnt[7]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[7]~26_combout\ = (\encoder_turning~0_combout\ & ((cnt(7) & (!\cnt[6]~25\)) # (!cnt(7) & ((\cnt[6]~25\) # (GND))))) # (!\encoder_turning~0_combout\ & ((cnt(7) & (\cnt[6]~25\ & VCC)) # (!cnt(7) & (!\cnt[6]~25\))))
-- \cnt[7]~27\ = CARRY((\encoder_turning~0_combout\ & ((!\cnt[6]~25\) # (!cnt(7)))) # (!\encoder_turning~0_combout\ & (!cnt(7) & !\cnt[6]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(7),
	datad => VCC,
	cin => \cnt[6]~25\,
	combout => \cnt[7]~26_combout\,
	cout => \cnt[7]~27\);

-- Location: FF_X40_Y19_N19
\cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[7]~26_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(7));

-- Location: LCCOMB_X40_Y19_N20
\cnt[8]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[8]~28_combout\ = ((\encoder_turning~0_combout\ $ (cnt(8) $ (\cnt[7]~27\)))) # (GND)
-- \cnt[8]~29\ = CARRY((\encoder_turning~0_combout\ & (cnt(8) & !\cnt[7]~27\)) # (!\encoder_turning~0_combout\ & ((cnt(8)) # (!\cnt[7]~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~0_combout\,
	datab => cnt(8),
	datad => VCC,
	cin => \cnt[7]~27\,
	combout => \cnt[8]~28_combout\,
	cout => \cnt[8]~29\);

-- Location: FF_X40_Y19_N21
\cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[8]~28_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(8));

-- Location: LCCOMB_X40_Y19_N22
\cnt[9]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[9]~30_combout\ = cnt(9) $ (\cnt[8]~29\ $ (!\encoder_turning~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(9),
	datad => \encoder_turning~0_combout\,
	cin => \cnt[8]~29\,
	combout => \cnt[9]~30_combout\);

-- Location: FF_X40_Y19_N23
\cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cnt[9]~30_combout\,
	ena => \cnt[9]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(9));

-- Location: LCCOMB_X38_Y21_N18
\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = cnt(7) $ (VCC)
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(7),
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X38_Y21_N20
\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (cnt(8) & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!cnt(8) & (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!cnt(8) & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(8),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X38_Y21_N22
\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (cnt(9) & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!cnt(9) & (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((cnt(9) & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cnt(9),
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X38_Y21_N24
\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X38_Y21_N26
\Div0|auto_generated|divider|divider|StageOut[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~57_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~57_combout\);

-- Location: LCCOMB_X38_Y21_N0
\Div0|auto_generated|divider|divider|StageOut[18]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~56_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => cnt(9),
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~56_combout\);

-- Location: LCCOMB_X38_Y21_N30
\Div0|auto_generated|divider|divider|StageOut[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~58_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => cnt(8),
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~58_combout\);

-- Location: LCCOMB_X38_Y21_N16
\Div0|auto_generated|divider|divider|StageOut[17]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~59_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~59_combout\);

-- Location: LCCOMB_X38_Y21_N28
\Div0|auto_generated|divider|divider|StageOut[16]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~61_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~61_combout\);

-- Location: LCCOMB_X38_Y21_N2
\Div0|auto_generated|divider|divider|StageOut[16]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~60_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => cnt(7),
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~60_combout\);

-- Location: LCCOMB_X37_Y21_N16
\Div0|auto_generated|divider|divider|StageOut[15]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~63_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => cnt(6),
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~63_combout\);

-- Location: LCCOMB_X40_Y21_N24
\Div0|auto_generated|divider|divider|StageOut[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~62_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => cnt(6),
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~62_combout\);

-- Location: LCCOMB_X38_Y21_N4
\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[15]~63_combout\) # (\Div0|auto_generated|divider|divider|StageOut[15]~62_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[15]~63_combout\) # (\Div0|auto_generated|divider|divider|StageOut[15]~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[15]~63_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[15]~62_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X38_Y21_N6
\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[16]~61_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[16]~60_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[16]~61_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[16]~60_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[16]~61_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[16]~60_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[16]~61_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[16]~60_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X38_Y21_N8
\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[17]~58_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~59_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[17]~58_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~59_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[17]~58_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[17]~59_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[17]~58_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[17]~59_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X38_Y21_N10
\Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[18]~57_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[18]~56_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[18]~57_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[18]~56_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X38_Y21_N12
\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X39_Y21_N26
\Div0|auto_generated|divider|divider|StageOut[23]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~64_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~64_combout\);

-- Location: LCCOMB_X40_Y21_N8
\Div0|auto_generated|divider|divider|StageOut[23]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[23]~98_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (cnt(8))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => cnt(8),
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[23]~98_combout\);

-- Location: LCCOMB_X40_Y21_N26
\Div0|auto_generated|divider|divider|StageOut[22]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~65_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~65_combout\);

-- Location: LCCOMB_X38_Y21_N14
\Div0|auto_generated|divider|divider|StageOut[22]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~99_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((cnt(7)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => cnt(7),
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~99_combout\);

-- Location: LCCOMB_X37_Y21_N26
\Div0|auto_generated|divider|divider|StageOut[21]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~67_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~67_combout\);

-- Location: LCCOMB_X40_Y21_N28
\Div0|auto_generated|divider|divider|StageOut[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~66_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => cnt(6),
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~66_combout\);

-- Location: LCCOMB_X40_Y21_N30
\Div0|auto_generated|divider|divider|StageOut[20]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~68_combout\ = (cnt(5) & \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(5),
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~68_combout\);

-- Location: LCCOMB_X40_Y21_N0
\Div0|auto_generated|divider|divider|StageOut[20]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~69_combout\ = (cnt(5) & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(5),
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~69_combout\);

-- Location: LCCOMB_X40_Y21_N12
\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[20]~68_combout\) # (\Div0|auto_generated|divider|divider|StageOut[20]~69_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[20]~68_combout\) # (\Div0|auto_generated|divider|divider|StageOut[20]~69_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[20]~68_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[20]~69_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X40_Y21_N14
\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[21]~67_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[21]~66_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[21]~67_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[21]~66_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[21]~67_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[21]~66_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[21]~67_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[21]~66_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X40_Y21_N16
\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[22]~65_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~99_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[22]~65_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~99_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[22]~65_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[22]~99_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[22]~65_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[22]~99_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X40_Y21_N18
\Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[23]~64_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[23]~98_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[23]~64_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[23]~98_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X40_Y21_N20
\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X37_Y20_N14
\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ (GND)
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY(!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

-- Location: LCCOMB_X37_Y20_N16
\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & VCC))
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

-- Location: LCCOMB_X37_Y20_N18
\Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & VCC)) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ $ (GND)))
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

-- Location: LCCOMB_X37_Y20_N20
\Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY(!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

-- Location: LCCOMB_X37_Y20_N22
\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\);

-- Location: LCCOMB_X37_Y20_N24
\Mod1|auto_generated|divider|divider|StageOut[33]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[33]~37_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[33]~37_combout\);

-- Location: LCCOMB_X38_Y20_N16
\Mod1|auto_generated|divider|divider|StageOut[33]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[33]~36_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[33]~36_combout\);

-- Location: LCCOMB_X37_Y21_N20
\Mod1|auto_generated|divider|divider|StageOut[32]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\);

-- Location: LCCOMB_X36_Y20_N30
\Mod1|auto_generated|divider|divider|StageOut[32]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\);

-- Location: LCCOMB_X37_Y20_N12
\Mod1|auto_generated|divider|divider|StageOut[31]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\);

-- Location: LCCOMB_X37_Y20_N0
\Mod1|auto_generated|divider|divider|StageOut[31]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\);

-- Location: LCCOMB_X40_Y21_N22
\Div0|auto_generated|divider|divider|StageOut[28]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[28]~94_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[22]~99_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[22]~99_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[28]~94_combout\);

-- Location: LCCOMB_X40_Y21_N10
\Div0|auto_generated|divider|divider|StageOut[28]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[28]~70_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[28]~70_combout\);

-- Location: LCCOMB_X37_Y21_N6
\Div0|auto_generated|divider|divider|StageOut[27]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~100_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((cnt(6)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => cnt(6),
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~100_combout\);

-- Location: LCCOMB_X36_Y21_N24
\Div0|auto_generated|divider|divider|StageOut[27]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[27]~71_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[27]~71_combout\);

-- Location: LCCOMB_X36_Y21_N10
\Div0|auto_generated|divider|divider|StageOut[26]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[26]~72_combout\ = (\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & cnt(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => cnt(5),
	combout => \Div0|auto_generated|divider|divider|StageOut[26]~72_combout\);

-- Location: LCCOMB_X36_Y21_N28
\Div0|auto_generated|divider|divider|StageOut[26]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[26]~73_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[26]~73_combout\);

-- Location: LCCOMB_X36_Y21_N30
\Div0|auto_generated|divider|divider|StageOut[25]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~74_combout\ = (cnt(4) & \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(4),
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~74_combout\);

-- Location: LCCOMB_X36_Y21_N8
\Div0|auto_generated|divider|divider|StageOut[25]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[25]~75_combout\ = (cnt(4) & !\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(4),
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[25]~75_combout\);

-- Location: LCCOMB_X36_Y21_N14
\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[25]~74_combout\) # (\Div0|auto_generated|divider|divider|StageOut[25]~75_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[25]~74_combout\) # (\Div0|auto_generated|divider|divider|StageOut[25]~75_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[25]~74_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[25]~75_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

-- Location: LCCOMB_X36_Y21_N16
\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[26]~72_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[26]~73_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[26]~72_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[26]~73_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[26]~72_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[26]~73_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[26]~72_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[26]~73_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

-- Location: LCCOMB_X36_Y21_N18
\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[27]~100_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[27]~71_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[27]~100_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[27]~71_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[27]~100_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[27]~71_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[27]~100_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[27]~71_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

-- Location: LCCOMB_X36_Y21_N20
\Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[28]~94_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[28]~70_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[28]~94_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[28]~70_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

-- Location: LCCOMB_X36_Y21_N22
\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\);

-- Location: LCCOMB_X37_Y17_N0
\Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\);

-- Location: LCCOMB_X37_Y20_N26
\Mod1|auto_generated|divider|divider|StageOut[30]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[30]~43_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[30]~43_combout\);

-- Location: LCCOMB_X36_Y20_N24
\Mod1|auto_generated|divider|divider|StageOut[30]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[30]~42_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[30]~42_combout\);

-- Location: LCCOMB_X37_Y20_N2
\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[30]~43_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[30]~42_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[30]~43_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[30]~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[30]~43_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[30]~42_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\);

-- Location: LCCOMB_X37_Y20_N4
\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[31]~40_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[31]~41_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\);

-- Location: LCCOMB_X37_Y20_N6
\Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[32]~38_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[32]~39_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\);

-- Location: LCCOMB_X37_Y20_N8
\Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[33]~37_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[33]~36_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[33]~37_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[33]~36_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\);

-- Location: LCCOMB_X37_Y20_N10
\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\);

-- Location: LCCOMB_X37_Y20_N28
\Mod1|auto_generated|divider|divider|StageOut[38]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & 
-- ((!\Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\);

-- Location: LCCOMB_X37_Y17_N14
\Mod1|auto_generated|divider|divider|StageOut[38]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[38]~44_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[38]~44_combout\);

-- Location: LCCOMB_X37_Y17_N24
\Mod1|auto_generated|divider|divider|StageOut[37]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\);

-- Location: LCCOMB_X37_Y20_N30
\Mod1|auto_generated|divider|divider|StageOut[37]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & 
-- ((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\);

-- Location: LCCOMB_X37_Y17_N18
\Mod1|auto_generated|divider|divider|StageOut[36]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\);

-- Location: LCCOMB_X37_Y17_N20
\Mod1|auto_generated|divider|divider|StageOut[36]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\)) # (!\Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[0]~10_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\);

-- Location: LCCOMB_X36_Y21_N12
\Div0|auto_generated|divider|divider|StageOut[33]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[33]~95_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[27]~100_combout\) # 
-- ((!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[27]~100_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[33]~95_combout\);

-- Location: LCCOMB_X36_Y21_N2
\Div0|auto_generated|divider|divider|StageOut[33]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[33]~76_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[33]~76_combout\);

-- Location: LCCOMB_X36_Y21_N0
\Div0|auto_generated|divider|divider|StageOut[32]~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[32]~101_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((cnt(5)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datab => cnt(5),
	datac => \Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[32]~101_combout\);

-- Location: LCCOMB_X36_Y20_N16
\Div0|auto_generated|divider|divider|StageOut[32]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[32]~77_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[32]~77_combout\);

-- Location: LCCOMB_X36_Y20_N22
\Div0|auto_generated|divider|divider|StageOut[31]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[31]~79_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[31]~79_combout\);

-- Location: LCCOMB_X36_Y20_N2
\Div0|auto_generated|divider|divider|StageOut[31]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[31]~78_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & cnt(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(4),
	combout => \Div0|auto_generated|divider|divider|StageOut[31]~78_combout\);

-- Location: LCCOMB_X36_Y20_N26
\Div0|auto_generated|divider|divider|StageOut[30]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[30]~81_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(3),
	combout => \Div0|auto_generated|divider|divider|StageOut[30]~81_combout\);

-- Location: LCCOMB_X36_Y20_N0
\Div0|auto_generated|divider|divider|StageOut[30]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[30]~80_combout\ = (\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(3),
	combout => \Div0|auto_generated|divider|divider|StageOut[30]~80_combout\);

-- Location: LCCOMB_X36_Y20_N4
\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[30]~81_combout\) # (\Div0|auto_generated|divider|divider|StageOut[30]~80_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[30]~81_combout\) # (\Div0|auto_generated|divider|divider|StageOut[30]~80_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[30]~81_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[30]~80_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\);

-- Location: LCCOMB_X36_Y20_N6
\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[31]~79_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[31]~78_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[31]~79_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[31]~78_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[31]~79_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[31]~78_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[31]~79_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[31]~78_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\);

-- Location: LCCOMB_X36_Y20_N8
\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[32]~77_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[32]~77_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[32]~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[32]~101_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[32]~77_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\);

-- Location: LCCOMB_X36_Y20_N10
\Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[33]~95_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[33]~76_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[33]~95_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[33]~76_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\);

-- Location: LCCOMB_X36_Y20_N12
\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\);

-- Location: LCCOMB_X37_Y17_N28
\Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\);

-- Location: LCCOMB_X37_Y17_N22
\Mod1|auto_generated|divider|divider|StageOut[35]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[35]~48_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[35]~48_combout\);

-- Location: LCCOMB_X37_Y17_N12
\Mod1|auto_generated|divider|divider|StageOut[35]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[35]~47_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[35]~47_combout\);

-- Location: LCCOMB_X37_Y17_N2
\Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[35]~48_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[35]~47_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[35]~48_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[35]~47_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[35]~48_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[35]~47_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\);

-- Location: LCCOMB_X37_Y17_N4
\Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (((\Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (!\Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[36]~46_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\);

-- Location: LCCOMB_X37_Y17_N6
\Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((((\Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((\Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[37]~45_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~5\);

-- Location: LCCOMB_X37_Y17_N8
\Mod1|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[38]~44_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[38]~60_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[38]~44_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~5\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\);

-- Location: LCCOMB_X37_Y17_N10
\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ = \Mod1|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\);

-- Location: LCCOMB_X37_Y17_N30
\Mod1|auto_generated|divider|divider|StageOut[41]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & 
-- ((!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\))) # (!\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[0]~10_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\);

-- Location: LCCOMB_X36_Y17_N8
\Mod1|auto_generated|divider|divider|StageOut[41]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\);

-- Location: LCCOMB_X36_Y19_N16
\Div0|auto_generated|divider|divider|StageOut[38]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[38]~82_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[38]~82_combout\);

-- Location: LCCOMB_X36_Y20_N18
\Div0|auto_generated|divider|divider|StageOut[38]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[38]~96_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[32]~101_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[38]~96_combout\);

-- Location: LCCOMB_X36_Y20_N28
\Div0|auto_generated|divider|divider|StageOut[37]~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[37]~102_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((cnt(4)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(4),
	combout => \Div0|auto_generated|divider|divider|StageOut[37]~102_combout\);

-- Location: LCCOMB_X36_Y19_N2
\Div0|auto_generated|divider|divider|StageOut[37]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[37]~83_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[37]~83_combout\);

-- Location: LCCOMB_X37_Y19_N26
\Div0|auto_generated|divider|divider|StageOut[36]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[36]~84_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => cnt(3),
	combout => \Div0|auto_generated|divider|divider|StageOut[36]~84_combout\);

-- Location: LCCOMB_X36_Y20_N20
\Div0|auto_generated|divider|divider|StageOut[36]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[36]~85_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[36]~85_combout\);

-- Location: LCCOMB_X37_Y19_N12
\Div0|auto_generated|divider|divider|StageOut[35]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[35]~86_combout\ = (\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => cnt(2),
	combout => \Div0|auto_generated|divider|divider|StageOut[35]~86_combout\);

-- Location: LCCOMB_X37_Y19_N30
\Div0|auto_generated|divider|divider|StageOut[35]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[35]~87_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => cnt(2),
	combout => \Div0|auto_generated|divider|divider|StageOut[35]~87_combout\);

-- Location: LCCOMB_X37_Y19_N0
\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ = (((\Div0|auto_generated|divider|divider|StageOut[35]~86_combout\) # (\Div0|auto_generated|divider|divider|StageOut[35]~87_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[35]~86_combout\) # (\Div0|auto_generated|divider|divider|StageOut[35]~87_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[35]~86_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[35]~87_combout\,
	datad => VCC,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\);

-- Location: LCCOMB_X37_Y19_N2
\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (((\Div0|auto_generated|divider|divider|StageOut[36]~84_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[36]~85_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (!\Div0|auto_generated|divider|divider|StageOut[36]~84_combout\ & 
-- (!\Div0|auto_generated|divider|divider|StageOut[36]~85_combout\)))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[36]~84_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[36]~85_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[36]~84_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[36]~85_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\);

-- Location: LCCOMB_X37_Y19_N4
\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & (((\Div0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[37]~83_combout\)))) # (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((((\Div0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[37]~83_combout\)))))
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((\Div0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[37]~83_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[37]~102_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[37]~83_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\);

-- Location: LCCOMB_X37_Y19_N6
\Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[38]~82_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[38]~96_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[38]~82_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[38]~96_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\,
	cout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\);

-- Location: LCCOMB_X37_Y19_N8
\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\);

-- Location: LCCOMB_X36_Y17_N26
\Mod1|auto_generated|divider|divider|StageOut[40]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\);

-- Location: LCCOMB_X36_Y17_N2
\Mod1|auto_generated|divider|divider|add_sub_8_result_int[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_8_result_int[0]~10_combout\ = !\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[0]~10_combout\);

-- Location: LCCOMB_X36_Y17_N6
\Mod1|auto_generated|divider|divider|StageOut[40]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_8_result_int[0]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[0]~10_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\);

-- Location: LCCOMB_X36_Y17_N12
\Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\);

-- Location: LCCOMB_X36_Y17_N14
\Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ & (!\Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\);

-- Location: LCCOMB_X36_Y17_N28
\Mod1|auto_generated|divider|divider|StageOut[43]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[43]~49_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[43]~49_combout\);

-- Location: LCCOMB_X37_Y17_N16
\Mod1|auto_generated|divider|divider|StageOut[43]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[43]~58_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[37]~61_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[43]~58_combout\);

-- Location: LCCOMB_X36_Y17_N30
\Mod1|auto_generated|divider|divider|StageOut[42]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\);

-- Location: LCCOMB_X37_Y17_N26
\Mod1|auto_generated|divider|divider|StageOut[42]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[36]~62_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\);

-- Location: LCCOMB_X36_Y17_N16
\Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ & (((\Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ & ((((\Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~7\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ & ((\Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~7\);

-- Location: LCCOMB_X36_Y17_N18
\Mod1|auto_generated|divider|divider|add_sub_9_result_int[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[43]~49_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[43]~58_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[43]~49_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[43]~58_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~7\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\);

-- Location: LCCOMB_X36_Y17_N20
\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ = \Mod1|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\);

-- Location: LCCOMB_X36_Y17_N22
\Mod1|auto_generated|divider|divider|StageOut[47]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (((\Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[41]~63_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[41]~51_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\);

-- Location: LCCOMB_X38_Y18_N30
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

-- Location: FF_X38_Y18_N31
\select_state.010\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \select_state.010~0_combout\,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.010~q\);

-- Location: FF_X38_Y18_N21
\select_state.100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \select_state.010~q\,
	sload => VCC,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.100~q\);

-- Location: LCCOMB_X38_Y18_N2
\select_state.001~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \select_state.001~0_combout\ = !\select_state.100~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \select_state.100~q\,
	combout => \select_state.001~0_combout\);

-- Location: FF_X38_Y18_N3
\select_state.001\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \select_state.001~0_combout\,
	ena => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.001~q\);

-- Location: LCCOMB_X36_Y17_N4
\Mod1|auto_generated|divider|divider|StageOut[48]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (((\Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[42]~50_combout\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[42]~59_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\);

-- Location: LCCOMB_X36_Y17_N10
\Mod1|auto_generated|divider|divider|StageOut[46]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((\Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\) # 
-- ((\Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (((\Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[40]~53_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[40]~52_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\);

-- Location: LCCOMB_X37_Y19_N24
\Div0|auto_generated|divider|divider|StageOut[43]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[43]~88_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[43]~88_combout\);

-- Location: LCCOMB_X39_Y20_N24
\Div0|auto_generated|divider|divider|StageOut[43]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[43]~97_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[37]~102_combout\,
	datac => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[43]~97_combout\);

-- Location: LCCOMB_X39_Y20_N26
\Div0|auto_generated|divider|divider|StageOut[42]~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[42]~103_combout\ = (\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((cnt(3)))) # 
-- (!\Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (\Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => cnt(3),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[42]~103_combout\);

-- Location: LCCOMB_X37_Y19_N18
\Div0|auto_generated|divider|divider|StageOut[42]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[42]~89_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[42]~89_combout\);

-- Location: LCCOMB_X37_Y19_N20
\Div0|auto_generated|divider|divider|StageOut[41]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[41]~91_combout\ = (!\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[41]~91_combout\);

-- Location: LCCOMB_X39_Y20_N16
\Div0|auto_generated|divider|divider|StageOut[41]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[41]~90_combout\ = (cnt(2) & \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(2),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[41]~90_combout\);

-- Location: LCCOMB_X39_Y20_N30
\Div0|auto_generated|divider|divider|StageOut[40]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[40]~93_combout\ = (cnt(1) & !\Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(1),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[40]~93_combout\);

-- Location: LCCOMB_X39_Y20_N2
\Div0|auto_generated|divider|divider|StageOut[40]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[40]~92_combout\ = (cnt(1) & \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(1),
	datad => \Div0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[40]~92_combout\);

-- Location: LCCOMB_X39_Y20_N4
\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1_cout\ = CARRY((\Div0|auto_generated|divider|divider|StageOut[40]~93_combout\) # (\Div0|auto_generated|divider|divider|StageOut[40]~92_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[40]~93_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[40]~92_combout\,
	datad => VCC,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1_cout\);

-- Location: LCCOMB_X39_Y20_N6
\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[41]~91_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[41]~90_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[41]~91_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[41]~90_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[1]~1_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3_cout\);

-- Location: LCCOMB_X39_Y20_N8
\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5_cout\ = CARRY((!\Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3_cout\ & ((\Div0|auto_generated|divider|divider|StageOut[42]~103_combout\) # 
-- (\Div0|auto_generated|divider|divider|StageOut[42]~89_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[42]~103_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[42]~89_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[2]~3_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5_cout\);

-- Location: LCCOMB_X39_Y20_N10
\Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\ = CARRY((!\Div0|auto_generated|divider|divider|StageOut[43]~88_combout\ & (!\Div0|auto_generated|divider|divider|StageOut[43]~97_combout\ & 
-- !\Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|StageOut[43]~88_combout\,
	datab => \Div0|auto_generated|divider|divider|StageOut[43]~97_combout\,
	datad => VCC,
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[3]~5_cout\,
	cout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\);

-- Location: LCCOMB_X39_Y20_N12
\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ = \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\,
	combout => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\);

-- Location: LCCOMB_X36_Y17_N24
\Mod1|auto_generated|divider|divider|add_sub_9_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\ = !\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\);

-- Location: LCCOMB_X36_Y17_N0
\Mod1|auto_generated|divider|divider|StageOut[45]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (!\Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\)) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\);

-- Location: LCCOMB_X36_Y22_N0
\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\ = cnt(5) $ (VCC)
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\ = CARRY(cnt(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(5),
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\);

-- Location: LCCOMB_X36_Y22_N2
\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\ = (cnt(6) & (\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\ & VCC)) # (!cnt(6) & (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\ = CARRY((!cnt(6) & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cnt(6),
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\);

-- Location: LCCOMB_X36_Y22_N4
\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\ = (cnt(7) & ((GND) # (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\))) # (!cnt(7) & (\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\ $ (GND)))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\ = CARRY((cnt(7)) # (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(7),
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\);

-- Location: LCCOMB_X36_Y22_N6
\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\ = (cnt(8) & (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\)) # (!cnt(8) & ((\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\) # (GND)))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\) # (!cnt(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cnt(8),
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~5\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\);

-- Location: LCCOMB_X36_Y22_N8
\Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\ = (cnt(9) & (\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ $ (GND))) # (!cnt(9) & (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\ & VCC))
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~9\ = CARRY((cnt(9) & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cnt(9),
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~7\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~9\);

-- Location: LCCOMB_X36_Y22_N10
\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ = !\Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~9\,
	combout => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\);

-- Location: LCCOMB_X36_Y22_N20
\Div1|auto_generated|divider|divider|StageOut[54]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[54]~55_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_6_result_int[6]~8_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[54]~55_combout\);

-- Location: LCCOMB_X39_Y23_N24
\Div1|auto_generated|divider|divider|StageOut[54]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[54]~54_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & cnt(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => cnt(9),
	combout => \Div1|auto_generated|divider|divider|StageOut[54]~54_combout\);

-- Location: LCCOMB_X36_Y22_N30
\Div1|auto_generated|divider|divider|StageOut[53]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[53]~57_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[53]~57_combout\);

-- Location: LCCOMB_X39_Y23_N2
\Div1|auto_generated|divider|divider|StageOut[53]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[53]~56_combout\ = (cnt(8) & \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(8),
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[53]~56_combout\);

-- Location: LCCOMB_X36_Y22_N16
\Div1|auto_generated|divider|divider|StageOut[52]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[52]~58_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => cnt(7),
	combout => \Div1|auto_generated|divider|divider|StageOut[52]~58_combout\);

-- Location: LCCOMB_X36_Y22_N18
\Div1|auto_generated|divider|divider|StageOut[52]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[52]~59_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[52]~59_combout\);

-- Location: LCCOMB_X39_Y21_N12
\Div1|auto_generated|divider|divider|StageOut[51]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[51]~60_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datac => cnt(6),
	combout => \Div1|auto_generated|divider|divider|StageOut[51]~60_combout\);

-- Location: LCCOMB_X36_Y22_N12
\Div1|auto_generated|divider|divider|StageOut[51]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[51]~61_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[51]~61_combout\);

-- Location: LCCOMB_X39_Y23_N6
\Div1|auto_generated|divider|divider|StageOut[50]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[50]~63_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\ & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[50]~63_combout\);

-- Location: LCCOMB_X39_Y23_N4
\Div1|auto_generated|divider|divider|StageOut[50]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[50]~62_combout\ = (cnt(5) & \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(5),
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[50]~62_combout\);

-- Location: LCCOMB_X39_Y23_N0
\Div1|auto_generated|divider|divider|StageOut[49]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[49]~65_combout\ = (cnt(4) & !\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(4),
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[49]~65_combout\);

-- Location: LCCOMB_X39_Y23_N8
\Div1|auto_generated|divider|divider|StageOut[49]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[49]~64_combout\ = (cnt(4) & \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(4),
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[49]~64_combout\);

-- Location: LCCOMB_X39_Y23_N10
\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[49]~65_combout\) # (\Div1|auto_generated|divider|divider|StageOut[49]~64_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[49]~65_combout\) # (\Div1|auto_generated|divider|divider|StageOut[49]~64_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[49]~65_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[49]~64_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\);

-- Location: LCCOMB_X39_Y23_N12
\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[50]~63_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[50]~62_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[50]~63_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[50]~62_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[50]~63_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[50]~62_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[50]~63_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[50]~62_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\);

-- Location: LCCOMB_X39_Y23_N14
\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[51]~60_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[51]~61_combout\))))) # (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[51]~60_combout\) # 
-- ((\Div1|auto_generated|divider|divider|StageOut[51]~61_combout\) # (GND))))
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[51]~60_combout\) # ((\Div1|auto_generated|divider|divider|StageOut[51]~61_combout\) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[51]~60_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[51]~61_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\);

-- Location: LCCOMB_X39_Y23_N16
\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ = (\Div1|auto_generated|divider|divider|StageOut[52]~58_combout\ & (((!\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\)))) # 
-- (!\Div1|auto_generated|divider|divider|StageOut[52]~58_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[52]~59_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\)) # 
-- (!\Div1|auto_generated|divider|divider|StageOut[52]~59_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\) # (GND)))))
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ = CARRY(((!\Div1|auto_generated|divider|divider|StageOut[52]~58_combout\ & !\Div1|auto_generated|divider|divider|StageOut[52]~59_combout\)) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[52]~58_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[52]~59_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~5\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\);

-- Location: LCCOMB_X39_Y23_N18
\Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ & (((\Div1|auto_generated|divider|divider|StageOut[53]~57_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[53]~56_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ & ((((\Div1|auto_generated|divider|divider|StageOut[53]~57_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[53]~56_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~9\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\ & ((\Div1|auto_generated|divider|divider|StageOut[53]~57_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[53]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[53]~57_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[53]~56_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~7\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~9\);

-- Location: LCCOMB_X39_Y23_N20
\Div1|auto_generated|divider|divider|add_sub_7_result_int[7]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[7]~11_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[54]~55_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[54]~54_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[54]~55_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[54]~54_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~9\,
	cout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[7]~11_cout\);

-- Location: LCCOMB_X39_Y23_N22
\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ = \Div1|auto_generated|divider|divider|add_sub_7_result_int[7]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_7_result_int[7]~11_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\);

-- Location: LCCOMB_X36_Y22_N24
\Div1|auto_generated|divider|divider|StageOut[62]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[62]~88_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (cnt(8))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => cnt(8),
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_6_result_int[5]~6_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[62]~88_combout\);

-- Location: LCCOMB_X39_Y23_N26
\Div1|auto_generated|divider|divider|StageOut[62]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[62]~66_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[6]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[62]~66_combout\);

-- Location: LCCOMB_X36_Y22_N26
\Div1|auto_generated|divider|divider|StageOut[61]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[61]~89_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((cnt(7)))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (\Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_6_result_int[4]~4_combout\,
	datad => cnt(7),
	combout => \Div1|auto_generated|divider|divider|StageOut[61]~89_combout\);

-- Location: LCCOMB_X39_Y22_N24
\Div1|auto_generated|divider|divider|StageOut[61]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[61]~67_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[61]~67_combout\);

-- Location: LCCOMB_X36_Y22_N28
\Div1|auto_generated|divider|divider|StageOut[60]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[60]~90_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((cnt(6)))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (\Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[3]~2_combout\,
	datac => cnt(6),
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[60]~90_combout\);

-- Location: LCCOMB_X39_Y22_N16
\Div1|auto_generated|divider|divider|StageOut[60]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[60]~68_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[60]~68_combout\);

-- Location: LCCOMB_X36_Y22_N14
\Div1|auto_generated|divider|divider|StageOut[59]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[59]~91_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & ((cnt(5)))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (\Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[2]~0_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => cnt(5),
	combout => \Div1|auto_generated|divider|divider|StageOut[59]~91_combout\);

-- Location: LCCOMB_X39_Y22_N18
\Div1|auto_generated|divider|divider|StageOut[59]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[59]~69_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[59]~69_combout\);

-- Location: LCCOMB_X36_Y22_N22
\Div1|auto_generated|divider|divider|StageOut[58]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[58]~70_combout\ = (cnt(4) & \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(4),
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[58]~70_combout\);

-- Location: LCCOMB_X39_Y23_N28
\Div1|auto_generated|divider|divider|StageOut[58]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[58]~71_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[58]~71_combout\);

-- Location: LCCOMB_X39_Y21_N30
\Div1|auto_generated|divider|divider|StageOut[57]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[57]~72_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => cnt(3),
	combout => \Div1|auto_generated|divider|divider|StageOut[57]~72_combout\);

-- Location: LCCOMB_X39_Y21_N2
\Div1|auto_generated|divider|divider|StageOut[48]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[48]~74_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => cnt(3),
	combout => \Div1|auto_generated|divider|divider|StageOut[48]~74_combout\);

-- Location: LCCOMB_X39_Y21_N24
\Div1|auto_generated|divider|divider|StageOut[48]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[48]~73_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => cnt(3),
	combout => \Div1|auto_generated|divider|divider|StageOut[48]~73_combout\);

-- Location: LCCOMB_X39_Y21_N0
\Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\ = (\Div1|auto_generated|divider|divider|StageOut[48]~74_combout\) # (\Div1|auto_generated|divider|divider|StageOut[48]~73_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|StageOut[48]~74_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[48]~73_combout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\);

-- Location: LCCOMB_X39_Y21_N4
\Div1|auto_generated|divider|divider|StageOut[57]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[57]~75_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[57]~75_combout\);

-- Location: LCCOMB_X39_Y22_N2
\Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\ = (((\Div1|auto_generated|divider|divider|StageOut[57]~72_combout\) # (\Div1|auto_generated|divider|divider|StageOut[57]~75_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[57]~72_combout\) # (\Div1|auto_generated|divider|divider|StageOut[57]~75_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[57]~72_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[57]~75_combout\,
	datad => VCC,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\);

-- Location: LCCOMB_X39_Y22_N4
\Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ & (((\Div1|auto_generated|divider|divider|StageOut[58]~70_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[58]~71_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\ & (!\Div1|auto_generated|divider|divider|StageOut[58]~70_combout\ & 
-- (!\Div1|auto_generated|divider|divider|StageOut[58]~71_combout\)))
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[58]~70_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[58]~71_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[58]~70_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[58]~71_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~1\,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\);

-- Location: LCCOMB_X39_Y22_N6
\Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ & ((((\Div1|auto_generated|divider|divider|StageOut[59]~91_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[59]~69_combout\))))) # (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\ & ((\Div1|auto_generated|divider|divider|StageOut[59]~91_combout\) # 
-- ((\Div1|auto_generated|divider|divider|StageOut[59]~69_combout\) # (GND))))
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[59]~91_combout\) # ((\Div1|auto_generated|divider|divider|StageOut[59]~69_combout\) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[59]~91_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[59]~69_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~3\,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\);

-- Location: LCCOMB_X39_Y22_N8
\Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\ = (\Div1|auto_generated|divider|divider|StageOut[60]~90_combout\ & (((!\Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\)))) # 
-- (!\Div1|auto_generated|divider|divider|StageOut[60]~90_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[60]~68_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\)) # 
-- (!\Div1|auto_generated|divider|divider|StageOut[60]~68_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\) # (GND)))))
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ = CARRY(((!\Div1|auto_generated|divider|divider|StageOut[60]~90_combout\ & !\Div1|auto_generated|divider|divider|StageOut[60]~68_combout\)) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[60]~90_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[60]~68_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~5\,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\);

-- Location: LCCOMB_X39_Y22_N10
\Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ & (((\Div1|auto_generated|divider|divider|StageOut[61]~89_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[61]~67_combout\)))) # (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ & ((((\Div1|auto_generated|divider|divider|StageOut[61]~89_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[61]~67_combout\)))))
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~9\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\ & ((\Div1|auto_generated|divider|divider|StageOut[61]~89_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[61]~67_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[61]~89_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[61]~67_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~7\,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~9\);

-- Location: LCCOMB_X39_Y22_N12
\Div1|auto_generated|divider|divider|add_sub_8_result_int[7]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[7]~11_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[62]~88_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[62]~66_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[62]~88_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[62]~66_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~9\,
	cout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[7]~11_cout\);

-- Location: LCCOMB_X39_Y22_N14
\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ = \Div1|auto_generated|divider|divider|add_sub_8_result_int[7]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_8_result_int[7]~11_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\);

-- Location: LCCOMB_X39_Y22_N20
\Div1|auto_generated|divider|divider|StageOut[70]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[70]~76_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_8_result_int[6]~8_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[70]~76_combout\);

-- Location: LCCOMB_X39_Y22_N26
\Div1|auto_generated|divider|divider|StageOut[70]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[70]~85_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[61]~89_combout\) # 
-- ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[5]~6_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[61]~89_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[70]~85_combout\);

-- Location: LCCOMB_X39_Y22_N28
\Div1|auto_generated|divider|divider|StageOut[69]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[69]~86_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[60]~90_combout\) # 
-- ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[4]~4_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[60]~90_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[69]~86_combout\);

-- Location: LCCOMB_X39_Y22_N22
\Div1|auto_generated|divider|divider|StageOut[69]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[69]~77_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\ & !\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_8_result_int[5]~6_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[69]~77_combout\);

-- Location: LCCOMB_X39_Y22_N30
\Div1|auto_generated|divider|divider|StageOut[68]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[68]~87_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|StageOut[59]~91_combout\) # 
-- ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\ & !\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[59]~91_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_7_result_int[3]~2_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[68]~87_combout\);

-- Location: LCCOMB_X39_Y22_N0
\Div1|auto_generated|divider|divider|StageOut[68]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[68]~78_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_8_result_int[4]~4_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[68]~78_combout\);

-- Location: LCCOMB_X38_Y22_N28
\Div1|auto_generated|divider|divider|StageOut[67]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[67]~79_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_8_result_int[3]~2_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[67]~79_combout\);

-- Location: LCCOMB_X39_Y23_N30
\Div1|auto_generated|divider|divider|StageOut[67]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[67]~92_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & (cnt(4))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datab => cnt(4),
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_7_result_int[2]~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[67]~92_combout\);

-- Location: LCCOMB_X38_Y22_N30
\Div1|auto_generated|divider|divider|StageOut[66]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[66]~80_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_8_result_int[2]~0_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[66]~80_combout\);

-- Location: LCCOMB_X39_Y21_N6
\Div1|auto_generated|divider|divider|StageOut[66]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[66]~93_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & ((\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & ((cnt(3)))) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & (\Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datab => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[1]~14_combout\,
	datad => cnt(3),
	combout => \Div1|auto_generated|divider|divider|StageOut[66]~93_combout\);

-- Location: LCCOMB_X38_Y22_N8
\Div1|auto_generated|divider|divider|StageOut[65]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[65]~81_combout\ = (\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => cnt(2),
	combout => \Div1|auto_generated|divider|divider|StageOut[65]~81_combout\);

-- Location: LCCOMB_X38_Y22_N2
\Div1|auto_generated|divider|divider|StageOut[56]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[56]~83_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => cnt(2),
	combout => \Div1|auto_generated|divider|divider|StageOut[56]~83_combout\);

-- Location: LCCOMB_X38_Y22_N10
\Div1|auto_generated|divider|divider|StageOut[56]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[56]~82_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => cnt(2),
	combout => \Div1|auto_generated|divider|divider|StageOut[56]~82_combout\);

-- Location: LCCOMB_X38_Y22_N0
\Div1|auto_generated|divider|divider|add_sub_8_result_int[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_8_result_int[1]~14_combout\ = (\Div1|auto_generated|divider|divider|StageOut[56]~83_combout\) # (\Div1|auto_generated|divider|divider|StageOut[56]~82_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|StageOut[56]~83_combout\,
	datad => \Div1|auto_generated|divider|divider|StageOut[56]~82_combout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_8_result_int[1]~14_combout\);

-- Location: LCCOMB_X38_Y22_N4
\Div1|auto_generated|divider|divider|StageOut[65]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|StageOut[65]~84_combout\ = (!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ & \Div1|auto_generated|divider|divider|add_sub_8_result_int[1]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_8_result_int[1]~14_combout\,
	combout => \Div1|auto_generated|divider|divider|StageOut[65]~84_combout\);

-- Location: LCCOMB_X38_Y22_N12
\Div1|auto_generated|divider|divider|add_sub_9_result_int[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[2]~1_cout\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[65]~81_combout\) # (\Div1|auto_generated|divider|divider|StageOut[65]~84_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[65]~81_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[65]~84_combout\,
	datad => VCC,
	cout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[2]~1_cout\);

-- Location: LCCOMB_X38_Y22_N14
\Div1|auto_generated|divider|divider|add_sub_9_result_int[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[3]~3_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[66]~80_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[66]~93_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_9_result_int[2]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[66]~80_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[66]~93_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_9_result_int[2]~1_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[3]~3_cout\);

-- Location: LCCOMB_X38_Y22_N16
\Div1|auto_generated|divider|divider|add_sub_9_result_int[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[4]~5_cout\ = CARRY((\Div1|auto_generated|divider|divider|StageOut[67]~79_combout\) # ((\Div1|auto_generated|divider|divider|StageOut[67]~92_combout\) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_9_result_int[3]~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[67]~79_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[67]~92_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_9_result_int[3]~3_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[4]~5_cout\);

-- Location: LCCOMB_X38_Y22_N18
\Div1|auto_generated|divider|divider|add_sub_9_result_int[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[5]~7_cout\ = CARRY(((!\Div1|auto_generated|divider|divider|StageOut[68]~87_combout\ & !\Div1|auto_generated|divider|divider|StageOut[68]~78_combout\)) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_9_result_int[4]~5_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[68]~87_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[68]~78_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_9_result_int[4]~5_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[5]~7_cout\);

-- Location: LCCOMB_X38_Y22_N20
\Div1|auto_generated|divider|divider|add_sub_9_result_int[6]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[6]~9_cout\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_9_result_int[5]~7_cout\ & ((\Div1|auto_generated|divider|divider|StageOut[69]~86_combout\) # 
-- (\Div1|auto_generated|divider|divider|StageOut[69]~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[69]~86_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[69]~77_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_9_result_int[5]~7_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[6]~9_cout\);

-- Location: LCCOMB_X38_Y22_N22
\Div1|auto_generated|divider|divider|add_sub_9_result_int[7]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[7]~11_cout\ = CARRY((!\Div1|auto_generated|divider|divider|StageOut[70]~76_combout\ & (!\Div1|auto_generated|divider|divider|StageOut[70]~85_combout\ & 
-- !\Div1|auto_generated|divider|divider|add_sub_9_result_int[6]~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|StageOut[70]~76_combout\,
	datab => \Div1|auto_generated|divider|divider|StageOut[70]~85_combout\,
	datad => VCC,
	cin => \Div1|auto_generated|divider|divider|add_sub_9_result_int[6]~9_cout\,
	cout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[7]~11_cout\);

-- Location: LCCOMB_X38_Y22_N24
\Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\ = \Div1|auto_generated|divider|divider|add_sub_9_result_int[7]~11_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Div1|auto_generated|divider|divider|add_sub_9_result_int[7]~11_cout\,
	combout => \Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\);

-- Location: LCCOMB_X38_Y22_N26
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\ = !\Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\);

-- Location: LCCOMB_X39_Y21_N14
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\ = \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\ $ (GND)
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ = CARRY(!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	datad => VCC,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\);

-- Location: LCCOMB_X39_Y21_N16
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\ = (\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\)) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\ & VCC))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ = CARRY((\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~3\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\);

-- Location: LCCOMB_X39_Y21_N18
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\ = (\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ & VCC)) # 
-- (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\ $ (GND)))
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~7\ = CARRY((!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\ & !\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~5\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~7\);

-- Location: LCCOMB_X39_Y21_N20
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\ = CARRY(!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~7\,
	cout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\);

-- Location: LCCOMB_X39_Y21_N22
\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ = \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[4]~9_cout\,
	combout => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\);

-- Location: LCCOMB_X38_Y22_N6
\Mod2|auto_generated|divider|divider|StageOut[45]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((!\Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[0]~0_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_9_result_int[8]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\);

-- Location: LCCOMB_X39_Y21_N28
\Mod2|auto_generated|divider|divider|StageOut[46]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((!\Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\))) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[1]~2_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	datad => \Div1|auto_generated|divider|divider|add_sub_8_result_int[8]~12_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\);

-- Location: LCCOMB_X39_Y21_N10
\Mod2|auto_generated|divider|divider|StageOut[47]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\)) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Div1|auto_generated|divider|divider|add_sub_7_result_int[8]~12_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[2]~4_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\);

-- Location: LCCOMB_X39_Y21_N8
\Mod2|auto_generated|divider|divider|StageOut[48]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\ = (\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & (!\Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\)) # 
-- (!\Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\ & ((\Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Div1|auto_generated|divider|divider|add_sub_6_result_int[7]~10_combout\,
	datac => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[5]~10_combout\,
	datad => \Mod2|auto_generated|divider|divider|add_sub_9_result_int[3]~6_combout\,
	combout => \Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\);

-- Location: LCCOMB_X38_Y18_N18
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (!\Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\ & (!\Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\ & 
-- !\Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\,
	datac => \Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X38_Y18_N20
\Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (!\Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\ & (\select_state.010~q\ & \Selector5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\,
	datac => \select_state.010~q\,
	datad => \Selector5~0_combout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X38_Y18_N8
\Selector5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = ((!\Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\ & \Selector5~1_combout\))) # (!\select_state.001~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\,
	datab => \select_state.001~q\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\,
	datad => \Selector5~1_combout\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X38_Y18_N28
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (!\Selector5~2_combout\ & ((\select_state.100~q\ & (cnt(0))) # (!\select_state.100~q\ & ((\Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => \Selector5~2_combout\,
	datac => \select_state.100~q\,
	datad => \Mod1|auto_generated|divider|divider|StageOut[45]~54_combout\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X38_Y18_N4
\Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux3~0_combout\) # ((\Selector5~2_combout\ & \Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux3~0_combout\,
	datac => \Selector5~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[45]~0_combout\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X34_Y16_N10
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = cnt(7) $ (VCC)
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(7),
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X34_Y16_N12
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (cnt(8) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!cnt(8) & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!cnt(8) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => cnt(8),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X34_Y16_N14
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (cnt(9) & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!cnt(9) & (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((cnt(9) & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(9),
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X34_Y16_N16
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X35_Y19_N30
\Mod0|auto_generated|divider|divider|StageOut[17]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\);

-- Location: LCCOMB_X35_Y19_N28
\Mod0|auto_generated|divider|divider|StageOut[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => cnt(8),
	combout => \Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\);

-- Location: LCCOMB_X34_Y16_N26
\Mod0|auto_generated|divider|divider|StageOut[16]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\);

-- Location: LCCOMB_X35_Y19_N16
\Mod0|auto_generated|divider|divider|StageOut[16]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => cnt(7),
	combout => \Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\);

-- Location: LCCOMB_X35_Y19_N12
\Mod0|auto_generated|divider|divider|StageOut[15]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~63_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => cnt(6),
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~63_combout\);

-- Location: LCCOMB_X35_Y19_N26
\Mod0|auto_generated|divider|divider|StageOut[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~62_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => cnt(6),
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~62_combout\);

-- Location: LCCOMB_X35_Y19_N0
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[15]~63_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[15]~62_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[15]~63_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[15]~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~63_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[15]~62_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X35_Y19_N2
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[16]~61_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[16]~60_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X35_Y19_N4
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~59_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[17]~58_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X35_Y19_N10
\Mod0|auto_generated|divider|divider|StageOut[18]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~56_combout\ = (cnt(9) & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(9),
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~56_combout\);

-- Location: LCCOMB_X34_Y16_N24
\Mod0|auto_generated|divider|divider|StageOut[18]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~57_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~57_combout\);

-- Location: LCCOMB_X35_Y19_N6
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[18]~56_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[18]~57_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[18]~56_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[18]~57_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X35_Y19_N8
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X35_Y19_N14
\Mod0|auto_generated|divider|divider|StageOut[23]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~64_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~64_combout\);

-- Location: LCCOMB_X35_Y19_N24
\Mod0|auto_generated|divider|divider|StageOut[23]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~98_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((cnt(8)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => cnt(8),
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~98_combout\);

-- Location: LCCOMB_X34_Y16_N4
\Mod0|auto_generated|divider|divider|StageOut[22]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((cnt(7)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => cnt(7),
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\);

-- Location: LCCOMB_X35_Y20_N0
\Mod0|auto_generated|divider|divider|StageOut[22]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\);

-- Location: LCCOMB_X35_Y20_N26
\Mod0|auto_generated|divider|divider|StageOut[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & cnt(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => cnt(6),
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\);

-- Location: LCCOMB_X35_Y20_N4
\Mod0|auto_generated|divider|divider|StageOut[21]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\);

-- Location: LCCOMB_X35_Y20_N30
\Mod0|auto_generated|divider|divider|StageOut[20]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~68_combout\ = (cnt(5) & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(5),
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~68_combout\);

-- Location: LCCOMB_X35_Y20_N8
\Mod0|auto_generated|divider|divider|StageOut[20]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[20]~69_combout\ = (cnt(5) & !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(5),
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[20]~69_combout\);

-- Location: LCCOMB_X35_Y20_N14
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[20]~68_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[20]~69_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[20]~68_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[20]~69_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[20]~68_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[20]~69_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X35_Y20_N16
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[21]~66_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[21]~67_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X35_Y20_N18
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[22]~65_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X35_Y20_N20
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[23]~64_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[23]~98_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[23]~64_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[23]~98_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X35_Y20_N22
\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X34_Y20_N10
\Mod0|auto_generated|divider|divider|StageOut[26]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & cnt(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => cnt(5),
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\);

-- Location: LCCOMB_X34_Y20_N28
\Mod0|auto_generated|divider|divider|StageOut[26]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\);

-- Location: LCCOMB_X34_Y20_N30
\Mod0|auto_generated|divider|divider|StageOut[25]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~74_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & cnt(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => cnt(4),
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~74_combout\);

-- Location: LCCOMB_X34_Y20_N16
\Mod0|auto_generated|divider|divider|StageOut[25]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[25]~75_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & cnt(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => cnt(4),
	combout => \Mod0|auto_generated|divider|divider|StageOut[25]~75_combout\);

-- Location: LCCOMB_X34_Y20_N18
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[25]~74_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[25]~75_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[25]~74_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[25]~75_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[25]~74_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[25]~75_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\);

-- Location: LCCOMB_X34_Y20_N20
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[26]~72_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[26]~73_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\);

-- Location: LCCOMB_X34_Y20_N8
\Mod0|auto_generated|divider|divider|StageOut[28]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~70_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~70_combout\);

-- Location: LCCOMB_X35_Y20_N12
\Mod0|auto_generated|divider|divider|StageOut[28]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~94_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\) # 
-- ((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[22]~99_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~94_combout\);

-- Location: LCCOMB_X35_Y20_N2
\Mod0|auto_generated|divider|divider|StageOut[27]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\);

-- Location: LCCOMB_X35_Y20_N10
\Mod0|auto_generated|divider|divider|StageOut[27]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (cnt(6))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => cnt(6),
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\);

-- Location: LCCOMB_X34_Y20_N22
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[27]~71_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\);

-- Location: LCCOMB_X34_Y20_N24
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[28]~70_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[28]~94_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[28]~70_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[28]~94_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~5\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\);

-- Location: LCCOMB_X34_Y20_N26
\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[4]~7_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\);

-- Location: LCCOMB_X34_Y22_N16
\Mod0|auto_generated|divider|divider|StageOut[33]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[33]~76_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[33]~76_combout\);

-- Location: LCCOMB_X35_Y20_N24
\Mod0|auto_generated|divider|divider|StageOut[33]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[33]~95_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[27]~100_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[33]~95_combout\);

-- Location: LCCOMB_X35_Y20_N28
\Mod0|auto_generated|divider|divider|StageOut[32]~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((cnt(5)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datac => cnt(5),
	datad => \Mod0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\);

-- Location: LCCOMB_X35_Y22_N24
\Mod0|auto_generated|divider|divider|StageOut[32]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\);

-- Location: LCCOMB_X35_Y22_N26
\Mod0|auto_generated|divider|divider|StageOut[31]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & cnt(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(4),
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\);

-- Location: LCCOMB_X35_Y22_N28
\Mod0|auto_generated|divider|divider|StageOut[31]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\);

-- Location: LCCOMB_X34_Y22_N2
\Mod0|auto_generated|divider|divider|StageOut[30]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~81_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(3),
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~81_combout\);

-- Location: LCCOMB_X35_Y22_N30
\Mod0|auto_generated|divider|divider|StageOut[30]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~80_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(3),
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~80_combout\);

-- Location: LCCOMB_X35_Y22_N10
\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[30]~81_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[30]~80_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[30]~81_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[30]~80_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[30]~81_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[30]~80_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\);

-- Location: LCCOMB_X35_Y22_N12
\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[31]~78_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[31]~79_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\);

-- Location: LCCOMB_X35_Y22_N14
\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[32]~77_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\);

-- Location: LCCOMB_X35_Y22_N16
\Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[33]~76_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[33]~95_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[33]~76_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[33]~95_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~5\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\);

-- Location: LCCOMB_X35_Y22_N18
\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[4]~7_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\);

-- Location: LCCOMB_X35_Y22_N8
\Mod0|auto_generated|divider|divider|StageOut[38]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[38]~96_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[2]~2_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[32]~101_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[38]~96_combout\);

-- Location: LCCOMB_X34_Y22_N4
\Mod0|auto_generated|divider|divider|StageOut[38]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[38]~82_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[38]~82_combout\);

-- Location: LCCOMB_X35_Y22_N4
\Mod0|auto_generated|divider|divider|StageOut[37]~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & ((cnt(4)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\ & (\Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[1]~0_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_6_result_int[5]~8_combout\,
	datad => cnt(4),
	combout => \Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\);

-- Location: LCCOMB_X34_Y22_N14
\Mod0|auto_generated|divider|divider|StageOut[37]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\);

-- Location: LCCOMB_X34_Y22_N10
\Mod0|auto_generated|divider|divider|StageOut[36]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\);

-- Location: LCCOMB_X34_Y22_N0
\Mod0|auto_generated|divider|divider|StageOut[36]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & cnt(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datad => cnt(3),
	combout => \Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\);

-- Location: LCCOMB_X34_Y22_N30
\Mod0|auto_generated|divider|divider|StageOut[35]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~87_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => cnt(2),
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~87_combout\);

-- Location: LCCOMB_X34_Y22_N12
\Mod0|auto_generated|divider|divider|StageOut[35]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[35]~86_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	datac => cnt(2),
	combout => \Mod0|auto_generated|divider|divider|StageOut[35]~86_combout\);

-- Location: LCCOMB_X34_Y22_N20
\Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[35]~87_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[35]~86_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[35]~87_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[35]~86_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[35]~87_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[35]~86_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\);

-- Location: LCCOMB_X34_Y22_N22
\Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[36]~85_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[36]~84_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\);

-- Location: LCCOMB_X34_Y22_N24
\Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[37]~83_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\);

-- Location: LCCOMB_X34_Y22_N26
\Mod0|auto_generated|divider|divider|add_sub_8_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[38]~96_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[38]~82_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[38]~96_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[38]~82_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~5\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\);

-- Location: LCCOMB_X34_Y22_N28
\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[4]~7_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\);

-- Location: LCCOMB_X34_Y18_N30
\Mod0|auto_generated|divider|divider|StageOut[41]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & cnt(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datac => cnt(2),
	combout => \Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\);

-- Location: LCCOMB_X34_Y18_N0
\Mod0|auto_generated|divider|divider|StageOut[41]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\);

-- Location: LCCOMB_X34_Y18_N2
\Mod0|auto_generated|divider|divider|StageOut[40]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~89_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & cnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => cnt(1),
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~89_combout\);

-- Location: LCCOMB_X34_Y18_N8
\Mod0|auto_generated|divider|divider|StageOut[40]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[40]~88_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & cnt(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => cnt(1),
	combout => \Mod0|auto_generated|divider|divider|StageOut[40]~88_combout\);

-- Location: LCCOMB_X34_Y18_N18
\Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[40]~89_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[40]~88_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[40]~89_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[40]~88_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[40]~89_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[40]~88_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\);

-- Location: LCCOMB_X34_Y18_N20
\Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ & (((\Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\ & (!\Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\);

-- Location: LCCOMB_X34_Y22_N18
\Mod0|auto_generated|divider|divider|StageOut[43]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~97_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\) # 
-- ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[37]~102_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~97_combout\);

-- Location: LCCOMB_X34_Y18_N4
\Mod0|auto_generated|divider|divider|StageOut[43]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~90_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~90_combout\);

-- Location: LCCOMB_X34_Y22_N6
\Mod0|auto_generated|divider|divider|StageOut[42]~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & (cnt(3))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[1]~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_7_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\);

-- Location: LCCOMB_X34_Y22_N8
\Mod0|auto_generated|divider|divider|StageOut[42]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[2]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_8_result_int[5]~8_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\);

-- Location: LCCOMB_X34_Y18_N22
\Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & ((((\Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\ & ((\Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\);

-- Location: LCCOMB_X34_Y18_N24
\Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[43]~97_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[43]~90_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[43]~97_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[43]~90_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~5\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\);

-- Location: LCCOMB_X34_Y18_N26
\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ = \Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[4]~7_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\);

-- Location: LCCOMB_X34_Y18_N28
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[41]~92_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[41]~93_combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X34_Y18_N6
\Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\select_state.100~q\ & ((\Mux1~0_combout\))) # (!\select_state.100~q\ & (\Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\,
	datab => \Mux1~0_combout\,
	datad => \select_state.100~q\,
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X38_Y18_N26
\Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\Selector5~2_combout\ & ((\Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\))) # (!\Selector5~2_combout\ & (\Mux1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mod2|auto_generated|divider|divider|StageOut[47]~2_combout\,
	datac => \Selector5~2_combout\,
	combout => \Mux1~2_combout\);

-- Location: LCCOMB_X34_Y18_N16
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[42]~91_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[3]~4_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[42]~103_combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X38_Y18_N0
\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (!\Selector5~2_combout\ & ((\select_state.100~q\ & ((\Mux0~0_combout\))) # (!\select_state.100~q\ & (\Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\,
	datab => \Selector5~2_combout\,
	datac => \select_state.100~q\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X38_Y18_N22
\Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\Mux0~1_combout\) # ((\Selector5~2_combout\ & \Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux0~1_combout\,
	datac => \Selector5~2_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[48]~1_combout\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X38_Y18_N12
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\ & !\select_state.100~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[46]~55_combout\,
	datac => \select_state.100~q\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X34_Y18_N10
\Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\select_state.100~q\ & ((\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & ((cnt(1)))) # (!\Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[1]~0_combout\,
	datab => \select_state.100~q\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_9_result_int[5]~8_combout\,
	datad => cnt(1),
	combout => \Mux2~1_combout\);

-- Location: LCCOMB_X38_Y18_N16
\Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\Selector5~2_combout\ & (((\Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\)))) # (!\Selector5~2_combout\ & ((\Mux2~0_combout\) # ((\Mux2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datab => \Selector5~2_combout\,
	datac => \Mux2~1_combout\,
	datad => \Mod2|auto_generated|divider|divider|StageOut[46]~3_combout\,
	combout => \Mux2~2_combout\);

-- Location: LCCOMB_X37_Y2_N16
\segments~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \segments~0_combout\ = (!\Mux0~2_combout\ & (!\Mux2~2_combout\ & (\Mux3~1_combout\ $ (\Mux1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \segments~0_combout\);

-- Location: LCCOMB_X37_Y2_N10
\segments~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \segments~1_combout\ = (\Mux1~2_combout\ & (\Mux3~1_combout\ $ (\Mux2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \segments~1_combout\);

-- Location: LCCOMB_X37_Y2_N4
\Decoder1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder1~0_combout\ = (!\Mux3~1_combout\ & (!\Mux1~2_combout\ & \Mux2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \Decoder1~0_combout\);

-- Location: LCCOMB_X37_Y2_N30
\WideOr6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr6~0_combout\ = (!\Mux0~2_combout\ & ((\Mux3~1_combout\ & (\Mux1~2_combout\ $ (!\Mux2~2_combout\))) # (!\Mux3~1_combout\ & (\Mux1~2_combout\ & !\Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \WideOr6~0_combout\);

-- Location: LCCOMB_X37_Y2_N24
\WideOr4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr4~0_combout\ = (\Mux3~1_combout\) # ((\Mux1~2_combout\ & !\Mux2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \WideOr4~0_combout\);

-- Location: LCCOMB_X37_Y2_N26
\WideOr3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = (!\Mux0~2_combout\ & ((\Mux3~1_combout\ & ((\Mux2~2_combout\) # (!\Mux1~2_combout\))) # (!\Mux3~1_combout\ & (!\Mux1~2_combout\ & \Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \WideOr3~0_combout\);

-- Location: LCCOMB_X37_Y2_N28
\WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (\Mux0~2_combout\) # ((\Mux1~2_combout\ & ((!\Mux2~2_combout\) # (!\Mux3~1_combout\))) # (!\Mux1~2_combout\ & ((\Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~1_combout\,
	datab => \Mux1~2_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux2~2_combout\,
	combout => \WideOr1~0_combout\);

-- Location: LCCOMB_X38_Y18_N10
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!\select_state.001~q\ & \Selector5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \select_state.001~q\,
	datad => \Selector5~0_combout\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X38_Y18_N24
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\LessThan1~0_combout\) # ((!\Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\ & \Selector5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[47]~57_combout\,
	datac => \Mod1|auto_generated|divider|divider|StageOut[48]~56_combout\,
	datad => \Selector5~1_combout\,
	combout => \Selector4~0_combout\);

-- Location: IOIBUF_X27_Y0_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G16
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: PLL_4
\button_clk0|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 120,
	c0_initial => 1,
	c0_low => 120,
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
	clk0_divide_by => 10000,
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
	areset => \reset~inputclkctrl_outclk\,
	fbin => \button_clk0|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \button_clk0|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \button_clk0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G19
\button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: PLL_1
\display_clk0|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 120,
	c0_initial => 1,
	c0_low => 120,
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
	clk1_divide_by => 10000,
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
	areset => \reset~inputclkctrl_outclk\,
	fbin => \display_clk0|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \display_clk0|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \display_clk0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \display_clk0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G4
\display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \display_clk0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: IOIBUF_X27_Y0_N8
\lock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_lock,
	o => \lock~input_o\);
END structure;


