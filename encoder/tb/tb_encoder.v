`timescale 1ns/1ps

module tb #(
	parameter IP_WIDTH = 4,
	parameter PRIORITY_ENCODER = 0
	) ();
	localparam OP_SIZE = $clog2(IP_WIDTH);

	reg en;
	reg [IP_WIDTH-1:0] a;
	wire [OP_SIZE-1:0] op;

	encoder #(
		.IP_WIDTH(IP_WIDTH),
		.PRIORITY_ENCODER(PRIORITY_ENCODER)
	) dut (
		.en(en),
		.a(a),
		.op(op)
	);

	integer j;

	initial begin
		$dumpfile("sim/encoder.vcd");
		$dumpvars(0);
		en = 0;
		for (j=0; j<IP_WIDTH; j = j+1) begin
			a = 0;
			a[j] = 1'b1;
			#10;
		end
		en = 1;
		for (j=0; j<IP_WIDTH; j = j+1) begin
			a = 0;
			a[j] = 1'b1;
			#10;
		end
		en = 0;
		for (j=0; j<(1<<IP_WIDTH); j = j+1) begin
			a = j;
			#10;
		end
		$finish;
	end
endmodule
