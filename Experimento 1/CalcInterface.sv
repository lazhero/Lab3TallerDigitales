module CalcInterface(input [3:0] a,b,sel, input clk,rst, output Z,C,N,O,Sign, output [6:0] Out);
	calculadora #(.M(4)) myCalc (.a(a), .b(b), .sel(sel), .clk(clk), .rst(rst), .Z(Z),.C(C),.N(N),.O(O),.Sign(Sign),.Out(Out));

endmodule 