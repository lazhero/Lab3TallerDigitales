module calculadora #(parameter M=6)(input [M-1:0] a,b, input [3:0] sel, input clk,rst, output Z,C,N,O,Sign, output [6:0] Out);
	logic [M-1:0] ALU_OUT,Reg_OUT;
	logic Z_ALU,C_ALU,O_ALU,N_ALU;
	ALU #(.N(M)) myALU(.A(a),.B(b), .sel({sel[3],sel[2],!sel[1],!sel[0]}), .out(ALU_OUT), .Z(Z_ALU),.Ca(C_ALU),.O(O_ALU),.Neg(N_ALU));
	D_Register #(.N(M)) myParallelRegister (.In(ALU_OUT), .clk(clk),.rst(!rst) ,.Out(Reg_OUT));
	D_Register #(.N(M)) myParallelRegisterFlags (.In({Z_ALU,C_ALU,O_ALU,N_ALU}), .clk(clk),.rst(!rst) ,.Out({Z,C,O,N}));
	hexDisplay myHex(.sel({1'b0,Reg_OUT[M-2:0]}), .Out(Out));
	assign Sign=!Reg_OUT[M-1];
endmodule 