module rom #(
		parameter BIT_DEPTH = 4,
		parameter BIT_SIZE = 16
	)
	(
		input clk,
		input [$clog2(BIT_SIZE/BIT_DEPTH) - 1 : 0] addr,
		output reg [BIT_DEPTH-1:0] data_out
	);

	reg [BIT_DEPTH-1:0] mem [(BIT_SIZE/BIT_DEPTH)-1:0];

	integer i;
	initial begin
		for (i=0; i<BIT_SIZE/BIT_DEPTH; i=i+1)
			mem[i] = $random;
	end

	always @(posedge clk)
		data_out <= mem[addr];
endmodule
