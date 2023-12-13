onerror {quit -f}
vlib work
vlog -work work ram_sinc.vo
vlog -work work ram_sinc.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ram_sinc_vlg_vec_tst
vcd file -direction ram_sinc.msim.vcd
vcd add -internal ram_sinc_vlg_vec_tst/*
vcd add -internal ram_sinc_vlg_vec_tst/i1/*
add wave /*
run -all
