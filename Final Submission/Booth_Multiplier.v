`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2021 02:55:05
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


module Booth_Multiplier(A,B,start,rst,clk,R,done);

    input [15:0] A,B;
    input clk,start,rst;
    output [15:0] R;
    output done;

    wire ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,Q0,Qm1,isCountZero;
    wire [31:0]out;
    Booth_Algo_Datapath DP(ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,A,B,clk,Q0,Qm1,isCountZero);
    Booth_Algo_Controlpath CP(rst,ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,isCountZero,Q0,Qm1,start,done,clk);

    assign out = {DP.A,DP.Q};
    assign R = out[31:16];
    

endmodule


