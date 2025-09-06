compile:
	iverilog -o ./sim/sr_latch.exe -f filelist.f
	./sim/sr_latch.exe
wave:
	gtkwave ./sim/sr_latch.vcd
clean:
	rm ./sim/sr_latch.exe ./sim/sr_latch.vcd
