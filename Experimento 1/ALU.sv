module ALU #(parameter N=6)(input [N-1:0] A,B, input [3:0] sel, output logic [N-1:0] out, output logic  Z,O,Ca,Neg );
	logic [N:0] a,b,d,e,f,g,h,i,j;
	logic [2*N-1:0] c;
	logic [N-1:0] A_c,B_c;
	logic [N-1:0] add_comb,subs_comb,mult_comb,div_comb,mod_comb;
	
	 
	sign_magnitud_to_complement #(.N(N)) to_comp_1 (.A(A),.B(A_c));
	sign_magnitud_to_complement #(.N(N)) to_comp_2 (.A(B),.B(B_c));
	
	
	complement_2_to_sign_magnitud #(.N(N)) to_mag_1 (.A(a[N-1:0]),.B(add_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_2(.A(b[N-1:0]),.B(subs_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_3 (.A(c[N-1:0]),.B(mult_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_4(.A(d[N-1:0]),.B(div_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_5(.A(e[N-1:0]),.B(mod_comb));
	
	adder #(.N(N)) myadder(.a(A_c),.b(B_c),.c(a));
	subtracter #(.N(N)) mysubstracter(.a(A_c),.b(B_c),.c(b));
	multiplier #(.N(N)) mymultiplier(.a(A_c),.b(B_c),.c(c));
	division #(.N(N)) mydiv (.A(A_c),.B(B_c),.C(d));
	mod #(.N(N)) mymod (.A(A_c),.B(B_c),.C(e));
	shifL #(.N(N)) myshiftL (.a(A),.c(f));
	shifR #(.N(N)) myshiftR (.a(A),.c(g));
	bitwise_and #(.N(N)) myand(.a(A),.b(B),.c(h));
	bitwise_or #(.N(N)) myor(.a(A),.b(B),.c(i));
	bitwise_xor #(.N(N)) myxor(.a(A),.b(B),.c(j));
	//mux_9_1 #(parameter N=5)(.select(sel), .a(add_comb),b,c,d,e,f,g,h,i,j output[N-1:0] out);
	always_comb begin
	
		case (sel)
		
		4'b0000:
			begin
				out=add_comb;
				Ca=a[N];
				O= 	(A[N-1] & B[N-1] & !a[N-1])   |  (!A[N-1] & !B[N-1] & a[N-1])  ;
			end
		4'b0001:
			begin
				out=subs_comb;
				Ca=b[N];
				O = (A[N-1] & !B[N-1] & !b[N-1])   |  (!A[N-1] & B[N-1] & b[N-1]);
			end
			
		4'b0010:
			begin
				out=mult_comb;
				Ca=c[2*N-1];
				O = |(c[2*N-1:N]);
			end
			
		4'b0011:
			begin
				out=div_comb;
				Ca=1'b0;
				O = B==0;
			end
			
		4'b0100:
			begin
				out=mod_comb;
				Ca=e[N];
				O = (!A[N-1] & !B[N-1] & e[N-1])|(A[N-1] & B[N-1] & e[N-1])|(A[N-1] & !B[N-1] & !e[N-1])|(!A[N-1] & B[N-1] & !e[N-1]);
			end
		4'b0101:
			begin
				out=f;
				Ca=1'b0;
				O = 1'b0;
				
			end
			
		4'b0111:
			begin
				out=g;
				Ca=1'b0;
				O = 1'b0;
				
			end
		4'b1000:
			begin
				out=A&B;
				Ca=1'b0;
				O = 1'b0;
				
			end
		4'b1001:
			begin
				out=A|B;
				Ca=1'b0;
				O = 1'b0;
				
			end
		4'b1010:
			begin
				out=A^B;
				Ca=1'b0;
				O = 1'b0;
				
			end
		default:
			begin
				out=A^B;
				Ca=1'b0;
				O = 1'b0;
			end
		endcase
		
		Z=~|(out);
		Neg=out[N-1];
		
	end
	
endmodule 