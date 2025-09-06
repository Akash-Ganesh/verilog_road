module dff(
	input clk,
	input d,
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
			q <= d;
			qbar <= !d;
		end
	end
endmodule
