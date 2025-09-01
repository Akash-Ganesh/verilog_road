`timescale 1ns/1ps

module tb #(
	parameter IP_WIDTH = 4
	) ();

	localparam OP_WIDTH = 1<<IP_WIDTH;

	reg en;
	reg [IP_WIDTH-1:0] a;
	wire [OP_WIDTH-1:0] op;

	decoder #(
		.IP_WIDTH(IP_WIDTH)
	) dut (
		.en(en),
		.a(a),
		.op(op)
	);

	integer j;

	initial begin
		$dumpfile("sim/decoder.vcd");
		$dumpvars(0);
		en = 0;
		for (j=0; j<OP_WIDTH; j = j+1) begin
			a = j;
			#10;
		end
		en = 1;
		for (j=0; j<OP_WIDTH; j = j+1) begin
			a = j;
			#10;
		end
		$finish;
	end
endmodule
