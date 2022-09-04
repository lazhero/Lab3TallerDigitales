module ALU_test();

	logic [3:0] A,B,Out,e,f;
	logic [3:0] sel;
	logic Z,O,Ca,Neg;
	ALU #(.N(4)) myALU (.A(A),.B(B),.sel(sel), .out(Out), .Z(Z),.O(O),.Ca(Ca),.Neg(Neg) );
	
	
	initial begin
	
	sel=4'b0000;
	A=4'b0011;
	B=4'b1101;
	
	#10;
	A=4'b0111;
	B=4'b1101;
	#10;
	A=4'b1111;
	B=4'b0110;
	#10;
	A=4'b0111;
	B=4'b0010;
	#10;
	
	sel=4'b0001;
	A=4'b0011;
	B=4'b1101;
	
	#10;
	A=4'b0111;
	
	
	B=4'b1101;
	#10;
	A=4'b1111;
	B=4'b0110;
	#10;
	A=4'b0111;
	B=4'b0010;
	#10;
	
	
	sel=4'b0010;
	A=4'b0001;
	B=4'b1001;
	#10;
	A=4'b1010;
	B=4'b1010;
	#10;
	A=4'b0000;
	B=4'b1111;
	#10;
	A=4'b0011;
	B=4'b1010;
	#10;
	
	
	sel=4'b0011;
	A=4'b0001;
	B=4'b0001;
	#10;
	A=4'b1011;
	B=4'b0010;
	#10;
	A=4'b0000;
	B=4'b1111;
	#10;
	A=4'b0011;
	B=4'b1010;
	#10;
	
	end 
endmodule  