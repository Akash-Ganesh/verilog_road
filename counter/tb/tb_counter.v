module tb();

	localparam N_WIDTH = 4;

	reg incr;
	reg clk;
	reg reset;
	wire [N_WIDTH-1:0] y;

	counter #(
		.N_WIDTH(N_WIDTH),
		.DOWNEN(0)
	) dut (
		.incr(incr),
		.reset(reset),
		.clk(clk),
		.y(y)
	);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial begin
		$dumpfile("sim/counter.vcd");
		$dumpvars(0);
		incr = 1;
		reset = 1;
		#20
		reset = 0;
		#1000
		$finish;
	end
endmodule
