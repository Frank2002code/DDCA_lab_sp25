onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib reg_half_opt

do {wave.do}

view wave
view structure
view signals

do {reg_half.udo}

run -all

quit -force
