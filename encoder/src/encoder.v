module encoder #(
		parameter N = 2
	)
	(
		input en,
		input [N-1:0] a,
		output reg [$clog2(N)-1:0] op
	);
	integer i;
	always @(*) begin 
		if (en)
			op = 0;
		else 
			for (i=0; i<N; i = i+1) begin
				if (a[i])
					op = i;
			end
	end
endmodule
