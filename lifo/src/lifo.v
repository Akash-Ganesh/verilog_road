module lifo #(
		parameter DATA_WIDTH = 8,
		parameter BUFFER_NO = 2
	)
	(
		input clk,
		input wen,
		input ren,
		input reset,
		input [DATA_WIDTH-1:0] data_in,
		output reg full,
		output reg empty,
		output reg [DATA_WIDTH-1:0] data_out
	);

	reg [DATA_WIDTH-1:0] mem [BUFFER_NO-1:0];
	reg [$clog2(BUFFER_NO)-1:0] ptr;

	always @(posedge clk or posedge reset) begin
		if (reset==1) begin
			ptr = 1'b0;
			full = 1'b0;
			empty = 1'b1;
		end 
		else begin
			if (ren==1 && !empty) begin
				ptr = ptr - 1;
				data_out = mem[ptr];
				if (ptr==0) begin
					full = 1'b0;
					empty = 1'b1;
				end else begin
					full = 1'b0;
					empty = 1'b0;
				end
			end
			if (wen==1 && !full) begin
				mem[ptr] = data_in;
				ptr = ptr + 1;
				if (ptr==0) begin
					full = 1'b1;
					empty = 1'b0;
				end else begin
					full = 1'b0;
					empty = 1'b0;
				end
			end
		end
	end
endmodule
