compile:
	iverilog -o ./sim/hamming_checker.exe -f filelist.f
	./sim/hamming_checker.exe
wave:
	gtkwave ./sim/hamming_checker.vcd
clean:
	rm ./sim/hamming_checker.exe ./sim/hamming_checker.vcd
