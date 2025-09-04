# verilog_road

## Projects

- `full_adder/` - 1-bit full adder
- `mux/` - Multiplexer
- `dmux/` - Demultiplexer
- `encoder/` - N-bit encoder
- `decoder/` - N-bit decoder
- `comparator/` - Comparator
- `ripple_adder/` - Ripple-carry adder using the full_adder module
- `alu/` - Arithmetic Logic Unit

---

## Requirements

- **[Icarus Verilog](http://iverilog.icarus.com/)** (`iverilog`)  
- **[GTKWave](http://gtkwave.sourceforge.net/)** (waveform visualizer)  

---

## Quick Start


```bash
# Using the provided `Makefile`
$ make compile
$ make wave 


# Manual compilation
$ iverilog -o sim/<module>.vcd -f filelist.f
$ ./sim/<module>.exe
$ gtkwave sim/<module>.vcd
