module hamming_generator #(
		parameter P_BITS = 2,
		parameter OP_WIDTH = (1<<P_BITS) - 1,
		parameter IP_WIDTH = (1<<P_BITS) - P_BITS - 1
	)
	(
		input [IP_WIDTH-1:0] data,
		output reg [OP_WIDTH:0] op
	);
	integer i;
	integer j;

	initial begin
		j=3;
		for (i=3; i<=OP_WIDTH; i=i+1) begin
			op[i] = data[i-j];
			if ( 1<<$clog2(i) == i )
				j = j+1;
		end
	end

	always @(*) begin
		j=3;
		for (i=3; i<=OP_WIDTH; i=i+1) begin
			op[i] = data[i-j];
			if ( 1<<$clog2(i) == i )
				j = j+1;
		end

		for (i=1; i<=P_BITS; i=i+1) begin
			op[1<<(i-1)] = 0;
			for (j=1; j<=OP_WIDTH; j=j+1) begin
				if ( ((1<<(i-1))&j) != 0)
					op[1<<(i-1)] = op[1<<(i-1)] ^ op[j];
			end
		end
		
		op[0] = 0;
		for (i=1; i<=OP_WIDTH; i=i+1) begin
			op[0] = op[0] ^ op[i];
		end

	end

endmodule
