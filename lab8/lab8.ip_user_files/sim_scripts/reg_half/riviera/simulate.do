onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+reg_half -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.reg_half xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {reg_half.udo}

run -all

endsim

quit -force
