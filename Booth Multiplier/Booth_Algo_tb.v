`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2021 01:45:25 PM
// Design Name: 
// Module Name: Booth_Algo_tb
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

module Booth_Algo_tb;

    reg [15:0] data_in;
    reg clk,start;
    wire done;
    wire ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,Q0,Qm1,isCountZero;

    Booth_Algo_Datapath DP(ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,data_in,clk,Q0,Qm1,isCountZero);
    Booth_Algo_Controlpath CP(ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,isCountZero,Q0,Qm1,start,done,clk);

    initial begin 
        clk = 1'b0;
        start = 1'b0;
        #2 start = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin 
        #3 data_in = 16'd14;
        #20 data_in = -16'd16;
    end

//    initial #10000 $finish;
    
//    initial $monitor($time,"%d %b",{DP.A,DP.Q},done);

endmodule



