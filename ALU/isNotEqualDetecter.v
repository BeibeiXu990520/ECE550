module isNotEqualDetecter(input overflow,
								input [31:0] subOut,
								output out);
	
	wire outIsNotZero;
	
//	not not0(notOverflow, overflow);
	
	assign outIsNotZero = subOut ? 1 : 0;
	
	or or0(out, overflow, outIsNotZero);

endmodule