module sra(input [31:0] in,
			  input [4:0] amt,			  
			  output [31:0] out);
			  
	wire sign;
	wire [31:0] layers [0:3];
	
	// take sign bit out
	buf signBuf (sign, in[31]);
	
	
	genvar i;	
	
	// 1-bit SRA, the least significant bit
	mux1_1 mux11(in[31], sign, amt[0], layers[0][31]);
	generate 
		for (i = 30; i >= 0; i = i - 1) begin: sraLayer0
			mux1_1 mux12(in[i], in[i+1], amt[0], layers[0][i]);
		end
	endgenerate
	
	// 2nd bit SLL
	mux1_1 mux21(layers[0][31], sign, amt[1], layers[1][31]);
	mux1_1 mux22(layers[0][30], sign, amt[1], layers[1][30]);
	generate
		for (i = 29; i >= 0; i = i - 1) begin: sraLayer1
			mux1_1 mux23(layers[0][i], layers[0][i+2], amt[1], layers[1][i]);
		end
	endgenerate
	
	// 3rd bit SLL
	generate
		for (i = 31; i >= 28; i = i - 1) begin: sraLayer2High4bit
			mux1_1 mux31(layers[1][i], sign, amt[2], layers[2][i]);
		end
	endgenerate
	generate 
		for (i = 27; i >= 0; i = i - 1) begin: sraLayer2Low28bit
			mux1_1 mux32(layers[1][i], layers[1][i+4], amt[2], layers[2][i]);
		end
	endgenerate
	
	// 4rd bit SLL
	generate
		for (i = 31; i >= 24; i = i - 1) begin: sraLayer3High8bit
			mux1_1 mux41(layers[2][i], sign, amt[3], layers[3][i]);
		end
	endgenerate
	generate 
		for (i = 23; i >= 0; i = i - 1) begin: sraLayer3Low24bit
			mux1_1 mux42(layers[2][i], layers[2][i+8], amt[3], layers[3][i]);
		end
	endgenerate
	
	// 5th bit SLL
	generate
		for (i = 31; i >= 16; i = i - 1) begin: sraLayer4High16bit
			mux1_1 mux51(layers[3][i], sign, amt[4], out[i]);
		end
	endgenerate
	generate 
		for (i = 15; i >= 0; i = i - 1) begin: sraLayer4Low16bit
			mux1_1 mux52(layers[3][i], layers[3][i+16], amt[4], out[i]);
		end
	endgenerate

endmodule