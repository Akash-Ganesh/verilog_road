module tb();
	localparam DATA_WIDTH = 8;
	localparam BUFFER_NO = 8;

	reg clk;
	reg wen;
	reg ren;
	reg reset;
	reg [DATA_WIDTH-1:0] data_in;
	wire full;
	wire empty;
	wire [DATA_WIDTH-1:0] data_out;

	lifo #(
		.DATA_WIDTH(DATA_WIDTH),
		.BUFFER_NO(BUFFER_NO)
	) dut (
		.clk(clk),
		.wen(wen),
		.ren(ren),
		.reset(reset),
		.data_in(data_in),
		.full(full),
		.empty(empty),
		.data_out(data_out)
	);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial begin
		$dumpfile("sim/lifo.vcd");
		$dumpvars(0);
		reset = 1;
		#10
		reset = 0;
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
		#20
		data_in = $random;
		wen = 1;
		ren = 0;
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
