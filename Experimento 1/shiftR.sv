module shifR #(parameter N=6)(input [N-1:0] a, output[N-1:0] c);

	assign c=a>> 1;
endmodule 
