`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2021 18:40:07
// Design Name: 
// Module Name: multiply
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


module multiply(
    input [10:0]A, // MSB is sign bit
    input [10:0]B, // MSB is sign bit
    output [19:0]R,
    output signR
    );
    wire [9:0]operandA,operandB;
    //
    xor(signR,A[10],B[10]);
    assign operandA[9:0] = A[9:0];
    assign operandB[9:0] = B[9:0];
    //
    assign R[19:0] = operandA[9:0]*operandB[9:0];
endmodule
