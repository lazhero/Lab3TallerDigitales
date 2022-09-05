module Calc_test();

	logic [3:0] A,B,sel;
	logic clk, rst, Sign;
	logic [6:0] Out;
	logic Z,O,Ca,Neg;
	CalcInterface mycalc(A,B,sel,clk,rst, Z, Ca,Neg,O,Sign,Out);
	
	initial begin 
	rst = 1;
	#1;
	rst = 0;
	clk = 0;
	
	sel=4'b0000;
	A=4'b0011;
	B=4'b1101;
	clk = 1;
	#10;
	
	clk = 0;
	A=4'b0111;
	B=4'b1101;
	clk = 1;
	#10;
	clk = 0;
	A=4'b1111;
	B=4'b0110;
	clk = 1;
	#10;
	clk = 0;
	A=4'b0111;
	B=4'b0010;
	clk = 1;
	#10;
	clk = 0;
	sel=4'b0001;
	A=4'b0011;
	B=4'b1101;
	clk = 1;
	#10;
	clk = 0;
	A=4'b0111;
	B=4'b1101;
	clk = 1;
	#10;
	clk = 0;
	A=4'b1111;
	B=4'b0110;
	clk = 1;
	#10;
	clk = 0;
	A=4'b0111;
	B=4'b0010;
	clk = 1;
	#10;
	clk = 0;
	sel=4'b0010;
	A=4'b0001;
	B=4'b1001;
	clk = 1;
	#10;
	clk = 0;
	A=4'b1010;
	B=4'b1010;
	clk = 1;
	#10;
	clk = 0;
	A=4'b0000;
	B=4'b1111;
	clk = 1;
	#10;
	clk = 0;
	A=4'b0011;
	B=4'b1010;
	clk = 1;
	#10;
	clk = 0;
	sel=4'b0011;
	A=4'b0001;
	B=4'b0001;
	clk = 1;
	
	end
endmodule 