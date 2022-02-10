module triStateBuffer(input [31:0] d,
							 input e,
							 inout [31:0] out);	
	
	assign out = e ? d : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
							 
//	genvar i;
//	
//	generate 
//		for (i = 0; i < 32; i = i + 1) begin : triStateGenerate
//			bufif1 b1(out[i], d[i], e);
//		end
//	endgenerate	
							 
endmodule