compile:
	iverilog -o ./sim/ripple_adder.exe -f filelist.f
	./sim/ripple_adder.exe
wave:
	gtkwave ./sim/ripple_adder.vcd
clean:
	rm ./sim/ripple_adder.exe ./sim/ripple_adder.vcd
