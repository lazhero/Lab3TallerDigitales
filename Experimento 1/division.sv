module division #(parameter N=6)(input signed  [N-1:0] A,B, output signed [N:0] C);
	
	assign C=A/B;
	
endmodule 