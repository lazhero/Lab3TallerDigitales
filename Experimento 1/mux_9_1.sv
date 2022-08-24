module mux_9_1 #(parameter N=5)(input[2:0] select, input[N-1:0] a,b,c,d,e,f,g,h, output[N-1:0] out);
	always_comb begin
		case(select)
			3'b000: out=a;
			3'b001: out=b;
			3'b010: out=c;
			3'b011: out=d;
			3'b100: out=e;
			3'b101: out=f;
			3'b110: out=g;
			3'b111: out=h;
		endcase 
	end
endmodule 