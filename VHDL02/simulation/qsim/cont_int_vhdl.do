onerror {quit -f}
vlib work
vlog -work work cont_int_vhdl.vo
vlog -work work cont_int_vhdl.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cont_int_vhdl_vlg_vec_tst
vcd file -direction cont_int_vhdl.msim.vcd
vcd add -internal cont_int_vhdl_vlg_vec_tst/*
vcd add -internal cont_int_vhdl_vlg_vec_tst/i1/*
add wave /*
run -all
