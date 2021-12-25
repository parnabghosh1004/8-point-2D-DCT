`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2021 00:22:39
// Design Name: 
// Module Name: Multiply_Block
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


module Multiply_Block(
    input [15:0] A,
    input [15:0] B,
    output [15:0] R
    );
wire [31:0]result;
// Perform Multiplication
assign result[31:0] = {A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15],A[15:0]} * {B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15],B[15:0]};
assign R[15:0] = result[31:0] >> 4'b1111;
endmodule
