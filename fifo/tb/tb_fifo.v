module tb();
	localparam DATA_WIDTH = 8;
	localparam BUFFER_NO = 8;

	reg clk;
	reg wen;
	reg ren;
	reg reset;
	reg [DATA_WIDTH-1:0] data_in;
	wire full;
	wire half;
	wire empty;
	wire [DATA_WIDTH-1:0] data_out;

	fifo #(
		.DATA_WIDTH(DATA_WIDTH),
		.BUFFER_NO(BUFFER_NO)
	) dut (
		.clk(clk),
		.wen(wen),
		.ren(ren),
		.reset(reset),
		.data_in(data_in),
		.full(full),
		.half(half),
		.empty(empty),
		.data_out(data_out)
	);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial begin
		$dumpfile("sim/fifo.vcd");
		$dumpvars(0);
		reset = 1;
		#10
		reset = 0;
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 1;
		ren = 0;
		data_in = $random;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		wen = 0;
		ren = 1;
		#20
		$finish;
	end
endmodule
