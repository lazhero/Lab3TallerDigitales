module mod #(parameter N=6)(input[N-1:0] A,B, output [N:0] C);
	
	assign C=A%B;
	
endmodule 