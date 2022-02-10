// ** There is no cout in the adder, only overflow.
// This adder is to judge add/sum, transform operand1 to 2's complement if necessary, 
// use csa to do calculation and output overflow
module adder(in0, in1, operator, sum, cout, overflow);	
	
	input [31:0] in0, in1;
	
	// operator input, 0 for add, 1 for sub
	input operator;
	
	output [31:0] sum;
	output cout, overflow;
	
	wire [31:0] operand0, operand1;	
	
	buf_32 passIn0(in0, operand0);
	operandAddorSub toOperand1(in1, operator, operand1);	
	
	// calculate, a + b or a + b's 1's complement
	csa_32 csa32bits(operand0, operand1, operator, sum, cout, overflow);	
	
endmodule
	
	