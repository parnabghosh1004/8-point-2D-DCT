`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2021 16:53:43
// Design Name: 
// Module Name: adder
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
module adder( // 24-Bit Adder
	 input [23:0]A,
	 input [23:0]B,
	 input Cin,
	 output [23:0]Sum,
	 output Cout
	 );
	 wire ripple1,ripple2;
    adder8 E1(.a(A[7:0]),   .b(B[7:0]),   .cin(Cin),     .sum(Sum[7:0]),   .Cout(ripple1));
    adder8 E2(.a(A[15:8]),  .b(B[15:8]),  .cin(ripple1), .sum(Sum[15:8]),  .Cout(ripple2));
    adder8 E3(.a(A[23:16]), .b(B[23:16]), .cin(ripple2), .sum(Sum[23:16]), .carry(Cout));
endmodule

module adder16(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output carry
    );
    wire ripple1;
    adder8 E5(.a(a[7:0]),  .b(b[7:0]),  .cin(cin),     .sum(sum[7:0]),  .carry(ripple1));
    adder8 E6(.a(a[15:8]), .b(b[15:8]), .cin(ripple1), .sum(sum[15:8]), .carry(carry));
endmodule

module adder8(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output carry
    );
    wire ripple;
    adder4 F2( .a(a[3:0]),  .b(b[3:0]),  .cin(cin),      .sum(sum[3:0]),  .carry(ripple));
    adder4 F3( .a(a[7:4]),  .b(b[7:4]),  .cin(ripple),   .sum(sum[7:4]),  .carry(carry));
endmodule

module adder4(
	 input [3:0]a,
	 input [3:0]b,
	 input cin,
	 output [3:0]sum,
	 output carry
	 );
wire w1,w2,w3;
adder_full A3(.a(a[0]),  .b(b[0]),  .cin(cin),  .sum(sum[0]),  .carry(w1));
adder_full A4(.a(a[1]),  .b(b[1]),  .cin(w1),   .sum(sum[1]),  .carry(w2));
adder_full A5(.a(a[2]),  .b(b[2]),  .cin(w2),   .sum(sum[2]),  .carry(w3));
adder_full A6(.a(a[3]),  .b(b[3]),  .cin(w3),   .sum(sum[3]),  .carry(carry));
endmodule

module adder_full(
	 input a,
	 input b,
	 input cin,
	 output sum,
	 output carry
	 );
wire w1,w2,w3;
adder_half H1(.a(a),    .b(b),    .sum(w1),   .carry(w2));
adder_half H2(.a(w1),   .b(cin),  .sum(sum),  .carry(w3));
or(carry,w2,w3);
endmodule

module adder_half(
	 input a,
	 input b,
	 output sum,
	 output carry
	 );
xor(sum,a,b);
and(carry,a,b);
endmodule

module complement(
	 input [15:0]I,
	 input X,
	 output [15:0]O
	 );
xor(O[15], X, I[15]);
xor(O[14], X, I[14]);
xor(O[13], X, I[13]);
xor(O[12], X, I[12]);
xor(O[11], X, I[11]);
xor(O[10], X, I[10]);
xor(O[9],  X, I[9]);
xor(O[8],  X, I[8]);
xor(O[7],  X, I[7]);
xor(O[6],  X, I[6]);
xor(O[5],  X, I[5]);
xor(O[4],  X, I[4]);
xor(O[3],  X, I[3]);
xor(O[2],  X, I[2]);
xor(O[1],  X, I[1]);
xor(O[0],  X, I[0]);
endmodule


