module time_calc(input clk,rst,input [3:0] a,b, input [3:0] sel, output Z,O,C,N,Sign, output[6:0] Out);
	logic[3:0] outMeasure;
	timeMeasure #(.N(4)) myTime(a,b,{sel[3],sel[2],!sel[1],!sel[0]},Z,O,C,N,clk,!rst,outMeasure);
	hexDisplay myHex(.sel({1'b0,outMeasure[2:0]}), .Out(Out));
	assign Sign=!outMeasure[3];
endmodule 