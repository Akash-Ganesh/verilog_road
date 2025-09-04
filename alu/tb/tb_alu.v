module tb #(
		parameter N_WIDTH = 4
	)();
	reg [N_WIDTH-1:0] a;
	reg [N_WIDTH-1:0] b;
	reg c_in;
	reg [2:0] sel;
	wire [N_WIDTH-1:0] y;
	wire c_out;
	
	alu #(
		.N_WIDTH(N_WIDTH)
	) dut (
		.a(a),
		.b(b),
		.c_in(c_in),
		.sel(sel),
		.y(y),
		.c_out(c_out)
	);

	integer i;
	integer j;
	integer k;
	initial begin
		$dumpfile("sim/alu.vcd");
		$dumpvars(0);
		c_in = 0;
		for(i=0; i<(1<<N_WIDTH); i=i+1) begin
			for(j=0; j<(1<<N_WIDTH); j=j+1) begin
				for(k=0; k<8; k=k+1) begin
					a = i;
					b = j;
					sel = k;
					#10;
				end
			end
		end
		c_in = 1;
		for(i=0; i<(1<<N_WIDTH); i=i+1) begin
			for(j=0; j<(1<<N_WIDTH); j=j+1) begin
				for(k=0; k<8; k=k+1) begin
					a = i;
					b = j;
					sel = k;
					#10;
				end
			end
		end
		$finish;
	end
endmodule
