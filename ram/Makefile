compile:
	iverilog -o ./sim/ram.exe -f filelist.f
	./sim/ram.exe
wave:
	gtkwave ./sim/ram.vcd
clean:
	rm ./sim/ram.exe ./sim/ram.vcd
