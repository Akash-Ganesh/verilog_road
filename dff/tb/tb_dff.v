module tb();
	reg clk, d, clear;
	wire q, qbar;

	dff dut (
		.clk(clk),
		.d(d),
		.clear(clear),
		.q(q),
		.qbar(qbar)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		$dumpfile("sim/dff.vcd");
		$dumpvars(0);
		clear = 1;
		#12
		clear = 0;
		d = 1;
		#10
		d = 0;
		#14
		d = 1;
		#10
		$finish;
	end
endmodule
