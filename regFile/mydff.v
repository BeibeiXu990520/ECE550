/*
	positive edge triggered DFFE
	has a clr input, which is used to reset DFFE to 0 at positive edge
	
	all states are initialized as 0 here
*/
module mydff(input clk,
				input D,
				input E,
				input clr,
				output Q); 

	reg state;
	assign Q = state;	
	
	initial
	begin
		state = 1'b0;
	end
				
	always @ (posedge clk) begin
		if (clr) begin
			state = 1'b0;
		end
		else if (E) begin
			state = D;
		end
	end
				
endmodule