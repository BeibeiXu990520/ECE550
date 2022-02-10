module operandAddorSub(in, operator, out);
	
	input [31:0] in;
	input operator;
	output [31:0] out;
	
	wire [31:0] notIn;

	genvar i;
	
	generate
		for (i = 0; i < 32; i = i + 1) begin : operandTransform
			not (notIn[i], in[i]);
			assign out[i] = operator ? notIn[i] : in[i];
		end
	endgenerate

endmodule