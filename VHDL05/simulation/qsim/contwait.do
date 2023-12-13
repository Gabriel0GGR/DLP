onerror {quit -f}
vlib work
vlog -work work contwait.vo
vlog -work work contwait.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.contwait_vlg_vec_tst
vcd file -direction contwait.msim.vcd
vcd add -internal contwait_vlg_vec_tst/*
vcd add -internal contwait_vlg_vec_tst/i1/*
add wave /*
run -all
