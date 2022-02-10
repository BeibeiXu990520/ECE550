// a bit buffer, same as buf
module buf_32(in, out);

	input [31:0] in;
	output [31:0] out;
	
	genvar i;
	
	generate
		for (i = 0; i < 32; i = i + 1) begin: bufProcess
			buf buf0(out[i], in[i]);
		end
	endgenerate
	
endmodule