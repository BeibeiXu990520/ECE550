// a rca with an overflow output
module rca_16(operand0, operand1, cin, sum, cout, overflow);
	
	input [15:0] operand0, operand1;
	input cin;
	output [15:0] sum;
	output cout, overflow;
	
	wire [15:1] cBetween;
	
	genvar i;
	
	// full adder of least significant bit
	full_adder fa0(operand0[0], operand1[0], cin, sum[0], cBetween[1]);	
	
	
	// full adder of intermidiate 14 bits
	generate 
		for (i = 1; i < 15; i = i + 1) begin : generateFAs4RCA
			// connect all the full_adders here
			full_adder fa(operand0[i], operand1[i], cBetween[i], sum[i], cBetween[i+1]);
		end	
	endgenerate
	
	// full adder of last bit
	full_adder fa15(operand0[15], operand1[15], cBetween[15], sum[15], cout);
	
	// overflow : CI != CO of the last bit
	xor xor_overflow(overflow, cBetween[15], cout);
	
endmodule