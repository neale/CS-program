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

-- DATE "05/12/2016 19:52:23"

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
	lock_pwm : OUT std_logic;
	lock_display : OUT std_logic;
	pwm_led : OUT std_logic;
	segments : OUT std_logic_vector(6 DOWNTO 0);
	\select\ : OUT std_logic_vector(2 DOWNTO 0);
	pwm_clk : OUT std_logic;
	display_clk : OUT std_logic;
	pwm : OUT std_logic
	);
END ROM;

-- Design Ports Information
-- reset	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lock_pwm	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lock_display	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm_led	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[0]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[1]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[2]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[3]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[4]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[5]	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- segments[6]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[0]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[1]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- select[2]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm_clk	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display_clk	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[2]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[3]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[4]	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[5]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[6]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[7]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[1]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- encoder0	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- encoder1	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_lock_pwm : std_logic;
SIGNAL ww_lock_display : std_logic;
SIGNAL ww_pwm_led : std_logic;
SIGNAL ww_segments : std_logic_vector(6 DOWNTO 0);
SIGNAL \ww_select\ : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_pwm_clk : std_logic;
SIGNAL ww_display_clk : std_logic;
SIGNAL ww_pwm : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LessThan1~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LessThan3~2clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LessThan2~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \encoder1~input_o\ : std_logic;
SIGNAL \encoderb|A0~q\ : std_logic;
SIGNAL \encoderb|count~14_combout\ : std_logic;
SIGNAL \encoderb|Add0~0_combout\ : std_logic;
SIGNAL \encoderb|triggered~6_combout\ : std_logic;
SIGNAL \encoderb|Add0~1\ : std_logic;
SIGNAL \encoderb|Add0~2_combout\ : std_logic;
SIGNAL \encoderb|count~13_combout\ : std_logic;
SIGNAL \encoderb|Add0~3\ : std_logic;
SIGNAL \encoderb|Add0~4_combout\ : std_logic;
SIGNAL \encoderb|count~12_combout\ : std_logic;
SIGNAL \encoderb|Add0~5\ : std_logic;
SIGNAL \encoderb|Add0~6_combout\ : std_logic;
SIGNAL \encoderb|count~11_combout\ : std_logic;
SIGNAL \encoderb|Add0~7\ : std_logic;
SIGNAL \encoderb|Add0~8_combout\ : std_logic;
SIGNAL \encoderb|count~10_combout\ : std_logic;
SIGNAL \encoderb|Add0~9\ : std_logic;
SIGNAL \encoderb|Add0~10_combout\ : std_logic;
SIGNAL \encoderb|count~9_combout\ : std_logic;
SIGNAL \encoderb|Add0~11\ : std_logic;
SIGNAL \encoderb|Add0~12_combout\ : std_logic;
SIGNAL \encoderb|count~8_combout\ : std_logic;
SIGNAL \encoderb|Add0~13\ : std_logic;
SIGNAL \encoderb|Add0~14_combout\ : std_logic;
SIGNAL \encoderb|count~7_combout\ : std_logic;
SIGNAL \encoderb|Add0~15\ : std_logic;
SIGNAL \encoderb|Add0~16_combout\ : std_logic;
SIGNAL \encoderb|count~6_combout\ : std_logic;
SIGNAL \encoderb|Add0~17\ : std_logic;
SIGNAL \encoderb|Add0~18_combout\ : std_logic;
SIGNAL \encoderb|count~5_combout\ : std_logic;
SIGNAL \encoderb|Add0~19\ : std_logic;
SIGNAL \encoderb|Add0~20_combout\ : std_logic;
SIGNAL \encoderb|count~4_combout\ : std_logic;
SIGNAL \encoderb|Add0~21\ : std_logic;
SIGNAL \encoderb|Add0~22_combout\ : std_logic;
SIGNAL \encoderb|count~3_combout\ : std_logic;
SIGNAL \encoderb|Add0~23\ : std_logic;
SIGNAL \encoderb|Add0~24_combout\ : std_logic;
SIGNAL \encoderb|count~2_combout\ : std_logic;
SIGNAL \encoderb|Add0~25\ : std_logic;
SIGNAL \encoderb|Add0~26_combout\ : std_logic;
SIGNAL \encoderb|count~1_combout\ : std_logic;
SIGNAL \encoderb|Add0~27\ : std_logic;
SIGNAL \encoderb|Add0~28_combout\ : std_logic;
SIGNAL \encoderb|count~0_combout\ : std_logic;
SIGNAL \encoderb|Add0~29\ : std_logic;
SIGNAL \encoderb|Add0~30_combout\ : std_logic;
SIGNAL \encoderb|triggered~1_combout\ : std_logic;
SIGNAL \encoderb|triggered~2_combout\ : std_logic;
SIGNAL \encoderb|triggered~0_combout\ : std_logic;
SIGNAL \encoderb|triggered~3_combout\ : std_logic;
SIGNAL \encoderb|triggered~4_combout\ : std_logic;
SIGNAL \encoderb|triggered~5_combout\ : std_logic;
SIGNAL \encoderb|triggered~q\ : std_logic;
SIGNAL \encoder1_last[0]~feeder_combout\ : std_logic;
SIGNAL \encoder1_last[1]~feeder_combout\ : std_logic;
SIGNAL \encoder1_last[2]~feeder_combout\ : std_logic;
SIGNAL \encoder0~input_o\ : std_logic;
SIGNAL \encodera|A0~feeder_combout\ : std_logic;
SIGNAL \encodera|A0~q\ : std_logic;
SIGNAL \encodera|count~14_combout\ : std_logic;
SIGNAL \encodera|Add0~0_combout\ : std_logic;
SIGNAL \encodera|triggered~0_combout\ : std_logic;
SIGNAL \encodera|Add0~1\ : std_logic;
SIGNAL \encodera|Add0~2_combout\ : std_logic;
SIGNAL \encodera|count~13_combout\ : std_logic;
SIGNAL \encodera|Add0~3\ : std_logic;
SIGNAL \encodera|Add0~4_combout\ : std_logic;
SIGNAL \encodera|count~12_combout\ : std_logic;
SIGNAL \encodera|Add0~5\ : std_logic;
SIGNAL \encodera|Add0~6_combout\ : std_logic;
SIGNAL \encodera|count~11_combout\ : std_logic;
SIGNAL \encodera|Add0~7\ : std_logic;
SIGNAL \encodera|Add0~8_combout\ : std_logic;
SIGNAL \encodera|count~10_combout\ : std_logic;
SIGNAL \encodera|Add0~9\ : std_logic;
SIGNAL \encodera|Add0~10_combout\ : std_logic;
SIGNAL \encodera|count~9_combout\ : std_logic;
SIGNAL \encodera|Add0~11\ : std_logic;
SIGNAL \encodera|Add0~12_combout\ : std_logic;
SIGNAL \encodera|count~8_combout\ : std_logic;
SIGNAL \encodera|Add0~13\ : std_logic;
SIGNAL \encodera|Add0~14_combout\ : std_logic;
SIGNAL \encodera|count~7_combout\ : std_logic;
SIGNAL \encodera|Add0~15\ : std_logic;
SIGNAL \encodera|Add0~16_combout\ : std_logic;
SIGNAL \encodera|count~6_combout\ : std_logic;
SIGNAL \encodera|Add0~17\ : std_logic;
SIGNAL \encodera|Add0~18_combout\ : std_logic;
SIGNAL \encodera|count~5_combout\ : std_logic;
SIGNAL \encodera|Add0~19\ : std_logic;
SIGNAL \encodera|Add0~20_combout\ : std_logic;
SIGNAL \encodera|count~4_combout\ : std_logic;
SIGNAL \encodera|Add0~21\ : std_logic;
SIGNAL \encodera|Add0~22_combout\ : std_logic;
SIGNAL \encodera|count~3_combout\ : std_logic;
SIGNAL \encodera|Add0~23\ : std_logic;
SIGNAL \encodera|Add0~24_combout\ : std_logic;
SIGNAL \encodera|count~2_combout\ : std_logic;
SIGNAL \encodera|Add0~25\ : std_logic;
SIGNAL \encodera|Add0~26_combout\ : std_logic;
SIGNAL \encodera|count~1_combout\ : std_logic;
SIGNAL \encodera|Add0~27\ : std_logic;
SIGNAL \encodera|Add0~28_combout\ : std_logic;
SIGNAL \encodera|count~0_combout\ : std_logic;
SIGNAL \encodera|Add0~29\ : std_logic;
SIGNAL \encodera|Add0~30_combout\ : std_logic;
SIGNAL \encodera|triggered~4_combout\ : std_logic;
SIGNAL \encodera|triggered~3_combout\ : std_logic;
SIGNAL \encodera|triggered~1_combout\ : std_logic;
SIGNAL \encodera|triggered~2_combout\ : std_logic;
SIGNAL \encodera|triggered~5_combout\ : std_logic;
SIGNAL \encodera|triggered~6_combout\ : std_logic;
SIGNAL \encodera|triggered~q\ : std_logic;
SIGNAL \encoder0_last[0]~feeder_combout\ : std_logic;
SIGNAL \encoder0_last[1]~feeder_combout\ : std_logic;
SIGNAL \encoder_turning~1_combout\ : std_logic;
SIGNAL \cnt[0]~10_combout\ : std_logic;
SIGNAL \encoder_turning~0_combout\ : std_logic;
SIGNAL \cnt[0]~11\ : std_logic;
SIGNAL \cnt[1]~12_combout\ : std_logic;
SIGNAL \cnt[1]~13\ : std_logic;
SIGNAL \cnt[2]~14_combout\ : std_logic;
SIGNAL \cnt[2]~15\ : std_logic;
SIGNAL \cnt[3]~16_combout\ : std_logic;
SIGNAL \cnt[3]~17\ : std_logic;
SIGNAL \cnt[4]~18_combout\ : std_logic;
SIGNAL \cnt[4]~19\ : std_logic;
SIGNAL \cnt[5]~20_combout\ : std_logic;
SIGNAL \cnt[5]~21\ : std_logic;
SIGNAL \cnt[6]~22_combout\ : std_logic;
SIGNAL \cnt[6]~23\ : std_logic;
SIGNAL \cnt[7]~24_combout\ : std_logic;
SIGNAL \cnt[7]~25\ : std_logic;
SIGNAL \cnt[8]~26_combout\ : std_logic;
SIGNAL \LessThan21~1_combout\ : std_logic;
SIGNAL \cnt[8]~27\ : std_logic;
SIGNAL \cnt[9]~28_combout\ : std_logic;
SIGNAL \ones~43_combout\ : std_logic;
SIGNAL \ones~26_combout\ : std_logic;
SIGNAL \LessThan21~0_combout\ : std_logic;
SIGNAL \LessThan24~1_combout\ : std_logic;
SIGNAL \ones~32_combout\ : std_logic;
SIGNAL \LessThan27~0_combout\ : std_logic;
SIGNAL \LessThan27~1_combout\ : std_logic;
SIGNAL \ones~41_combout\ : std_logic;
SIGNAL \Add8~2_combout\ : std_logic;
SIGNAL \Add8~3_combout\ : std_logic;
SIGNAL \ones[3]_583~combout\ : std_logic;
SIGNAL \Add8~1_combout\ : std_logic;
SIGNAL \ones[1]_571~combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \ones~15_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \LessThan9~0_combout\ : std_logic;
SIGNAL \ones~16_combout\ : std_logic;
SIGNAL \ones~21_combout\ : std_logic;
SIGNAL \LessThan12~1_combout\ : std_logic;
SIGNAL \LessThan15~1_combout\ : std_logic;
SIGNAL \ones~45_combout\ : std_logic;
SIGNAL \ones~25_combout\ : std_logic;
SIGNAL \ones~30_combout\ : std_logic;
SIGNAL \ones~31_combout\ : std_logic;
SIGNAL \LessThan27~2_combout\ : std_logic;
SIGNAL \ones~39_combout\ : std_logic;
SIGNAL \ones[3]~42_combout\ : std_logic;
SIGNAL \Add8~0_combout\ : std_logic;
SIGNAL \ones~34_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \LessThan3~2clkctrl_outclk\ : std_logic;
SIGNAL \ones[0]_565~combout\ : std_logic;
SIGNAL \ones~14_combout\ : std_logic;
SIGNAL \ones~17_combout\ : std_logic;
SIGNAL \ones~19_combout\ : std_logic;
SIGNAL \LessThan15~0_combout\ : std_logic;
SIGNAL \LessThan18~0_combout\ : std_logic;
SIGNAL \ones~24_combout\ : std_logic;
SIGNAL \ones~27_combout\ : std_logic;
SIGNAL \ones~28_combout\ : std_logic;
SIGNAL \ones~29_combout\ : std_logic;
SIGNAL \LessThan30~0_combout\ : std_logic;
SIGNAL \LessThan30~1_combout\ : std_logic;
SIGNAL \Add8~4_combout\ : std_logic;
SIGNAL \ones[2]_577~combout\ : std_logic;
SIGNAL \LessThan9~1_combout\ : std_logic;
SIGNAL \ones~18_combout\ : std_logic;
SIGNAL \LessThan12~0_combout\ : std_logic;
SIGNAL \ones~20_combout\ : std_logic;
SIGNAL \ones~22_combout\ : std_logic;
SIGNAL \LessThan15~2_combout\ : std_logic;
SIGNAL \LessThan18~1_combout\ : std_logic;
SIGNAL \ones~44_combout\ : std_logic;
SIGNAL \ones~23_combout\ : std_logic;
SIGNAL \LessThan24~0_combout\ : std_logic;
SIGNAL \ones~33_combout\ : std_logic;
SIGNAL \ones~48_combout\ : std_logic;
SIGNAL \ones~46_combout\ : std_logic;
SIGNAL \ones~36_combout\ : std_logic;
SIGNAL \ones~37_combout\ : std_logic;
SIGNAL \ones[4]~35_combout\ : std_logic;
SIGNAL \ones~38_combout\ : std_logic;
SIGNAL \ones~47_combout\ : std_logic;
SIGNAL \tens[2]~33_combout\ : std_logic;
SIGNAL \LessThan31~0_combout\ : std_logic;
SIGNAL \Add7~3_combout\ : std_logic;
SIGNAL \tens[3]_607~combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \tens~2_combout\ : std_logic;
SIGNAL \LessThan8~2_combout\ : std_logic;
SIGNAL \LessThan11~0_combout\ : std_logic;
SIGNAL \tens~9_combout\ : std_logic;
SIGNAL \LessThan14~0_combout\ : std_logic;
SIGNAL \tens~11_combout\ : std_logic;
SIGNAL \LessThan17~0_combout\ : std_logic;
SIGNAL \LessThan17~1_combout\ : std_logic;
SIGNAL \LessThan20~0_combout\ : std_logic;
SIGNAL \LessThan20~1_combout\ : std_logic;
SIGNAL \LessThan17~2_combout\ : std_logic;
SIGNAL \tens~20_combout\ : std_logic;
SIGNAL \LessThan23~0_combout\ : std_logic;
SIGNAL \LessThan23~1_combout\ : std_logic;
SIGNAL \tens~29_combout\ : std_logic;
SIGNAL \LessThan23~2_combout\ : std_logic;
SIGNAL \LessThan26~2_combout\ : std_logic;
SIGNAL \LessThan26~3_combout\ : std_logic;
SIGNAL \tens~30_combout\ : std_logic;
SIGNAL \tens~27_combout\ : std_logic;
SIGNAL \tens[1]~36_combout\ : std_logic;
SIGNAL \Add7~4_combout\ : std_logic;
SIGNAL \tens[1]_595~combout\ : std_logic;
SIGNAL \LessThan5~1_combout\ : std_logic;
SIGNAL \tens~4_combout\ : std_logic;
SIGNAL \LessThan8~3_combout\ : std_logic;
SIGNAL \LessThan11~1_combout\ : std_logic;
SIGNAL \tens~7_combout\ : std_logic;
SIGNAL \tens~8_combout\ : std_logic;
SIGNAL \tens~12_combout\ : std_logic;
SIGNAL \tens~16_combout\ : std_logic;
SIGNAL \tens~17_combout\ : std_logic;
SIGNAL \tens~25_combout\ : std_logic;
SIGNAL \tens~26_combout\ : std_logic;
SIGNAL \tens~22_combout\ : std_logic;
SIGNAL \tens~32_combout\ : std_logic;
SIGNAL \tens~34_combout\ : std_logic;
SIGNAL \tens[3]~35_combout\ : std_logic;
SIGNAL \tens[4]~31_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~0clkctrl_outclk\ : std_logic;
SIGNAL \tens[0]_589~combout\ : std_logic;
SIGNAL \tens~37_combout\ : std_logic;
SIGNAL \tens~5_combout\ : std_logic;
SIGNAL \tens~6_combout\ : std_logic;
SIGNAL \tens~14_combout\ : std_logic;
SIGNAL \tens~19_combout\ : std_logic;
SIGNAL \tens~21_combout\ : std_logic;
SIGNAL \tens~28_combout\ : std_logic;
SIGNAL \LessThan29~2_combout\ : std_logic;
SIGNAL \LessThan29~3_combout\ : std_logic;
SIGNAL \Add7~2_combout\ : std_logic;
SIGNAL \tens[2]_601~combout\ : std_logic;
SIGNAL \tens~3_combout\ : std_logic;
SIGNAL \tens~10_combout\ : std_logic;
SIGNAL \LessThan14~1_combout\ : std_logic;
SIGNAL \tens~13_combout\ : std_logic;
SIGNAL \tens~15_combout\ : std_logic;
SIGNAL \tens~18_combout\ : std_logic;
SIGNAL \tens~23_combout\ : std_logic;
SIGNAL \LessThan16~0_combout\ : std_logic;
SIGNAL \Add6~5_combout\ : std_logic;
SIGNAL \LessThan19~4_combout\ : std_logic;
SIGNAL \hundreds[0]_613~combout\ : std_logic;
SIGNAL \LessThan7~3_combout\ : std_logic;
SIGNAL \hundreds~8_combout\ : std_logic;
SIGNAL \hundreds~11_combout\ : std_logic;
SIGNAL \LessThan10~4_combout\ : std_logic;
SIGNAL \LessThan7~5_combout\ : std_logic;
SIGNAL \hundreds~9_combout\ : std_logic;
SIGNAL \hundreds~10_combout\ : std_logic;
SIGNAL \LessThan13~0_combout\ : std_logic;
SIGNAL \tens~24_combout\ : std_logic;
SIGNAL \LessThan10~3_combout\ : std_logic;
SIGNAL \LessThan13~1_combout\ : std_logic;
SIGNAL \hundreds~20_combout\ : std_logic;
SIGNAL \hundreds~15_combout\ : std_logic;
SIGNAL \LessThan19~2_combout\ : std_logic;
SIGNAL \hundreds~19_combout\ : std_logic;
SIGNAL \LessThan22~0_combout\ : std_logic;
SIGNAL \hundreds~30_combout\ : std_logic;
SIGNAL \hundreds~31_combout\ : std_logic;
SIGNAL \LessThan28~0_combout\ : std_logic;
SIGNAL \hundreds~23_combout\ : std_logic;
SIGNAL \hundreds~24_combout\ : std_logic;
SIGNAL \hundreds~21_combout\ : std_logic;
SIGNAL \LessThan25~0_combout\ : std_logic;
SIGNAL \hundreds~26_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~1clkctrl_outclk\ : std_logic;
SIGNAL \hundreds[1]_619~combout\ : std_logic;
SIGNAL \Add6~6_combout\ : std_logic;
SIGNAL \hundreds[2]_625~combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \Add9~0_combout\ : std_logic;
SIGNAL \LessThan7~4_combout\ : std_logic;
SIGNAL \hundreds~12_combout\ : std_logic;
SIGNAL \hundreds~14_combout\ : std_logic;
SIGNAL \LessThan16~1_combout\ : std_logic;
SIGNAL \hundreds~16_combout\ : std_logic;
SIGNAL \LessThan22~1_combout\ : std_logic;
SIGNAL \LessThan25~1_combout\ : std_logic;
SIGNAL \LessThan25~2_combout\ : std_logic;
SIGNAL \hundreds~32_combout\ : std_logic;
SIGNAL \hundreds[2]~27_combout\ : std_logic;
SIGNAL \hundreds[3]~28_combout\ : std_logic;
SIGNAL \Add6~4_combout\ : std_logic;
SIGNAL \hundreds[3]_631~combout\ : std_logic;
SIGNAL \LessThan7~2_combout\ : std_logic;
SIGNAL \LessThan10~2_combout\ : std_logic;
SIGNAL \hundreds~13_combout\ : std_logic;
SIGNAL \LessThan13~2_combout\ : std_logic;
SIGNAL \hundreds~17_combout\ : std_logic;
SIGNAL \hundreds~18_combout\ : std_logic;
SIGNAL \LessThan19~3_combout\ : std_logic;
SIGNAL \hundreds~29_combout\ : std_logic;
SIGNAL \hundreds~22_combout\ : std_logic;
SIGNAL \LessThan28~1_combout\ : std_logic;
SIGNAL \hundreds[1]~25_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \select_state.100~q\ : std_logic;
SIGNAL \select_state.001~0_combout\ : std_logic;
SIGNAL \select_state.001~q\ : std_logic;
SIGNAL \select_state.010~0_combout\ : std_logic;
SIGNAL \select_state.010~q\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \Selector12~2_combout\ : std_logic;
SIGNAL \ones[2]~40_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \segments~0_combout\ : std_logic;
SIGNAL \segments~1_combout\ : std_logic;
SIGNAL \Decoder1~0_combout\ : std_logic;
SIGNAL \WideOr6~0_combout\ : std_logic;
SIGNAL \WideOr4~0_combout\ : std_logic;
SIGNAL \WideOr3~0_combout\ : std_logic;
SIGNAL \WideOr1~0_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \duty~1_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \duty~0_combout\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \buttons[2]~input_o\ : std_logic;
SIGNAL \buttons[5]~input_o\ : std_logic;
SIGNAL \buttons[4]~input_o\ : std_logic;
SIGNAL \buttons[3]~input_o\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \buttons[7]~input_o\ : std_logic;
SIGNAL \buttons[6]~input_o\ : std_logic;
SIGNAL \Equal4~1_combout\ : std_logic;
SIGNAL \buttons[1]~input_o\ : std_logic;
SIGNAL \buttons[0]~input_o\ : std_logic;
SIGNAL \Equal4~2_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \lumens[0]~4_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~19_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~17_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \lumens~1_combout\ : std_logic;
SIGNAL \lumens~0_combout\ : std_logic;
SIGNAL \lumens~2_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \pwm_count~1_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \pwm_count~0_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \Add2~13\ : std_logic;
SIGNAL \Add2~14_combout\ : std_logic;
SIGNAL \pwm_count~2_combout\ : std_logic;
SIGNAL \Add2~15\ : std_logic;
SIGNAL \Add2~16_combout\ : std_logic;
SIGNAL \pwm_count~4_combout\ : std_logic;
SIGNAL \Add2~17\ : std_logic;
SIGNAL \Add2~18_combout\ : std_logic;
SIGNAL \pwm_count~5_combout\ : std_logic;
SIGNAL \Add2~19\ : std_logic;
SIGNAL \Add2~20_combout\ : std_logic;
SIGNAL \Add2~21\ : std_logic;
SIGNAL \Add2~22_combout\ : std_logic;
SIGNAL \Add2~23\ : std_logic;
SIGNAL \Add2~24_combout\ : std_logic;
SIGNAL \pwm_count~3_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \lumens~3_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add1~15_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~12_combout\ : std_logic;
SIGNAL \pwm~reg0_q\ : std_logic;
SIGNAL \encodera|count\ : std_logic_vector(15 DOWNTO 0);
SIGNAL pwm_count : std_logic_vector(12 DOWNTO 0);
SIGNAL lumens : std_logic_vector(6 DOWNTO 0);
SIGNAL encoder1_last : std_logic_vector(2 DOWNTO 0);
SIGNAL cnt : std_logic_vector(9 DOWNTO 0);
SIGNAL encoder0_last : std_logic_vector(2 DOWNTO 0);
SIGNAL \frame_rate0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \encoderb|count\ : std_logic_vector(15 DOWNTO 0);
SIGNAL duty : std_logic_vector(6 DOWNTO 0);
SIGNAL \button_clk0|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_WideOr3~0_combout\ : std_logic;
SIGNAL \ALT_INV_select_state.100~q\ : std_logic;

