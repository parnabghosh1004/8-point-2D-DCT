`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2021 14:55:21
// Design Name: 
// Module Name: Booth_Multiplier
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


module Booth_Multiplier(in1,in2,start,clk,out,done);

    input [15:0] in1,in2;
    input clk,start;
    output [31:0] out;
    output done;

    wire ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,Q0,Qm1,isCountZero;

    Booth_Algo_Datapath DP(ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,in1,in2,clk,Q0,Qm1,isCountZero);
    Booth_Algo_Controlpath CP(ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,isCountZero,Q0,Qm1,start,done,clk);

    assign out = {DP.A,DP.Q};

endmodule
