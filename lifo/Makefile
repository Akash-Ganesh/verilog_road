compile:
	iverilog -o ./sim/lifo.exe -f filelist.f
	./sim/lifo.exe
wave:
	gtkwave ./sim/lifo.vcd
clean:
	rm ./sim/lifo.exe ./sim/lifo.vcd
