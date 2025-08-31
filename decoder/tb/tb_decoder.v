`timescale 1ns/1ps

module tb #(
	parameter N = 4
	) ();

	localparam OP_SIZE = 1<<N;

	reg en;
	reg [N-1:0] a;
	wire [OP_SIZE-1:0] op;

	decoder #(
		.N(N)
	) dut (
		.en(en),
		.a(a),
		.op(op)
	);

	integer j;

	initial begin
		$dumpfile("sim/decoder.vcd");
		$dumpvars(0);
		en = 0;
		for (j=0; j<OP_SIZE; j = j+1) begin
			a = j;
			#10;
		end
		en = 1;
		for (j=0; j<OP_SIZE; j = j+1) begin
			a = j;
			#10;
		end
		$finish;
	end
endmodule