BEGIN

ww_buttons <= buttons;
ww_encoder0 <= encoder0;
ww_encoder1 <= encoder1;
ww_clk <= clk;
ww_reset <= reset;
lock_pwm <= ww_lock_pwm;
lock_display <= ww_lock_display;
pwm_led <= ww_pwm_led;
segments <= ww_segments;
\select\ <= \ww_select\;
pwm_clk <= ww_pwm_clk;
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

\frame_rate0|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk~input_o\);

\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(0) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(0);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(1) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(1);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(2) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(2);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(3) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(3);
\frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(4) <= \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\(4);

\button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \button_clk0|altpll_component|auto_generated|wire_pll1_clk\(0));

\LessThan1~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \LessThan1~1_combout\);

\LessThan3~2clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \LessThan3~2_combout\);

\LessThan2~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \LessThan2~0_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \frame_rate0|altpll_component|auto_generated|wire_pll1_clk\(1));
\ALT_INV_WideOr3~0_combout\ <= NOT \WideOr3~0_combout\;
\ALT_INV_select_state.100~q\ <= NOT \select_state.100~q\;

-- Location: IOOBUF_X0_Y4_N16
\lock_pwm~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \button_clk0|altpll_component|auto_generated|wire_pll1_locked\,
	devoe => ww_devoe,
	o => ww_lock_pwm);

-- Location: IOOBUF_X1_Y34_N2
\lock_display~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \frame_rate0|altpll_component|auto_generated|wire_pll1_locked\,
	devoe => ww_devoe,
	o => ww_lock_display);

-- Location: IOOBUF_X7_Y34_N2
\pwm_led~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_pwm_led);

-- Location: IOOBUF_X11_Y0_N23
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

-- Location: IOOBUF_X16_Y0_N23
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

-- Location: IOOBUF_X14_Y0_N16
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

-- Location: IOOBUF_X16_Y0_N16
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

-- Location: IOOBUF_X11_Y0_N16
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

-- Location: IOOBUF_X14_Y0_N2
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

-- Location: IOOBUF_X14_Y0_N23
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

-- Location: IOOBUF_X14_Y0_N9
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

-- Location: IOOBUF_X18_Y0_N23
\select[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector12~2_combout\,
	devoe => ww_devoe,
	o => \ww_select\(1));

-- Location: IOOBUF_X0_Y12_N2
\select[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector11~0_combout\,
	devoe => ww_devoe,
	o => \ww_select\(2));

-- Location: IOOBUF_X5_Y0_N23
\pwm_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \button_clk0|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_pwm_clk);

-- Location: IOOBUF_X1_Y34_N9
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

-- Location: IOOBUF_X53_Y14_N2
\pwm~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm~reg0_q\,
	devoe => ww_devoe,
	o => ww_pwm);

-- Location: IOIBUF_X0_Y16_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: PLL_1
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
	areset => GND,
	fbin => \button_clk0|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \button_clk0|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \button_clk0|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \button_clk0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \button_clk0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: PLL_3
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
	locked => \frame_rate0|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \frame_rate0|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \frame_rate0|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G2
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

-- Location: IOIBUF_X0_Y11_N1
\encoder1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_encoder1,
	o => \encoder1~input_o\);

-- Location: FF_X8_Y11_N7
\encoderb|A0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \encoder1~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|A0~q\);

-- Location: LCCOMB_X8_Y11_N20
\encoderb|count~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~14_combout\ = (\encoderb|Add0~30_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datab => \encoderb|triggered~q\,
	datac => \encoderb|Add0~30_combout\,
	combout => \encoderb|count~14_combout\);

-- Location: FF_X8_Y11_N21
\encoderb|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(15));

-- Location: LCCOMB_X9_Y11_N0
\encoderb|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~0_combout\ = \encoderb|count\(0) $ (VCC)
-- \encoderb|Add0~1\ = CARRY(\encoderb|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(0),
	datad => VCC,
	combout => \encoderb|Add0~0_combout\,
	cout => \encoderb|Add0~1\);

-- Location: LCCOMB_X8_Y11_N30
\encoderb|triggered~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~6_combout\ = (\encoderb|Add0~0_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datab => \encoderb|triggered~q\,
	datac => \encoderb|Add0~0_combout\,
	combout => \encoderb|triggered~6_combout\);

-- Location: FF_X8_Y11_N31
\encoderb|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|triggered~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(0));

-- Location: LCCOMB_X9_Y11_N2
\encoderb|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~2_combout\ = (\encoderb|count\(1) & (!\encoderb|Add0~1\)) # (!\encoderb|count\(1) & ((\encoderb|Add0~1\) # (GND)))
-- \encoderb|Add0~3\ = CARRY((!\encoderb|Add0~1\) # (!\encoderb|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(1),
	datad => VCC,
	cin => \encoderb|Add0~1\,
	combout => \encoderb|Add0~2_combout\,
	cout => \encoderb|Add0~3\);

-- Location: LCCOMB_X8_Y11_N16
\encoderb|count~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~13_combout\ = (\encoderb|Add0~2_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datac => \encoderb|triggered~q\,
	datad => \encoderb|Add0~2_combout\,
	combout => \encoderb|count~13_combout\);

-- Location: FF_X8_Y11_N17
\encoderb|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(1));

-- Location: LCCOMB_X9_Y11_N4
\encoderb|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~4_combout\ = (\encoderb|count\(2) & (\encoderb|Add0~3\ $ (GND))) # (!\encoderb|count\(2) & (!\encoderb|Add0~3\ & VCC))
-- \encoderb|Add0~5\ = CARRY((\encoderb|count\(2) & !\encoderb|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(2),
	datad => VCC,
	cin => \encoderb|Add0~3\,
	combout => \encoderb|Add0~4_combout\,
	cout => \encoderb|Add0~5\);

-- Location: LCCOMB_X8_Y11_N18
\encoderb|count~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~12_combout\ = (\encoderb|Add0~4_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datac => \encoderb|triggered~q\,
	datad => \encoderb|Add0~4_combout\,
	combout => \encoderb|count~12_combout\);

-- Location: FF_X8_Y11_N19
\encoderb|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(2));

-- Location: LCCOMB_X9_Y11_N6
\encoderb|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~6_combout\ = (\encoderb|count\(3) & (!\encoderb|Add0~5\)) # (!\encoderb|count\(3) & ((\encoderb|Add0~5\) # (GND)))
-- \encoderb|Add0~7\ = CARRY((!\encoderb|Add0~5\) # (!\encoderb|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(3),
	datad => VCC,
	cin => \encoderb|Add0~5\,
	combout => \encoderb|Add0~6_combout\,
	cout => \encoderb|Add0~7\);

-- Location: LCCOMB_X8_Y11_N0
\encoderb|count~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~11_combout\ = (\encoderb|Add0~6_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datac => \encoderb|triggered~q\,
	datad => \encoderb|Add0~6_combout\,
	combout => \encoderb|count~11_combout\);

-- Location: FF_X8_Y11_N1
\encoderb|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(3));

-- Location: LCCOMB_X9_Y11_N8
\encoderb|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~8_combout\ = (\encoderb|count\(4) & (\encoderb|Add0~7\ $ (GND))) # (!\encoderb|count\(4) & (!\encoderb|Add0~7\ & VCC))
-- \encoderb|Add0~9\ = CARRY((\encoderb|count\(4) & !\encoderb|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(4),
	datad => VCC,
	cin => \encoderb|Add0~7\,
	combout => \encoderb|Add0~8_combout\,
	cout => \encoderb|Add0~9\);

-- Location: LCCOMB_X8_Y11_N10
\encoderb|count~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~10_combout\ = (\encoderb|Add0~8_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datab => \encoderb|triggered~q\,
	datac => \encoderb|Add0~8_combout\,
	combout => \encoderb|count~10_combout\);

-- Location: FF_X8_Y11_N11
\encoderb|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(4));

-- Location: LCCOMB_X9_Y11_N10
\encoderb|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~10_combout\ = (\encoderb|count\(5) & (!\encoderb|Add0~9\)) # (!\encoderb|count\(5) & ((\encoderb|Add0~9\) # (GND)))
-- \encoderb|Add0~11\ = CARRY((!\encoderb|Add0~9\) # (!\encoderb|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(5),
	datad => VCC,
	cin => \encoderb|Add0~9\,
	combout => \encoderb|Add0~10_combout\,
	cout => \encoderb|Add0~11\);

-- Location: LCCOMB_X8_Y11_N24
\encoderb|count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~9_combout\ = (\encoderb|Add0~10_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datab => \encoderb|triggered~q\,
	datac => \encoderb|Add0~10_combout\,
	combout => \encoderb|count~9_combout\);

-- Location: FF_X8_Y11_N25
\encoderb|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(5));

