module tb();
	localparam DATA_WIDTH = 8;

	reg RbarL;
	reg [$clog2(DATA_WIDTH)-1:0] shift;
	reg [DATA_WIDTH-1:0] data_in;
	wire [DATA_WIDTH-1:0] data_out;

	barrel_shifter #(
		.DATA_WIDTH(DATA_WIDTH)
	) dut (
		.RbarL(RbarL),
		.shift(shift),
		.data_in(data_in),
		.data_out(data_out)
	);

	integer i;

	initial begin
		$dumpfile("sim/barrel_shifter.vcd");
		$dumpvars(0);
		RbarL = 0;
		for (i=0; i<DATA_WIDTH; i=i+1) begin
			data_in	= $random;
			shift = i;
			#10;
		end
		RbarL = 1;
		for (i=0; i<DATA_WIDTH; i=i+1) begin
			data_in	= $random;
			shift = i;
			#10;
		end
		$finish;
	end
endmodule
