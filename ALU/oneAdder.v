module oneAdder(in, bit, out, overflow);
	input [31:0] in;
	input bit;
	output [31:0] out;
	output overflow;
	
	wire [31:1] cs;
	wire cout;

	// get two's complement
	half_adder hf0(in[0], bit, out[0], cs[1]);
	
	genvar i;
	
	generate
		for (i = 1; i < 31; i = i + 1) begin : twosComplementTransformer
			half_adder hf(in[i], cs[i], out[i], cs[i+1]);
		end		
	endgenerate
		
	half_adder hf31(in[31], cs[31], out[31], cout);
	
	xor xorOverflow(overflow, cout, cs[31]);

endmodule