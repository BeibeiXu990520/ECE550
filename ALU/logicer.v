module logicer(input [31:0] in0,
					input [31:0] in1,
					input type,
					output [31:0] out);
					
	wire [31:0] andOut, orOut;

	operandAnd andInLogic(in0, in1, andOut);
	operandOr orInLogic(in0, in1, orOut);
	
	mux1_32 muxInLogic(andOut, orOut, type, out);
					
endmodule