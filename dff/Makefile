compile:
	iverilog -o ./sim/dff.exe -f filelist.f
	./sim/dff.exe
wave:
	gtkwave ./sim/dff.vcd
clean:
	rm ./sim/dff.exe ./sim/dff.vcd
