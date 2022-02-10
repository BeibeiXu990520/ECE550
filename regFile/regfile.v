/*
	regfile, completing reading, writing
	
	register 0 will always be 0, which is not writable
*/
module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	// output of 32 32-bit registers
	wire [31:0] registerStates [31:0];
	
	// writing enables for 32 registers
	wire [31:0] writeEnables;
	
	// reading signals
	wire [31:0] readSignalsA;
	wire [31:0] readSignalsB;
		
	// For Verilog reason I cannot abstract registers like following
	/*
	registers regs(clock, data_writeReg, writeEnables, ctrl_reset, registerStates);
	*/
	// 32 32-bit registers
	register reg0(clock, data_writeReg, 1'b0, ctrl_reset, registerStates[0]);	// reg0 cannot be written
	genvar i;
	generate 
		for (i = 1; i < 32; i = i + 1) begin : generateRegisters			
			register regs(clock, data_writeReg, writeEnables[i], ctrl_reset, registerStates[i]);
		end
	endgenerate
	
	regFileWriter writer(ctrl_writeEnable, ctrl_writeReg, writeEnables);
	
	// For Verilog reason I cannot abstract readers like following
	/*	
	regFileReader readerA(ctrl_readRegA, registerStates, data_readRegA);
	regFileReader readerB(ctrl_readRegB, registerStates, data_readRegB);
	*/	
			
	// reader implmentation
	decoder5to32 decoderReaderA(ctrl_readRegA, readSignalsA);
	decoder5to32 decoderReaderB(ctrl_readRegB, readSignalsB);
	genvar j;
	generate 
		for (i = 0; i < 32; i = i + 1) begin : loopOverRegs
			triStateBuffer triStateBuffersA(registerStates[i], readSignalsA[i], data_readRegA);
			triStateBuffer triStateBuffersB(registerStates[i], readSignalsB[i], data_readRegB);
		end
	endgenerate			
	

endmodule
