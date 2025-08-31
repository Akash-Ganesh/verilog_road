compile:
	iverilog -o ./sim/encoder.exe -f filelist.f
	./sim/encoder.exe
wave:
	gtkwave ./sim/encoder.vcd
clean:
	rm ./sim/encoder.exe ./sim/encoder.vcd
