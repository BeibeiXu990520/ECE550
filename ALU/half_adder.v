module half_adder(in0, in1, sum, cout);
	
	input in0, in1;
	output sum, cout;
	
	xor xor_sum(sum, in0, in1);
	and and_cout(cout, in0, in1);
	
endmodule
