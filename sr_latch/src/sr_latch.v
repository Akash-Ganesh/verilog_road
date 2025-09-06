module sr_latch(
	input s,
	input r,
	input en,
	output reg q,
	output reg qbar
	);
	always @(*) begin
		if (en) begin
			case({s,r})
				2'b00 : begin
					q = 1'bx;
					qbar = 1'bx;
				end
				2'b10 : begin
					q = 1'b1;
					qbar = 1'b0;
				end
				2'b01 : begin
					q = 1'b0;
					qbar = 1'b1;
				end
				2'b11 : begin
					q = q;
					qbar = qbar;
				end
			endcase
		end
		else begin
			q = q;
			qbar = qbar;
		end
	end
endmodule
