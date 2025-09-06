module tb();
	localparam P_BITS = 3;
	localparam IP_WIDTH = (1<<P_BITS) - 1;
	localparam OP_WIDTH = (1<<P_BITS) - P_BITS - 1;

	reg [IP_WIDTH:0] ip;
	wire [OP_WIDTH-1:0] data;
	wire [P_BITS:0] par;

	hamming_checker #(
		.P_BITS(P_BITS)
	) dut (
		.ip(ip),
		.data(data),
		.par(par)
	);

	integer i;
	initial begin
		$dumpfile("sim/hamming_checker.vcd");
		$dumpvars(0);
		for (i=0; i<(1<<IP_WIDTH+1); i=i+1) begin
			ip = i;
			#10;
		end
		$finish;
	end
endmodule
