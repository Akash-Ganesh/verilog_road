compile:
	iverilog -o ./sim/counter.exe -f filelist.f
	./sim/counter.exe
wave:
	gtkwave ./sim/counter.vcd
clean:
	rm ./sim/counter.exe ./sim/counter.vcd
