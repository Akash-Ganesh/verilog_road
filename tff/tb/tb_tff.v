module tb();
	reg clk, t, clear;
	wire q, qbar;

	tff dut (
		.clk(clk),
		.t(t),
		.clear(clear),
		.q(q),
		.qbar(qbar)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		$dumpfile("sim/tff.vcd");
		$dumpvars(0);
		clear = 1;
		#12
		clear = 0;
		t = 1;
		#10
		t = 0;
		#10
		t = 1;
		#10
		t = 0;
		#10
		t = 1;
		#10
		t = 0;
		#10
		$finish;
	end
endmodule
