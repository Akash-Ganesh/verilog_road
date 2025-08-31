`timescale 1ns/1ps

module tb #(
	parameter N = 4,
	parameter P = 1
	) ();
	localparam OP_SIZE = $clog2(N);

	reg en;
	reg [N-1:0] a;
	wire [OP_SIZE-1:0] op;

	encoder #(
		.N(N),
		.PRIORITY_ENCODER(P)
	) dut (
		.en(en),
		.a(a),
		.op(op)
	);

	integer j;

	initial begin
		$dumpfile("sim/encoder.vcd");
		$dumpvars(0);
		en = 0;
		for (j=0; j<N; j = j+1) begin
			a = 0;
			a[j] = 1'b1;
			#10;
		end
		en = 1;
		for (j=0; j<N; j = j+1) begin
			a = 0;
			a[j] = 1'b1;
			#10;
		end
		en = 0;
		for (j=0; j<(1<<N); j = j+1) begin
			a = j;
			#10;
		end
		$finish;
	end
endmodule
