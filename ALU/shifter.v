module shifter(input [31:0] in,
					input [4:0] amt,
					input type,	// 0 for SLL, 1 for SRA
					output [31:0] out);
					
	wire [31:0] sllOut, sraOut;
	
	sll sllInShifter(in, amt, sllOut);
	sra sraInShifter(in, amt, sraOut);
	
	mux1_32 muxInShifter(sllOut, sraOut, type, out);
	
					
endmodule