`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2021 04:29:38
// Design Name: 
// Module Name: Adder_Block_tb
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


module Adder_Block_tb;
    reg [31:0]A;
    reg [31:0]B;
    wire [31:0]R;
    
    Adder_Block uut(.A(A[31:0]),.B(B[31:0]),.R(R[31:0]));
    
    initial
    begin
    A=32'b00110000000000000000000100000000;
    B=32'b00010000000000000000011111010000;
    #50;
    A=32'b10110000000000000000000100000000;
    B=32'b00010000000000000000011111010000;
    #50;
    A=32'b00110000000000000000000100000000;
    B=32'b10010000000000000000011111010000;
    #50;
    A=32'b10110000000000000000000100000000;
    B=32'b10010000000000000000011111010000;
    #50;
    $finish;
    end
endmodule
