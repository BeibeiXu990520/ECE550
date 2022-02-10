module csa_32(operand0, operand1, cin, sum, cout, overflow);
	input [31:0] operand0, operand1;
	input cin;
	output [31:0] sum;
	output cout, overflow;
	
	wire [31:16] sumHigh [1:0];
	wire coutHigh [1:0];
	wire overflows [1:0];
	wire coutLow;

	// to be implemented with 3 16 RCAs and 3 muxes
	// low 16 bit csa
	// the last blank is because overflow in rca is not used
	csa_16 csa_low(operand0[15:0], operand1[15:0], cin, sum[15:0], coutLow, );
	
	// high 16 bit csa
	csa_16 csa_high0(operand0[31:16], operand1[31:16], 1'b0, sumHigh[0][31:16], coutHigh[0], overflows[0]);
	csa_16 csa_high1(operand0[31:16], operand1[31:16], 1'b1, sumHigh[1][31:16], coutHigh[1], overflows[1]);
	
	// muxes to select from couts, overflows and sums
	mux1_1 mux_cout(coutHigh[0], coutHigh[1], coutLow, cout);
	mux1_1 mux_overflow(overflows[0], overflows[1], coutLow, overflow);
	mux1_16 mux_sumHigh(sumHigh[0], sumHigh[1], coutLow, sum[31:16]);
	
endmodule