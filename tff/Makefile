compile:
	iverilog -o ./sim/tff.exe -f filelist.f
	./sim/tff.exe
wave:
	gtkwave ./sim/tff.vcd
clean:
	rm ./sim/tff.exe ./sim/tff.vcd
