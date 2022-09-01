module multiplier #(parameter N=5)(input [N-1:0] a,b, output  [2*N-1:0] c);
	assign c=a*b;

endmodule 