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
- `hamming_generator/` - Hamming code generator
- `hamming_checker/` - Hamming code checker
- `sr_latch/` - SR Latch and D Latch
- `dff/` - D Flip Flop with an asynchronous clear
- `tff/` - T Flip Flop with an asynchronous clear
- `jkff/` - JK Flip Flop
- `register/` - Register with shifting
- `ram/` - RAM
- `rom/` - ROM
- `fifo/` - Queue
- `lifo/` - Stack

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
