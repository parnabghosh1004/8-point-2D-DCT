`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2021 01:00:31
// Design Name: 
// Module Name: main
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
// Values => Sign Bit      Integeral Part       Fractional Part
//            1-Bit           11-Bit              4-Bit
module DCT_1D(
    input [15:0] y0,y1,y2,y3,y4,y5,y6,y7,
    input [15:0]Data_in,
    input [7:0]mem_bar,
    output [15:0] Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7
    );
    wire [15:0]s07,s16,s25,s34,s0_7,s1_6,s2_5,s3_4,s0734,s1625,s07_34,s16_25,s07341625,s0734_1625;//final values
    wire [15:0]r00;
    wire [15:0]r11,r13,r15,r17;
    wire [15:0]r22,r26;
    wire [15:0]r33,r37,r31,r35;
    wire [15:0]r44;
    wire [15:0]r55,r51,r57,r53;
    wire [15:0]r66,r62;
    wire [15:0]r77,r75,r73,r71;
    //
    //Precalculations Started
    precalculate Step1(.y0(y0),.y1(y1),.y2(y2),.y3(y3),.y4(y4),.y5(y5),.y6(y6),.y7(y7),
                       .s07(s07),.s16(s16),.s25(s25),.s34(s34),.s0_7(s0_7),.s1_6(s1_6),
                       .s2_5(s2_5),.s3_4(s3_4),.s0734(s0734),.s1625(s1625),.s07_34(s07_34),
                       .s16_25(s16_25),.s07341625(s07341625),.s0734_1625(s0734_1625));
    //Precalculation Completed
    //
    Coeff_Multiply Step2(.s07(s07),.s16(s16),.s25(s25),.s34(s34),.s0_7(s0_7),.s1_6(s1_6),
                         .s2_5(s2_5),.s3_4(s3_4),.s0734(s0734),.s1625(s1625),.s07_34(s07_34),
                         .s16_25(s16_25),.s07341625(s07341625),.s0734_1625(s0734_1625),
                         .r00(r00),.r11(r11),.r13(r13),.r15(r15),.r17(r17),.r22(r22),.r26(r26),
                         .r33(r33),.r37(r37),.r31(r31),.r35(r35),.r44(r44),.r55(r55),.r51(r51),
                         .r57(r57),.r53(r53),.r66(r66),.r62(r62),.r77(r77),.r75(r75),.r73(r73),.r71(r71),
                         .Data_in(Data_in[15:0]),.mem_bar(mem_bar[7:0]));
    //
    Get_Result Step3(.r00(r00),.r11(r11),.r13(r13),.r15(r15),.r17(r17),.r22(r22),.r26(r26),
                     .r33(r33),.r37(r37),.r31(r31),.r35(r35),.r44(r44),.r55(r55),.r51(r51),
                     .r57(r57),.r53(r53),.r66(r66),.r62(r62),.r77(r77),.r75(r75),.r73(r73),.r71(r71),
                     .Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6),.Y7(Y7));
    //
    // 1D DCT ENDS HERE
endmodule
// STEP-1
module precalculate(
    input [15:0] y0,y1,y2,y3,y4,y5,y6,y7,
    output [15:0]s07,s16,s25,s34,s0_7,s1_6,s2_5,s3_4,s0734,s1625,s07_34,s16_25,s07341625,s0734_1625
    );
    //ADDITION s07,s16,s25,s34
    Adder_Block S07(.A(y0[15:0]),.B(y7[15:0]),.operation(1'b0),.R(s07[15:0]));
    Adder_Block S16(.A(y1[15:0]),.B(y6[15:0]),.operation(1'b0),.R(s16[15:0]));
    Adder_Block S25(.A(y2[15:0]),.B(y5[15:0]),.operation(1'b0),.R(s25[15:0]));
    Adder_Block S34(.A(y3[15:0]),.B(y4[15:0]),.operation(1'b0),.R(s34[15:0]));
    //
    //SUBTRACTION s0_7,s1_6,s2_5,s3_4
    Adder_Block S0_7(.A(y0[15:0]),.B(y7[15:0]),.operation(1'b1),.R(s0_7[15:0]));
    Adder_Block S1_6(.A(y1[15:0]),.B(y6[15:0]),.operation(1'b1),.R(s1_6[15:0]));
    Adder_Block S2_5(.A(y2[15:0]),.B(y5[15:0]),.operation(1'b1),.R(s2_5[15:0]));
    Adder_Block S3_4(.A(y3[15:0]),.B(y4[15:0]),.operation(1'b1),.R(s3_4[15:0]));
    //
    //ADDITION s0734,s1625
    Adder_Block S0734(.A(s07[15:0]),.B(s34[15:0]),.operation(1'b0),.R(s0734[15:0]));
    Adder_Block S1625(.A(s16[15:0]),.B(s25[15:0]),.operation(1'b0),.R(s1625[15:0]));
    //
    //SUBTRACTION s07_34,s16_25
    Adder_Block S07_34(.A(s07[15:0]),.B(s34[15:0]),.operation(1'b1),.R(s07_34[15:0]));
    Adder_Block S16_25(.A(s16[15:0]),.B(s25[15:0]),.operation(1'b1),.R(s16_25[15:0]));
    //
    //ADDITION s07341625
    Adder_Block S07341625(.A(s0734[15:0]),.B(s1625[15:0]),.operation(1'b0),.R(s07341625[15:0]));
    //
    //SUBTRACTION s0734_1625
    Adder_Block S0734_1625(.A(s0734[15:0]),.B(s1625[15:0]),.operation(1'b1),.R(s0734_1625[15:0]));
endmodule
// STEP-2
module Coeff_Multiply(
    input [15:0]s07,s16,s25,s34,s0_7,s1_6,s2_5,s3_4,s0734,s1625,s07_34,s16_25,s07341625,s0734_1625,
    input [15:0]Data_in,
    input [7:0]mem_bar,
    output [15:0]r00,
    output [15:0]r11,r13,r15,r17,
    output [15:0]r22,r26,
    output [15:0]r33,r37,r31,r35,
    output [15:0]r44,
    output [15:0]r55,r51,r57,r53,
    output [15:0]r66,r62,
    output [15:0]r77,r75,r73,r71
    );
    wire [15:0]C0,C1,C2,C3,C4,C5,C6,C7;// coefficient matrix values
    // Taking only fractional part with positive sign bit
    //     Sign Bit      Fractional Part
    //      1-Bit     .   15-Bits
    
//    assign C0 = 16'b0010110101000001; // 0.5 * cos(4pi/16) => 0.35355339059 => in binary => 0.0101101010000010
//    assign C1 = 16'b0011111011000101; // 0.5 * cos(1pi/16) => 0.49039264020 => in binary => 0.0111110110001010
//    assign C2 = 16'b0011101100100000; // 0.5 * cos(2pi/16) => 0.46193976625 => in binary => 0.0111011001000001
//    assign C3 = 16'b0011010100110110; // 0.5 * cos(3pi/16) => 0.41573480615 => in binary => 0.0110101001101101
//    assign C4 = 16'b0010110101000001; // 0.5 * cos(4pi/16) => 0.35355339059 => in binary => 0.0101101010000010
//    assign C5 = 16'b0010001110001110; // 0.5 * cos(5pi/16) => 0.27778511651 => in binary => 0.0100011100011100
//    assign C6 = 16'b0001100001111101; // 0.5 * cos(6pi/16) => 0.19134171618 => in binary => 0.0011000011111011
//    assign C7 = 16'b0000110001111100; // 0.5 * cos(7pi/16) => 0.09754516101 => in binary => 0.0001100011111000
    //
    temp_store TS(.Data_in(Data_in[15:0]),.mem_bar(mem_bar[7:0]),
                  .C0(C0[15:0]),.C1(C1[15:0]),.C2(C2[15:0]),.C3(C3[15:0]),
                  .C4(C4[15:0]),.C5(C5[15:0]),.C6(C6[15:0]),.C7(C7[15:0]));
    //rpq[15:0] => rpq[15:0] contributes in finding out the value of Fp[15:0] 
    //             rpq[15:0] is obtained from multiplication of precalculated values with Cq
    // Get Y[0] = (s07341625*C4);
    Multiply_Block F00(.A(s07341625[15:0]),  .B(C0),       .R(r00[15:0]));
    // Get Y[1] = (s0_7*C1) + (s1_6*C3) + (s2_5*C5) + (s3_4*C7);
    Multiply_Block M11(.A(s0_7[15:0]),       .B(C1),       .R(r11[15:0]));
    Multiply_Block M13(.A(s1_6[15:0]),       .B(C3),       .R(r13[15:0]));
    Multiply_Block M15(.A(s2_5[15:0]),       .B(C5),       .R(r15[15:0]));
    Multiply_Block M17(.A(s3_4[15:0]),       .B(C7),       .R(r17[15:0]));
    // Get Y[2] = (s07_34*C2) + (s16_25*C6);
    Multiply_Block M22(.A(s07_34[15:0]),     .B(C2),       .R(r22[15:0]));
    Multiply_Block M26(.A(s16_25[15:0]),     .B(C6),       .R(r26[15:0]));
    //Get Y[3] = (s0_7*C3) - (s1_6*C7) - (s2_5*C1) - (s3_4*C5);
    Multiply_Block M33(.A(s0_7[15:0]),       .B(C3),       .R(r33[15:0]));
    Multiply_Block M37(.A(s1_6[15:0]),       .B(C7),       .R(r37[15:0]));
    Multiply_Block M31(.A(s2_5[15:0]),       .B(C1),       .R(r31[15:0]));
    Multiply_Block M35(.A(s3_4[15:0]),       .B(C5),       .R(r35[15:0]));
    // Get Y[4] = (s0734_1625*C4);
    Multiply_Block F04(.A(s0734_1625[15:0]), .B({1'b0,C4}),.R(r44[15:0]));
    // Get Y[5] = (s0_7*C5) - (s1_6*C1) + (s2_5*C7) + (s3_4*C3);
    Multiply_Block M55(.A(s0_7[15:0]),       .B(C5),       .R(r55[15:0]));
    Multiply_Block M51(.A(s1_6[15:0]),       .B(C1),       .R(r51[15:0]));
    Multiply_Block M57(.A(s2_5[15:0]),       .B(C7),       .R(r57[15:0]));
    Multiply_Block M53(.A(s3_4[15:0]),       .B(C3),       .R(r53[15:0]));
    // Get Y[6] = (s07_34*C6) - (s16_25*C2);
    Multiply_Block M66(.A(s07_34[15:0]),     .B(C6),       .R(r66[15:0]));
    Multiply_Block M62(.A(s16_25[15:0]),     .B(C2),       .R(r62[15:0]));
    // Get Y[7] = (s0_7*C7) - (s1_6*C5) + (s2_5*C3) - (s3_4*C1);
    Multiply_Block M77(.A(s0_7[15:0]),       .B(C7),       .R(r77[15:0]));
    Multiply_Block M75(.A(s1_6[15:0]),       .B(C5),       .R(r75[15:0]));
    Multiply_Block M73(.A(s2_5[15:0]),       .B(C3),       .R(r73[15:0]));
    Multiply_Block M71(.A(s3_4[15:0]),       .B(C1),       .R(r71[15:0]));
endmodule
// STEP-3
module Get_Result(
    input [15:0]r00,
    input [15:0]r11,r13,r15,r17,
    input [15:0]r22,r26,
    input [15:0]r33,r37,r31,r35,
    input [15:0]r44,
    input [15:0]r55,r51,r57,r53,
    input [15:0]r66,r62,
    input [15:0]r77,r75,r73,r71,
    output [15:0] Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7
    );
    wire [15:0]sum13,sum57;
    wire [15:0]sum37,sum15;
    wire [15:0]sum51,sum73;
    wire [15:0]sum75,sum31;
    // Get Y[0] = (s07341625*C4);
    Adder_Block F00(.A(r00[15:0]),   .B(16'h0000),    .operation(1'b0), .R(Y0[15:0]));
    // Get Y[1] = (s0_7*C1) + (s1_6*C3) + (s2_5*C5) + (s3_4*C7);
    Adder_Block A13(.A(r11[15:0]),   .B(r13[15:0]),   .operation(1'b0), .R(sum13[15:0]));
    Adder_Block A57(.A(r15[15:0]),   .B(r17[15:0]),   .operation(1'b0), .R(sum57[15:0]));
    Adder_Block F01(.A(sum13[15:0]), .B(sum57[15:0]), .operation(1'b0), .R(Y1[15:0]));
    // Get Y[2] = (s07_34*C2) + (s16_25*C6);
    Adder_Block F02(.A(r22[15:0]),   .B(r26[15:0]),   .operation(1'b0), .R(Y2[15:0]));
    //Get Y[3] = (s0_7*C3) - (s1_6*C7) - (s2_5*C1) - (s3_4*C5);
    Adder_Block A37(.A(r33[15:0]),   .B(r37[15:0]),   .operation(1'b1), .R(sum37[15:0]));
    Adder_Block A15(.A(r31[15:0]),   .B(r35[15:0]),   .operation(1'b0), .R(sum15[15:0]));
    Adder_Block F03(.A(sum37[15:0]), .B(sum15[15:0]), .operation(1'b1), .R(Y3[15:0]));
    // Get Y[4] = (s0734_1625*C4);
    Adder_Block F04(.A(r44[15:0]),   .B(16'h0000),    .operation(1'b0), .R(Y4[15:0]));
    // Get Y[5] = (s0_7*C5) - (s1_6*C1) + (s2_5*C7) + (s3_4*C3);
    Adder_Block A51(.A(r55[15:0]),   .B(r51[15:0]),   .operation(1'b1), .R(sum51[15:0]));
    Adder_Block A73(.A(r57[15:0]),   .B(r53[15:0]),   .operation(1'b0), .R(sum73[15:0]));
    Adder_Block F05(.A(sum51[15:0]), .B(sum73[15:0]), .operation(1'b0), .R(Y5[15:0]));
    // Get Y[6] = (s07_34*C6) - (s16_25*C2);
    Adder_Block F06(.A(r66[15:0]),   .B(r62[15:0]),   .operation(1'b1), .R(Y6[15:0]));
    // Get Y[7] = (s0_7*C7) - (s1_6*C5) + (s2_5*C3) - (s3_4*C1);
    Adder_Block A75(.A(r77[15:0]),   .B(r75[15:0]),   .operation(1'b1), .R(sum75[15:0]));
    Adder_Block A31(.A(r73[15:0]),   .B(r71[15:0]),   .operation(1'b1), .R(sum31[15:0]));
    Adder_Block F07(.A(sum75[15:0]), .B(sum31[15:0]), .operation(1'b0), .R(Y7[15:0]));
endmodule

// Block to perform addition operations
module Adder_Block ( //16-Bit Adder Block
    input [15:0]A, // MSB is sign bit
    input [15:0]B, // MSB is sign bit
    input operation, // Addition or Subtraction
    output [15:0]R // MSB is sign bit
    );
wire carry;
wire [15:0]compB;
//
complement C1(.I(B[15:0]),.X(operation),.O(compB[15:0]));
//
adder16 S1(.A(A[15:0]),.B(compB[15:0]),.Cin(1'b0),.Sum(R[15:0]),.Cout());
//
endmodule

module adder16(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] Sum,
    output Cout
    );
wire ripple;
adder08 E2(.A(A[7:0]),  .B(B[7:0]),  .Cin(Cin),     .Sum(Sum[7:0]),  .Cout(ripple));
adder08 E3(.A(A[15:8]), .B(B[15:8]), .Cin(ripple), .Sum(Sum[15:8]), .Cout(Cout));
endmodule

module adder08(
    input [7:0] A,
    input [7:0] B,
	input Cin,
	output [7:0] Sum,
	output Cout
    );
wire ripple;
adder04 F1( .a(A[3:0]),  .b(B[3:0]),  .cin(Cin),      .sum(Sum[3:0]),  .carry(ripple));
adder04 F2( .a(A[7:4]),  .b(B[7:4]),  .cin(ripple),   .sum(Sum[7:4]),  .carry(Cout));
endmodule

module adder04(
	 input [3:0]a,
	 input [3:0]b,
	 input cin,
	 output [3:0]sum,
	 output carry
	 );
wire w1,w2,w3;
adder_full G1(.a(a[0]),  .b(b[0]),  .cin(cin),  .sum(sum[0]),  .carry(w1));
adder_full G2(.a(a[1]),  .b(b[1]),  .cin(w1),   .sum(sum[1]),  .carry(w2));
adder_full G3(.a(a[2]),  .b(b[2]),  .cin(w2),   .sum(sum[2]),  .carry(w3));
adder_full G4(.a(a[3]),  .b(b[3]),  .cin(w3),   .sum(sum[3]),  .carry(carry));
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

module temp_store(
     input [15:0]Data_in,
     input [7:0]mem_bar,
     output [15:0]C0,C1,C2,C3,C4,C5,C6,C7
     );
Latch_16_Bit L0(.Din(Data_in[15:0]),.mem_bar(mem_bar[0]),.Q(C0[15:0]));
Latch_16_Bit L1(.Din(Data_in[15:0]),.mem_bar(mem_bar[1]),.Q(C1[15:0]));
Latch_16_Bit L2(.Din(Data_in[15:0]),.mem_bar(mem_bar[2]),.Q(C2[15:0]));
Latch_16_Bit L3(.Din(Data_in[15:0]),.mem_bar(mem_bar[3]),.Q(C3[15:0]));
Latch_16_Bit L4(.Din(Data_in[15:0]),.mem_bar(mem_bar[4]),.Q(C4[15:0]));
Latch_16_Bit L5(.Din(Data_in[15:0]),.mem_bar(mem_bar[5]),.Q(C5[15:0]));
Latch_16_Bit L6(.Din(Data_in[15:0]),.mem_bar(mem_bar[6]),.Q(C6[15:0]));
Latch_16_Bit L7(.Din(Data_in[15:0]),.mem_bar(mem_bar[7]),.Q(C7[15:0]));
endmodule

module Latch_16_Bit(
     input [15:0]Din,
     input mem_bar,
     output [15:0]Q
     );
D_Latch DL00(.D(Din[0]), .mem_bar(mem_bar), .Q(Q[0]));
D_Latch DL01(.D(Din[1]), .mem_bar(mem_bar), .Q(Q[1]));
D_Latch DL02(.D(Din[2]), .mem_bar(mem_bar), .Q(Q[2]));
D_Latch DL03(.D(Din[3]), .mem_bar(mem_bar), .Q(Q[3]));
D_Latch DL04(.D(Din[4]), .mem_bar(mem_bar), .Q(Q[4]));
D_Latch DL05(.D(Din[5]), .mem_bar(mem_bar), .Q(Q[5]));
D_Latch DL06(.D(Din[6]), .mem_bar(mem_bar), .Q(Q[6]));
D_Latch DL07(.D(Din[7]), .mem_bar(mem_bar), .Q(Q[7]));
D_Latch DL08(.D(Din[8]), .mem_bar(mem_bar), .Q(Q[8]));
D_Latch DL09(.D(Din[9]), .mem_bar(mem_bar), .Q(Q[9]));
D_Latch DL10(.D(Din[10]),.mem_bar(mem_bar),.Q(Q[10]));
D_Latch DL11(.D(Din[11]),.mem_bar(mem_bar),.Q(Q[11]));
D_Latch DL12(.D(Din[12]),.mem_bar(mem_bar),.Q(Q[12]));
D_Latch DL13(.D(Din[13]),.mem_bar(mem_bar),.Q(Q[13]));
D_Latch DL14(.D(Din[14]),.mem_bar(mem_bar),.Q(Q[14]));
D_Latch DL15(.D(Din[15]),.mem_bar(mem_bar),.Q(Q[15]));
endmodule

module D_Latch(
     input D,mem_bar,
     output Q
     );
wire comp_D,Dx,comp_Dx,Qbar;
not(comp_D,D);
nand(Dx,D,mem_bar);
nand(comp_Dx,comp_D,mem_bar);
nand(Qbar,comp_Dx,Q);
nand(Q,Dx,Qbar);
endmodule
