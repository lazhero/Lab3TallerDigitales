module adder #(parameter N=5)(input [N-1:0] a,b, output [N:0] c);
	assign c=a+b;

endmodule 