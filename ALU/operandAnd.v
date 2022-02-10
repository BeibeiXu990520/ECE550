module operandAnd(in1,in2,out);
 
	input [31:0] in1;
	input [31:0] in2;
	output [31:0] out;
	
	genvar i;
	
	generate
		for(i = 0 ; i < 32 ; i = i + 1) begin : And
			and and_gate(out[i],in1[i],in2[i]);
		end
	endgenerate
	
endmodule