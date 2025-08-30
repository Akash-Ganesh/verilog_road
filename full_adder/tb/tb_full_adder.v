`timescale 1ns/1ps

module tb();
	reg a;
	reg b;
	reg c_in;
	wire sum;
	wire c_out;

	full_adder dut (
		.a(a),
		.b(b),
		.c_in(c_in),
		.sum(sum),
		.c_out(c_out)
	);

	integer i;
	initial begin
		$dumpfile("sim/full_adder.vcd");
		$dumpvars(0);
		for (i = 0; i<8; i = i+1) begin 
			a = i[0];
			b = i[1];
			c_in = i[2];
			#10;
		end
		$finish;
	end
endmodule
