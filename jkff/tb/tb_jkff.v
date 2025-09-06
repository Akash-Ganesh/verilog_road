module tb();
	reg clk, j, k;
	wire q, qbar;

	jkff dut (
		.clk(clk),
		.j(j),
		.k(k),
		.q(q),
		.qbar(qbar)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end

	initial begin
		$dumpfile("sim/jkff.vcd");
		$dumpvars(0);
		j = 0;
		k = 0;
		#10
		j = 0;
		k = 1;
		#10
		j = 1;
		k = 0;
		#10
		j = 1;
		k = 1;
		#10
		j = 0;
		k = 0;
		#10
		j = 0;
		k = 1;
		#10
		j = 1;
		k = 0;
		#10
		j = 1;
		k = 1;
		#10
		$finish;
	end
endmodule
