module ALU #(parameter N=6)(input [N-1:0] A,B, input [2:0] sel, output [N-1:0] out, output Z,O,C,N );
	logic [N:0] a,b,c,d,e,f,g,h;
	logic [N-1:0] A_c,B_c;
	logic [N-1:0] add_comb,subs_comb,mult_comb,div_comb;
	
	 
	sign_magnitud_to_complement #(.N(N)) to_comp_1 (.A(A),.B(A_c));
	sign_magnitud_to_complement #(.N(N)) to_comp_2 (.A(B),.B(B_c));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_1 (.A(a),.B(add_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_2(.A(b),.B(subs_comp));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_3 (.A(c),.B(add_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_4(.A(d),.B(subs_comp));
	
	adder #(.N(N)) myadder(.a(A_c),.b(B_c),.c(a));
	substracter #(.N(N)) mysubstracter(.a(A_c),.b(B_c),.c(b));
	
	shifL #(.N(N)) myshiftL (.a(A),.c(e);
	shifR #(.N(N)) myshiftR (.a(A),.c(f));
	
	always_comb begin
	
		case (sel)
		
		3'b000:
			begin
				out=add_comb;
				c=a[N]
				o= (	(!A[N-1] & B[N-1])   +  (A[N-1] & !B[N-1])  )& a[N];
			end
		3'b001:
			begin
				out=subs_comb;
				c=b[N]
				o = (	(!A[N-1] & B[N-1])   +  (A[N-1] & !B[N-1])  )& b[N];
			end
			
		3'b100:
			begin
				out=e;
				c=1'b0;
				o = 1'b0;
				
			end
			
		3'b101:
			begin
				out=f;
				c=1'b0;
				o = 1'b0;
				
			end
		
		endcase
		
	
	end
	
	adder #(.N(N)) myadder (.a(A),.b(B), .c(a))
endmodule 