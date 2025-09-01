module tb #(
	parameter N_WIDTH = 4
	)();
	reg [N_WIDTH-1:0] a;
	reg [N_WIDTH-1:0] b;
	reg c_in;
	wire [N_WIDTH-1:0] sum;
	wire c_out;

	ripple_adder #(
		.N_WIDTH(N_WIDTH)
	) dut (
		.a(a),
		.b(b),
		.c_in(c_in),
		.sum(sum),
		.c_out(c_out)
	);

	integer j;
	integer k;

	initial begin
		$dumpfile("sim/ripple_adder.vcd");
		$dumpvars(0);
		c_in = 0;
		for(j=0; j<(1<<N_WIDTH); j=j+1) begin
			for(k=0; k<(1<<N_WIDTH); k=k+1) begin
				a = j;
				b = k;
				#10;
			end
		end
		c_in = 1;
		for(j=0; j<(1<<N_WIDTH); j=j+1) begin
			for(k=0; k<(1<<N_WIDTH); k=k+1) begin
				a = j;
				b = k;
				#10;
			end
		end
		$finish;
	end
endmodule
