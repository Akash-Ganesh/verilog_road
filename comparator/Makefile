compile:
	iverilog -o ./sim/comparator.exe -f filelist.f
	./sim/comparator.exe
wave:
	gtkwave ./sim/comparator.vcd
clean:
	rm ./sim/comparator.exe ./sim/comparator.vcd
