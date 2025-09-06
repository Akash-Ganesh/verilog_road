compile:
	iverilog -o ./sim/hamming_generator.exe -f filelist.f
	./sim/hamming_generator.exe
wave:
	gtkwave ./sim/hamming_generator.vcd
clean:
	rm ./sim/hamming_generator.exe ./sim/hamming_generator.vcd
