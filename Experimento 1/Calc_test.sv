module Calc_test();

	logic [3:0] A,B,sel;
	logic clk, rst, Sign;
	logic [6:0] Output;
	logic Z,O,Ca,Neg;
	//CalcInterface mycalc(.a(A),.b(B),.sel(sel),.clk(clk),.rst(rst), .Z(Z),.C(Ca),.N(Neg),.O(O),.Sign(Sign),.Out(Output));
	calculadora #(.M(4)) mycalc (.a(A), .b(B), .sel(sel), .clk(clk), .rst(rst), .Z(Z),.C(Ca),.N(Neg),.O(O),.Sign(Sign),.Out(Output));
	initial begin 
	rst = 1'b0;
	clk = 1'b0;
	#1;
	rst = 1'b1;
	clk = 1'b1;
	#1
	clk = 1'b0;
	#1;
	clk = 1'b1;
	sel=4'b0011;
	A=4'b0011;
	B=4'b1101;
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0010010) else $error("La suma falla");
	assert(Neg == 1)else $error("Bandera Neg falla sum");
	assert(Ca == 0)else $error("Bandera Carry falla sum");
	assert(Z == 0)else $error("Bandera Zero falla sum");
	assert(O == 0)else $error("Bandera Over falla sum");
	#1;
	
	clk = 1'b0;
	sel=4'b0010;
	A=4'b0010;
	B=4'b1101;
	
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0001111) else $error("La resta falla");
   assert(Neg == 0)else $error("Bandera Neg falla res");
	assert(Ca == 1)else $error("Bandera Carry falla res");
	assert(Z == 0)else $error("Bandera Zero falla res");
	assert(O == 0)else $error("Bandera Over falla res");
	#1;
	
	clk = 1'b0;
	sel=4'b0001;
	A=4'b0011;
	B=4'b1001;
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0000110) else $error("La multiplicacion falla");
	assert(Neg == 1)else $error("Bandera Neg falla mult");
	assert(Ca == 0)else $error("Bandera Carry falla mult");
	assert(Z == 0)else $error("Bandera Zero falla mult");
	assert(O == 1)else $error("Bandera Over falla mult");
	#1;
	
	clk = 1'b0;
	sel=4'b0000;
	A=4'b0110;
	B=4'b1011;
	
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0010010) else $error("La div falla");
	assert(Neg == 1)else $error("Bandera Neg falla div");
	assert(Ca == 0)else $error("Bandera Carry falla div");
	assert(Z == 0)else $error("Bandera Zero falla div");
	assert(O == 0)else $error("Bandera Over falla div");
	#1;
	
	
	clk = 1'b0;
	sel=4'b0111;
	A=4'b0011;
	B=4'b0001;
	clk = 1'b1;
	
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0000001) else $error("el mod falla");
	assert(Neg == 0)else $error("Bandera Neg falla mod");
	assert(Ca == 0)else $error("Bandera Carry falla mod");
	assert(Z == 1)else $error("Bandera Zero falla mod");
	assert(O == 0)else $error("Bandera Over falla mod");
	#1;
	
	clk = 1'b0;
	sel=4'b0110;
	A=4'b0010;
	B=4'b0001;
	
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b1001100) else $error("La ShiftL falla");
   assert(Neg == 0)else $error("Bandera Neg falla ShiftL");
	assert(Ca == 0)else $error("Bandera Carry falla ShiftL");
	assert(Z == 0)else $error("Bandera Zero falla ShiftL");
	assert(O == 0)else $error("Bandera Over falla ShiftL");
	#1;
	
	clk = 1'b0;
	sel=4'b0101;
	A=4'b0011;
	B=4'b0001;
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b1001111) else $error("La ShiftR falla");
	assert(Neg == 0)else $error("Bandera Neg falla ShiftR");
	assert(Ca == 0)else $error("Bandera Carry falla ShiftR");
	assert(Z == 0)else $error("Bandera Zero falla ShiftR");
	assert(O == 0)else $error("Bandera Over falla ShiftR");
	#1;
	
	clk = 1'b0;
	sel=4'b0100;
	A=4'b0110;
	B=4'b1011;
	
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0010010) else $error("La And falla");
	assert(Neg == 0)else $error("Bandera Neg falla And");
	assert(Ca == 0)else $error("Bandera Carry falla And");
	assert(Z == 0)else $error("Bandera Zero falla And");
	assert(O == 0)else $error("Bandera Over falla And");
	#1;
	
	clk = 1'b0;
	sel=4'b1010;
	A=4'b0110;
	B=4'b1011;
	
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0001111) else $error("La OR falla");
	assert(Neg == 1)else $error("Bandera Neg falla OR");
	assert(Ca == 0)else $error("Bandera Carry falla OR");
	assert(Z == 0)else $error("Bandera Zero falla OR");
	assert(O == 0)else $error("Bandera Over falla OR");
	#1;
	clk = 1'b0;
	sel=4'b1011;
	A=4'b0110;
	B=4'b1011;
	
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#1;
	clk = 1'b1;
	#1;
	assert(Output==7'b0100100) else $error("La XOR falla");
	assert(Neg == 1)else $error("Bandera Neg falla XOR");
	assert(Ca == 0)else $error("Bandera Carry falla XOR");
	assert(Z == 0)else $error("Bandera Zero falla XOR");
	assert(O == 0)else $error("Bandera Over falla XOR");
	#1;
	
	end
endmodule 