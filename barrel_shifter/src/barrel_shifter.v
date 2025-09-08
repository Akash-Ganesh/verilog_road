module barrel_shifter #(
		parameter DATA_WIDTH = 8
	)
	(
		input RbarL,
		input [$clog2(DATA_WIDTH)-1:0] shift,
		input [DATA_WIDTH-1:0] data_in,
		output reg [DATA_WIDTH-1:0] data_out
	);
	always @(*) begin
		if (RbarL==0)
			data_out = data_in>>shift;
		else
			data_out = data_in<<shift;
	end
endmodule
