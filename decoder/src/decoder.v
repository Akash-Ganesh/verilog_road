module decoder #(
		parameter N = 2
	)
	(
		input en,
		input [N-1:0] a,
		output reg [(1<<N)-1:0] op
	);
	localparam OP_SIZE = 1<<N;

	integer i;
	always @(*) begin
		if (en)
			op = 0;
		else
		for (i=0; i<OP_SIZE; i = i+1) begin 
			if (i==a)
				op[i] = 1'b1;
			else 
				op[i] = 1'b0;
		end
	end
endmodule
