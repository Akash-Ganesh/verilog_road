module ram #(
		parameter BIT_DEPTH = 4,
		parameter BIT_SIZE = 16
	)
	(
		input clk,
		input [$clog2(BIT_SIZE/BIT_DEPTH) - 1 : 0] addr,
		input wen,
		input [BIT_DEPTH-1:0] data_in,
		output reg [BIT_DEPTH-1:0] data_out
	);

	reg [BIT_DEPTH-1:0] mem [(BIT_SIZE/BIT_DEPTH)-1:0];

	always @(posedge clk) begin
		if(wen==0)
			data_out <= mem[addr];
		else
			mem[addr] <= data_in;
	end
endmodule
