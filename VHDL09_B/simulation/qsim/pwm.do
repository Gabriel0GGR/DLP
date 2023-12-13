onerror {quit -f}
vlib work
vlog -work work pwm.vo
vlog -work work pwm.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.pwm_vlg_vec_tst
vcd file -direction pwm.msim.vcd
vcd add -internal pwm_vlg_vec_tst/*
vcd add -internal pwm_vlg_vec_tst/i1/*
add wave /*
run -all
