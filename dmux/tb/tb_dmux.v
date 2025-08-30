`timescale 1ns/1ps

module tb #(
	parameter N_MASTERS = 4,
	parameter DATA_WIDTH = 4
	) ();

	reg [$clog2(N_MASTERS)-1:0] sel;
	reg [DATA_WIDTH-1:0] data;
	wire [DATA_WIDTH*N_MASTERS-1:0] op;

	dmux #( 
		.N_MASTERS(N_MASTERS),
		.DATA_WIDTH(DATA_WIDTH)
	) dut (
		.data(data),
		.sel(sel),
		.op(op)
	);

	integer i;

	initial begin
		$dumpfile("sim/dmux.vcd");
		$dumpvars(0);
		for (i=0; i<N_MASTERS; i = i+1) begin
			sel = i[$clog2(N_MASTERS)-1:0];
			data = $random;
			#10;
		end
		$finish;
	end
endmodule
