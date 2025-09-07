module tb();
	localparam BIT_DEPTH = 4;
	localparam BIT_SIZE = 16;

	reg clk;
	reg [$clog2(BIT_SIZE/BIT_DEPTH) - 1 : 0] addr;
	wire [BIT_DEPTH-1:0] data_out;

	rom #(
		.BIT_SIZE(BIT_SIZE),
		.BIT_DEPTH(BIT_DEPTH)
	) dut (
		.clk(clk),
		.addr(addr),
		.data_out(data_out)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	integer i;

	initial begin
		$dumpfile("sim/rom.vcd");
		$dumpvars(0);
		for (i=0; i<(BIT_SIZE/BIT_DEPTH); i=i+1) begin
			addr = i;
			#20;
		end
		for (i=0; i<(BIT_SIZE/BIT_DEPTH); i=i+1) begin
			addr = i;
			#20;
		end
		$finish;
	end
endmodule
