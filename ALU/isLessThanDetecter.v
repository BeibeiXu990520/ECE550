module isLessThanDetecter(input overflow,
								  input coutLastBit,
								  input signBit,
								  output out);
								  
	assign out = overflow ? coutLastBit : signBit;

endmodule