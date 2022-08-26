module multiplier #(parameter N=5)(input signed [N-1:0] a,b, output signed [2*N-1:0] c);
	assign c=a*b;

endmodule 