compile:
	iverilog -o ./sim/register.exe -f filelist.f
	./sim/register.exe
wave:
	gtkwave ./sim/register.vcd
clean:
	rm ./sim/register.exe ./sim/register.vcd
