vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../Top.srcs/sources_1/ip/queue_fifo/sim/queue_fifo.v" \


vlog -work xil_defaultlib \
"glbl.v"

