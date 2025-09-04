compile:
	iverilog -o ./sim/alu.exe -f filelist.f
	./sim/alu.exe
wave:
	gtkwave ./sim/alu.vcd
clean:
	rm ./sim/alu.exe ./sim/alu.vcd
