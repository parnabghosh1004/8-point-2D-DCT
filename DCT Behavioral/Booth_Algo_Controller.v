`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2021 01:35:08 PM
// Design Name: 
// Module Name: Booth_Algo_Controlpath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Booth_Algo_Controlpath(rst,ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,isCountZero,Q0,Qm1,start,done,clk);

	input Qm1,Q0,start,rst,isCountZero,clk;
	output reg ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,done;

	reg [2:0] state;

	parameter S0 = 3'b000,S1 = 3'b001,S2 = 3'b010,S3 = 3'b011,S4 = 3'b100,S5 = 3'b101,S6 = 3'b110;

	always @(posedge clk)
	begin 
		case(state)
		S0: if(start) state <= S1;
		S1: state <= S2;
		S2: if({Q0,Qm1} == 2'b01) state <= S3;
			 else if({Q0,Qm1} == 2'b10) state <= S4;
			 else state <= S5;
		S3: state <= S5;
		S4: state <= S5;
		S5: if(isCountZero) state <= S6;
			else if(!isCountZero && {Q0,Qm1} == 2'b01) state <= S3;
			else if(!isCountZero && {Q0,Qm1} == 2'b10) state <= S4;
		S6: if(~rst) state<=S0;
		     else state <= S6;
		default: state <= S0;
		endcase
	end

	always @(state)
	begin 
		case(state)
		S0: 
			begin
				ldA=0; ldQ=0; ldM=0; clrA=0; clrQ=0;addsub=0; clrDff=0; sftA=0; sftQ=0; done=0; decr=0;
			end
		S1: 
			begin
				ldM=1;ldQ=1; clrA=1; clrDff=1; ldCount=1;
			end
		S2: 
			begin
			    clrA=0; clrDff=0; ldCount=0; ldM=0; ldQ = 0;
			end
		S3: 
			begin
				ldA=1; addsub=0; sftA=0; sftQ=0; decr = 0;
			end
		S4: 
			begin
				ldA=1; addsub=1; sftA=0; sftQ=0; decr = 0;
			end	
		S5: 
			begin
				ldA=0;sftA=1; sftQ=1; decr = 1;
			end		
		S6: begin done = 1; sftA=0; sftQ=0; decr=0;end
		default: 
			begin
				ldA=0; ldQ=0; ldM=0; clrA=0; clrQ=0; clrDff=0; sftA=0; sftQ=0;addsub=0; done=0; decr=0; 
			end	
		endcase
	end

endmodule