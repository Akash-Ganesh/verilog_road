module decoder #(
		parameter IP_WIDTH = 2
	)
	(
		input en,
		input [IP_WIDTH-1:0] a,
		output reg [(1<<IP_WIDTH)-1:0] op
	);
	localparam OP_WIDTH = 1<<IP_WIDTH;

	integer i;
	always @(*) begin
		if (en)
			op = 0;
		else
			for (i=0; i<OP_WIDTH; i = i+1) begin 
				if (i==a)
					op[i] = 1'b1;
				else 
					op[i] = 1'b0;
			end
	end
endmodule
