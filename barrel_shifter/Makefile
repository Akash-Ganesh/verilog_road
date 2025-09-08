compile:
	iverilog -o ./sim/barrel_shifter.exe -f filelist.f
	./sim/barrel_shifter.exe
wave:
	gtkwave ./sim/barrel_shifter.vcd
clean:
	rm ./sim/barrel_shifter.exe ./sim/barrel_shifter.vcd
