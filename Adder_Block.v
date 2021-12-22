`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2021 03:09:01
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
module Adder_Block (
    input [31:0]A,
    input [31:0]B,
    output [31:0]R
    );
wire net_operation,comp_carry,carry,result_sign;
wire polarity;
wire [31:0]compB,temp_sum,comp_temp_sum,final_sum;
//
xor(net_operation,A[31],B[31]);
//
complement C1(.I(B[15:0]),.X(net_operation),.O(compB[15:0]));
complement C2(.I({1'b0,B[30:16]}),.X(net_operation),.O(compB[31:16]));
//
adder32 T1(.A({1'b0,A[30:0]}),.B(compB[31:0]),.Cin(net_operation),.Sum(temp_sum[31:0]),.Cout(carry));
//
not(comp_carry,carry);
and(polarity,comp_carry,net_operation);
//
complement C3(.I(temp_sum[15:0]),.X(polarity),.O(comp_temp_sum[15:0]));
complement C4(.I(temp_sum[31:16]),.X(polarity),.O(comp_temp_sum[31:16]));
//
adder32 T2(.A(comp_temp_sum[31:0]),.B(32'b0),.Cin(polarity),.Sum(R[30:0]),.Cout());
//
xor(R[31],A[31],polarity);
//
endmodule

module adder32( // 32-Bit Adder
	 input [31:0]A,
	 input [31:0]B,
	 input Cin,
	 output [31:0]Sum,
	 output Cout
	 );
	 wire ripple1,ripple2,ripple3;
adder08 E1(.A(A[7:0]),   .B(B[7:0]),   .Cin(Cin),     .Sum(Sum[7:0]),   .Cout(ripple1));
adder08 E2(.A(A[15:8]),  .B(B[15:8]),  .Cin(ripple1), .Sum(Sum[15:8]),  .Cout(ripple2));
adder08 E3(.A(A[23:16]), .B(B[23:16]), .Cin(ripple2), .Sum(Sum[23:16]), .Cout(ripple3));
adder08 E4(.A(A[31:24]), .B(B[31:24]), .Cin(ripple3), .Sum(Sum[31:24]), .Cout(Cout));
endmodule

module adder08(
    input [7:0] A,
    input [7:0] B,
	input Cin,
	output [7:0] Sum,
	output Cout
    );
wire win;
adder04 F0( .a(A[3:0]),  .b(B[3:0]),  .cin(Cin),      .sum(Sum[3:0]),  .carry(win));
adder04 F1( .a(A[7:4]),  .b(B[7:4]),  .cin(Cin),      .sum(Sum[7:4]),  .carry(Cout));
endmodule

// module 9
module adder04(
	 input [3:0]a,
	 input [3:0]b,
	 input cin,
	 output [3:0]sum,
	 output carry
	 );
wire w1,w2,w3;
adder_full G0(.a(a[0]),  .b(b[0]),  .cin(cin),  .sum(sum[0]),  .carry(w1));
adder_full G1(.a(a[1]),  .b(b[1]),  .cin(w1),   .sum(sum[1]),  .carry(w2));
adder_full G2(.a(a[2]),  .b(b[2]),  .cin(w2),   .sum(sum[2]),  .carry(w3));
adder_full G3(.a(a[3]),  .b(b[3]),  .cin(w3),   .sum(sum[3]),  .carry(carry));
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

