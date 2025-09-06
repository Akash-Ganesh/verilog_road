compile:
	iverilog -o ./sim/jkff.exe -f filelist.f
	./sim/jkff.exe
wave:
	gtkwave ./sim/jkff.vcd
clean:
	rm ./sim/jkff.exe ./sim/jkff.vcd
