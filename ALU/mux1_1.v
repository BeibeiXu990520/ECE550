module mux1_1(data0, data1, sel, out);

	// a mux of 1 bit in selector, 1 bit in data
	
	input data0, data1, sel;
	output out;
	
	assign out = sel ? data1 : data0;
endmodule