module counter #(
		parameter N_WIDTH = 4,
		parameter UPbarDOWN = 0,
		parameter MOD = (1<<N_WIDTH)
	)
	(
		input incr,
		input clk,
		input reset,
		output reg [N_WIDTH-1:0] y
	);
	always @(posedge clk or posedge reset) begin
		if (reset==1)
			y <= 0;
		else begin
			if (UPbarDOWN == 0)
				y <= (y+1)%MOD;
			else begin
				if (y==0)
					y <= MOD-1;
				else 
					y <= y-1;
			end
		end
	end
endmodule
