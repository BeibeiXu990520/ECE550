/*
	32-bit register
	made up of 32 DFFE
	positive triggered
	has a reset input to reset register to 0
*/
module register(input clk,
					 input [31:0] data,
					 input enable,
					 input reset,	// 1 for reset
					 output [31:0] q);
					 
	genvar i;
	
	generate
		for (i = 0; i < 32; i = i + 1) begin : generateDFFEs
			// here I am not gonna use notQ, therefore I leave it alone
			mydff dffes(clk, data[i], enable, reset, q[i]);
		end
	endgenerate



endmodule