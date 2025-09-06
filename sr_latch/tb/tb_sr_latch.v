module tb();

	reg d;
	wire dbar;
	reg en;
	wire q;
	wire qbar;

	not n1 (dbar,d);

	sr_latch dut (
		.s(d),
		.r(dbar),
		.en(en),
		.q(q),
		.qbar(qbar)
	);
	integer i;
	initial begin
		$dumpfile("sim/sr_latch.vcd");
		$dumpvars(0);
		en = 1'b0;
		for(i=0; i<2; i=i+1) begin
			d = i;
			#10;
		end
		en = 1'b1;
		for(i=0; i<2; i=i+1) begin
			d = i;
			#10;
		end
		en = 1'b0;
		for(i=0; i<2; i=i+1) begin
			d = i;
			#10;
		end
		en = 1'b1;
		for(i=0; i<2; i=i+1) begin
			d = i;
			#10;
		end
		$finish;
	end
endmodule
