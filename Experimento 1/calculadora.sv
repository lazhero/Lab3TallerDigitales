module calculadora(input [3:0] a,b,sel, input clk,rst, output Z,C,N,O,Sign, output [6:0] Out);
	logic [3:0] ALU_OUT,Reg_OUT;
	logic Z_ALU,C_ALU,O_ALU,N_ALU;
	ALU #(.N(4)) myALU(.A(a),.B(b), .sel({sel[3],sel[2],!sel[1],!sel[0]}), .out(ALU_OUT), .Z(Z_ALU),.Ca(C_ALU),.O(O_ALU),.Neg(N_ALU));
	D_Register #(.N(4)) myParallelRegister (.In(ALU_OUT), .clk(clk),.rst(!rst) ,.Out(Reg_OUT));
	D_Register #(.N(4)) myParallelRegisterFlags (.In({Z_ALU,C_ALU,O_ALU,N_ALU}), .clk(clk),.rst(!rst) ,.Out({Z,C,O,N}));
	hexDisplay(.sel(Reg_OUT[2:0]), .Out(Out));
	assign Sign=!Reg_OUT[3];
endmodule