transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/enratzz/altera_lite/15.1/Lab_5 {/home/enratzz/altera_lite/15.1/Lab_5/frame_rate.v}
vlog -vlog01compat -work work +incdir+/home/enratzz/altera_lite/15.1/Lab_5/db {/home/enratzz/altera_lite/15.1/Lab_5/db/frame_rate_altpll.v}
vlog -sv -work work +incdir+/home/enratzz/altera_lite/15.1/Lab_5 {/home/enratzz/altera_lite/15.1/Lab_5/sine_rom.sv}
vlog -sv -work work +incdir+/home/enratzz/altera_lite/15.1/Lab_5 {/home/enratzz/altera_lite/15.1/Lab_5/debounce.sv}
vlog -sv -work work +incdir+/home/enratzz/altera_lite/15.1/Lab_5 {/home/enratzz/altera_lite/15.1/Lab_5/ROM.sv}

