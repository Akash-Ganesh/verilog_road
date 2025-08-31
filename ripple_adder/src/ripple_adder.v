module ripple_adder #(
		parameter N_WIDTH = 4
	)
	(
		input [N_WIDTH-1:0] a,
		input [N_WIDTH-1:0] b,
		input c_in,
		output [N_WIDTH-1:0] sum,
		output c_out
	);

	wire [N_WIDTH:0] c;
	assign c[0] = c_in;

	genvar i;
	generate 
		for (i=0; i<N_WIDTH; i = i+1) begin
			full_adder fa (
				.a(a[i]), 
				.b(b[i]),
				.c_in(c[i]),
				.sum(sum[i]),
				.c_out(c[i+1])
			);
		end
	endgenerate
	assign c_out = c[N_WIDTH];
endmodule
