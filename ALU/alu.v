module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	wire [31:0] addResult, shiftResult, logicResult;
	
	wire [31:0] logicArithmeticResult, shiftNullResult;
	
	wire coutLastBit;

   // YOUR CODE HERE //
	
	// use an adder to realize project 1
	adder adder(data_operandA, data_operandB, ctrl_ALUopcode[0], addResult, coutLastBit, overflow);
	
	shifter shifter(data_operandA, ctrl_shiftamt, ctrl_ALUopcode[0], shiftResult);
	
	logicer logicer(data_operandA, data_operandB, ctrl_ALUopcode[0], logicResult);
	
	isNotEqualDetecter isNotEqualDetecter(overflow, data_result, isNotEqual);
	isLessThanDetecter isLessThanDetecter(overflow, coutLastBit, data_result[31], isLessThan);
	
	// mux to select actual result
	mux1_32 muxAddLogic(addResult, logicResult, ctrl_ALUopcode[1], logicArithmeticResult);
	mux1_32 muxShiftNull(shiftResult, 0, ctrl_ALUopcode[1], shiftNullResult);
	
	mux1_32 muxFinal(logicArithmeticResult, shiftNullResult, ctrl_ALUopcode[2], data_result);
endmodule
