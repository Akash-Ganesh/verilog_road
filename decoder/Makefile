compile:
	iverilog -o ./sim/decoder.exe -f filelist.f
	./sim/decoder.exe
wave:
	gtkwave ./sim/decoder.vcd
clean:
	rm ./sim/decoder.exe ./sim/decoder.vcd
