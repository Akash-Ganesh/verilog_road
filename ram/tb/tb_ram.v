module tb();
	localparam BIT_DEPTH = 8;
	localparam BIT_SIZE = 1024;

	reg clk;
	reg [$clog2(BIT_SIZE/BIT_DEPTH) - 1 : 0] addr;
	reg wen;
	reg [BIT_DEPTH-1:0] data_in;
	wire [BIT_DEPTH-1:0] data_out;

	ram #(
		.BIT_SIZE(BIT_SIZE),
		.BIT_DEPTH(BIT_DEPTH)
	) dut (
		.clk(clk),
		.addr(addr),
		.wen(wen),
		.data_in(data_in),
		.data_out(data_out)
	);

	initial begin
		clk = 1;
		forever #10 clk = ~clk;
	end

	integer i;

	initial begin
		$dumpfile("sim/ram.vcd");
		$dumpvars(0);
		wen = 1'b1;
		for (i=0; i<(BIT_SIZE/BIT_DEPTH); i=i+1) begin
			data_in = $random;
			addr = i;
			#20;
		end
		wen = 1'b0;
		for (i=0; i<(BIT_SIZE/BIT_DEPTH); i=i+1) begin
			addr = i;
			#20;
		end
		$finish;
	end
endmodule