-- Location: LCCOMB_X9_Y11_N12
\encoderb|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~12_combout\ = (\encoderb|count\(6) & (\encoderb|Add0~11\ $ (GND))) # (!\encoderb|count\(6) & (!\encoderb|Add0~11\ & VCC))
-- \encoderb|Add0~13\ = CARRY((\encoderb|count\(6) & !\encoderb|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(6),
	datad => VCC,
	cin => \encoderb|Add0~11\,
	combout => \encoderb|Add0~12_combout\,
	cout => \encoderb|Add0~13\);

-- Location: LCCOMB_X10_Y11_N2
\encoderb|count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~8_combout\ = (\encoderb|Add0~12_combout\ & (\encoderb|triggered~q\ $ (\encoderb|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~q\,
	datac => \encoderb|A0~q\,
	datad => \encoderb|Add0~12_combout\,
	combout => \encoderb|count~8_combout\);

-- Location: FF_X10_Y11_N3
\encoderb|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(6));

-- Location: LCCOMB_X9_Y11_N14
\encoderb|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~14_combout\ = (\encoderb|count\(7) & (!\encoderb|Add0~13\)) # (!\encoderb|count\(7) & ((\encoderb|Add0~13\) # (GND)))
-- \encoderb|Add0~15\ = CARRY((!\encoderb|Add0~13\) # (!\encoderb|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(7),
	datad => VCC,
	cin => \encoderb|Add0~13\,
	combout => \encoderb|Add0~14_combout\,
	cout => \encoderb|Add0~15\);

-- Location: LCCOMB_X10_Y11_N4
\encoderb|count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~7_combout\ = (\encoderb|Add0~14_combout\ & (\encoderb|triggered~q\ $ (\encoderb|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~q\,
	datac => \encoderb|A0~q\,
	datad => \encoderb|Add0~14_combout\,
	combout => \encoderb|count~7_combout\);

-- Location: FF_X10_Y11_N5
\encoderb|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(7));

-- Location: LCCOMB_X9_Y11_N16
\encoderb|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~16_combout\ = (\encoderb|count\(8) & (\encoderb|Add0~15\ $ (GND))) # (!\encoderb|count\(8) & (!\encoderb|Add0~15\ & VCC))
-- \encoderb|Add0~17\ = CARRY((\encoderb|count\(8) & !\encoderb|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(8),
	datad => VCC,
	cin => \encoderb|Add0~15\,
	combout => \encoderb|Add0~16_combout\,
	cout => \encoderb|Add0~17\);

-- Location: LCCOMB_X10_Y11_N6
\encoderb|count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~6_combout\ = (\encoderb|Add0~16_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|A0~q\,
	datac => \encoderb|Add0~16_combout\,
	datad => \encoderb|triggered~q\,
	combout => \encoderb|count~6_combout\);

-- Location: FF_X10_Y11_N7
\encoderb|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(8));

-- Location: LCCOMB_X9_Y11_N18
\encoderb|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~18_combout\ = (\encoderb|count\(9) & (!\encoderb|Add0~17\)) # (!\encoderb|count\(9) & ((\encoderb|Add0~17\) # (GND)))
-- \encoderb|Add0~19\ = CARRY((!\encoderb|Add0~17\) # (!\encoderb|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(9),
	datad => VCC,
	cin => \encoderb|Add0~17\,
	combout => \encoderb|Add0~18_combout\,
	cout => \encoderb|Add0~19\);

-- Location: LCCOMB_X10_Y11_N12
\encoderb|count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~5_combout\ = (\encoderb|Add0~18_combout\ & (\encoderb|triggered~q\ $ (\encoderb|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~q\,
	datac => \encoderb|A0~q\,
	datad => \encoderb|Add0~18_combout\,
	combout => \encoderb|count~5_combout\);

-- Location: FF_X10_Y11_N13
\encoderb|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(9));

-- Location: LCCOMB_X9_Y11_N20
\encoderb|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~20_combout\ = (\encoderb|count\(10) & (\encoderb|Add0~19\ $ (GND))) # (!\encoderb|count\(10) & (!\encoderb|Add0~19\ & VCC))
-- \encoderb|Add0~21\ = CARRY((\encoderb|count\(10) & !\encoderb|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(10),
	datad => VCC,
	cin => \encoderb|Add0~19\,
	combout => \encoderb|Add0~20_combout\,
	cout => \encoderb|Add0~21\);

-- Location: LCCOMB_X10_Y11_N22
\encoderb|count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~4_combout\ = (\encoderb|Add0~20_combout\ & (\encoderb|triggered~q\ $ (\encoderb|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~q\,
	datac => \encoderb|A0~q\,
	datad => \encoderb|Add0~20_combout\,
	combout => \encoderb|count~4_combout\);

-- Location: FF_X10_Y11_N23
\encoderb|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(10));

-- Location: LCCOMB_X9_Y11_N22
\encoderb|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~22_combout\ = (\encoderb|count\(11) & (!\encoderb|Add0~21\)) # (!\encoderb|count\(11) & ((\encoderb|Add0~21\) # (GND)))
-- \encoderb|Add0~23\ = CARRY((!\encoderb|Add0~21\) # (!\encoderb|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(11),
	datad => VCC,
	cin => \encoderb|Add0~21\,
	combout => \encoderb|Add0~22_combout\,
	cout => \encoderb|Add0~23\);

-- Location: LCCOMB_X10_Y11_N24
\encoderb|count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~3_combout\ = (\encoderb|Add0~22_combout\ & (\encoderb|triggered~q\ $ (\encoderb|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~q\,
	datac => \encoderb|A0~q\,
	datad => \encoderb|Add0~22_combout\,
	combout => \encoderb|count~3_combout\);

-- Location: FF_X10_Y11_N25
\encoderb|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(11));

-- Location: LCCOMB_X9_Y11_N24
\encoderb|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~24_combout\ = (\encoderb|count\(12) & (\encoderb|Add0~23\ $ (GND))) # (!\encoderb|count\(12) & (!\encoderb|Add0~23\ & VCC))
-- \encoderb|Add0~25\ = CARRY((\encoderb|count\(12) & !\encoderb|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|count\(12),
	datad => VCC,
	cin => \encoderb|Add0~23\,
	combout => \encoderb|Add0~24_combout\,
	cout => \encoderb|Add0~25\);

-- Location: LCCOMB_X10_Y11_N10
\encoderb|count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~2_combout\ = (\encoderb|Add0~24_combout\ & (\encoderb|triggered~q\ $ (\encoderb|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~q\,
	datac => \encoderb|A0~q\,
	datad => \encoderb|Add0~24_combout\,
	combout => \encoderb|count~2_combout\);

-- Location: FF_X10_Y11_N11
\encoderb|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(12));

-- Location: LCCOMB_X9_Y11_N26
\encoderb|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~26_combout\ = (\encoderb|count\(13) & (!\encoderb|Add0~25\)) # (!\encoderb|count\(13) & ((\encoderb|Add0~25\) # (GND)))
-- \encoderb|Add0~27\ = CARRY((!\encoderb|Add0~25\) # (!\encoderb|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(13),
	datad => VCC,
	cin => \encoderb|Add0~25\,
	combout => \encoderb|Add0~26_combout\,
	cout => \encoderb|Add0~27\);

-- Location: LCCOMB_X10_Y11_N20
\encoderb|count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~1_combout\ = (\encoderb|Add0~26_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encoderb|A0~q\,
	datac => \encoderb|Add0~26_combout\,
	datad => \encoderb|triggered~q\,
	combout => \encoderb|count~1_combout\);

-- Location: FF_X10_Y11_N21
\encoderb|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(13));

-- Location: LCCOMB_X9_Y11_N28
\encoderb|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~28_combout\ = (\encoderb|count\(14) & (\encoderb|Add0~27\ $ (GND))) # (!\encoderb|count\(14) & (!\encoderb|Add0~27\ & VCC))
-- \encoderb|Add0~29\ = CARRY((\encoderb|count\(14) & !\encoderb|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|count\(14),
	datad => VCC,
	cin => \encoderb|Add0~27\,
	combout => \encoderb|Add0~28_combout\,
	cout => \encoderb|Add0~29\);

-- Location: LCCOMB_X8_Y11_N26
\encoderb|count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|count~0_combout\ = (\encoderb|Add0~28_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datac => \encoderb|triggered~q\,
	datad => \encoderb|Add0~28_combout\,
	combout => \encoderb|count~0_combout\);

-- Location: FF_X8_Y11_N27
\encoderb|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|count\(14));

-- Location: LCCOMB_X9_Y11_N30
\encoderb|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|Add0~30_combout\ = \encoderb|Add0~29\ $ (\encoderb|count\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \encoderb|count\(15),
	cin => \encoderb|Add0~29\,
	combout => \encoderb|Add0~30_combout\);

-- Location: LCCOMB_X8_Y11_N22
\encoderb|triggered~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~1_combout\ = (\encoderb|Add0~6_combout\ & (\encoderb|Add0~8_combout\ & (\encoderb|Add0~10_combout\ & \encoderb|Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|Add0~6_combout\,
	datab => \encoderb|Add0~8_combout\,
	datac => \encoderb|Add0~10_combout\,
	datad => \encoderb|Add0~4_combout\,
	combout => \encoderb|triggered~1_combout\);

-- Location: LCCOMB_X10_Y11_N8
\encoderb|triggered~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~2_combout\ = (\encoderb|Add0~14_combout\ & (\encoderb|Add0~18_combout\ & (\encoderb|Add0~16_combout\ & \encoderb|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|Add0~14_combout\,
	datab => \encoderb|Add0~18_combout\,
	datac => \encoderb|Add0~16_combout\,
	datad => \encoderb|Add0~12_combout\,
	combout => \encoderb|triggered~2_combout\);

-- Location: LCCOMB_X8_Y11_N4
\encoderb|triggered~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~0_combout\ = (\encoderb|Add0~0_combout\ & (\encoderb|Add0~2_combout\ & (\encoderb|A0~q\ $ (\encoderb|triggered~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|A0~q\,
	datab => \encoderb|triggered~q\,
	datac => \encoderb|Add0~0_combout\,
	datad => \encoderb|Add0~2_combout\,
	combout => \encoderb|triggered~0_combout\);

-- Location: LCCOMB_X10_Y11_N18
\encoderb|triggered~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~3_combout\ = (\encoderb|Add0~24_combout\ & (\encoderb|Add0~22_combout\ & (\encoderb|Add0~26_combout\ & \encoderb|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|Add0~24_combout\,
	datab => \encoderb|Add0~22_combout\,
	datac => \encoderb|Add0~26_combout\,
	datad => \encoderb|Add0~20_combout\,
	combout => \encoderb|triggered~3_combout\);

-- Location: LCCOMB_X8_Y11_N28
\encoderb|triggered~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~4_combout\ = (\encoderb|triggered~1_combout\ & (\encoderb|triggered~2_combout\ & (\encoderb|triggered~0_combout\ & \encoderb|triggered~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|triggered~1_combout\,
	datab => \encoderb|triggered~2_combout\,
	datac => \encoderb|triggered~0_combout\,
	datad => \encoderb|triggered~3_combout\,
	combout => \encoderb|triggered~4_combout\);

-- Location: LCCOMB_X8_Y11_N8
\encoderb|triggered~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoderb|triggered~5_combout\ = \encoderb|triggered~q\ $ (((\encoderb|Add0~30_combout\ & (\encoderb|triggered~4_combout\ & \encoderb|Add0~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encoderb|Add0~30_combout\,
	datab => \encoderb|triggered~4_combout\,
	datac => \encoderb|triggered~q\,
	datad => \encoderb|Add0~28_combout\,
	combout => \encoderb|triggered~5_combout\);

-- Location: FF_X8_Y11_N9
\encoderb|triggered\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoderb|triggered~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encoderb|triggered~q\);

-- Location: LCCOMB_X15_Y14_N8
\encoder1_last[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder1_last[0]~feeder_combout\ = \encoderb|triggered~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \encoderb|triggered~q\,
	combout => \encoder1_last[0]~feeder_combout\);

-- Location: FF_X15_Y14_N9
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

-- Location: LCCOMB_X19_Y14_N18
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

-- Location: FF_X19_Y14_N19
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

-- Location: LCCOMB_X19_Y14_N30
\encoder1_last[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder1_last[2]~feeder_combout\ = encoder1_last(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => encoder1_last(1),
	combout => \encoder1_last[2]~feeder_combout\);

-- Location: FF_X19_Y14_N31
\encoder1_last[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoder1_last[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder1_last(2));

-- Location: IOIBUF_X53_Y20_N22
\encoder0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_encoder0,
	o => \encoder0~input_o\);

-- Location: LCCOMB_X47_Y20_N12
\encodera|A0~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|A0~feeder_combout\ = \encoder0~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \encoder0~input_o\,
	combout => \encodera|A0~feeder_combout\);

-- Location: FF_X47_Y20_N13
\encodera|A0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|A0~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|A0~q\);

-- Location: LCCOMB_X45_Y20_N28
\encodera|count~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~14_combout\ = (\encodera|Add0~30_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~30_combout\,
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	combout => \encodera|count~14_combout\);

-- Location: FF_X45_Y20_N29
\encodera|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(15));

-- Location: LCCOMB_X46_Y20_N0
\encodera|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~0_combout\ = \encodera|count\(0) $ (VCC)
-- \encodera|Add0~1\ = CARRY(\encodera|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(0),
	datad => VCC,
	combout => \encodera|Add0~0_combout\,
	cout => \encodera|Add0~1\);

-- Location: LCCOMB_X47_Y20_N10
\encodera|triggered~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~0_combout\ = (\encodera|Add0~0_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|Add0~0_combout\,
	datad => \encodera|A0~q\,
	combout => \encodera|triggered~0_combout\);

-- Location: FF_X47_Y20_N11
\encodera|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|triggered~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(0));

-- Location: LCCOMB_X46_Y20_N2
\encodera|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~2_combout\ = (\encodera|count\(1) & (!\encodera|Add0~1\)) # (!\encodera|count\(1) & ((\encodera|Add0~1\) # (GND)))
-- \encodera|Add0~3\ = CARRY((!\encodera|Add0~1\) # (!\encodera|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|count\(1),
	datad => VCC,
	cin => \encodera|Add0~1\,
	combout => \encodera|Add0~2_combout\,
	cout => \encodera|Add0~3\);

-- Location: LCCOMB_X47_Y20_N20
\encodera|count~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~13_combout\ = (\encodera|Add0~2_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~2_combout\,
	datac => \encodera|triggered~q\,
	datad => \encodera|A0~q\,
	combout => \encodera|count~13_combout\);

-- Location: FF_X47_Y20_N21
\encodera|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(1));

-- Location: LCCOMB_X46_Y20_N4
\encodera|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~4_combout\ = (\encodera|count\(2) & (\encodera|Add0~3\ $ (GND))) # (!\encodera|count\(2) & (!\encodera|Add0~3\ & VCC))
-- \encodera|Add0~5\ = CARRY((\encodera|count\(2) & !\encodera|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|count\(2),
	datad => VCC,
	cin => \encodera|Add0~3\,
	combout => \encodera|Add0~4_combout\,
	cout => \encodera|Add0~5\);

-- Location: LCCOMB_X47_Y20_N6
\encodera|count~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~12_combout\ = (\encodera|Add0~4_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|Add0~4_combout\,
	datad => \encodera|A0~q\,
	combout => \encodera|count~12_combout\);

-- Location: FF_X47_Y20_N7
\encodera|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(2));

-- Location: LCCOMB_X46_Y20_N6
\encodera|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~6_combout\ = (\encodera|count\(3) & (!\encodera|Add0~5\)) # (!\encodera|count\(3) & ((\encodera|Add0~5\) # (GND)))
-- \encodera|Add0~7\ = CARRY((!\encodera|Add0~5\) # (!\encodera|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|count\(3),
	datad => VCC,
	cin => \encodera|Add0~5\,
	combout => \encodera|Add0~6_combout\,
	cout => \encodera|Add0~7\);

-- Location: LCCOMB_X47_Y20_N4
\encodera|count~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~11_combout\ = (\encodera|Add0~6_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|Add0~6_combout\,
	datad => \encodera|A0~q\,
	combout => \encodera|count~11_combout\);

-- Location: FF_X47_Y20_N5
\encodera|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(3));

-- Location: LCCOMB_X46_Y20_N8
\encodera|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~8_combout\ = (\encodera|count\(4) & (\encodera|Add0~7\ $ (GND))) # (!\encodera|count\(4) & (!\encodera|Add0~7\ & VCC))
-- \encodera|Add0~9\ = CARRY((\encodera|count\(4) & !\encodera|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(4),
	datad => VCC,
	cin => \encodera|Add0~7\,
	combout => \encodera|Add0~8_combout\,
	cout => \encodera|Add0~9\);

-- Location: LCCOMB_X47_Y20_N18
\encodera|count~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~10_combout\ = (\encodera|Add0~8_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~8_combout\,
	datac => \encodera|triggered~q\,
	datad => \encodera|A0~q\,
	combout => \encodera|count~10_combout\);

-- Location: FF_X47_Y20_N19
\encodera|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(4));

-- Location: LCCOMB_X46_Y20_N10
\encodera|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~10_combout\ = (\encodera|count\(5) & (!\encodera|Add0~9\)) # (!\encodera|count\(5) & ((\encodera|Add0~9\) # (GND)))
-- \encodera|Add0~11\ = CARRY((!\encodera|Add0~9\) # (!\encodera|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(5),
	datad => VCC,
	cin => \encodera|Add0~9\,
	combout => \encodera|Add0~10_combout\,
	cout => \encodera|Add0~11\);

-- Location: LCCOMB_X47_Y20_N8
\encodera|count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~9_combout\ = (\encodera|Add0~10_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~10_combout\,
	datac => \encodera|triggered~q\,
	datad => \encodera|A0~q\,
	combout => \encodera|count~9_combout\);

-- Location: FF_X47_Y20_N9
\encodera|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(5));

-- Location: LCCOMB_X46_Y20_N12
\encodera|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~12_combout\ = (\encodera|count\(6) & (\encodera|Add0~11\ $ (GND))) # (!\encodera|count\(6) & (!\encodera|Add0~11\ & VCC))
-- \encodera|Add0~13\ = CARRY((\encodera|count\(6) & !\encodera|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(6),
	datad => VCC,
	cin => \encodera|Add0~11\,
	combout => \encodera|Add0~12_combout\,
	cout => \encodera|Add0~13\);

-- Location: LCCOMB_X45_Y20_N6
\encodera|count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~8_combout\ = (\encodera|Add0~12_combout\ & (\encodera|A0~q\ $ (\encodera|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|Add0~12_combout\,
	datac => \encodera|A0~q\,
	datad => \encodera|triggered~q\,
	combout => \encodera|count~8_combout\);

-- Location: FF_X45_Y20_N7
\encodera|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(6));

-- Location: LCCOMB_X46_Y20_N14
\encodera|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~14_combout\ = (\encodera|count\(7) & (!\encodera|Add0~13\)) # (!\encodera|count\(7) & ((\encodera|Add0~13\) # (GND)))
-- \encodera|Add0~15\ = CARRY((!\encodera|Add0~13\) # (!\encodera|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(7),
	datad => VCC,
	cin => \encodera|Add0~13\,
	combout => \encodera|Add0~14_combout\,
	cout => \encodera|Add0~15\);

-- Location: LCCOMB_X45_Y20_N24
\encodera|count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~7_combout\ = (\encodera|Add0~14_combout\ & (\encodera|A0~q\ $ (\encodera|triggered~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|Add0~14_combout\,
	datac => \encodera|A0~q\,
	datad => \encodera|triggered~q\,
	combout => \encodera|count~7_combout\);

-- Location: FF_X45_Y20_N25
\encodera|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(7));

-- Location: LCCOMB_X46_Y20_N16
\encodera|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~16_combout\ = (\encodera|count\(8) & (\encodera|Add0~15\ $ (GND))) # (!\encodera|count\(8) & (!\encodera|Add0~15\ & VCC))
-- \encodera|Add0~17\ = CARRY((\encodera|count\(8) & !\encodera|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(8),
	datad => VCC,
	cin => \encodera|Add0~15\,
	combout => \encodera|Add0~16_combout\,
	cout => \encodera|Add0~17\);

-- Location: LCCOMB_X45_Y20_N30
\encodera|count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~6_combout\ = (\encodera|Add0~16_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	datad => \encodera|Add0~16_combout\,
	combout => \encodera|count~6_combout\);

-- Location: FF_X45_Y20_N31
\encodera|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(8));

-- Location: LCCOMB_X46_Y20_N18
\encodera|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~18_combout\ = (\encodera|count\(9) & (!\encodera|Add0~17\)) # (!\encodera|count\(9) & ((\encodera|Add0~17\) # (GND)))
-- \encodera|Add0~19\ = CARRY((!\encodera|Add0~17\) # (!\encodera|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(9),
	datad => VCC,
	cin => \encodera|Add0~17\,
	combout => \encodera|Add0~18_combout\,
	cout => \encodera|Add0~19\);

-- Location: LCCOMB_X45_Y20_N20
\encodera|count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~5_combout\ = (\encodera|Add0~18_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	datad => \encodera|Add0~18_combout\,
	combout => \encodera|count~5_combout\);

-- Location: FF_X45_Y20_N21
\encodera|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(9));

-- Location: LCCOMB_X46_Y20_N20
\encodera|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~20_combout\ = (\encodera|count\(10) & (\encodera|Add0~19\ $ (GND))) # (!\encodera|count\(10) & (!\encodera|Add0~19\ & VCC))
-- \encodera|Add0~21\ = CARRY((\encodera|count\(10) & !\encodera|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(10),
	datad => VCC,
	cin => \encodera|Add0~19\,
	combout => \encodera|Add0~20_combout\,
	cout => \encodera|Add0~21\);

-- Location: LCCOMB_X45_Y20_N18
\encodera|count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~4_combout\ = (\encodera|Add0~20_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~20_combout\,
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	combout => \encodera|count~4_combout\);

-- Location: FF_X45_Y20_N19
\encodera|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(10));

-- Location: LCCOMB_X46_Y20_N22
\encodera|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~22_combout\ = (\encodera|count\(11) & (!\encodera|Add0~21\)) # (!\encodera|count\(11) & ((\encodera|Add0~21\) # (GND)))
-- \encodera|Add0~23\ = CARRY((!\encodera|Add0~21\) # (!\encodera|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|count\(11),
	datad => VCC,
	cin => \encodera|Add0~21\,
	combout => \encodera|Add0~22_combout\,
	cout => \encodera|Add0~23\);

-- Location: LCCOMB_X45_Y20_N16
\encodera|count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~3_combout\ = (\encodera|Add0~22_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	datad => \encodera|Add0~22_combout\,
	combout => \encodera|count~3_combout\);

-- Location: FF_X45_Y20_N17
\encodera|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(11));

-- Location: LCCOMB_X46_Y20_N24
\encodera|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~24_combout\ = (\encodera|count\(12) & (\encodera|Add0~23\ $ (GND))) # (!\encodera|count\(12) & (!\encodera|Add0~23\ & VCC))
-- \encodera|Add0~25\ = CARRY((\encodera|count\(12) & !\encodera|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|count\(12),
	datad => VCC,
	cin => \encodera|Add0~23\,
	combout => \encodera|Add0~24_combout\,
	cout => \encodera|Add0~25\);

-- Location: LCCOMB_X45_Y20_N26
\encodera|count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~2_combout\ = (\encodera|Add0~24_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	datad => \encodera|Add0~24_combout\,
	combout => \encodera|count~2_combout\);

-- Location: FF_X45_Y20_N27
\encodera|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(12));

-- Location: LCCOMB_X46_Y20_N26
\encodera|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~26_combout\ = (\encodera|count\(13) & (!\encodera|Add0~25\)) # (!\encodera|count\(13) & ((\encodera|Add0~25\) # (GND)))
-- \encodera|Add0~27\ = CARRY((!\encodera|Add0~25\) # (!\encodera|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encodera|count\(13),
	datad => VCC,
	cin => \encodera|Add0~25\,
	combout => \encodera|Add0~26_combout\,
	cout => \encodera|Add0~27\);

-- Location: LCCOMB_X45_Y20_N4
\encodera|count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~1_combout\ = (\encodera|Add0~26_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~26_combout\,
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	combout => \encodera|count~1_combout\);

-- Location: FF_X45_Y20_N5
\encodera|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(13));

-- Location: LCCOMB_X46_Y20_N28
\encodera|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~28_combout\ = (\encodera|count\(14) & (\encodera|Add0~27\ $ (GND))) # (!\encodera|count\(14) & (!\encodera|Add0~27\ & VCC))
-- \encodera|Add0~29\ = CARRY((\encodera|count\(14) & !\encodera|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|count\(14),
	datad => VCC,
	cin => \encodera|Add0~27\,
	combout => \encodera|Add0~28_combout\,
	cout => \encodera|Add0~29\);

-- Location: LCCOMB_X45_Y20_N14
\encodera|count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|count~0_combout\ = (\encodera|Add0~28_combout\ & (\encodera|triggered~q\ $ (\encodera|A0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \encodera|triggered~q\,
	datac => \encodera|A0~q\,
	datad => \encodera|Add0~28_combout\,
	combout => \encodera|count~0_combout\);

-- Location: FF_X45_Y20_N15
\encodera|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|count\(14));

-- Location: LCCOMB_X46_Y20_N30
\encodera|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|Add0~30_combout\ = \encodera|Add0~29\ $ (\encodera|count\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \encodera|count\(15),
	cin => \encodera|Add0~29\,
	combout => \encodera|Add0~30_combout\);

-- Location: LCCOMB_X45_Y20_N12
\encodera|triggered~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~4_combout\ = (\encodera|Add0~26_combout\ & (\encodera|Add0~24_combout\ & (\encodera|Add0~20_combout\ & \encodera|Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~26_combout\,
	datab => \encodera|Add0~24_combout\,
	datac => \encodera|Add0~20_combout\,
	datad => \encodera|Add0~22_combout\,
	combout => \encodera|triggered~4_combout\);

-- Location: LCCOMB_X45_Y20_N22
\encodera|triggered~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~3_combout\ = (\encodera|Add0~18_combout\ & (\encodera|Add0~14_combout\ & (\encodera|Add0~12_combout\ & \encodera|Add0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~18_combout\,
	datab => \encodera|Add0~14_combout\,
	datac => \encodera|Add0~12_combout\,
	datad => \encodera|Add0~16_combout\,
	combout => \encodera|triggered~3_combout\);

-- Location: LCCOMB_X47_Y20_N22
\encodera|triggered~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~1_combout\ = (\encodera|Add0~10_combout\ & (\encodera|Add0~6_combout\ & (\encodera|Add0~4_combout\ & \encodera|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~10_combout\,
	datab => \encodera|Add0~6_combout\,
	datac => \encodera|Add0~4_combout\,
	datad => \encodera|Add0~8_combout\,
	combout => \encodera|triggered~1_combout\);

-- Location: LCCOMB_X47_Y20_N24
\encodera|triggered~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~2_combout\ = (\encodera|Add0~2_combout\ & (\encodera|triggered~1_combout\ & \encodera|triggered~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~2_combout\,
	datac => \encodera|triggered~1_combout\,
	datad => \encodera|triggered~0_combout\,
	combout => \encodera|triggered~2_combout\);

-- Location: LCCOMB_X45_Y20_N10
\encodera|triggered~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~5_combout\ = (\encodera|triggered~4_combout\ & (\encodera|triggered~3_combout\ & \encodera|triggered~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|triggered~4_combout\,
	datac => \encodera|triggered~3_combout\,
	datad => \encodera|triggered~2_combout\,
	combout => \encodera|triggered~5_combout\);

-- Location: LCCOMB_X45_Y20_N0
\encodera|triggered~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \encodera|triggered~6_combout\ = \encodera|triggered~q\ $ (((\encodera|Add0~30_combout\ & (\encodera|Add0~28_combout\ & \encodera|triggered~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \encodera|Add0~30_combout\,
	datab => \encodera|Add0~28_combout\,
	datac => \encodera|triggered~q\,
	datad => \encodera|triggered~5_combout\,
	combout => \encodera|triggered~6_combout\);

-- Location: FF_X45_Y20_N1
\encodera|triggered\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encodera|triggered~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \encodera|triggered~q\);

-- Location: LCCOMB_X19_Y14_N10
\encoder0_last[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder0_last[0]~feeder_combout\ = \encodera|triggered~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \encodera|triggered~q\,
	combout => \encoder0_last[0]~feeder_combout\);

-- Location: FF_X19_Y14_N11
\encoder0_last[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \encoder0_last[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => encoder0_last(0));

-- Location: LCCOMB_X19_Y14_N12
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

-- Location: FF_X19_Y14_N13
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

-- Location: LCCOMB_X19_Y14_N24
\encoder_turning~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_turning~1_combout\ = encoder1_last(2) $ (encoder0_last(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => encoder1_last(2),
	datad => encoder0_last(1),
	combout => \encoder_turning~1_combout\);

-- Location: LCCOMB_X20_Y13_N2
\cnt[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[0]~10_combout\ = cnt(0) $ (VCC)
-- \cnt[0]~11\ = CARRY(cnt(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datad => VCC,
	combout => \cnt[0]~10_combout\,
	cout => \cnt[0]~11\);

-- Location: FF_X19_Y14_N29
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

-- Location: LCCOMB_X19_Y14_N28
\encoder_turning~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \encoder_turning~0_combout\ = encoder1_last(2) $ (encoder1_last(1) $ (encoder0_last(2) $ (encoder0_last(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => encoder1_last(2),
	datab => encoder1_last(1),
	datac => encoder0_last(2),
	datad => encoder0_last(1),
	combout => \encoder_turning~0_combout\);

-- Location: FF_X19_Y13_N31
\cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \cnt[0]~10_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(0));

-- Location: LCCOMB_X20_Y13_N4
\cnt[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[1]~12_combout\ = (cnt(1) & ((\encoder_turning~1_combout\ & (!\cnt[0]~11\)) # (!\encoder_turning~1_combout\ & (\cnt[0]~11\ & VCC)))) # (!cnt(1) & ((\encoder_turning~1_combout\ & ((\cnt[0]~11\) # (GND))) # (!\encoder_turning~1_combout\ & 
-- (!\cnt[0]~11\))))
-- \cnt[1]~13\ = CARRY((cnt(1) & (\encoder_turning~1_combout\ & !\cnt[0]~11\)) # (!cnt(1) & ((\encoder_turning~1_combout\) # (!\cnt[0]~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(1),
	datab => \encoder_turning~1_combout\,
	datad => VCC,
	cin => \cnt[0]~11\,
	combout => \cnt[1]~12_combout\,
	cout => \cnt[1]~13\);

-- Location: FF_X20_Y13_N31
\cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \cnt[1]~12_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(1));

-- Location: LCCOMB_X20_Y13_N6
\cnt[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[2]~14_combout\ = ((\encoder_turning~1_combout\ $ (cnt(2) $ (\cnt[1]~13\)))) # (GND)
-- \cnt[2]~15\ = CARRY((\encoder_turning~1_combout\ & (cnt(2) & !\cnt[1]~13\)) # (!\encoder_turning~1_combout\ & ((cnt(2)) # (!\cnt[1]~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~1_combout\,
	datab => cnt(2),
	datad => VCC,
	cin => \cnt[1]~13\,
	combout => \cnt[2]~14_combout\,
	cout => \cnt[2]~15\);

-- Location: FF_X19_Y13_N19
\cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \cnt[2]~14_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(2));

-- Location: LCCOMB_X20_Y13_N8
\cnt[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[3]~16_combout\ = (cnt(3) & ((\encoder_turning~1_combout\ & (!\cnt[2]~15\)) # (!\encoder_turning~1_combout\ & (\cnt[2]~15\ & VCC)))) # (!cnt(3) & ((\encoder_turning~1_combout\ & ((\cnt[2]~15\) # (GND))) # (!\encoder_turning~1_combout\ & 
-- (!\cnt[2]~15\))))
-- \cnt[3]~17\ = CARRY((cnt(3) & (\encoder_turning~1_combout\ & !\cnt[2]~15\)) # (!cnt(3) & ((\encoder_turning~1_combout\) # (!\cnt[2]~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => \encoder_turning~1_combout\,
	datad => VCC,
	cin => \cnt[2]~15\,
	combout => \cnt[3]~16_combout\,
	cout => \cnt[3]~17\);

-- Location: FF_X19_Y13_N21
\cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[3]~16_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(3));

-- Location: LCCOMB_X20_Y13_N10
\cnt[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[4]~18_combout\ = ((\encoder_turning~1_combout\ $ (cnt(4) $ (\cnt[3]~17\)))) # (GND)
-- \cnt[4]~19\ = CARRY((\encoder_turning~1_combout\ & (cnt(4) & !\cnt[3]~17\)) # (!\encoder_turning~1_combout\ & ((cnt(4)) # (!\cnt[3]~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \encoder_turning~1_combout\,
	datab => cnt(4),
	datad => VCC,
	cin => \cnt[3]~17\,
	combout => \cnt[4]~18_combout\,
	cout => \cnt[4]~19\);

-- Location: FF_X16_Y13_N3
\cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[4]~18_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(4));

-- Location: LCCOMB_X20_Y13_N12
\cnt[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[5]~20_combout\ = (cnt(5) & ((\encoder_turning~1_combout\ & (!\cnt[4]~19\)) # (!\encoder_turning~1_combout\ & (\cnt[4]~19\ & VCC)))) # (!cnt(5) & ((\encoder_turning~1_combout\ & ((\cnt[4]~19\) # (GND))) # (!\encoder_turning~1_combout\ & 
-- (!\cnt[4]~19\))))
-- \cnt[5]~21\ = CARRY((cnt(5) & (\encoder_turning~1_combout\ & !\cnt[4]~19\)) # (!cnt(5) & ((\encoder_turning~1_combout\) # (!\cnt[4]~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(5),
	datab => \encoder_turning~1_combout\,
	datad => VCC,
	cin => \cnt[4]~19\,
	combout => \cnt[5]~20_combout\,
	cout => \cnt[5]~21\);

-- Location: FF_X18_Y13_N1
\cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[5]~20_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(5));

-- Location: LCCOMB_X20_Y13_N14
\cnt[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[6]~22_combout\ = ((cnt(6) $ (\encoder_turning~1_combout\ $ (\cnt[5]~21\)))) # (GND)
-- \cnt[6]~23\ = CARRY((cnt(6) & ((!\cnt[5]~21\) # (!\encoder_turning~1_combout\))) # (!cnt(6) & (!\encoder_turning~1_combout\ & !\cnt[5]~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(6),
	datab => \encoder_turning~1_combout\,
	datad => VCC,
	cin => \cnt[5]~21\,
	combout => \cnt[6]~22_combout\,
	cout => \cnt[6]~23\);

-- Location: FF_X16_Y13_N23
\cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[6]~22_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(6));

-- Location: LCCOMB_X20_Y13_N16
\cnt[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[7]~24_combout\ = (cnt(7) & ((\encoder_turning~1_combout\ & (!\cnt[6]~23\)) # (!\encoder_turning~1_combout\ & (\cnt[6]~23\ & VCC)))) # (!cnt(7) & ((\encoder_turning~1_combout\ & ((\cnt[6]~23\) # (GND))) # (!\encoder_turning~1_combout\ & 
-- (!\cnt[6]~23\))))
-- \cnt[7]~25\ = CARRY((cnt(7) & (\encoder_turning~1_combout\ & !\cnt[6]~23\)) # (!cnt(7) & ((\encoder_turning~1_combout\) # (!\cnt[6]~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(7),
	datab => \encoder_turning~1_combout\,
	datad => VCC,
	cin => \cnt[6]~23\,
	combout => \cnt[7]~24_combout\,
	cout => \cnt[7]~25\);

-- Location: FF_X16_Y13_N7
\cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[7]~24_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(7));

-- Location: LCCOMB_X20_Y13_N18
\cnt[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[8]~26_combout\ = ((cnt(8) $ (\encoder_turning~1_combout\ $ (\cnt[7]~25\)))) # (GND)
-- \cnt[8]~27\ = CARRY((cnt(8) & ((!\cnt[7]~25\) # (!\encoder_turning~1_combout\))) # (!cnt(8) & (!\encoder_turning~1_combout\ & !\cnt[7]~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => cnt(8),
	datab => \encoder_turning~1_combout\,
	datad => VCC,
	cin => \cnt[7]~25\,
	combout => \cnt[8]~26_combout\,
	cout => \cnt[8]~27\);

-- Location: FF_X17_Y13_N19
\cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[8]~26_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(8));

-- Location: LCCOMB_X19_Y13_N6
\LessThan21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan21~1_combout\ = (cnt(4)) # (!\ones~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(4),
	datad => \ones~24_combout\,
	combout => \LessThan21~1_combout\);

-- Location: LCCOMB_X20_Y13_N20
\cnt[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \cnt[9]~28_combout\ = \encoder_turning~1_combout\ $ (\cnt[8]~27\ $ (!cnt(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \encoder_turning~1_combout\,
	datad => cnt(9),
	cin => \cnt[8]~27\,
	combout => \cnt[9]~28_combout\);

-- Location: FF_X17_Y13_N1
\cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	asdata => \cnt[9]~28_combout\,
	sload => VCC,
	ena => \encoder_turning~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cnt(9));

-- Location: LCCOMB_X18_Y13_N2
\ones~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~43_combout\ = (cnt(6) & (!\ones~19_combout\)) # (!cnt(6) & ((\ones~19_combout\ & (!\LessThan15~1_combout\)) # (!\ones~19_combout\ & (\LessThan15~1_combout\ & !\ones~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(6),
	datab => \ones~19_combout\,
	datac => \LessThan15~1_combout\,
	datad => \ones~20_combout\,
	combout => \ones~43_combout\);

-- Location: LCCOMB_X18_Y13_N6
\ones~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~26_combout\ = (\LessThan18~0_combout\ & (!\LessThan18~1_combout\ & !\ones~43_combout\)) # (!\LessThan18~0_combout\ & ((\ones~43_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~1_combout\,
	datac => \LessThan18~0_combout\,
	datad => \ones~43_combout\,
	combout => \ones~26_combout\);

-- Location: LCCOMB_X18_Y13_N16
\LessThan21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan21~0_combout\ = (!\ones~26_combout\ & (((!cnt(4) & \ones~24_combout\)) # (!\ones~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~26_combout\,
	datab => cnt(4),
	datac => \ones~24_combout\,
	datad => \ones~25_combout\,
	combout => \LessThan21~0_combout\);

-- Location: LCCOMB_X19_Y13_N26
\LessThan24~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan24~1_combout\ = (cnt(3)) # (cnt(4) $ (((\ones~23_combout\) # (!\LessThan21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(4),
	datab => \ones~23_combout\,
	datac => cnt(3),
	datad => \LessThan21~0_combout\,
	combout => \LessThan24~1_combout\);

-- Location: LCCOMB_X19_Y13_N8
\ones~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~32_combout\ = (\LessThan24~1_combout\ & (!\LessThan24~0_combout\ & !\ones~27_combout\)) # (!\LessThan24~1_combout\ & ((\ones~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan24~0_combout\,
	datac => \LessThan24~1_combout\,
	datad => \ones~27_combout\,
	combout => \ones~32_combout\);

-- Location: LCCOMB_X20_Y13_N28
\LessThan27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan27~0_combout\ = (!cnt(2) & \ones~29_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(2),
	datad => \ones~29_combout\,
	combout => \LessThan27~0_combout\);

-- Location: LCCOMB_X19_Y13_N16
\LessThan27~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan27~1_combout\ = (!\ones~31_combout\ & (!\ones~32_combout\ & ((\LessThan27~0_combout\) # (!\ones~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~31_combout\,
	datab => \ones~33_combout\,
	datac => \ones~32_combout\,
	datad => \LessThan27~0_combout\,
	combout => \LessThan27~1_combout\);

-- Location: LCCOMB_X19_Y13_N18
\ones~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~41_combout\ = \ones~29_combout\ $ (((cnt(2)) # (\LessThan27~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~29_combout\,
	datac => cnt(2),
	datad => \LessThan27~1_combout\,
	combout => \ones~41_combout\);

-- Location: LCCOMB_X19_Y13_N24
\Add8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add8~2_combout\ = (cnt(0) & ((cnt(1)) # (\LessThan30~1_combout\))) # (!cnt(0) & (cnt(1) & \LessThan30~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(0),
	datac => cnt(1),
	datad => \LessThan30~1_combout\,
	combout => \Add8~2_combout\);

-- Location: LCCOMB_X19_Y13_N22
\Add8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add8~3_combout\ = \ones~41_combout\ $ (\LessThan30~1_combout\ $ (((\ones~39_combout\) # (!\Add8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~41_combout\,
	datab => \Add8~2_combout\,
	datac => \LessThan30~1_combout\,
	datad => \ones~39_combout\,
	combout => \Add8~3_combout\);

-- Location: LCCOMB_X19_Y13_N30
\ones[3]_583\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[3]_583~combout\ = (\LessThan3~2_combout\ & ((\ones[3]_583~combout\))) # (!\LessThan3~2_combout\ & (\Add8~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~3_combout\,
	datab => \ones[3]_583~combout\,
	datad => \LessThan3~2_combout\,
	combout => \ones[3]_583~combout\);

-- Location: LCCOMB_X16_Y13_N24
\Add8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add8~1_combout\ = cnt(1) $ (\LessThan30~1_combout\ $ (cnt(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(1),
	datac => \LessThan30~1_combout\,
	datad => cnt(0),
	combout => \Add8~1_combout\);

-- Location: LCCOMB_X17_Y13_N8
\ones[1]_571\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[1]_571~combout\ = (GLOBAL(\LessThan3~2clkctrl_outclk\) & (\ones[1]_571~combout\)) # (!GLOBAL(\LessThan3~2clkctrl_outclk\) & ((\Add8~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones[1]_571~combout\,
	datac => \Add8~1_combout\,
	datad => \LessThan3~2clkctrl_outclk\,
	combout => \ones[1]_571~combout\);

-- Location: LCCOMB_X17_Y13_N12
\LessThan6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (!\ones[3]_583~combout\ & (((!\ones[0]_565~combout\ & !cnt(9))) # (!\ones[1]_571~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[3]_583~combout\,
	datab => \ones[0]_565~combout\,
	datac => \ones[1]_571~combout\,
	datad => cnt(9),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X17_Y13_N14
\ones~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~15_combout\ = cnt(9) $ (((!\ones[2]_577~combout\ & \LessThan6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(9),
	datac => \ones[2]_577~combout\,
	datad => \LessThan6~0_combout\,
	combout => \ones~15_combout\);

-- Location: LCCOMB_X17_Y13_N18
\LessThan6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = (\ones[0]_565~combout\) # (cnt(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones[0]_565~combout\,
	datad => cnt(9),
	combout => \LessThan6~1_combout\);

-- Location: LCCOMB_X17_Y13_N2
\LessThan9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~0_combout\ = (\ones[2]_577~combout\ & (\ones[1]_571~combout\ & (\LessThan6~1_combout\))) # (!\ones[2]_577~combout\ & (!\ones[1]_571~combout\ & ((\LessThan6~0_combout\) # (!\LessThan6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000110000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[2]_577~combout\,
	datab => \ones[1]_571~combout\,
	datac => \LessThan6~1_combout\,
	datad => \LessThan6~0_combout\,
	combout => \LessThan9~0_combout\);

-- Location: LCCOMB_X17_Y13_N4
\ones~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~16_combout\ = (cnt(8) & (((!\ones~15_combout\)))) # (!cnt(8) & ((\ones~15_combout\ & ((!\LessThan9~0_combout\))) # (!\ones~15_combout\ & (!\ones~14_combout\ & \LessThan9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~14_combout\,
	datab => cnt(8),
	datac => \ones~15_combout\,
	datad => \LessThan9~0_combout\,
	combout => \ones~16_combout\);

-- Location: LCCOMB_X16_Y13_N4
\ones~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~21_combout\ = (\ones~14_combout\ & (!\LessThan9~1_combout\)) # (!\ones~14_combout\ & (\LessThan9~1_combout\ & !\LessThan9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~14_combout\,
	datac => \LessThan9~1_combout\,
	datad => \LessThan9~0_combout\,
	combout => \ones~21_combout\);

-- Location: LCCOMB_X16_Y13_N18
\LessThan12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan12~1_combout\ = (cnt(7)) # (!\ones~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(7),
	datad => \ones~17_combout\,
	combout => \LessThan12~1_combout\);

-- Location: LCCOMB_X18_Y13_N30
\LessThan15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan15~1_combout\ = (\ones~16_combout\ & (((\ones~21_combout\ & \LessThan12~1_combout\)))) # (!\ones~16_combout\ & ((\LessThan12~0_combout\) # ((!\ones~21_combout\ & !\LessThan12~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan12~0_combout\,
	datab => \ones~16_combout\,
	datac => \ones~21_combout\,
	datad => \LessThan12~1_combout\,
	combout => \LessThan15~1_combout\);

-- Location: LCCOMB_X18_Y13_N28
\ones~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~45_combout\ = (\ones~20_combout\ & ((cnt(6)) # ((\ones~19_combout\ & \LessThan15~1_combout\)))) # (!\ones~20_combout\ & ((cnt(6) $ (\LessThan15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~20_combout\,
	datab => \ones~19_combout\,
	datac => cnt(6),
	datad => \LessThan15~1_combout\,
	combout => \ones~45_combout\);

-- Location: LCCOMB_X18_Y13_N0
\ones~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~25_combout\ = (\LessThan18~1_combout\ & (!\ones~45_combout\ & ((cnt(5)) # (!\ones~43_combout\)))) # (!\LessThan18~1_combout\ & (\ones~45_combout\ $ ((cnt(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~1_combout\,
	datab => \ones~45_combout\,
	datac => cnt(5),
	datad => \ones~43_combout\,
	combout => \ones~25_combout\);

-- Location: LCCOMB_X19_Y13_N12
\ones~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~30_combout\ = \ones~25_combout\ $ (((\LessThan21~1_combout\ & ((\ones~23_combout\) # (!\LessThan21~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan21~1_combout\,
	datab => \ones~23_combout\,
	datac => \ones~25_combout\,
	datad => \LessThan21~0_combout\,
	combout => \ones~30_combout\);

-- Location: LCCOMB_X19_Y13_N10
\ones~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~31_combout\ = (\ones~30_combout\ & (!\LessThan24~0_combout\ & ((!\ones~27_combout\) # (!\LessThan24~1_combout\)))) # (!\ones~30_combout\ & (((\LessThan24~1_combout\ & \ones~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~30_combout\,
	datab => \LessThan24~0_combout\,
	datac => \LessThan24~1_combout\,
	datad => \ones~27_combout\,
	combout => \ones~31_combout\);

-- Location: LCCOMB_X20_Y13_N22
\LessThan27~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan27~2_combout\ = ((!cnt(2) & \ones~29_combout\)) # (!\ones~33_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(2),
	datac => \ones~29_combout\,
	datad => \ones~33_combout\,
	combout => \LessThan27~2_combout\);

-- Location: LCCOMB_X20_Y13_N0
\ones~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~39_combout\ = cnt(2) $ (((!\ones~31_combout\ & (\LessThan27~2_combout\ & !\ones~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~31_combout\,
	datab => cnt(2),
	datac => \LessThan27~2_combout\,
	datad => \ones~32_combout\,
	combout => \ones~39_combout\);

-- Location: LCCOMB_X20_Y13_N30
\ones[3]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[3]~42_combout\ = \ones~41_combout\ $ (((!\LessThan30~1_combout\ & ((cnt(1)) # (!\ones~39_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~39_combout\,
	datab => \LessThan30~1_combout\,
	datac => cnt(1),
	datad => \ones~41_combout\,
	combout => \ones[3]~42_combout\);

-- Location: LCCOMB_X20_Y13_N26
\Add8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add8~0_combout\ = (\ones~39_combout\ & (((!cnt(1) & !\LessThan30~1_combout\)))) # (!\ones~39_combout\ & ((cnt(0) & ((cnt(1)) # (\LessThan30~1_combout\))) # (!cnt(0) & (cnt(1) & \LessThan30~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(0),
	datab => \ones~39_combout\,
	datac => cnt(1),
	datad => \LessThan30~1_combout\,
	combout => \Add8~0_combout\);

-- Location: LCCOMB_X19_Y13_N2
\ones~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~34_combout\ = \ones~33_combout\ $ (((!\LessThan27~1_combout\ & ((cnt(2)) # (!\ones~29_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~29_combout\,
	datab => \ones~33_combout\,
	datac => cnt(2),
	datad => \LessThan27~1_combout\,
	combout => \ones~34_combout\);

-- Location: LCCOMB_X14_Y13_N0
\LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (!\ones[3]~42_combout\ & (!\Add8~0_combout\ & (\LessThan30~0_combout\ $ (\ones~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[3]~42_combout\,
	datab => \Add8~0_combout\,
	datac => \LessThan30~0_combout\,
	datad => \ones~34_combout\,
	combout => \LessThan3~2_combout\);

-- Location: CLKCTRL_G3
\LessThan3~2clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \LessThan3~2clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \LessThan3~2clkctrl_outclk\);

-- Location: LCCOMB_X17_Y13_N20
\ones[0]_565\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[0]_565~combout\ = (GLOBAL(\LessThan3~2clkctrl_outclk\) & (\ones[0]_565~combout\)) # (!GLOBAL(\LessThan3~2clkctrl_outclk\) & ((!cnt(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones[0]_565~combout\,
	datac => cnt(0),
	datad => \LessThan3~2clkctrl_outclk\,
	combout => \ones[0]_565~combout\);

-- Location: LCCOMB_X17_Y13_N22
\ones~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~14_combout\ = \ones[0]_565~combout\ $ (((!cnt(9) & ((\ones[2]_577~combout\) # (!\LessThan6~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[0]_565~combout\,
	datab => cnt(9),
	datac => \ones[2]_577~combout\,
	datad => \LessThan6~0_combout\,
	combout => \ones~14_combout\);

-- Location: LCCOMB_X17_Y13_N16
\ones~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~17_combout\ = cnt(8) $ (((\LessThan9~0_combout\ & ((!\ones~14_combout\) # (!\LessThan9~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan9~1_combout\,
	datab => cnt(8),
	datac => \ones~14_combout\,
	datad => \LessThan9~0_combout\,
	combout => \ones~17_combout\);

-- Location: LCCOMB_X17_Y13_N28
\ones~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~19_combout\ = (cnt(7) & (((\ones~16_combout\) # (!\LessThan12~0_combout\)))) # (!cnt(7) & (\LessThan12~0_combout\ & ((\ones~17_combout\) # (!\ones~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(7),
	datab => \ones~17_combout\,
	datac => \ones~16_combout\,
	datad => \LessThan12~0_combout\,
	combout => \ones~19_combout\);

-- Location: LCCOMB_X18_Y13_N8
\LessThan15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan15~0_combout\ = ((\ones~19_combout\ & !cnt(6))) # (!\ones~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~19_combout\,
	datac => cnt(6),
	datad => \ones~20_combout\,
	combout => \LessThan15~0_combout\);

-- Location: LCCOMB_X18_Y13_N26
\LessThan18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan18~0_combout\ = (cnt(5)) # (cnt(6) $ (((!\LessThan15~1_combout\) # (!\LessThan15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(5),
	datab => \LessThan15~0_combout\,
	datac => \LessThan15~1_combout\,
	datad => cnt(6),
	combout => \LessThan18~0_combout\);

-- Location: LCCOMB_X18_Y13_N14
\ones~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~24_combout\ = cnt(5) $ (((\LessThan18~1_combout\ & ((!\ones~43_combout\) # (!\LessThan18~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~0_combout\,
	datab => cnt(5),
	datac => \LessThan18~1_combout\,
	datad => \ones~43_combout\,
	combout => \ones~24_combout\);

-- Location: LCCOMB_X18_Y13_N10
\ones~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~27_combout\ = \ones~24_combout\ $ (((cnt(4)) # ((!\ones~23_combout\ & \LessThan21~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~23_combout\,
	datab => cnt(4),
	datac => \ones~24_combout\,
	datad => \LessThan21~0_combout\,
	combout => \ones~27_combout\);

-- Location: LCCOMB_X18_Y13_N4
\ones~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~28_combout\ = cnt(4) $ (((!\ones~23_combout\ & \LessThan21~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~23_combout\,
	datac => cnt(4),
	datad => \LessThan21~0_combout\,
	combout => \ones~28_combout\);

-- Location: LCCOMB_X18_Y13_N20
\ones~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~29_combout\ = (cnt(3) & ((\ones~27_combout\) # ((!\LessThan24~0_combout\)))) # (!cnt(3) & (\LessThan24~0_combout\ & ((\ones~28_combout\) # (!\ones~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(3),
	datab => \ones~27_combout\,
	datac => \ones~28_combout\,
	datad => \LessThan24~0_combout\,
	combout => \ones~29_combout\);

-- Location: LCCOMB_X19_Y13_N14
\LessThan30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan30~0_combout\ = (cnt(2) & ((\ones~29_combout\) # ((!cnt(1) & !\LessThan27~1_combout\)))) # (!cnt(2) & ((\ones~29_combout\ & ((\LessThan27~1_combout\))) # (!\ones~29_combout\ & ((!\LessThan27~1_combout\) # (!cnt(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110110011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(2),
	datab => \ones~29_combout\,
	datac => cnt(1),
	datad => \LessThan27~1_combout\,
	combout => \LessThan30~0_combout\);

-- Location: LCCOMB_X19_Y13_N28
\LessThan30~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan30~1_combout\ = (!\ones~48_combout\ & (\LessThan30~0_combout\ & !\ones~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~48_combout\,
	datac => \LessThan30~0_combout\,
	datad => \ones~34_combout\,
	combout => \LessThan30~1_combout\);

-- Location: LCCOMB_X20_Y13_N24
\Add8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add8~4_combout\ = \ones~39_combout\ $ (((\LessThan30~1_combout\ & (!cnt(0) & !cnt(1))) # (!\LessThan30~1_combout\ & ((!cnt(1)) # (!cnt(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100000010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan30~1_combout\,
	datab => cnt(0),
	datac => cnt(1),
	datad => \ones~39_combout\,
	combout => \Add8~4_combout\);

-- Location: LCCOMB_X17_Y13_N0
\ones[2]_577\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[2]_577~combout\ = (GLOBAL(\LessThan3~2clkctrl_outclk\) & (\ones[2]_577~combout\)) # (!GLOBAL(\LessThan3~2clkctrl_outclk\) & ((\Add8~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[2]_577~combout\,
	datab => \Add8~4_combout\,
	datad => \LessThan3~2clkctrl_outclk\,
	combout => \ones[2]_577~combout\);

-- Location: LCCOMB_X17_Y13_N10
\LessThan9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan9~1_combout\ = (cnt(8)) # (cnt(9) $ (((\ones[2]_577~combout\) # (!\LessThan6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[2]_577~combout\,
	datab => cnt(9),
	datac => cnt(8),
	datad => \LessThan6~0_combout\,
	combout => \LessThan9~1_combout\);

-- Location: LCCOMB_X17_Y13_N24
\ones~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~18_combout\ = \ones[1]_571~combout\ $ (((\LessThan6~1_combout\ & ((\ones[2]_577~combout\) # (!\LessThan6~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[2]_577~combout\,
	datab => \ones[1]_571~combout\,
	datac => \LessThan6~1_combout\,
	datad => \LessThan6~0_combout\,
	combout => \ones~18_combout\);

-- Location: LCCOMB_X17_Y13_N6
\LessThan12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan12~0_combout\ = (\ones~14_combout\ & (\LessThan9~1_combout\ & (\ones~18_combout\))) # (!\ones~14_combout\ & ((\LessThan9~0_combout\) # ((!\LessThan9~1_combout\ & !\ones~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan9~1_combout\,
	datab => \ones~18_combout\,
	datac => \ones~14_combout\,
	datad => \LessThan9~0_combout\,
	combout => \LessThan12~0_combout\);

-- Location: LCCOMB_X18_Y13_N12
\ones~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~20_combout\ = (cnt(7) & (((!\ones~17_combout\)))) # (!cnt(7) & ((\LessThan12~0_combout\ & (!\ones~16_combout\ & !\ones~17_combout\)) # (!\LessThan12~0_combout\ & ((\ones~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(7),
	datab => \LessThan12~0_combout\,
	datac => \ones~16_combout\,
	datad => \ones~17_combout\,
	combout => \ones~20_combout\);

-- Location: LCCOMB_X16_Y13_N6
\ones~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~22_combout\ = (\ones~16_combout\ & (((\ones~17_combout\ & !cnt(7))))) # (!\ones~16_combout\ & (!\LessThan12~0_combout\ & ((cnt(7)) # (!\ones~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan12~0_combout\,
	datab => \ones~17_combout\,
	datac => cnt(7),
	datad => \ones~16_combout\,
	combout => \ones~22_combout\);

-- Location: LCCOMB_X16_Y13_N28
\LessThan15~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan15~2_combout\ = (cnt(6)) # (!\ones~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => cnt(6),
	datad => \ones~19_combout\,
	combout => \LessThan15~2_combout\);

-- Location: LCCOMB_X18_Y13_N22
\LessThan18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan18~1_combout\ = (\ones~20_combout\ & (\ones~22_combout\ & ((\LessThan15~2_combout\)))) # (!\ones~20_combout\ & ((\LessThan15~1_combout\) # ((!\ones~22_combout\ & !\LessThan15~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~20_combout\,
	datab => \ones~22_combout\,
	datac => \LessThan15~1_combout\,
	datad => \LessThan15~2_combout\,
	combout => \LessThan18~1_combout\);

-- Location: LCCOMB_X18_Y13_N24
\ones~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~44_combout\ = (\ones~20_combout\ & (\ones~19_combout\ & (!cnt(6)))) # (!\ones~20_combout\ & (!\LessThan15~1_combout\ & ((cnt(6)) # (!\ones~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~20_combout\,
	datab => \ones~19_combout\,
	datac => cnt(6),
	datad => \LessThan15~1_combout\,
	combout => \ones~44_combout\);

-- Location: LCCOMB_X18_Y13_N18
\ones~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~23_combout\ = (\ones~44_combout\ & (!\LessThan18~1_combout\ & ((!\LessThan18~0_combout\) # (!\ones~43_combout\)))) # (!\ones~44_combout\ & (((\ones~43_combout\ & \LessThan18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~1_combout\,
	datab => \ones~43_combout\,
	datac => \LessThan18~0_combout\,
	datad => \ones~44_combout\,
	combout => \ones~23_combout\);

-- Location: LCCOMB_X19_Y13_N4
\LessThan24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan24~0_combout\ = (\ones~26_combout\ & (((\ones~25_combout\ & \LessThan21~1_combout\)))) # (!\ones~26_combout\ & (!\ones~25_combout\ & ((!\LessThan21~1_combout\) # (!\ones~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~23_combout\,
	datab => \ones~26_combout\,
	datac => \ones~25_combout\,
	datad => \LessThan21~1_combout\,
	combout => \LessThan24~0_combout\);

-- Location: LCCOMB_X19_Y13_N20
\ones~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~33_combout\ = (\LessThan24~0_combout\ & (!\ones~28_combout\ & ((cnt(3)) # (!\ones~27_combout\)))) # (!\LessThan24~0_combout\ & (\ones~28_combout\ $ ((cnt(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan24~0_combout\,
	datab => \ones~28_combout\,
	datac => cnt(3),
	datad => \ones~27_combout\,
	combout => \ones~33_combout\);

-- Location: LCCOMB_X19_Y13_N0
\ones~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~48_combout\ = \ones~32_combout\ $ (((\ones~33_combout\ & ((cnt(2)) # (!\ones~29_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => cnt(2),
	datab => \ones~33_combout\,
	datac => \ones~32_combout\,
	datad => \ones~29_combout\,
	combout => \ones~48_combout\);

-- Location: LCCOMB_X16_Y13_N22
\ones~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~46_combout\ = \ones~22_combout\ $ (((\ones~20_combout\ & ((cnt(6)) # (!\ones~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~22_combout\,
	datab => \ones~19_combout\,
	datac => cnt(6),
	datad => \ones~20_combout\,
	combout => \ones~46_combout\);

-- Location: LCCOMB_X17_Y13_N26
\ones~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~36_combout\ = (\ones~18_combout\ & (!\LessThan9~0_combout\ & ((!\ones~14_combout\) # (!\LessThan9~1_combout\)))) # (!\ones~18_combout\ & (\LessThan9~1_combout\ & (\ones~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan9~1_combout\,
	datab => \ones~18_combout\,
	datac => \ones~14_combout\,
	datad => \LessThan9~0_combout\,
	combout => \ones~36_combout\);

-- Location: LCCOMB_X17_Y13_N30
\ones~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~37_combout\ = (\ones[2]_577~combout\ & (((!\LessThan6~1_combout\)) # (!\ones[1]_571~combout\))) # (!\ones[2]_577~combout\ & (\ones[1]_571~combout\ & (\LessThan6~1_combout\ & !\LessThan6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[2]_577~combout\,
	datab => \ones[1]_571~combout\,
	datac => \LessThan6~1_combout\,
	datad => \LessThan6~0_combout\,
	combout => \ones~37_combout\);

-- Location: LCCOMB_X18_Y12_N28
\ones[4]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[4]~35_combout\ = \ones~34_combout\ $ (!\LessThan30~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~34_combout\,
	datad => \LessThan30~0_combout\,
	combout => \ones[4]~35_combout\);

-- Location: LCCOMB_X16_Y13_N30
\ones~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~38_combout\ = (\ones~21_combout\ & (!\LessThan12~0_combout\ & ((!\LessThan12~1_combout\) # (!\ones~16_combout\)))) # (!\ones~21_combout\ & (((\ones~16_combout\ & \LessThan12~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan12~0_combout\,
	datab => \ones~21_combout\,
	datac => \ones~16_combout\,
	datad => \LessThan12~1_combout\,
	combout => \ones~38_combout\);

-- Location: LCCOMB_X16_Y13_N2
\ones~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones~47_combout\ = \ones~26_combout\ $ (((\ones~25_combout\ & ((cnt(4)) # (!\ones~24_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~25_combout\,
	datab => \ones~24_combout\,
	datac => cnt(4),
	datad => \ones~26_combout\,
	combout => \ones~47_combout\);

-- Location: LCCOMB_X15_Y13_N18
\tens[2]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[2]~33_combout\ = \tens~32_combout\ $ (((\ones~48_combout\) # (\LessThan29~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~48_combout\,
	datac => \tens~32_combout\,
	datad => \LessThan29~3_combout\,
	combout => \tens[2]~33_combout\);

-- Location: LCCOMB_X15_Y13_N20
\LessThan31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan31~0_combout\ = (\ones~48_combout\ & ((\LessThan29~3_combout\) # (\LessThan30~0_combout\ $ (!\ones~34_combout\)))) # (!\ones~48_combout\ & ((\LessThan30~0_combout\ $ (!\ones~34_combout\)) # (!\LessThan29~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~48_combout\,
	datab => \LessThan30~0_combout\,
	datac => \ones~34_combout\,
	datad => \LessThan29~3_combout\,
	combout => \LessThan31~0_combout\);

-- Location: LCCOMB_X15_Y13_N0
\Add7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~3_combout\ = \tens[3]~35_combout\ $ (((\tens[2]~33_combout\ & \LessThan31~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[2]~33_combout\,
	datac => \LessThan31~0_combout\,
	datad => \tens[3]~35_combout\,
	combout => \Add7~3_combout\);

-- Location: LCCOMB_X15_Y13_N30
\tens[3]_607\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[3]_607~combout\ = (\LessThan2~0_combout\ & (\tens[3]_607~combout\)) # (!\LessThan2~0_combout\ & ((\Add7~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[3]_607~combout\,
	datac => \Add7~3_combout\,
	datad => \LessThan2~0_combout\,
	combout => \tens[3]_607~combout\);

-- Location: LCCOMB_X17_Y12_N28
\LessThan5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (!\tens[3]_607~combout\ & (((!\tens[0]_589~combout\ & !\ones[3]_583~combout\)) # (!\tens[1]_595~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[0]_589~combout\,
	datab => \tens[3]_607~combout\,
	datac => \ones[3]_583~combout\,
	datad => \tens[1]_595~combout\,
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X17_Y12_N10
\tens~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~2_combout\ = \ones[3]_583~combout\ $ (((!\tens[2]_601~combout\ & \LessThan5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[2]_601~combout\,
	datac => \ones[3]_583~combout\,
	datad => \LessThan5~0_combout\,
	combout => \tens~2_combout\);

-- Location: LCCOMB_X17_Y12_N14
\LessThan8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~2_combout\ = (!\tens~4_combout\ & (((\tens~2_combout\ & !\ones~37_combout\)) # (!\tens~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~2_combout\,
	datab => \tens~3_combout\,
	datac => \ones~37_combout\,
	datad => \tens~4_combout\,
	combout => \LessThan8~2_combout\);

-- Location: LCCOMB_X17_Y12_N24
\LessThan11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan11~0_combout\ = (\ones~36_combout\) # (\ones~37_combout\ $ (((\tens~37_combout\) # (!\LessThan8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~37_combout\,
	datab => \tens~37_combout\,
	datac => \LessThan8~2_combout\,
	datad => \ones~36_combout\,
	combout => \LessThan11~0_combout\);

-- Location: LCCOMB_X17_Y12_N20
\tens~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~9_combout\ = (\tens~5_combout\ & ((!\LessThan11~0_combout\))) # (!\tens~5_combout\ & (!\LessThan11~1_combout\ & \LessThan11~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan11~1_combout\,
	datac => \tens~5_combout\,
	datad => \LessThan11~0_combout\,
	combout => \tens~9_combout\);

-- Location: LCCOMB_X16_Y12_N28
\LessThan14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan14~0_combout\ = ((\tens~6_combout\ & !\ones~38_combout\)) # (!\tens~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tens~6_combout\,
	datac => \ones~38_combout\,
	datad => \tens~8_combout\,
	combout => \LessThan14~0_combout\);

-- Location: LCCOMB_X16_Y12_N14
\tens~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~11_combout\ = (\tens~9_combout\ & (!\LessThan14~1_combout\ & \LessThan14~0_combout\)) # (!\tens~9_combout\ & ((!\LessThan14~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan14~1_combout\,
	datac => \tens~9_combout\,
	datad => \LessThan14~0_combout\,
	combout => \tens~11_combout\);

-- Location: LCCOMB_X16_Y12_N16
\LessThan17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~0_combout\ = ((\ones~22_combout\ & (!\LessThan15~1_combout\ & \LessThan15~0_combout\)) # (!\ones~22_combout\ & ((!\LessThan15~0_combout\)))) # (!\tens~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan15~1_combout\,
	datab => \ones~22_combout\,
	datac => \LessThan15~0_combout\,
	datad => \tens~14_combout\,
	combout => \LessThan17~0_combout\);

-- Location: LCCOMB_X16_Y12_N0
\LessThan17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~1_combout\ = (!\tens~12_combout\ & (!\tens~11_combout\ & ((!\LessThan17~0_combout\) # (!\tens~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datab => \tens~12_combout\,
	datac => \tens~11_combout\,
	datad => \LessThan17~0_combout\,
	combout => \LessThan17~1_combout\);

-- Location: LCCOMB_X16_Y12_N12
\LessThan20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan20~0_combout\ = (\tens~14_combout\ & ((\ones~46_combout\) # ((\LessThan17~1_combout\)))) # (!\tens~14_combout\ & ((\ones~46_combout\ & (!\ones~23_combout\ & !\LessThan17~1_combout\)) # (!\ones~46_combout\ & ((!\LessThan17~1_combout\) # 
-- (!\ones~23_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~14_combout\,
	datab => \ones~46_combout\,
	datac => \ones~23_combout\,
	datad => \LessThan17~1_combout\,
	combout => \LessThan20~0_combout\);

-- Location: LCCOMB_X16_Y12_N2
\LessThan20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan20~1_combout\ = (!\tens~16_combout\ & (!\tens~15_combout\ & \LessThan20~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tens~16_combout\,
	datac => \tens~15_combout\,
	datad => \LessThan20~0_combout\,
	combout => \LessThan20~1_combout\);

-- Location: LCCOMB_X16_Y13_N26
\LessThan17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan17~2_combout\ = ((!\ones~46_combout\ & \tens~14_combout\)) # (!\tens~13_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~46_combout\,
	datac => \tens~13_combout\,
	datad => \tens~14_combout\,
	combout => \LessThan17~2_combout\);

-- Location: LCCOMB_X16_Y13_N14
\tens~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~20_combout\ = \ones~46_combout\ $ (((!\tens~12_combout\ & (\LessThan17~2_combout\ & !\tens~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~12_combout\,
	datab => \ones~46_combout\,
	datac => \LessThan17~2_combout\,
	datad => \tens~11_combout\,
	combout => \tens~20_combout\);

-- Location: LCCOMB_X16_Y13_N8
\LessThan23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan23~0_combout\ = (\ones~23_combout\ & ((\tens~20_combout\) # ((!\ones~47_combout\ & \tens~19_combout\)))) # (!\ones~23_combout\ & ((\tens~20_combout\ & ((!\tens~19_combout\))) # (!\tens~20_combout\ & ((\tens~19_combout\) # (!\ones~47_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~23_combout\,
	datab => \ones~47_combout\,
	datac => \tens~20_combout\,
	datad => \tens~19_combout\,
	combout => \LessThan23~0_combout\);

-- Location: LCCOMB_X15_Y13_N4
\LessThan23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan23~1_combout\ = (\LessThan23~0_combout\ & (!\tens~18_combout\ & (\LessThan20~1_combout\ $ (\tens~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~1_combout\,
	datab => \tens~19_combout\,
	datac => \LessThan23~0_combout\,
	datad => \tens~18_combout\,
	combout => \LessThan23~1_combout\);

-- Location: LCCOMB_X15_Y13_N26
\tens~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~29_combout\ = \tens~17_combout\ $ (((\ones~47_combout\) # (\LessThan23~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~47_combout\,
	datac => \LessThan23~1_combout\,
	datad => \tens~17_combout\,
	combout => \tens~29_combout\);

-- Location: LCCOMB_X16_Y13_N20
\LessThan23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan23~2_combout\ = (\ones~23_combout\ & ((\tens~20_combout\) # ((!\ones~47_combout\ & !\LessThan20~1_combout\)))) # (!\ones~23_combout\ & ((\tens~20_combout\ & ((\LessThan20~1_combout\))) # (!\tens~20_combout\ & ((!\LessThan20~1_combout\) # 
-- (!\ones~47_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000110100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~23_combout\,
	datab => \ones~47_combout\,
	datac => \tens~20_combout\,
	datad => \LessThan20~1_combout\,
	combout => \LessThan23~2_combout\);

-- Location: LCCOMB_X15_Y13_N8
\LessThan26~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan26~2_combout\ = (\ones~47_combout\ & ((\tens~17_combout\) # ((!\ones~31_combout\ & !\LessThan23~1_combout\)))) # (!\ones~47_combout\ & ((\LessThan23~1_combout\ & ((\tens~17_combout\) # (!\ones~31_combout\))) # (!\LessThan23~1_combout\ & 
-- ((!\tens~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~31_combout\,
	datab => \ones~47_combout\,
	datac => \LessThan23~1_combout\,
	datad => \tens~17_combout\,
	combout => \LessThan26~2_combout\);

-- Location: LCCOMB_X15_Y13_N10
\LessThan26~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan26~3_combout\ = (\LessThan26~2_combout\ & (!\tens~26_combout\ & (\LessThan23~2_combout\ $ (\tens~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan23~2_combout\,
	datab => \tens~21_combout\,
	datac => \LessThan26~2_combout\,
	datad => \tens~26_combout\,
	combout => \LessThan26~3_combout\);

-- Location: LCCOMB_X15_Y13_N6
\tens~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~30_combout\ = \tens~29_combout\ $ (((!\LessThan26~3_combout\ & ((\ones~31_combout\) # (!\tens~28_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~29_combout\,
	datab => \ones~31_combout\,
	datac => \tens~28_combout\,
	datad => \LessThan26~3_combout\,
	combout => \tens~30_combout\);

-- Location: LCCOMB_X14_Y12_N24
\tens~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~27_combout\ = \LessThan26~2_combout\ $ (!\tens~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan26~2_combout\,
	datad => \tens~26_combout\,
	combout => \tens~27_combout\);

-- Location: LCCOMB_X18_Y12_N22
\tens[1]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[1]~36_combout\ = \ones~48_combout\ $ (((\LessThan29~2_combout\ & (!\tens~30_combout\ & !\tens~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan29~2_combout\,
	datab => \ones~48_combout\,
	datac => \tens~30_combout\,
	datad => \tens~27_combout\,
	combout => \tens[1]~36_combout\);

-- Location: LCCOMB_X18_Y12_N24
\Add7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~4_combout\ = \tens[1]~36_combout\ $ (\ones~34_combout\ $ (!\LessThan30~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[1]~36_combout\,
	datac => \ones~34_combout\,
	datad => \LessThan30~0_combout\,
	combout => \Add7~4_combout\);

-- Location: LCCOMB_X18_Y12_N26
\tens[1]_595\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[1]_595~combout\ = (GLOBAL(\LessThan2~0clkctrl_outclk\) & ((\tens[1]_595~combout\))) # (!GLOBAL(\LessThan2~0clkctrl_outclk\) & (\Add7~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add7~4_combout\,
	datac => \tens[1]_595~combout\,
	datad => \LessThan2~0clkctrl_outclk\,
	combout => \tens[1]_595~combout\);

-- Location: LCCOMB_X17_Y12_N30
\LessThan5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan5~1_combout\ = (\ones[3]_583~combout\) # (\tens[0]_589~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ones[3]_583~combout\,
	datad => \tens[0]_589~combout\,
	combout => \LessThan5~1_combout\);

-- Location: LCCOMB_X17_Y12_N2
\tens~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~4_combout\ = \tens[1]_595~combout\ $ (((\LessThan5~1_combout\ & ((\tens[2]_601~combout\) # (!\LessThan5~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[2]_601~combout\,
	datab => \tens[1]_595~combout\,
	datac => \LessThan5~1_combout\,
	datad => \LessThan5~0_combout\,
	combout => \tens~4_combout\);

-- Location: LCCOMB_X17_Y12_N0
\LessThan8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan8~3_combout\ = (\ones~37_combout\) # (\ones[3]_583~combout\ $ (((\tens[2]_601~combout\) # (!\LessThan5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[2]_601~combout\,
	datab => \ones[3]_583~combout\,
	datac => \ones~37_combout\,
	datad => \LessThan5~0_combout\,
	combout => \LessThan8~3_combout\);

-- Location: LCCOMB_X17_Y12_N12
\LessThan11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan11~1_combout\ = (\tens~4_combout\ & (((\tens~3_combout\ & \LessThan8~3_combout\)))) # (!\tens~4_combout\ & (!\tens~3_combout\ & ((!\LessThan8~3_combout\) # (!\tens~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~37_combout\,
	datab => \tens~4_combout\,
	datac => \tens~3_combout\,
	datad => \LessThan8~3_combout\,
	combout => \LessThan11~1_combout\);

-- Location: LCCOMB_X18_Y12_N16
\tens~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~7_combout\ = \ones~37_combout\ $ (((!\tens~37_combout\ & \LessThan8~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~37_combout\,
	datac => \ones~37_combout\,
	datad => \LessThan8~2_combout\,
	combout => \tens~7_combout\);

-- Location: LCCOMB_X16_Y12_N18
\tens~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~8_combout\ = (\ones~36_combout\ & (((!\tens~7_combout\)))) # (!\ones~36_combout\ & ((\LessThan11~1_combout\ & (!\tens~5_combout\ & !\tens~7_combout\)) # (!\LessThan11~1_combout\ & ((\tens~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~36_combout\,
	datab => \tens~5_combout\,
	datac => \LessThan11~1_combout\,
	datad => \tens~7_combout\,
	combout => \tens~8_combout\);

-- Location: LCCOMB_X16_Y12_N8
\tens~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~12_combout\ = (\tens~8_combout\ & (((\tens~6_combout\ & !\ones~38_combout\)))) # (!\tens~8_combout\ & (!\LessThan14~1_combout\ & ((\ones~38_combout\) # (!\tens~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan14~1_combout\,
	datab => \tens~6_combout\,
	datac => \ones~38_combout\,
	datad => \tens~8_combout\,
	combout => \tens~12_combout\);

-- Location: LCCOMB_X16_Y12_N4
\tens~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~16_combout\ = \tens~12_combout\ $ (((\tens~13_combout\ & \LessThan17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datac => \tens~12_combout\,
	datad => \LessThan17~0_combout\,
	combout => \tens~16_combout\);

-- Location: LCCOMB_X16_Y12_N24
\tens~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~17_combout\ = \ones~23_combout\ $ (((!\tens~15_combout\ & (!\tens~16_combout\ & \LessThan20~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~15_combout\,
	datab => \tens~16_combout\,
	datac => \ones~23_combout\,
	datad => \LessThan20~0_combout\,
	combout => \tens~17_combout\);

-- Location: LCCOMB_X15_Y13_N24
\tens~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~25_combout\ = \tens~20_combout\ $ (((\ones~23_combout\) # (\LessThan20~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~23_combout\,
	datac => \tens~20_combout\,
	datad => \LessThan20~1_combout\,
	combout => \tens~25_combout\);

-- Location: LCCOMB_X15_Y13_N28
\tens~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~26_combout\ = \tens~25_combout\ $ (((!\LessThan23~1_combout\ & ((\ones~47_combout\) # (!\tens~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~17_combout\,
	datab => \ones~47_combout\,
	datac => \LessThan23~1_combout\,
	datad => \tens~25_combout\,
	combout => \tens~26_combout\);

-- Location: LCCOMB_X16_Y13_N16
\tens~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~22_combout\ = \tens~21_combout\ $ (!\LessThan23~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~21_combout\,
	datad => \LessThan23~2_combout\,
	combout => \tens~22_combout\);

-- Location: LCCOMB_X15_Y13_N22
\tens~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~32_combout\ = \ones~31_combout\ $ (((!\tens~26_combout\ & (\LessThan26~2_combout\ & !\tens~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~31_combout\,
	datab => \tens~26_combout\,
	datac => \LessThan26~2_combout\,
	datad => \tens~22_combout\,
	combout => \tens~32_combout\);

-- Location: LCCOMB_X15_Y13_N14
\tens~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~34_combout\ = \tens~28_combout\ $ (((\ones~31_combout\) # (\LessThan26~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~31_combout\,
	datac => \tens~28_combout\,
	datad => \LessThan26~3_combout\,
	combout => \tens~34_combout\);

-- Location: LCCOMB_X15_Y13_N2
\tens[3]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[3]~35_combout\ = \tens~34_combout\ $ (((!\LessThan29~3_combout\ & ((\ones~48_combout\) # (!\tens~32_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~32_combout\,
	datab => \ones~48_combout\,
	datac => \tens~34_combout\,
	datad => \LessThan29~3_combout\,
	combout => \tens[3]~35_combout\);

-- Location: LCCOMB_X14_Y13_N12
\tens[4]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[4]~31_combout\ = \LessThan29~2_combout\ $ (!\tens~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan29~2_combout\,
	datad => \tens~30_combout\,
	combout => \tens[4]~31_combout\);

-- Location: LCCOMB_X14_Y13_N22
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!\tens[3]~35_combout\ & (!\tens[4]~31_combout\ & ((!\tens[2]~33_combout\) # (!\LessThan31~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[3]~35_combout\,
	datab => \LessThan31~0_combout\,
	datac => \tens[4]~31_combout\,
	datad => \tens[2]~33_combout\,
	combout => \LessThan2~0_combout\);

-- Location: CLKCTRL_G1
\LessThan2~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \LessThan2~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \LessThan2~0clkctrl_outclk\);

-- Location: LCCOMB_X17_Y12_N18
\tens[0]_589\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[0]_589~combout\ = (GLOBAL(\LessThan2~0clkctrl_outclk\) & (\tens[0]_589~combout\)) # (!GLOBAL(\LessThan2~0clkctrl_outclk\) & ((!\ones[4]~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tens[0]_589~combout\,
	datac => \ones[4]~35_combout\,
	datad => \LessThan2~0clkctrl_outclk\,
	combout => \tens[0]_589~combout\);

-- Location: LCCOMB_X17_Y12_N16
\tens~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~37_combout\ = \tens[2]_601~combout\ $ (((\tens[1]_595~combout\ & ((\tens[0]_589~combout\) # (\ones[3]_583~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[2]_601~combout\,
	datab => \tens[0]_589~combout\,
	datac => \ones[3]_583~combout\,
	datad => \tens[1]_595~combout\,
	combout => \tens~37_combout\);

-- Location: LCCOMB_X17_Y12_N8
\tens~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~5_combout\ = \tens~2_combout\ $ (((\ones~37_combout\) # ((!\tens~37_combout\ & \LessThan8~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~37_combout\,
	datab => \tens~37_combout\,
	datac => \LessThan8~2_combout\,
	datad => \tens~2_combout\,
	combout => \tens~5_combout\);

-- Location: LCCOMB_X16_Y12_N20
\tens~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~6_combout\ = \ones~36_combout\ $ (((\LessThan11~1_combout\ & ((!\LessThan11~0_combout\) # (!\tens~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~36_combout\,
	datab => \tens~5_combout\,
	datac => \LessThan11~1_combout\,
	datad => \LessThan11~0_combout\,
	combout => \tens~6_combout\);

-- Location: LCCOMB_X16_Y12_N6
\tens~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~14_combout\ = (\LessThan14~1_combout\ & ((\ones~38_combout\ & ((\tens~8_combout\))) # (!\ones~38_combout\ & ((\tens~6_combout\) # (!\tens~8_combout\))))) # (!\LessThan14~1_combout\ & (((\ones~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan14~1_combout\,
	datab => \tens~6_combout\,
	datac => \ones~38_combout\,
	datad => \tens~8_combout\,
	combout => \tens~14_combout\);

-- Location: LCCOMB_X16_Y13_N12
\tens~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~19_combout\ = \tens~14_combout\ $ (((\ones~46_combout\) # (\LessThan17~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ones~46_combout\,
	datac => \tens~14_combout\,
	datad => \LessThan17~1_combout\,
	combout => \tens~19_combout\);

-- Location: LCCOMB_X16_Y13_N10
\tens~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~21_combout\ = \tens~19_combout\ $ (((!\LessThan20~1_combout\ & ((\ones~23_combout\) # (!\tens~20_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~19_combout\,
	datab => \ones~23_combout\,
	datac => \tens~20_combout\,
	datad => \LessThan20~1_combout\,
	combout => \tens~21_combout\);

-- Location: LCCOMB_X16_Y13_N0
\tens~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~28_combout\ = \ones~47_combout\ $ (((!\tens~21_combout\ & (!\tens~18_combout\ & \LessThan23~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~21_combout\,
	datab => \ones~47_combout\,
	datac => \tens~18_combout\,
	datad => \LessThan23~2_combout\,
	combout => \tens~28_combout\);

-- Location: LCCOMB_X15_Y13_N12
\LessThan29~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan29~2_combout\ = (\ones~31_combout\ & ((\tens~28_combout\) # ((!\ones~48_combout\ & !\LessThan26~3_combout\)))) # (!\ones~31_combout\ & ((\tens~28_combout\ & ((\LessThan26~3_combout\))) # (!\tens~28_combout\ & ((!\LessThan26~3_combout\) # 
-- (!\ones~48_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones~48_combout\,
	datab => \ones~31_combout\,
	datac => \tens~28_combout\,
	datad => \LessThan26~3_combout\,
	combout => \LessThan29~2_combout\);

-- Location: LCCOMB_X15_Y13_N16
\LessThan29~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan29~3_combout\ = (\LessThan29~2_combout\ & (!\tens~30_combout\ & (\tens~26_combout\ $ (\LessThan26~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan29~2_combout\,
	datab => \tens~26_combout\,
	datac => \LessThan26~2_combout\,
	datad => \tens~30_combout\,
	combout => \LessThan29~3_combout\);

-- Location: LCCOMB_X18_Y12_N10
\Add7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~2_combout\ = \tens~32_combout\ $ (((\LessThan29~3_combout\ & (!\ones[4]~35_combout\ & !\ones~48_combout\)) # (!\LessThan29~3_combout\ & ((!\ones~48_combout\) # (!\ones[4]~35_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100110010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan29~3_combout\,
	datab => \tens~32_combout\,
	datac => \ones[4]~35_combout\,
	datad => \ones~48_combout\,
	combout => \Add7~2_combout\);

-- Location: LCCOMB_X17_Y12_N26
\tens[2]_601\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens[2]_601~combout\ = (GLOBAL(\LessThan2~0clkctrl_outclk\) & ((\tens[2]_601~combout\))) # (!GLOBAL(\LessThan2~0clkctrl_outclk\) & (\Add7~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add7~2_combout\,
	datac => \tens[2]_601~combout\,
	datad => \LessThan2~0clkctrl_outclk\,
	combout => \tens[2]_601~combout\);

-- Location: LCCOMB_X17_Y12_N22
\tens~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~3_combout\ = \tens[0]_589~combout\ $ (((!\ones[3]_583~combout\ & ((\tens[2]_601~combout\) # (!\LessThan5~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[2]_601~combout\,
	datab => \tens[0]_589~combout\,
	datac => \ones[3]_583~combout\,
	datad => \LessThan5~0_combout\,
	combout => \tens~3_combout\);

-- Location: LCCOMB_X17_Y12_N4
\tens~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~10_combout\ = \tens~3_combout\ $ (((\LessThan8~3_combout\ & ((\tens~37_combout\) # (!\LessThan8~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~3_combout\,
	datab => \tens~37_combout\,
	datac => \LessThan8~2_combout\,
	datad => \LessThan8~3_combout\,
	combout => \tens~10_combout\);

-- Location: LCCOMB_X16_Y12_N26
\LessThan14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan14~1_combout\ = (\tens~5_combout\ & (\tens~10_combout\ & ((\LessThan11~0_combout\)))) # (!\tens~5_combout\ & ((\LessThan11~1_combout\) # ((!\tens~10_combout\ & !\LessThan11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~10_combout\,
	datab => \tens~5_combout\,
	datac => \LessThan11~1_combout\,
	datad => \LessThan11~0_combout\,
	combout => \LessThan14~1_combout\);

-- Location: LCCOMB_X16_Y12_N10
\tens~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~13_combout\ = (\LessThan14~1_combout\ & (!\tens~6_combout\ & ((\ones~38_combout\) # (!\tens~8_combout\)))) # (!\LessThan14~1_combout\ & (\tens~6_combout\ $ ((\ones~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan14~1_combout\,
	datab => \tens~6_combout\,
	datac => \ones~38_combout\,
	datad => \tens~8_combout\,
	combout => \tens~13_combout\);

-- Location: LCCOMB_X16_Y12_N22
\tens~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~15_combout\ = (\tens~13_combout\ & (((!\LessThan17~0_combout\)))) # (!\tens~13_combout\ & (\LessThan17~0_combout\ & ((\tens~12_combout\) # (\tens~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~13_combout\,
	datab => \tens~12_combout\,
	datac => \tens~11_combout\,
	datad => \LessThan17~0_combout\,
	combout => \tens~15_combout\);

-- Location: LCCOMB_X16_Y12_N30
\tens~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~18_combout\ = \tens~15_combout\ $ (!\LessThan20~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tens~15_combout\,
	datad => \LessThan20~0_combout\,
	combout => \tens~18_combout\);

-- Location: LCCOMB_X17_Y12_N6
\tens~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~23_combout\ = (\tens~10_combout\ & (!\LessThan11~1_combout\ & ((!\LessThan11~0_combout\) # (!\tens~5_combout\)))) # (!\tens~10_combout\ & (((\tens~5_combout\ & \LessThan11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan11~1_combout\,
	datab => \tens~5_combout\,
	datac => \tens~10_combout\,
	datad => \LessThan11~0_combout\,
	combout => \tens~23_combout\);

-- Location: LCCOMB_X16_Y10_N20
\LessThan16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan16~0_combout\ = (\tens~11_combout\) # (\tens~23_combout\ $ (!\LessThan13~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~11_combout\,
	datac => \tens~23_combout\,
	datad => \LessThan13~2_combout\,
	combout => \LessThan16~0_combout\);

-- Location: LCCOMB_X14_Y12_N10
\Add6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~5_combout\ = \tens~30_combout\ $ (\LessThan29~2_combout\ $ (!\hundreds[1]~25_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~30_combout\,
	datac => \LessThan29~2_combout\,
	datad => \hundreds[1]~25_combout\,
	combout => \Add6~5_combout\);

-- Location: LCCOMB_X15_Y12_N24
\LessThan19~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan19~4_combout\ = (\tens~12_combout\ $ (((\LessThan17~0_combout\ & \tens~13_combout\)))) # (!\hundreds~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan17~0_combout\,
	datab => \tens~13_combout\,
	datac => \hundreds~16_combout\,
	datad => \tens~12_combout\,
	combout => \LessThan19~4_combout\);

-- Location: LCCOMB_X14_Y13_N14
\hundreds[0]_613\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[0]_613~combout\ = (GLOBAL(\LessThan1~1clkctrl_outclk\) & ((\hundreds[0]_613~combout\))) # (!GLOBAL(\LessThan1~1clkctrl_outclk\) & (!\tens[4]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[4]~31_combout\,
	datac => \hundreds[0]_613~combout\,
	datad => \LessThan1~1clkctrl_outclk\,
	combout => \hundreds[0]_613~combout\);

-- Location: LCCOMB_X17_Y10_N4
\LessThan7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~3_combout\ = (\hundreds[0]_613~combout\ & ((\tens~37_combout\ & (!\tens[3]_607~combout\ & !\LessThan4~1_combout\)) # (!\tens~37_combout\ & ((!\LessThan4~1_combout\) # (!\tens[3]_607~combout\))))) # (!\hundreds[0]_613~combout\ & 
-- (((\tens[3]_607~combout\) # (\LessThan4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~37_combout\,
	datab => \hundreds[0]_613~combout\,
	datac => \tens[3]_607~combout\,
	datad => \LessThan4~1_combout\,
	combout => \LessThan7~3_combout\);

-- Location: LCCOMB_X17_Y10_N10
\hundreds~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~8_combout\ = \hundreds[1]_619~combout\ $ (((!\LessThan4~1_combout\ & ((\hundreds[0]_613~combout\) # (\tens[3]_607~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[1]_619~combout\,
	datab => \hundreds[0]_613~combout\,
	datac => \tens[3]_607~combout\,
	datad => \LessThan4~1_combout\,
	combout => \hundreds~8_combout\);

-- Location: LCCOMB_X17_Y10_N22
\hundreds~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~11_combout\ = \tens~37_combout\ $ (((\LessThan7~2_combout\ & (\LessThan7~3_combout\ & !\hundreds~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan7~2_combout\,
	datab => \tens~37_combout\,
	datac => \LessThan7~3_combout\,
	datad => \hundreds~8_combout\,
	combout => \hundreds~11_combout\);

-- Location: LCCOMB_X17_Y10_N8
\LessThan10~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~4_combout\ = (\tens~4_combout\ $ (((\tens~3_combout\ & \LessThan8~3_combout\)))) # (!\hundreds~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~3_combout\,
	datab => \LessThan8~3_combout\,
	datac => \hundreds~11_combout\,
	datad => \tens~4_combout\,
	combout => \LessThan10~4_combout\);

-- Location: LCCOMB_X17_Y10_N24
\LessThan7~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~5_combout\ = (\tens~37_combout\) # (\tens[3]_607~combout\ $ (((\hundreds[3]_631~combout\) # (!\LessThan4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[3]_607~combout\,
	datab => \hundreds[3]_631~combout\,
	datac => \tens~37_combout\,
	datad => \LessThan4~0_combout\,
	combout => \LessThan7~5_combout\);

-- Location: LCCOMB_X17_Y10_N30
\hundreds~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~9_combout\ = \hundreds[0]_613~combout\ $ (((!\tens[3]_607~combout\ & ((\hundreds[3]_631~combout\) # (!\LessThan4~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[3]_631~combout\,
	datab => \hundreds[0]_613~combout\,
	datac => \tens[3]_607~combout\,
	datad => \LessThan4~0_combout\,
	combout => \hundreds~9_combout\);

-- Location: LCCOMB_X17_Y10_N28
\hundreds~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~10_combout\ = (\LessThan7~5_combout\ & (!\hundreds~9_combout\ & ((\hundreds~8_combout\) # (!\LessThan7~2_combout\)))) # (!\LessThan7~5_combout\ & (((\hundreds~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan7~2_combout\,
	datab => \LessThan7~5_combout\,
	datac => \hundreds~9_combout\,
	datad => \hundreds~8_combout\,
	combout => \hundreds~10_combout\);

-- Location: LCCOMB_X17_Y10_N16
\LessThan13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~0_combout\ = (\hundreds~10_combout\ & ((\LessThan10~2_combout\) # ((\hundreds~12_combout\ & \LessThan10~4_combout\)))) # (!\hundreds~10_combout\ & (((!\LessThan10~4_combout\)) # (!\hundreds~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~12_combout\,
	datab => \LessThan10~2_combout\,
	datac => \LessThan10~4_combout\,
	datad => \hundreds~10_combout\,
	combout => \LessThan13~0_combout\);

-- Location: LCCOMB_X16_Y10_N0
\tens~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \tens~24_combout\ = \tens~4_combout\ $ (((\tens~3_combout\ & \LessThan8~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \tens~3_combout\,
	datac => \tens~4_combout\,
	datad => \LessThan8~3_combout\,
	combout => \tens~24_combout\);

-- Location: LCCOMB_X16_Y10_N22
\LessThan10~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~3_combout\ = (\LessThan10~2_combout\ & (((\hundreds~11_combout\ & !\tens~24_combout\)) # (!\hundreds~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan10~2_combout\,
	datab => \hundreds~12_combout\,
	datac => \hundreds~11_combout\,
	datad => \tens~24_combout\,
	combout => \LessThan10~3_combout\);

-- Location: LCCOMB_X16_Y10_N18
\LessThan13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~1_combout\ = (\tens~23_combout\) # (\LessThan10~3_combout\ $ (!\tens~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan10~3_combout\,
	datac => \tens~23_combout\,
	datad => \tens~24_combout\,
	combout => \LessThan13~1_combout\);

-- Location: LCCOMB_X16_Y10_N6
\hundreds~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~20_combout\ = (\hundreds~13_combout\ & (((!\LessThan13~1_combout\)))) # (!\hundreds~13_combout\ & (\LessThan13~1_combout\ & ((\hundreds~14_combout\) # (!\LessThan13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~13_combout\,
	datab => \LessThan13~0_combout\,
	datac => \hundreds~14_combout\,
	datad => \LessThan13~1_combout\,
	combout => \hundreds~20_combout\);

-- Location: LCCOMB_X16_Y10_N4
\hundreds~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~15_combout\ = \LessThan10~3_combout\ $ (\tens~24_combout\ $ (((\LessThan13~2_combout\) # (\tens~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan13~2_combout\,
	datab => \tens~23_combout\,
	datac => \LessThan10~3_combout\,
	datad => \tens~24_combout\,
	combout => \hundreds~15_combout\);

-- Location: LCCOMB_X16_Y10_N24
\LessThan19~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan19~2_combout\ = (\hundreds~20_combout\ & ((\LessThan16~1_combout\) # ((\LessThan16~0_combout\ & \hundreds~15_combout\)))) # (!\hundreds~20_combout\ & (((!\hundreds~15_combout\)) # (!\LessThan16~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~20_combout\,
	datab => \LessThan16~0_combout\,
	datac => \LessThan16~1_combout\,
	datad => \hundreds~15_combout\,
	combout => \LessThan19~2_combout\);

-- Location: LCCOMB_X16_Y10_N28
\hundreds~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~19_combout\ = (\hundreds~15_combout\ & ((!\LessThan16~0_combout\))) # (!\hundreds~15_combout\ & (!\LessThan16~1_combout\ & \LessThan16~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan16~1_combout\,
	datac => \hundreds~15_combout\,
	datad => \LessThan16~0_combout\,
	combout => \hundreds~19_combout\);

-- Location: LCCOMB_X15_Y12_N20
\LessThan22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan22~0_combout\ = (\hundreds~18_combout\ & (\LessThan19~4_combout\ & ((\hundreds~19_combout\)))) # (!\hundreds~18_combout\ & (!\hundreds~19_combout\ & ((\LessThan19~2_combout\) # (!\LessThan19~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~18_combout\,
	datab => \LessThan19~4_combout\,
	datac => \LessThan19~2_combout\,
	datad => \hundreds~19_combout\,
	combout => \LessThan22~0_combout\);

-- Location: LCCOMB_X15_Y12_N10
\hundreds~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~30_combout\ = \LessThan20~0_combout\ $ (\tens~15_combout\ $ (((!\LessThan22~1_combout\) # (!\LessThan22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110010010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan22~0_combout\,
	datab => \LessThan20~0_combout\,
	datac => \LessThan22~1_combout\,
	datad => \tens~15_combout\,
	combout => \hundreds~30_combout\);

-- Location: LCCOMB_X15_Y12_N16
\hundreds~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~31_combout\ = \hundreds~30_combout\ $ (((\LessThan25~2_combout\) # (\tens~21_combout\ $ (!\LessThan23~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~30_combout\,
	datab => \LessThan25~2_combout\,
	datac => \tens~21_combout\,
	datad => \LessThan23~2_combout\,
	combout => \hundreds~31_combout\);

-- Location: LCCOMB_X14_Y12_N8
\LessThan28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan28~0_combout\ = (\LessThan25~2_combout\ & ((\tens~22_combout\) # (\LessThan26~2_combout\ $ (!\tens~26_combout\)))) # (!\LessThan25~2_combout\ & ((\LessThan26~2_combout\ $ (!\tens~26_combout\)) # (!\tens~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan25~2_combout\,
	datab => \LessThan26~2_combout\,
	datac => \tens~26_combout\,
	datad => \tens~22_combout\,
	combout => \LessThan28~0_combout\);

-- Location: LCCOMB_X15_Y12_N28
\hundreds~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~23_combout\ = \hundreds~16_combout\ $ (((\LessThan19~3_combout\) # (\tens~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~3_combout\,
	datac => \hundreds~16_combout\,
	datad => \tens~16_combout\,
	combout => \hundreds~23_combout\);

-- Location: LCCOMB_X15_Y12_N8
\hundreds~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~24_combout\ = (\hundreds~23_combout\ & (\hundreds~29_combout\ & (!\tens~18_combout\))) # (!\hundreds~23_combout\ & (!\LessThan22~0_combout\ & ((\tens~18_combout\) # (!\hundreds~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~29_combout\,
	datab => \hundreds~23_combout\,
	datac => \tens~18_combout\,
	datad => \LessThan22~0_combout\,
	combout => \hundreds~24_combout\);

-- Location: LCCOMB_X15_Y12_N26
\hundreds~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~21_combout\ = (\hundreds~18_combout\ & (!\LessThan19~4_combout\)) # (!\hundreds~18_combout\ & (\LessThan19~4_combout\ & ((\hundreds~19_combout\) # (!\LessThan19~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~18_combout\,
	datab => \LessThan19~4_combout\,
	datac => \LessThan19~2_combout\,
	datad => \hundreds~19_combout\,
	combout => \hundreds~21_combout\);

-- Location: LCCOMB_X15_Y12_N18
\LessThan25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan25~0_combout\ = (\hundreds~21_combout\ & ((\LessThan22~0_combout\) # (!\LessThan22~1_combout\))) # (!\hundreds~21_combout\ & (\LessThan22~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~21_combout\,
	datac => \LessThan22~1_combout\,
	datad => \LessThan22~0_combout\,
	combout => \LessThan25~0_combout\);

-- Location: LCCOMB_X15_Y12_N4
\hundreds~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~26_combout\ = (\LessThan25~1_combout\ & (!\hundreds~22_combout\ & ((\hundreds~24_combout\) # (!\LessThan25~0_combout\)))) # (!\LessThan25~1_combout\ & (((\hundreds~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan25~1_combout\,
	datab => \hundreds~24_combout\,
	datac => \hundreds~22_combout\,
	datad => \LessThan25~0_combout\,
	combout => \hundreds~26_combout\);

-- Location: LCCOMB_X14_Y12_N30
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\hundreds~31_combout\ & (((\LessThan28~0_combout\ & \hundreds~26_combout\)))) # (!\hundreds~31_combout\ & ((\LessThan28~1_combout\) # ((!\LessThan28~0_combout\ & !\hundreds~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan28~1_combout\,
	datab => \hundreds~31_combout\,
	datac => \LessThan28~0_combout\,
	datad => \hundreds~26_combout\,
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X14_Y12_N14
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (\LessThan1~0_combout\ & (((!\tens[4]~31_combout\ & \hundreds[1]~25_combout\)) # (!\hundreds[2]~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[4]~31_combout\,
	datab => \hundreds[2]~27_combout\,
	datac => \LessThan1~0_combout\,
	datad => \hundreds[1]~25_combout\,
	combout => \LessThan1~1_combout\);

-- Location: CLKCTRL_G0
\LessThan1~1clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \LessThan1~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \LessThan1~1clkctrl_outclk\);

-- Location: LCCOMB_X14_Y12_N2
\hundreds[1]_619\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[1]_619~combout\ = (GLOBAL(\LessThan1~1clkctrl_outclk\) & (\hundreds[1]_619~combout\)) # (!GLOBAL(\LessThan1~1clkctrl_outclk\) & ((\Add6~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hundreds[1]_619~combout\,
	datac => \Add6~5_combout\,
	datad => \LessThan1~1clkctrl_outclk\,
	combout => \hundreds[1]_619~combout\);

-- Location: LCCOMB_X14_Y12_N28
\Add6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~6_combout\ = \hundreds[2]~27_combout\ $ (((\tens~30_combout\ $ (!\LessThan29~2_combout\)) # (!\hundreds[1]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~30_combout\,
	datab => \LessThan29~2_combout\,
	datac => \hundreds[2]~27_combout\,
	datad => \hundreds[1]~25_combout\,
	combout => \Add6~6_combout\);

-- Location: LCCOMB_X14_Y12_N12
\hundreds[2]_625\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[2]_625~combout\ = (GLOBAL(\LessThan1~1clkctrl_outclk\) & (\hundreds[2]_625~combout\)) # (!GLOBAL(\LessThan1~1clkctrl_outclk\) & ((\Add6~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[2]_625~combout\,
	datac => \Add6~6_combout\,
	datad => \LessThan1~1clkctrl_outclk\,
	combout => \hundreds[2]_625~combout\);

-- Location: LCCOMB_X17_Y10_N18
\LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (!\hundreds[2]_625~combout\ & (((!\hundreds[0]_613~combout\ & !\tens[3]_607~combout\)) # (!\hundreds[1]_619~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[1]_619~combout\,
	datab => \hundreds[0]_613~combout\,
	datac => \hundreds[2]_625~combout\,
	datad => \tens[3]_607~combout\,
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X17_Y10_N6
\LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (!\hundreds[3]_631~combout\ & \LessThan4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \hundreds[3]_631~combout\,
	datad => \LessThan4~0_combout\,
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X17_Y10_N14
\Add9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add9~0_combout\ = \hundreds[2]_625~combout\ $ (((\hundreds[1]_619~combout\ & ((\hundreds[0]_613~combout\) # (\tens[3]_607~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[1]_619~combout\,
	datab => \hundreds[0]_613~combout\,
	datac => \hundreds[2]_625~combout\,
	datad => \tens[3]_607~combout\,
	combout => \Add9~0_combout\);

-- Location: LCCOMB_X17_Y10_N0
\LessThan7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~4_combout\ = (\LessThan7~3_combout\ & (!\hundreds~8_combout\ & ((\LessThan4~1_combout\) # (!\Add9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~1_combout\,
	datab => \Add9~0_combout\,
	datac => \LessThan7~3_combout\,
	datad => \hundreds~8_combout\,
	combout => \LessThan7~4_combout\);

-- Location: LCCOMB_X17_Y10_N26
\hundreds~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~12_combout\ = \LessThan4~1_combout\ $ (\tens[3]_607~combout\ $ (((\tens~37_combout\) # (\LessThan7~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~1_combout\,
	datab => \tens~37_combout\,
	datac => \tens[3]_607~combout\,
	datad => \LessThan7~4_combout\,
	combout => \hundreds~12_combout\);

-- Location: LCCOMB_X16_Y10_N30
\hundreds~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~14_combout\ = (\hundreds~12_combout\ & (((\hundreds~11_combout\ & !\tens~24_combout\)))) # (!\hundreds~12_combout\ & (!\LessThan10~2_combout\ & ((\tens~24_combout\) # (!\hundreds~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan10~2_combout\,
	datab => \hundreds~12_combout\,
	datac => \hundreds~11_combout\,
	datad => \tens~24_combout\,
	combout => \hundreds~14_combout\);

-- Location: LCCOMB_X16_Y10_N14
\LessThan16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan16~1_combout\ = (\hundreds~14_combout\ & (((\hundreds~13_combout\ & \LessThan13~1_combout\)))) # (!\hundreds~14_combout\ & (!\hundreds~13_combout\ & ((\LessThan13~0_combout\) # (!\LessThan13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~14_combout\,
	datab => \LessThan13~0_combout\,
	datac => \hundreds~13_combout\,
	datad => \LessThan13~1_combout\,
	combout => \LessThan16~1_combout\);

-- Location: LCCOMB_X16_Y10_N10
\hundreds~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~16_combout\ = \tens~11_combout\ $ (((\LessThan16~1_combout\ & ((!\hundreds~15_combout\) # (!\LessThan16~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~11_combout\,
	datab => \LessThan16~0_combout\,
	datac => \LessThan16~1_combout\,
	datad => \hundreds~15_combout\,
	combout => \hundreds~16_combout\);

-- Location: LCCOMB_X15_Y12_N14
\LessThan22~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan22~1_combout\ = (\LessThan19~3_combout\ & ((\hundreds~16_combout\) # ((!\tens~18_combout\ & !\tens~16_combout\)))) # (!\LessThan19~3_combout\ & ((\hundreds~16_combout\ & ((\tens~16_combout\))) # (!\hundreds~16_combout\ & ((!\tens~16_combout\) # 
-- (!\tens~18_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~18_combout\,
	datab => \LessThan19~3_combout\,
	datac => \hundreds~16_combout\,
	datad => \tens~16_combout\,
	combout => \LessThan22~1_combout\);

-- Location: LCCOMB_X15_Y12_N12
\LessThan25~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan25~1_combout\ = (\tens~22_combout\) # (\tens~18_combout\ $ (((!\LessThan22~0_combout\) # (!\LessThan22~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~18_combout\,
	datab => \tens~22_combout\,
	datac => \LessThan22~1_combout\,
	datad => \LessThan22~0_combout\,
	combout => \LessThan25~1_combout\);

-- Location: LCCOMB_X15_Y12_N2
\LessThan25~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan25~2_combout\ = (!\hundreds~24_combout\ & (\LessThan25~0_combout\ & ((!\hundreds~22_combout\) # (!\LessThan25~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan25~1_combout\,
	datab => \hundreds~24_combout\,
	datac => \hundreds~22_combout\,
	datad => \LessThan25~0_combout\,
	combout => \LessThan25~2_combout\);

-- Location: LCCOMB_X15_Y12_N0
\hundreds~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~32_combout\ = \LessThan23~2_combout\ $ (\LessThan25~2_combout\ $ (!\tens~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan23~2_combout\,
	datab => \LessThan25~2_combout\,
	datad => \tens~21_combout\,
	combout => \hundreds~32_combout\);

-- Location: LCCOMB_X14_Y12_N4
\hundreds[2]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[2]~27_combout\ = (\LessThan28~1_combout\ & (!\hundreds~32_combout\ & ((\tens~27_combout\) # (!\hundreds~31_combout\)))) # (!\LessThan28~1_combout\ & (\tens~27_combout\ $ ((\hundreds~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan28~1_combout\,
	datab => \tens~27_combout\,
	datac => \hundreds~32_combout\,
	datad => \hundreds~31_combout\,
	combout => \hundreds[2]~27_combout\);

-- Location: LCCOMB_X14_Y12_N16
\hundreds[3]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[3]~28_combout\ = (\LessThan28~0_combout\ & (!\LessThan28~1_combout\ & !\hundreds~31_combout\)) # (!\LessThan28~0_combout\ & ((\hundreds~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan28~1_combout\,
	datac => \LessThan28~0_combout\,
	datad => \hundreds~31_combout\,
	combout => \hundreds[3]~28_combout\);

-- Location: LCCOMB_X14_Y12_N18
\Add6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~4_combout\ = \hundreds[3]~28_combout\ $ (((\hundreds[2]~27_combout\ & ((\tens[4]~31_combout\) # (!\hundreds[1]~25_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[1]~25_combout\,
	datab => \tens[4]~31_combout\,
	datac => \hundreds[2]~27_combout\,
	datad => \hundreds[3]~28_combout\,
	combout => \Add6~4_combout\);

-- Location: LCCOMB_X14_Y12_N22
\hundreds[3]_631\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[3]_631~combout\ = (GLOBAL(\LessThan1~1clkctrl_outclk\) & ((\hundreds[3]_631~combout\))) # (!GLOBAL(\LessThan1~1clkctrl_outclk\) & (\Add6~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add6~4_combout\,
	datac => \hundreds[3]_631~combout\,
	datad => \LessThan1~1clkctrl_outclk\,
	combout => \hundreds[3]_631~combout\);

-- Location: LCCOMB_X17_Y10_N12
\LessThan7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan7~2_combout\ = ((!\hundreds[3]_631~combout\ & \LessThan4~0_combout\)) # (!\Add9~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hundreds[3]_631~combout\,
	datac => \Add9~0_combout\,
	datad => \LessThan4~0_combout\,
	combout => \LessThan7~2_combout\);

-- Location: LCCOMB_X17_Y10_N20
\LessThan10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan10~2_combout\ = (\hundreds~9_combout\ & (((\LessThan7~5_combout\ & \hundreds~8_combout\)))) # (!\hundreds~9_combout\ & (!\hundreds~8_combout\ & ((\LessThan7~2_combout\) # (!\LessThan7~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan7~2_combout\,
	datab => \LessThan7~5_combout\,
	datac => \hundreds~9_combout\,
	datad => \hundreds~8_combout\,
	combout => \LessThan10~2_combout\);

-- Location: LCCOMB_X16_Y10_N8
\hundreds~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~13_combout\ = (\LessThan10~2_combout\ & (!\hundreds~11_combout\ & ((\tens~24_combout\) # (!\hundreds~12_combout\)))) # (!\LessThan10~2_combout\ & ((\hundreds~11_combout\ $ (\tens~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan10~2_combout\,
	datab => \hundreds~12_combout\,
	datac => \hundreds~11_combout\,
	datad => \tens~24_combout\,
	combout => \hundreds~13_combout\);

-- Location: LCCOMB_X16_Y10_N12
\LessThan13~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan13~2_combout\ = (\LessThan13~0_combout\ & (!\hundreds~14_combout\ & ((!\LessThan13~1_combout\) # (!\hundreds~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~13_combout\,
	datab => \LessThan13~0_combout\,
	datac => \hundreds~14_combout\,
	datad => \LessThan13~1_combout\,
	combout => \LessThan13~2_combout\);

-- Location: LCCOMB_X16_Y10_N2
\hundreds~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~17_combout\ = \tens~23_combout\ $ (\LessThan13~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \tens~23_combout\,
	datad => \LessThan13~2_combout\,
	combout => \hundreds~17_combout\);

-- Location: LCCOMB_X16_Y10_N16
\hundreds~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~18_combout\ = (\tens~11_combout\ & (!\hundreds~17_combout\)) # (!\tens~11_combout\ & ((\hundreds~17_combout\ & (!\LessThan16~1_combout\)) # (!\hundreds~17_combout\ & (\LessThan16~1_combout\ & !\hundreds~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011000110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~11_combout\,
	datab => \hundreds~17_combout\,
	datac => \LessThan16~1_combout\,
	datad => \hundreds~15_combout\,
	combout => \hundreds~18_combout\);

-- Location: LCCOMB_X15_Y12_N6
\LessThan19~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan19~3_combout\ = (\LessThan19~2_combout\ & (!\hundreds~19_combout\ & ((!\LessThan19~4_combout\) # (!\hundreds~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~18_combout\,
	datab => \LessThan19~4_combout\,
	datac => \LessThan19~2_combout\,
	datad => \hundreds~19_combout\,
	combout => \LessThan19~3_combout\);

-- Location: LCCOMB_X15_Y12_N22
\hundreds~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~29_combout\ = \LessThan19~3_combout\ $ (\tens~12_combout\ $ (((\tens~13_combout\ & \LessThan17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~3_combout\,
	datab => \tens~12_combout\,
	datac => \tens~13_combout\,
	datad => \LessThan17~0_combout\,
	combout => \hundreds~29_combout\);

-- Location: LCCOMB_X15_Y12_N30
\hundreds~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds~22_combout\ = \hundreds~29_combout\ $ (((\tens~18_combout\) # ((\LessThan22~1_combout\ & \LessThan22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens~18_combout\,
	datab => \hundreds~29_combout\,
	datac => \LessThan22~1_combout\,
	datad => \LessThan22~0_combout\,
	combout => \hundreds~22_combout\);

-- Location: LCCOMB_X14_Y12_N26
\LessThan28~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan28~1_combout\ = (\hundreds~22_combout\ & (\LessThan25~1_combout\ & (\hundreds~24_combout\))) # (!\hundreds~22_combout\ & (!\hundreds~24_combout\ & ((\LessThan25~0_combout\) # (!\LessThan25~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010110000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds~22_combout\,
	datab => \LessThan25~1_combout\,
	datac => \hundreds~24_combout\,
	datad => \LessThan25~0_combout\,
	combout => \LessThan28~1_combout\);

-- Location: LCCOMB_X14_Y12_N6
\hundreds[1]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \hundreds[1]~25_combout\ = \tens~27_combout\ $ (((\LessThan28~1_combout\ & ((!\hundreds~31_combout\) # (!\LessThan28~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan28~1_combout\,
	datab => \tens~27_combout\,
	datac => \LessThan28~0_combout\,
	datad => \hundreds~31_combout\,
	combout => \hundreds[1]~25_combout\);

-- Location: LCCOMB_X14_Y12_N0
\Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\hundreds[1]~25_combout\ & (!\hundreds[2]~27_combout\ & (!\tens[4]~31_combout\ & \LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \hundreds[1]~25_combout\,
	datab => \hundreds[2]~27_combout\,
	datac => \tens[4]~31_combout\,
	datad => \LessThan1~0_combout\,
	combout => \Selector12~0_combout\);

-- Location: CLKCTRL_G14
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

-- Location: FF_X14_Y13_N29
\select_state.100\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \select_state.010~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.100~q\);

-- Location: LCCOMB_X14_Y13_N2
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

-- Location: FF_X14_Y13_N3
\select_state.001\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \select_state.001~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.001~q\);

-- Location: LCCOMB_X14_Y13_N8
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

-- Location: FF_X14_Y13_N9
\select_state.010\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \select_state.010~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \select_state.010~q\);

-- Location: LCCOMB_X14_Y13_N28
\Selector12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = (!\LessThan31~0_combout\ & (!\tens[3]~35_combout\ & (\select_state.010~q\ & !\tens[2]~33_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan31~0_combout\,
	datab => \tens[3]~35_combout\,
	datac => \select_state.010~q\,
	datad => \tens[2]~33_combout\,
	combout => \Selector12~1_combout\);

-- Location: LCCOMB_X14_Y13_N16
\Selector12~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~2_combout\ = ((\Selector12~0_combout\ & \Selector12~1_combout\)) # (!\select_state.001~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector12~0_combout\,
	datac => \Selector12~1_combout\,
	datad => \select_state.001~q\,
	combout => \Selector12~2_combout\);

-- Location: LCCOMB_X14_Y13_N26
\ones[2]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ones[2]~40_combout\ = \ones~39_combout\ $ (((cnt(1)) # (\LessThan30~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => cnt(1),
	datac => \LessThan30~1_combout\,
	datad => \ones~39_combout\,
	combout => \ones[2]~40_combout\);

-- Location: LCCOMB_X14_Y13_N20
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\Selector12~2_combout\ & ((\select_state.100~q\ & (\ones[2]~40_combout\)) # (!\select_state.100~q\ & ((\tens[2]~33_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[2]~40_combout\,
	datab => \tens[2]~33_combout\,
	datac => \select_state.100~q\,
	datad => \Selector12~2_combout\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X14_Y12_N20
\Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux1~0_combout\) # ((\Selector12~2_combout\ & \hundreds[2]~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector12~2_combout\,
	datab => \Mux1~0_combout\,
	datac => \hundreds[2]~27_combout\,
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X14_Y13_N18
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\select_state.100~q\ & (\ones[3]~42_combout\)) # (!\select_state.100~q\ & ((\tens[3]~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[3]~42_combout\,
	datac => \select_state.100~q\,
	datad => \tens[3]~35_combout\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X14_Y4_N4
\Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Selector12~2_combout\ & (\hundreds[3]~28_combout\)) # (!\Selector12~2_combout\ & ((\Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hundreds[3]~28_combout\,
	datac => \Mux0~0_combout\,
	datad => \Selector12~2_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X14_Y13_N10
\Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (!\Selector12~2_combout\ & ((\select_state.100~q\ & ((cnt(0)))) # (!\select_state.100~q\ & (\ones[4]~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ones[4]~35_combout\,
	datab => \Selector12~2_combout\,
	datac => \select_state.100~q\,
	datad => cnt(0),
	combout => \Mux3~2_combout\);

-- Location: LCCOMB_X14_Y13_N4
\Mux3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Mux3~2_combout\) # ((\Selector12~2_combout\ & (\LessThan29~2_combout\ $ (!\tens~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~2_combout\,
	datab => \Selector12~2_combout\,
	datac => \LessThan29~2_combout\,
	datad => \tens~30_combout\,
	combout => \Mux3~3_combout\);

-- Location: LCCOMB_X14_Y13_N24
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\select_state.100~q\ & ((\LessThan30~1_combout\ $ (cnt(1))))) # (!\select_state.100~q\ & (\tens[1]~36_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tens[1]~36_combout\,
	datab => \LessThan30~1_combout\,
	datac => \select_state.100~q\,
	datad => cnt(1),
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X14_Y13_N30
\Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Selector12~2_combout\ & ((\hundreds[1]~25_combout\))) # (!\Selector12~2_combout\ & (\Mux2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux2~0_combout\,
	datac => \hundreds[1]~25_combout\,
	datad => \Selector12~2_combout\,
	combout => \Mux2~1_combout\);

-- Location: LCCOMB_X14_Y4_N10
\segments~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \segments~0_combout\ = (!\Mux0~1_combout\ & (\Mux2~1_combout\ & (\Mux1~1_combout\ $ (\Mux3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux3~3_combout\,
	datad => \Mux2~1_combout\,
	combout => \segments~0_combout\);

-- Location: LCCOMB_X14_Y4_N28
\segments~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \segments~1_combout\ = (\Mux1~1_combout\ & (\Mux3~3_combout\ $ (!\Mux2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datac => \Mux1~1_combout\,
	datad => \Mux2~1_combout\,
	combout => \segments~1_combout\);

-- Location: LCCOMB_X14_Y4_N26
\Decoder1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Decoder1~0_combout\ = (!\Mux3~3_combout\ & (!\Mux1~1_combout\ & !\Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datac => \Mux1~1_combout\,
	datad => \Mux2~1_combout\,
	combout => \Decoder1~0_combout\);

-- Location: LCCOMB_X14_Y4_N20
\WideOr6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr6~0_combout\ = (!\Mux0~1_combout\ & ((\Mux1~1_combout\ & (\Mux3~3_combout\ $ (\Mux2~1_combout\))) # (!\Mux1~1_combout\ & (\Mux3~3_combout\ & \Mux2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux3~3_combout\,
	datad => \Mux2~1_combout\,
	combout => \WideOr6~0_combout\);

-- Location: LCCOMB_X14_Y4_N22
\WideOr4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr4~0_combout\ = (\Mux3~3_combout\) # ((\Mux1~1_combout\ & \Mux2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~3_combout\,
	datac => \Mux1~1_combout\,
	datad => \Mux2~1_combout\,
	combout => \WideOr4~0_combout\);

-- Location: LCCOMB_X14_Y4_N24
\WideOr3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr3~0_combout\ = (\Mux0~1_combout\) # ((\Mux1~1_combout\ & ((\Mux2~1_combout\) # (!\Mux3~3_combout\))) # (!\Mux1~1_combout\ & (!\Mux3~3_combout\ & \Mux2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux3~3_combout\,
	datad => \Mux2~1_combout\,
	combout => \WideOr3~0_combout\);

-- Location: LCCOMB_X14_Y4_N18
\WideOr1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr1~0_combout\ = (!\Mux0~1_combout\ & ((\Mux1~1_combout\ & (\Mux3~3_combout\ & !\Mux2~1_combout\)) # (!\Mux1~1_combout\ & ((\Mux2~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mux0~1_combout\,
	datac => \Mux3~3_combout\,
	datad => \Mux2~1_combout\,
	combout => \WideOr1~0_combout\);

-- Location: LCCOMB_X14_Y13_N6
\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\Selector12~0_combout\ & ((\Selector12~1_combout\) # (!\select_state.001~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector12~0_combout\,
	datac => \Selector12~1_combout\,
	datad => \select_state.001~q\,
	combout => \Selector11~0_combout\);

-- Location: CLKCTRL_G4
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

-- Location: FF_X52_Y12_N23
\duty[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add3~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(6));

-- Location: LCCOMB_X52_Y12_N24
\Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (!duty(4) & (!duty(3) & (!duty(6) & duty(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => duty(4),
	datab => duty(3),
	datac => duty(6),
	datad => duty(5),
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X52_Y12_N26
\Equal5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = (!duty(1) & (!duty(2) & (!duty(0) & \Equal5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => duty(1),
	datab => duty(2),
	datac => duty(0),
	datad => \Equal5~0_combout\,
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X52_Y12_N10
\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = duty(0) $ (VCC)
-- \Add3~1\ = CARRY(duty(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => duty(0),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X52_Y12_N30
\duty~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \duty~1_combout\ = (!\Equal5~1_combout\ & \Add3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal5~1_combout\,
	datad => \Add3~0_combout\,
	combout => \duty~1_combout\);

-- Location: FF_X52_Y12_N31
\duty[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \duty~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(0));

-- Location: LCCOMB_X52_Y12_N12
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (duty(1) & (!\Add3~1\)) # (!duty(1) & ((\Add3~1\) # (GND)))
-- \Add3~3\ = CARRY((!\Add3~1\) # (!duty(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => duty(1),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: FF_X52_Y12_N13
\duty[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(1));

-- Location: LCCOMB_X52_Y12_N14
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (duty(2) & (\Add3~3\ $ (GND))) # (!duty(2) & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((duty(2) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => duty(2),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: FF_X52_Y12_N15
\duty[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add3~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(2));

-- Location: LCCOMB_X52_Y12_N16
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (duty(3) & (!\Add3~5\)) # (!duty(3) & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!duty(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => duty(3),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: FF_X52_Y12_N17
\duty[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add3~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(3));

-- Location: LCCOMB_X52_Y12_N18
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (duty(4) & (\Add3~7\ $ (GND))) # (!duty(4) & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((duty(4) & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => duty(4),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: FF_X52_Y12_N19
\duty[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(4));

-- Location: LCCOMB_X52_Y12_N20
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (duty(5) & (!\Add3~9\)) # (!duty(5) & ((\Add3~9\) # (GND)))
-- \Add3~11\ = CARRY((!\Add3~9\) # (!duty(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => duty(5),
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X52_Y12_N28
\duty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \duty~0_combout\ = (\Add3~10_combout\ & !\Equal5~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add3~10_combout\,
	datac => \Equal5~1_combout\,
	combout => \duty~0_combout\);

-- Location: FF_X52_Y12_N29
\duty[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \duty~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => duty(5));

-- Location: LCCOMB_X52_Y12_N22
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = duty(6) $ (!\Add3~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => duty(6),
	cin => \Add3~11\,
	combout => \Add3~12_combout\);

-- Location: IOIBUF_X53_Y9_N15
\buttons[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(2),
	o => \buttons[2]~input_o\);

-- Location: IOIBUF_X53_Y10_N15
\buttons[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(5),
	o => \buttons[5]~input_o\);

-- Location: IOIBUF_X53_Y9_N8
\buttons[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(4),
	o => \buttons[4]~input_o\);

-- Location: IOIBUF_X53_Y11_N8
\buttons[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(3),
	o => \buttons[3]~input_o\);

-- Location: LCCOMB_X52_Y11_N16
\Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (\buttons[2]~input_o\ & (\buttons[5]~input_o\ & (\buttons[4]~input_o\ & \buttons[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[2]~input_o\,
	datab => \buttons[5]~input_o\,
	datac => \buttons[4]~input_o\,
	datad => \buttons[3]~input_o\,
	combout => \Equal4~0_combout\);

-- Location: IOIBUF_X53_Y11_N1
\buttons[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(7),
	o => \buttons[7]~input_o\);

-- Location: IOIBUF_X53_Y12_N1
\buttons[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(6),
	o => \buttons[6]~input_o\);

-- Location: LCCOMB_X52_Y11_N28
\Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~1_combout\ = (\Equal4~0_combout\ & (\buttons[7]~input_o\ & \buttons[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal4~0_combout\,
	datac => \buttons[7]~input_o\,
	datad => \buttons[6]~input_o\,
	combout => \Equal4~1_combout\);

-- Location: IOIBUF_X53_Y9_N22
\buttons[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(1),
	o => \buttons[1]~input_o\);

-- Location: IOIBUF_X53_Y17_N1
\buttons[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(0),
	o => \buttons[0]~input_o\);

-- Location: LCCOMB_X51_Y11_N2
\Equal4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~2_combout\ = (\Equal4~1_combout\ & (!\buttons[1]~input_o\ & \buttons[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal4~1_combout\,
	datac => \buttons[1]~input_o\,
	datad => \buttons[0]~input_o\,
	combout => \Equal4~2_combout\);

-- Location: FF_X51_Y11_N25
\lumens[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add1~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(6));

-- Location: LCCOMB_X51_Y11_N10
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = lumens(0) $ (GND)
-- \Add1~1\ = CARRY(!lumens(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => lumens(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X52_Y11_N24
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (\lumens~3_combout\ & (!lumens(0))) # (!\lumens~3_combout\ & ((\Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lumens~3_combout\,
	datac => lumens(0),
	datad => \Add1~0_combout\,
	combout => \Add1~20_combout\);

-- Location: LCCOMB_X52_Y11_N30
\lumens[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \lumens[0]~4_combout\ = !\Add1~20_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add1~20_combout\,
	combout => \lumens[0]~4_combout\);

-- Location: FF_X52_Y11_N31
\lumens[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \lumens[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(0));

-- Location: LCCOMB_X51_Y11_N12
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\Equal4~2_combout\ & ((lumens(1) & (\Add1~1\ & VCC)) # (!lumens(1) & (!\Add1~1\)))) # (!\Equal4~2_combout\ & ((lumens(1) & (!\Add1~1\)) # (!lumens(1) & ((\Add1~1\) # (GND)))))
-- \Add1~3\ = CARRY((\Equal4~2_combout\ & (!lumens(1) & !\Add1~1\)) # (!\Equal4~2_combout\ & ((!\Add1~1\) # (!lumens(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~2_combout\,
	datab => lumens(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X51_Y11_N8
\Add1~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~19_combout\ = (\lumens~3_combout\ & ((lumens(1)))) # (!\lumens~3_combout\ & (\Add1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datac => lumens(1),
	datad => \lumens~3_combout\,
	combout => \Add1~19_combout\);

-- Location: FF_X51_Y11_N9
\lumens[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add1~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(1));

-- Location: LCCOMB_X51_Y11_N14
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((lumens(2) $ (\Equal4~2_combout\ $ (!\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((lumens(2) & ((\Equal4~2_combout\) # (!\Add1~3\))) # (!lumens(2) & (\Equal4~2_combout\ & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => lumens(2),
	datab => \Equal4~2_combout\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X52_Y11_N20
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (\lumens~3_combout\ & (lumens(2))) # (!\lumens~3_combout\ & ((\Add1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lumens~3_combout\,
	datac => lumens(2),
	datad => \Add1~4_combout\,
	combout => \Add1~18_combout\);

-- Location: FF_X52_Y11_N21
\lumens[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add1~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(2));

-- Location: LCCOMB_X51_Y11_N16
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (lumens(3) & ((\Equal4~2_combout\ & (\Add1~5\ & VCC)) # (!\Equal4~2_combout\ & (!\Add1~5\)))) # (!lumens(3) & ((\Equal4~2_combout\ & (!\Add1~5\)) # (!\Equal4~2_combout\ & ((\Add1~5\) # (GND)))))
-- \Add1~7\ = CARRY((lumens(3) & (!\Equal4~2_combout\ & !\Add1~5\)) # (!lumens(3) & ((!\Add1~5\) # (!\Equal4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => lumens(3),
	datab => \Equal4~2_combout\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X51_Y11_N26
\Add1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~17_combout\ = (\lumens~3_combout\ & ((lumens(3)))) # (!\lumens~3_combout\ & (\Add1~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~6_combout\,
	datac => lumens(3),
	datad => \lumens~3_combout\,
	combout => \Add1~17_combout\);

-- Location: FF_X51_Y11_N27
\lumens[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add1~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(3));

-- Location: LCCOMB_X51_Y11_N18
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = ((\Equal4~2_combout\ $ (lumens(4) $ (!\Add1~7\)))) # (GND)
-- \Add1~9\ = CARRY((\Equal4~2_combout\ & ((lumens(4)) # (!\Add1~7\))) # (!\Equal4~2_combout\ & (lumens(4) & !\Add1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~2_combout\,
	datab => lumens(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X51_Y11_N28
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\lumens~3_combout\ & ((lumens(4)))) # (!\lumens~3_combout\ & (\Add1~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~8_combout\,
	datac => lumens(4),
	datad => \lumens~3_combout\,
	combout => \Add1~16_combout\);

-- Location: FF_X51_Y11_N29
\lumens[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add1~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(4));

-- Location: LCCOMB_X51_Y11_N30
\lumens~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \lumens~1_combout\ = (!lumens(2) & (!lumens(4) & (!lumens(3) & !lumens(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => lumens(2),
	datab => lumens(4),
	datac => lumens(3),
	datad => lumens(6),
	combout => \lumens~1_combout\);

-- Location: LCCOMB_X51_Y11_N4
\lumens~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \lumens~0_combout\ = (lumens(0) & (!lumens(1) & (lumens(5) $ (\buttons[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => lumens(0),
	datab => lumens(5),
	datac => lumens(1),
	datad => \buttons[0]~input_o\,
	combout => \lumens~0_combout\);

-- Location: LCCOMB_X51_Y11_N0
\lumens~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \lumens~2_combout\ = ((\lumens~1_combout\ & \lumens~0_combout\)) # (!\Equal4~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lumens~1_combout\,
	datac => \lumens~0_combout\,
	datad => \Equal4~1_combout\,
	combout => \lumens~2_combout\);

-- Location: LCCOMB_X38_Y18_N0
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = pwm_count(0) $ (VCC)
-- \Add2~1\ = CARRY(pwm_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(0),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: LCCOMB_X39_Y18_N26
\pwm_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pwm_count~1_combout\ = (\Add2~0_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~0_combout\,
	datad => \Equal0~3_combout\,
	combout => \pwm_count~1_combout\);

-- Location: FF_X39_Y18_N27
\pwm_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \pwm_count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(0));

-- Location: LCCOMB_X38_Y18_N2
\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (pwm_count(1) & (!\Add2~1\)) # (!pwm_count(1) & ((\Add2~1\) # (GND)))
-- \Add2~3\ = CARRY((!\Add2~1\) # (!pwm_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(1),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: FF_X38_Y18_N3
\pwm_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(1));

-- Location: LCCOMB_X38_Y18_N4
\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (pwm_count(2) & (\Add2~3\ $ (GND))) # (!pwm_count(2) & (!\Add2~3\ & VCC))
-- \Add2~5\ = CARRY((pwm_count(2) & !\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(2),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: FF_X38_Y18_N5
\pwm_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(2));

-- Location: LCCOMB_X38_Y18_N6
\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (pwm_count(3) & (!\Add2~5\)) # (!pwm_count(3) & ((\Add2~5\) # (GND)))
-- \Add2~7\ = CARRY((!\Add2~5\) # (!pwm_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(3),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

-- Location: LCCOMB_X39_Y18_N4
\pwm_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pwm_count~0_combout\ = (\Add2~6_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~6_combout\,
	datad => \Equal0~3_combout\,
	combout => \pwm_count~0_combout\);

-- Location: FF_X39_Y18_N5
\pwm_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \pwm_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(3));

-- Location: LCCOMB_X38_Y18_N8
\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (pwm_count(4) & (\Add2~7\ $ (GND))) # (!pwm_count(4) & (!\Add2~7\ & VCC))
-- \Add2~9\ = CARRY((pwm_count(4) & !\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(4),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

-- Location: FF_X38_Y18_N9
\pwm_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(4));

-- Location: LCCOMB_X38_Y18_N10
\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (pwm_count(5) & (!\Add2~9\)) # (!pwm_count(5) & ((\Add2~9\) # (GND)))
-- \Add2~11\ = CARRY((!\Add2~9\) # (!pwm_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(5),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

-- Location: FF_X38_Y18_N11
\pwm_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(5));

-- Location: LCCOMB_X38_Y18_N12
\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = (pwm_count(6) & (\Add2~11\ $ (GND))) # (!pwm_count(6) & (!\Add2~11\ & VCC))
-- \Add2~13\ = CARRY((pwm_count(6) & !\Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(6),
	datad => VCC,
	cin => \Add2~11\,
	combout => \Add2~12_combout\,
	cout => \Add2~13\);

-- Location: FF_X38_Y18_N13
\pwm_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(6));

-- Location: LCCOMB_X38_Y18_N14
\Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~14_combout\ = (pwm_count(7) & (!\Add2~13\)) # (!pwm_count(7) & ((\Add2~13\) # (GND)))
-- \Add2~15\ = CARRY((!\Add2~13\) # (!pwm_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(7),
	datad => VCC,
	cin => \Add2~13\,
	combout => \Add2~14_combout\,
	cout => \Add2~15\);

-- Location: LCCOMB_X39_Y18_N28
\pwm_count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pwm_count~2_combout\ = (\Add2~14_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~14_combout\,
	datad => \Equal0~3_combout\,
	combout => \pwm_count~2_combout\);

-- Location: FF_X39_Y18_N29
\pwm_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \pwm_count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(7));

-- Location: LCCOMB_X38_Y18_N16
\Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~16_combout\ = (pwm_count(8) & (\Add2~15\ $ (GND))) # (!pwm_count(8) & (!\Add2~15\ & VCC))
-- \Add2~17\ = CARRY((pwm_count(8) & !\Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(8),
	datad => VCC,
	cin => \Add2~15\,
	combout => \Add2~16_combout\,
	cout => \Add2~17\);

-- Location: LCCOMB_X39_Y18_N12
\pwm_count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pwm_count~4_combout\ = (\Add2~16_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add2~16_combout\,
	datad => \Equal0~3_combout\,
	combout => \pwm_count~4_combout\);

-- Location: FF_X39_Y18_N13
\pwm_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \pwm_count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(8));

-- Location: LCCOMB_X38_Y18_N18
\Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~18_combout\ = (pwm_count(9) & (!\Add2~17\)) # (!pwm_count(9) & ((\Add2~17\) # (GND)))
-- \Add2~19\ = CARRY((!\Add2~17\) # (!pwm_count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(9),
	datad => VCC,
	cin => \Add2~17\,
	combout => \Add2~18_combout\,
	cout => \Add2~19\);

-- Location: LCCOMB_X39_Y18_N2
\pwm_count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pwm_count~5_combout\ = (\Add2~18_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~18_combout\,
	datad => \Equal0~3_combout\,
	combout => \pwm_count~5_combout\);

-- Location: FF_X39_Y18_N3
\pwm_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \pwm_count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(9));

-- Location: LCCOMB_X38_Y18_N20
\Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~20_combout\ = (pwm_count(10) & (\Add2~19\ $ (GND))) # (!pwm_count(10) & (!\Add2~19\ & VCC))
-- \Add2~21\ = CARRY((pwm_count(10) & !\Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => pwm_count(10),
	datad => VCC,
	cin => \Add2~19\,
	combout => \Add2~20_combout\,
	cout => \Add2~21\);

-- Location: FF_X38_Y18_N21
\pwm_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(10));

-- Location: LCCOMB_X38_Y18_N22
\Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~22_combout\ = (pwm_count(11) & (!\Add2~21\)) # (!pwm_count(11) & ((\Add2~21\) # (GND)))
-- \Add2~23\ = CARRY((!\Add2~21\) # (!pwm_count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(11),
	datad => VCC,
	cin => \Add2~21\,
	combout => \Add2~22_combout\,
	cout => \Add2~23\);

-- Location: FF_X38_Y18_N23
\pwm_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add2~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(11));

-- Location: LCCOMB_X38_Y18_N24
\Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~24_combout\ = \Add2~23\ $ (!pwm_count(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => pwm_count(12),
	cin => \Add2~23\,
	combout => \Add2~24_combout\);

-- Location: LCCOMB_X39_Y18_N22
\pwm_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pwm_count~3_combout\ = (\Add2~24_combout\ & !\Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add2~24_combout\,
	datad => \Equal0~3_combout\,
	combout => \pwm_count~3_combout\);

-- Location: FF_X39_Y18_N23
\pwm_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \pwm_count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => pwm_count(12));

-- Location: LCCOMB_X38_Y18_N28
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!pwm_count(6) & (pwm_count(7) & (!pwm_count(4) & !pwm_count(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(6),
	datab => pwm_count(7),
	datac => pwm_count(4),
	datad => pwm_count(5),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X38_Y18_N26
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!pwm_count(11) & (!pwm_count(10) & (pwm_count(8) & pwm_count(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(11),
	datab => pwm_count(10),
	datac => pwm_count(8),
	datad => pwm_count(9),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X38_Y18_N30
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (pwm_count(3) & (!pwm_count(1) & (!pwm_count(2) & !pwm_count(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(3),
	datab => pwm_count(1),
	datac => pwm_count(2),
	datad => pwm_count(0),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X39_Y18_N20
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (pwm_count(12) & (\Equal0~1_combout\ & (\Equal0~2_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => pwm_count(12),
	datab => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X51_Y11_N6
\lumens~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \lumens~3_combout\ = (\lumens~2_combout\) # ((\buttons[1]~input_o\ $ (!\buttons[0]~input_o\)) # (!\Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \buttons[1]~input_o\,
	datab => \lumens~2_combout\,
	datac => \Equal0~3_combout\,
	datad => \buttons[0]~input_o\,
	combout => \lumens~3_combout\);

-- Location: LCCOMB_X51_Y11_N20
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Equal4~2_combout\ & ((lumens(5) & (\Add1~9\ & VCC)) # (!lumens(5) & (!\Add1~9\)))) # (!\Equal4~2_combout\ & ((lumens(5) & (!\Add1~9\)) # (!lumens(5) & ((\Add1~9\) # (GND)))))
-- \Add1~11\ = CARRY((\Equal4~2_combout\ & (!lumens(5) & !\Add1~9\)) # (!\Equal4~2_combout\ & ((!\Add1~9\) # (!lumens(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal4~2_combout\,
	datab => lumens(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X52_Y11_N22
\Add1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~15_combout\ = (\lumens~3_combout\ & (lumens(5))) # (!\lumens~3_combout\ & ((\Add1~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lumens~3_combout\,
	datac => lumens(5),
	datad => \Add1~10_combout\,
	combout => \Add1~15_combout\);

-- Location: FF_X52_Y11_N23
\lumens[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add1~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => lumens(5));

-- Location: LCCOMB_X51_Y11_N22
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = \Equal4~2_combout\ $ (\Add1~11\ $ (!lumens(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Equal4~2_combout\,
	datad => lumens(6),
	cin => \Add1~11\,
	combout => \Add1~12_combout\);

-- Location: LCCOMB_X51_Y11_N24
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\lumens~3_combout\ & ((lumens(6)))) # (!\lumens~3_combout\ & (\Add1~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add1~12_combout\,
	datac => lumens(6),
	datad => \lumens~3_combout\,
	combout => \Add1~14_combout\);

-- Location: LCCOMB_X52_Y11_N2
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((\duty~1_combout\ & !\Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \duty~1_combout\,
	datab => \Add1~20_combout\,
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X52_Y11_N4
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((\Add1~19_combout\ & ((!\LessThan0~1_cout\) # (!\Add3~2_combout\))) # (!\Add1~19_combout\ & (!\Add3~2_combout\ & !\LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~19_combout\,
	datab => \Add3~2_combout\,
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X52_Y11_N6
\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((\Add3~4_combout\ & ((!\LessThan0~3_cout\) # (!\Add1~18_combout\))) # (!\Add3~4_combout\ & (!\Add1~18_combout\ & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~4_combout\,
	datab => \Add1~18_combout\,
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X52_Y11_N8
\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((\Add1~17_combout\ & ((!\LessThan0~5_cout\) # (!\Add3~6_combout\))) # (!\Add1~17_combout\ & (!\Add3~6_combout\ & !\LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~17_combout\,
	datab => \Add3~6_combout\,
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X52_Y11_N10
\LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((\Add3~8_combout\ & ((!\LessThan0~7_cout\) # (!\Add1~16_combout\))) # (!\Add3~8_combout\ & (!\Add1~16_combout\ & !\LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~8_combout\,
	datab => \Add1~16_combout\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X52_Y11_N12
\LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((\Add1~15_combout\ & ((!\LessThan0~9_cout\) # (!\duty~0_combout\))) # (!\Add1~15_combout\ & (!\duty~0_combout\ & !\LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~15_combout\,
	datab => \duty~0_combout\,
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X52_Y11_N14
\LessThan0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~12_combout\ = (\Add3~12_combout\ & ((!\Add1~14_combout\) # (!\LessThan0~11_cout\))) # (!\Add3~12_combout\ & (!\LessThan0~11_cout\ & !\Add1~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add3~12_combout\,
	datad => \Add1~14_combout\,
	cin => \LessThan0~11_cout\,
	combout => \LessThan0~12_combout\);

-- Location: FF_X52_Y11_N15
\pwm~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \frame_rate0|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \LessThan0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm~reg0_q\);

-- Location: IOIBUF_X53_Y17_N8
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


