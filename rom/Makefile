compile:
	iverilog -o ./sim/rom.exe -f filelist.f
	./sim/rom.exe
wave:
	gtkwave ./sim/rom.vcd
clean:
	rm ./sim/rom.exe ./sim/rom.vcd
