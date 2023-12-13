onerror {quit -f}
vlib work
vlog -work work contador_vhdl.vo
vlog -work work contador_vhdl.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.contador_vhdl_vlg_vec_tst
vcd file -direction contador_vhdl.msim.vcd
vcd add -internal contador_vhdl_vlg_vec_tst/*
vcd add -internal contador_vhdl_vlg_vec_tst/i1/*
add wave /*
run -all
