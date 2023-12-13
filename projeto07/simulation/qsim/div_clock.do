onerror {quit -f}
vlib work
vlog -work work div_clock.vo
vlog -work work div_clock.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.div_clock_vlg_vec_tst
vcd file -direction div_clock.msim.vcd
vcd add -internal div_clock_vlg_vec_tst/*
vcd add -internal div_clock_vlg_vec_tst/i1/*
add wave /*
run -all
