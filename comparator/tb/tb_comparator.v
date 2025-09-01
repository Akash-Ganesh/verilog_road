`timescale 1ns/1ps

module tb #(
	parameter N_WIDTH = 4,
	parameter SIGNED = 1
	) ();
	reg [N_WIDTH-1:0] a;
	reg [N_WIDTH-1:0] b;
	wire gt;
	wire lt;
	wire eq;

	comparator #(
		.N_WIDTH(N_WIDTH),
		.SIGNED(SIGNED)
	) dut (
		.a(a),
		.b(b),
		.gt(gt),
		.lt(lt),
		.eq(eq)
	);

	integer i;
	integer j;

	initial begin
		$dumpfile("sim/comparator.vcd");
		$dumpvars(0);
		for (i=-(1<<(N_WIDTH-1)); i<(1<<(N_WIDTH-1)); i = i+1) begin
			for (j=-(1<<(N_WIDTH-1)); j<(1<<(N_WIDTH-1)); j = j+1) begin
				a = i;
				b = j;
				#10;
			end
		end
		$finish;
	end
endmodule
