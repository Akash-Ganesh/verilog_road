module fifo #(
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
		output reg half,
		output reg empty,
		output reg [DATA_WIDTH-1:0] data_out
	);

	reg [DATA_WIDTH-1:0] mem [BUFFER_NO-1:0];
	reg [$clog2(BUFFER_NO)-1:0] rd_ptr;
	reg [$clog2(BUFFER_NO)-1:0] wr_ptr;

	always @(posedge clk or posedge reset) begin
		if (reset==1) begin
			rd_ptr = 1'b0;
			wr_ptr = 1'b0;
			full = 1'b0;
			half = 1'b0;
			empty = 1'b1;
		end 
		else begin
			if (ren==1 && !empty) begin
				data_out = mem[rd_ptr];
				rd_ptr = rd_ptr + 1;
				if (rd_ptr==wr_ptr) begin
					full = 1'b0;
					half = 1'b0;
					empty = 1'b1;
				end else if ((rd_ptr+(BUFFER_NO>>1)) > wr_ptr) begin
					full = 1'b0;
					half = 1'b0;
					empty = 1'b0;
				end
			end
			if (wen==1 && !full) begin
				mem[wr_ptr] = data_in;
				wr_ptr = wr_ptr + 1;
				if (wr_ptr==rd_ptr) begin
					full = 1'b1;
					half = 1'b0;
					empty = 1'b0;
				end else if ((rd_ptr+(BUFFER_NO>>1)) <= wr_ptr) begin
					full = 1'b0;
					half = 1'b1;
					empty = 1'b0;
				end else begin
					full = 1'b0;
					half = 1'b0;
					empty = 1'b0;
				end
			end
		end
	end
endmodule
