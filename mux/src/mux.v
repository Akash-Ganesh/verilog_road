module mux #(
		parameter N_SLAVES = 4,
		parameter DATA_WIDTH = 8
	)
	(
		input [DATA_WIDTH*N_SLAVES-1:0] data,
		input [$clog2(N_SLAVES)-1:0] sel,
		output reg [DATA_WIDTH-1:0] op 
	);
	integer j;
	always @(*) begin
		op = 0;
		for (j = 0; j<N_SLAVES; j = j+1) begin
			if (sel == j)
				op = data[DATA_WIDTH*j +: DATA_WIDTH];
		end
	end

endmodule
