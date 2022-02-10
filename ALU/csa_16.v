module csa_16(operand0, operand1, cin, sum, cout, overflow);
	input [15:0] operand0, operand1;
	input cin;
	output [15:0] sum;
	output cout, overflow;
	
	wire [15:8] sumHigh [1:0];
	wire coutHigh [1:0];
	wire overflows [1:0];
	wire coutLow;

	// to be implemented with 3 8 csas and 3 muxes
	// low 8 bit csa
	// the last blank is because overflow in csa is not used
	csa_8 csa_low(operand0[7:0], operand1[7:0], cin, sum[7:0], coutLow, );
	
	// high 8 bit csa
	csa_8 csa_high0(operand0[15:8], operand1[15:8], 1'b0, sumHigh[0][15:8], coutHigh[0], overflows[0]);
	csa_8 csa_high1(operand0[15:8], operand1[15:8], 1'b1, sumHigh[1][15:8], coutHigh[1], overflows[1]);
	
	// muxes to select from couts, overflows and sums
	mux1_1 mux_cout(coutHigh[0], coutHigh[1], coutLow, cout);
	mux1_1 mux_overflow(overflows[0], overflows[1], coutLow, overflow);
	mux1_8 mux_sumHigh(sumHigh[0], sumHigh[1], coutLow, sum[15:8]);
	
endmodule