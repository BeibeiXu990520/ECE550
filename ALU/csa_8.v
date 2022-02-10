module csa_8(operand0, operand1, cin, sum, cout, overflow);
	input [7:0] operand0, operand1;
	input cin;
	output [7:0] sum;
	output cout, overflow;
	
	wire [7:4] sumHigh [1:0];
	wire coutHigh [1:0];
	wire overflows [1:0];
	wire coutLow;

	// to be implemented with 3 8 csas and 3 muxes	
	// the last blank is because overflow in csa is not used
	rca_4 rca_low(operand0[3:0], operand1[3:0], cin, sum[3:0], coutLow, );
		
	rca_4 rca_high0(operand0[7:4], operand1[7:4], 1'b0, sumHigh[0][7:4], coutHigh[0], overflows[0]);
	rca_4 rca_high1(operand0[7:4], operand1[7:4], 1'b1, sumHigh[1][7:4], coutHigh[1], overflows[1]);
	
	// muxes to select from couts, overflows and sums
	mux1_1 mux_cout(coutHigh[0], coutHigh[1], coutLow, cout);
	mux1_1 mux_overflow(overflows[0], overflows[1], coutLow, overflow);
	mux1_4 mux_sumHigh(sumHigh[0], sumHigh[1], coutLow, sum[7:4]);
	
endmodule