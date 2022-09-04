module adder_test();
	logic [3:0] a,b,d;
	logic [7:0] c;
	multiplier #(.N(4)) m (.a(a),.b(b), .c(c));
	complement_2_to_sign_magnitud #(.N(4)) comp(.A(c), .B(d));

	initial begin
		a=4'b1101;
		b=4'b0010;
		#10;
		a=4'b1110;
		b=4'b1101;
		#10;
		
	end


endmodule