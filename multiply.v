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
    input [16:0]A, // MSB is sign bit
    input [16:0]B, // MSB is sign bit
    output [32:0]R // MSB is sign bit
    );
    // Multiplying two 16-Bit numbers
    assign R[31:0] = A[15:0]*B[15:0];
    // Finding the sign of result after multiplication
    xor(R[32],A[16],B[16]);
endmodule
