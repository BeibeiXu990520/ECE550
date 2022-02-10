module and5(out, in4, in3, in2, in1, in0);
	output out;
	input in4, in3, in2, in1, in0;
	
	/*
	wire [2:0] ws;
	
	and and0(ws[0], in0, in1);
	and and1(ws[1], in2, in3);
	and and2(ws[2], ws[0], ws[1]);
	and and3(out, in4, ws[2]);
	*/
	
	and andd(out, in4, in3, in2, in1, in0);
	
endmodule