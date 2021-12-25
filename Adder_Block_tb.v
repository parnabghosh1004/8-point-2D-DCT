`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2021 02:24:43
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
    reg [15:0]A;
    reg [15:0]B;
    reg operation;
    wire [15:0]R;
    
    Adder_Block uut(.A(A[15:0]),.B(B[15:0]),.operation(operation),.R(R[15:0]));
    
    initial
    begin
    operation = 1'b0;
    A={1'b0,11'b00000010000,4'b0000};  //16
    B={1'b1,11'b00000010100,4'b0000};  //20
    #50;
    operation = 1'b1;
    A=16'b0000000100000000;  //16
    B=16'b1111111011000000;  //-20 => 2's complement
    #50;
    $finish;
    end
endmodule