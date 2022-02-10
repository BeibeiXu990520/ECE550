module decoder5to32(input [4:0] in,
						  output [31:0] out);
	
	/*
	say no to syntax suger
	genvar i;	
	generate
		for (i = 0; i < 32; i = i + 1) begin : decoderGenerate		
			assign out[i] = (in == i) ? 1 : 0;
		end
	endgenerate
	*/
	
	
	wire [4:0] notIn;
	
	genvar i;
	generate
		for (i = 0; i < 5; i = i + 1) begin : decoderGenerate		
			not notIns(notIn[i], in[i]);
		end
	endgenerate
	
	// out0 ~ out7
	and and50(out[0], notIn[4], notIn[3], notIn[2], notIn[1], notIn[0]);
	and and51(out[1], notIn[4], notIn[3], notIn[2], notIn[1], in[0]);
	and and52(out[2], notIn[4], notIn[3], notIn[2], in[1], notIn[0]);
	and and53(out[3], notIn[4], notIn[3], notIn[2], in[1], in[0]);
	and and54(out[4], notIn[4], notIn[3], in[2], notIn[1], notIn[0]);
	and and55(out[5], notIn[4], notIn[3], in[2], notIn[1], in[0]);
	and and56(out[6], notIn[4], notIn[3], in[2], in[1], notIn[0]);
	and and57(out[7], notIn[4], notIn[3], in[2], in[1], in[0]);
	
	
	// out8 ~ out15
	and and58(out[8], notIn[4], in[3], notIn[2], notIn[1], notIn[0]);
	and and59(out[9], notIn[4], in[3], notIn[2], notIn[1], in[0]);
	and and5a(out[10], notIn[4], in[3], notIn[2], in[1], notIn[0]);
	and and5b(out[11], notIn[4], in[3], notIn[2], in[1], in[0]);
	and and5c(out[12], notIn[4], in[3], in[2], notIn[1], notIn[0]);
	and and5d(out[13], notIn[4], in[3], in[2], notIn[1], in[0]);
	and and5e(out[14], notIn[4], in[3], in[2], in[1], notIn[0]);
	and and5f(out[15], notIn[4], in[3], in[2], in[1], in[0]);
	
	// out16 ~ out23
	and and5g(out[16], in[4], notIn[3], notIn[2], notIn[1], notIn[0]);
	and and5h(out[17], in[4], notIn[3], notIn[2], notIn[1], in[0]);
	and and5i(out[18], in[4], notIn[3], notIn[2], in[1], notIn[0]);
	and and5j(out[19], in[4], notIn[3], notIn[2], in[1], in[0]);
	and and5k(out[20], in[4], notIn[3], in[2], notIn[1], notIn[0]);
	and and5l(out[21], in[4], notIn[3], in[2], notIn[1], in[0]);
	and and5m(out[22], in[4], notIn[3], in[2], in[1], notIn[0]);
	and and5n(out[23], in[4], notIn[3], in[2], in[1], in[0]);
	
	// out24 ~ out31
	and and5o(out[24], in[4], in[3], notIn[2], notIn[1], notIn[0]);
	and and5p(out[25], in[4], in[3], notIn[2], notIn[1], in[0]);
	and and5q(out[26], in[4], in[3], notIn[2], in[1], notIn[0]);
	and and5r(out[27], in[4], in[3], notIn[2], in[1], in[0]);
	and and5s(out[28], in[4], in[3], in[2], notIn[1], notIn[0]);
	and and5t(out[29], in[4], in[3], in[2], notIn[1], in[0]);
	and and5u(out[30], in[4], in[3], in[2], in[1], notIn[0]);
	and and5v(out[31], in[4], in[3], in[2], in[1], in[0]);
	
	
endmodule
