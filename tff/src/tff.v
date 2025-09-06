module tff(
	input clk,
	input t,
	input clear,
	output reg q,
	output reg qbar
	);
	always @(posedge clk or posedge clear) begin
		if (clear==1) begin
			q <= 0;
			qbar <= 1;
		end
		else begin
			q <= t^q;
			qbar <= !(t^q);
		end
	end
endmodule
