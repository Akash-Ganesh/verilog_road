module comparator #(
		parameter N_WIDTH = 4,
		parameter SIGNED = 0
	)
	(
		input [N_WIDTH-1:0] a,
		input [N_WIDTH-1:0] b,
		output reg gt,
		output reg lt,
		output reg eq
	);
	always @(*) begin
		if (SIGNED) begin
			if ( a[N_WIDTH-1] ^ b[N_WIDTH-1] ) begin
				if(a[N_WIDTH-1]) begin
					gt = 1'b0;
					lt = 1'b1;
					eq = 1'b0;
				end
				else begin
					gt = 1'b1;
					lt = 1'b0;
					eq = 1'b0;
				end
			end
			else begin
				gt = (a>b) ? 1'b1 : 1'b0;
				lt = (a<b) ? 1'b1 : 1'b0;
				eq = (a==b) ? 1'b1 : 1'b0;
			end
		end
		else begin
			gt = (a>b) ? 1'b1 : 1'b0;
			lt = (a<b) ? 1'b1 : 1'b0;
			eq = (a==b) ? 1'b1 : 1'b0;
		end
	end
endmodule
