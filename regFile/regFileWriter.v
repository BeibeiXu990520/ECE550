/*
	writer of regFile,
	used to locate correct register (set one enable line to 1 by decoder).
	When writeEnable is 0, set all write_enables to be 0
*/

module regFileWriter(input writeEnable,
							input [4:0] ctrl_writeReg,
							output [31:0] write_enables);

	wire [4:0] enabledWriteReg;
	
	assign enabledWriteReg = writeEnable ? ctrl_writeReg : 5'b00000;
	
	decoder5to32 decoder(enabledWriteReg, write_enables);				  
				  
endmodule