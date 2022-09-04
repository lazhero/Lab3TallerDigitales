module D_Register #(parameter N=6)(input [N-1:0] In, input clk,rst, output [N-1:0] Out);

	logic [N-1:0] state;
	
	always_ff @(posedge clk or posedge rst)begin
		if(rst)state=0;
		else state=In;
	end
	assign Out=state;

endmodule 