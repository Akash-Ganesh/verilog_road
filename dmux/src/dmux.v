module dmux #(
		parameter N_MASTERS = 4,
		parameter DATA_WIDTH = 8
	)
	(
		input [DATA_WIDTH-1:0] data,
		input [$clog2(N_MASTERS)-1:0] sel,
		output reg [DATA_WIDTH*N_MASTERS-1:0] op 
	);
	integer j;
	always @(*) begin
		op = 0;
		for (j = 0; j<N_MASTERS; j = j+1) begin
			if (sel == j)
				op[DATA_WIDTH*j +: DATA_WIDTH] = data;
		end
	end
endmodule
