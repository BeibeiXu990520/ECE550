// a rca with an overflow output
module rca_4(operand0, operand1, cin, sum, cout, overflow);
	
	input [3:0] operand0, operand1;
	input cin;
	output [3:0] sum;
	output cout, overflow;
	
	wire [3:1] cBetween;
	
	genvar i;
	
	// full adder of least significant bit
	full_adder fa0(operand0[0], operand1[0], cin, sum[0], cBetween[1]);	
	
	
	// full adder of intermidiate 14 bits
	generate 
		for (i = 1; i < 3; i = i + 1) begin : generateFAs4RCA
			// connect all the full_adders here
			full_adder fa(operand0[i], operand1[i], cBetween[i], sum[i], cBetween[i+1]);
		end	
	endgenerate
	
	// full adder of last bit
	full_adder fa3(operand0[3], operand1[3], cBetween[3], sum[3], cout);
	
	// overflow : CI != CO of the last bit
	xor xor_overflow(overflow, cBetween[3], cout);
	
endmodule