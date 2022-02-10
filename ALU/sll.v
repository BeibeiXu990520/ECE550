module sll(input [31:0] in,
			  input [4:0] amt,			  
			  output [31:0] out);

	wire [31:0] layers [0:3];
	
	genvar i;	
	
	// 1-bit SLL, the least significant bit
	mux1_1 mux11(in[0], 0, amt[0], layers[0][0]);
	generate 
		for (i = 1; i < 32; i = i + 1) begin: sllLayer0
			mux1_1 mux12(in[i], in[i-1], amt[0], layers[0][i]);
		end
	endgenerate
	
	// 2nd bit SLL
	mux1_1 mux21(layers[0][0], 0, amt[1], layers[1][0]);
	mux1_1 mux22(layers[0][1], 0, amt[1], layers[1][1]);
	generate
		for (i = 2; i < 32; i = i + 1) begin: sllLayer1
			mux1_1 mux23(layers[0][i], layers[0][i-2], amt[1], layers[1][i]);
		end
	endgenerate
	
	// 3rd bit SLL
	generate
		for (i = 0; i < 4; i = i + 1) begin: sllLayer2Low4bit
			mux1_1 mux31(layers[1][i], 0, amt[2], layers[2][i]);
		end
	endgenerate
	generate 
		for (i = 4; i < 32; i = i + 1) begin: sllLayer2High28bit
			mux1_1 mux32(layers[1][i], layers[1][i-4], amt[2], layers[2][i]);
		end
	endgenerate
	
	// 4rd bit SLL
	generate
		for (i = 0; i < 8; i = i + 1) begin: sllLayer3Low8bit
			mux1_1 mux41(layers[2][i], 0, amt[3], layers[3][i]);
		end
	endgenerate
	generate 
		for (i = 8; i < 32; i = i + 1) begin: sllLayer3High24bit
			mux1_1 mux42(layers[2][i], layers[2][i-8], amt[3], layers[3][i]);
		end
	endgenerate
	
	// 5th bit SLL
	generate
		for (i = 0; i < 16; i = i + 1) begin: sllLayer4Low16bit
			mux1_1 mux51(layers[3][i], 0, amt[4], out[i]);
		end
	endgenerate
	generate 
		for (i = 16; i < 32; i = i + 1) begin: sllLayer4High16bit
			mux1_1 mux52(layers[3][i], layers[3][i-16], amt[4], out[i]);
		end
	endgenerate
			  
endmodule