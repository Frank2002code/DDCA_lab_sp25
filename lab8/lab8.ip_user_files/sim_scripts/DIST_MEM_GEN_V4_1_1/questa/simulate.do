onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib DIST_MEM_GEN_V4_1_opt

do {wave.do}

view wave
view structure
view signals

do {DIST_MEM_GEN_V4_1.udo}

run -all

quit -force
