module tb();

	localparam P_BITS = 3;
	localparam OP_WIDTH = (1<<P_BITS) - 1;
	localparam IP_WIDTH = (1<<P_BITS) - P_BITS - 1;

	reg [IP_WIDTH-1:0] data;
	wire [OP_WIDTH:0] op;

	hamming_generator #(
		.P_BITS(P_BITS)
	) dut (
		.data(data),
		.op(op)
	);

	integer k;

	initial begin
		$dumpfile("sim/hamming_generator.vcd");
		$dumpvars(0);
		for (k=0; k<(1<<IP_WIDTH); k=k+1) begin
			data = k;
			#10;
		end
		$finish;
	end

endmodule
