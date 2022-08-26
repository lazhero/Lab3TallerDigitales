module adder_test();
	logic [3:0] a,b;
	logic [4:0] c;
	adder #(.N(4)) myadder (.a(a),.b(b),.c(c));
	

	initial begin
		a=4'b1110;
		b=4'b0011;
		#10;
		a=4'b1011;
		b=4'b1010;
		#10;
		
	end


endmodule