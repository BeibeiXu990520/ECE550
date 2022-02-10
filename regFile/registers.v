/*
	32 32-bit registers
	
	with all bits readable
	reset : 1 to set all registers to be 0
	
	register0 cannot be writen, protect it here
*/

/*
module registers(input clk,
					  input [31:0] dataWrite,
					  input [31:0] ctrlWrite,
					  input reset,
					  output [31:0] registerStates [31:0]);
	
	register reg0(clk, dataWrite, 0, reset, registerStates[0]);
	genvar i;
	generate 
		for (i = 1; i < 32; i = i + 1) begin : generateRegisters			
			register regs(clk, dataWrite, ctrlWrite[i], reset, registerStates[i]);
		end
	endgenerate
					  
endmodule
*/