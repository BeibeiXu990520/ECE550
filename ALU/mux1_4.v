module mux1_4(data0, data1, sel, out);

	// a mux of 1 bit in selector, 16 bit in data

	input [3:0] data0, data1;
	input sel;
	output [3:0] out;
	
	assign out = sel ? data1 : data0;
	
endmodule