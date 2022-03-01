`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2021 02:53:02
// Design Name: 
// Module Name: Adder_Block
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


// Block to perform addition operations
module Adder_Block ( //16-Bit Adder Block
    input [15:0]A, // MSB is sign bit
    input [15:0]B, // MSB is sign bit
    input operation, // Addition or Subtraction
    output reg [15:0]R // MSB is sign bit
    );
//wire carry;
//wire [15:0]compB;
//
//complement C1(.I(B[15:0]),.X(operation),.O(compB[15:0]));
//
//adder16 S1(.A(A[15:0]),.B(compB[15:0]),.Sum(R[15:0]));
//

always@(*)
    if(operation)
        R = A - B;
    else
        R = A + B;
endmodule

//module adder16(
//    input [15:0] A,
//    input [15:0] B,
//    output reg [15:0] Sum
//    );
//always@(A,B)
//    Sum <= A + B;
//endmodule

//module complement(
//	 input [15:0]I,
//	 input X,
//	 output [15:0]O
//	 );
//xor(O[15], X, I[15]);
//xor(O[14], X, I[14]);
//xor(O[13], X, I[13]);
//xor(O[12], X, I[12]);
//xor(O[11], X, I[11]);
//xor(O[10], X, I[10]);
//xor(O[9],  X, I[9]);
//xor(O[8],  X, I[8]);
//xor(O[7],  X, I[7]);
//xor(O[6],  X, I[6]);
//xor(O[5],  X, I[5]);
//xor(O[4],  X, I[4]);
//xor(O[3],  X, I[3]);
//xor(O[2],  X, I[2]);
//xor(O[1],  X, I[1]);
//xor(O[0],  X, I[0]);
//endmodule
