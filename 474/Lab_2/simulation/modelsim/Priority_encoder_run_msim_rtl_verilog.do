transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/enratzz/altera_lite/15.1/Lab_2 {/home/enratzz/altera_lite/15.1/Lab_2/Priority_encoder.sv}

