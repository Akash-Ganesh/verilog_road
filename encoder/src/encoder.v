module encoder #(
		parameter N = 4,
		parameter PRIORITY_ENCODER = 0
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
		else begin
			op = 0;
			for (i=N-1; i>=0; i = i-1) begin
				if (a[i]) begin
					if (PRIORITY_ENCODER) begin
						op = i;
					end
					else
						op = op | i;
				end
			end
		end
	end
endmodule
