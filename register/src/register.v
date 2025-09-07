module register #(
		parameter N_WIDTH = 4
	)
	(
		input [N_WIDTH-1:0] data_in,
		input clear,
		input [1:0] sel,
		input clk,
		input serr,
		input serl,
		output [N_WIDTH-1:0] data_out
	);

	wire [N_WIDTH-1:0] buff;

	mux #(
		.N_SLAVES(4),
		.DATA_WIDTH(N_WIDTH)
	) m0 (
		.data({data_out,serr,data_out[N_WIDTH-1:1],data_out[N_WIDTH-2:0],serl,data_in}),
		.sel(sel),
		.op(buff)
	);

	genvar i;
	generate 
		for (i=0; i<N_WIDTH; i=i+1) begin
			dff d0 (
				.clk(clk),
				.d(buff[i]),
				.clear(clear),
				.q(data_out[i])
			);
		end
	endgenerate
endmodule
