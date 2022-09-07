module timeMeasure #(parameter N=5)(input [N-1:0] A,B,input [3:0] sel,output Z,O,Ca,Neg, input clk,rst, output [N-1:0] Out);
	
	logic [2*N-1:0] Reg1Out;
	logic [N-1:0] ALUOUT;
	D_Register  #(.N(2*N)) reg1(.In({A,B}), .clk(clk),.rst(rst), .Out(Reg1Out));
	ALU #(.N(N))(.A(Reg1Out[2*N-1:N]),.B(Reg1Out[N-1:0]), .sel(sel), .out(ALUOUT),.Z(Z),.O(O),.Ca(Ca),.Neg(Neg));
	D_Register  #(.N(N)) reg2(.In(ALUOUT), .clk(!clk),.rst(rst), .Out(Out));

endmodule 