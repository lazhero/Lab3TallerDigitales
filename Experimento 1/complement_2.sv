module complement_2_to_sign_magnitud #(parameter N=6)(input [N-1:0] A, output [N-1:0] B);
	logic [N-1:0] out;
	logic sign;
	assign sign=A[N-1];
	assign out= (~A)+1'b1;
	assign B={sign,out[N-2:0]}
	

endmodule 