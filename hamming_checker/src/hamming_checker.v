module hamming_checker #(
		parameter P_BITS = 2,
		parameter IP_WIDTH = (1<<P_BITS) - 1,
		parameter OP_WIDTH = (1<<P_BITS) - P_BITS - 1
	)
	(
		input [IP_WIDTH:0] ip,
		output reg [OP_WIDTH-1:0] data,
		output reg [P_BITS:0] par
	);

	integer i;
	integer j;

	reg [IP_WIDTH:0] buffer;

	always @(*) begin

		for (i=1; i<=P_BITS; i=i+1) begin
			par[i] = 0;
			for (j=1; j<=IP_WIDTH; j=j+1) begin
				if ( ((1<<(i-1))&j) != 0)
					par[i] = par[i] ^ ip[j];
			end
		end
		
		par[0] = 0;
		for (i=0; i<=IP_WIDTH; i=i+1) begin
			par[0] = par[0] ^ ip[i];
		end

		for (i=0; i<(1<<(P_BITS)); i=i+1) begin
			if (i==(par>>1))
				buffer[i] = ~(ip[i]);
			else
				buffer[i] = ip[i];
		end

		j=3;
		for (i=3; i<=IP_WIDTH; i=i+1) begin
			if ( 1<<$clog2(i) == i )
				j = j+1;
			else 
				data[i-j] = buffer[i];
		end

	end

endmodule
