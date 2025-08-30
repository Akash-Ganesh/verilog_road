compile:
	iverilog -o ./sim/dmux.exe -f filelist.f
	./sim/dmux.exe
wave:
	gtkwave ./sim/dmux.vcd
clean:
	rm ./sim/dmux.exe ./sim/dmux.vcd
