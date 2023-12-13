onerror {quit -f}
vlib work
vlog -work work fsm_temp.vo
vlog -work work fsm_temp.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.fsm_temp_vlg_vec_tst
vcd file -direction fsm_temp.msim.vcd
vcd add -internal fsm_temp_vlg_vec_tst/*
vcd add -internal fsm_temp_vlg_vec_tst/i1/*
add wave /*
run -all
