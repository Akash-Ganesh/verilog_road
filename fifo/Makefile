compile:
	iverilog -o ./sim/fifo.exe -f filelist.f
	./sim/fifo.exe
wave:
	gtkwave ./sim/fifo.vcd
clean:
	rm ./sim/fifo.exe ./sim/fifo.vcd
