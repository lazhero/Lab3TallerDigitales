module subtracter #(parameter N=5)(input signed [N-1:0] a,b, output signed [N:0] c);
	assign c=a-b;

endmodule 