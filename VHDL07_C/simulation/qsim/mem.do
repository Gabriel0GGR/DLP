onerror {quit -f}
vlib work
vlog -work work mem.vo
vlog -work work mem.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mem_vlg_vec_tst
vcd file -direction mem.msim.vcd
vcd add -internal mem_vlg_vec_tst/*
vcd add -internal mem_vlg_vec_tst/i1/*
add wave /*
run -all
