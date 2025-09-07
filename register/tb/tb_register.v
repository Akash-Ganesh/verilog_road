module tb();

	localparam N_WIDTH = 4;
	reg [N_WIDTH-1:0] data_in;
	reg clear;
	reg [1:0] sel;
	reg clk;
	reg serr;
	reg serl;
	wire [N_WIDTH-1:0] data_out;

	register #(
		.N_WIDTH(N_WIDTH)
	) dut (
		.data_in(data_in),
		.clear(clear),
		.sel(sel),
		.clk(clk),
		.serr(data_out[0]),
		.serl(data_out[N_WIDTH-1]),
		.data_out(data_out)
	);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end

	initial begin
		$dumpfile("sim/register.vcd");
		$dumpvars(0);
		clear = 1'b0;
		serr = 1'b0;
		serl = 1'b0;
		data_in = 4'b1010;
		sel = 2'b00;
		#20
		sel = 2'b01;
		#80
		$finish;
	end
endmodule
