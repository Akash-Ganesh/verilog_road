`timescale 1ns/1ps

module tb #(
	parameter N = 4,
	parameter S = 1
	) ();
	reg [N-1:0] a;
	reg [N-1:0] b;
	wire gt;
	wire lt;
	wire eq;

	comparator #(
		.N(N),
		.SIGNED(S)
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
		for (i=-(1<<(N-1)); i<(1<<(N-1)); i = i+1) begin
			for (j=-(1<<(N-1)); j<(1<<(N-1)); j = j+1) begin
				a = i;
				b = j;
				#10;
			end
		end
		$finish;
	end
endmodule
