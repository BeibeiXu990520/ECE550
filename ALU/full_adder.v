module full_adder(in0, in1, cin, sum, cout);
	input in0, in1, cin;
	output sum, cout;
	
	wire in0xorin1;
	wire [2:0] in0nds;
	wire or0;
	
	xor (in0xorin1, in0, in1);
	xor (sum, in0xorin1, cin);
	
	and (in0nds[0], in0, in1);
	and (in0nds[1], in0, cin);
	and (in0nds[2], in1, cin);
	
	or (or0, in0nds[0], in0nds[1]);
	or (cout, or0, in0nds[2]);
	
endmodule
	
	