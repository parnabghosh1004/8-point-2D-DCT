`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2021 01:18:02 PM
// Design Name: 
// Module Name: Booth_Algo_Datapath
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


module Booth_Algo_Datapath(ldA,ldQ,ldM,clrA,clrQ,clrDff,sftA,sftQ,addsub,decr,ldCount,in1,in2,clk,Q0,Qm1,isCountZero);
    
    input ldA,ldQ,ldM,clk,clrA,clrQ,clrDff,sftA,sftQ,decr,ldCount,addsub;
    input [15:0] in1,in2;
    output Q0,Qm1,isCountZero;
    wire [15:0] A,Q,M,Z;
    wire [4:0] count;
   
    assign isCountZero = ~|count;
    assign Q0 = Q[0];

    shiftReg AR(.data_in(Z),.data_out(A),.SR_in(A[15]),.clk(clk),.ld(ldA),.clr(clrA),.sft(sftA));
    shiftReg QR(.data_in(in1),.data_out(Q),.SR_in(A[0]),.clk(clk),.ld(ldQ),.clr(clrQ),.sft(sftQ));
    Dff QM1 (.d(Q[0]),.q(Qm1),.clk(clk),.clr(clrDff));
    PIPOReg MR(.data_in(in2),.data_out(M),.clk(clk),.ld(ldM));
    AddSub AS(.out(Z),.in1(A),.in2(M),.oper(addsub));
    Counter C(.count(count),.clk(clk),.ld(ldCount),.decr(decr));

endmodule




