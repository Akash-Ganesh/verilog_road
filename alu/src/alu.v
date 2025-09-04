module alu #(
		parameter N_WIDTH = 4
	)
	(
		input [N_WIDTH-1:0] a,
		input [N_WIDTH-1:0] b,
		input c_in,
		input [2:0] sel,
		output reg [N_WIDTH-1:0] y,
		output reg c_out
	);
	parameter [N_WIDTH-1:0] mask = ~(0);

	always @(*) begin
		case(sel)
			3'b000 : begin
				{c_out,y} = (~a)&(mask) + c_in;
			end
			3'b001 : begin
				y = a|b;
				c_out = 0;
			end
			3'b010 : begin
				y = a&b;
				c_out = 0;
			end
			3'b011 : begin
				y = a^b;
				c_out = 0;
			end
			3'b100 : begin
				{c_out, y} = a+b+c_in;
			end
			3'b101 : begin
				{c_out, y} = a + ~b + c_in;
			end
			3'b110 : begin
				y = {c_in,a[N_WIDTH-1:1]};
				c_out = a[0];
			end
			3'b111 : begin
				y = {a[N_WIDTH-2:0],c_in};
				c_out = a[N_WIDTH-1];
			end
			default : begin
				y = 0;
				c_out = 0;
			end
		endcase
	end
endmodule
