module mux1_8(data0, data1, sel, out);

	// a mux of 1 bit in selector, 16 bit in data

	input [7:0] data0, data1;
	input sel;
	output [7:0] out;
	
	assign out = sel ? data1 : data0;
	
endmodule