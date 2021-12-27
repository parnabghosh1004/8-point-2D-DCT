
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
    input clr,clk,start,enDCT,done,
    input [15:0]Data_in, // Coefficient
    input [7:0]mem_select, // decoder_out
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
                         .Data_in(Data_in[15:0]),.mem_select(mem_select[7:0]),.clr(clr),.enDCT(enDCT),.clk(clk),.start(start),.done(done));
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
    input [7:0]mem_select,
    input start,clk,
    input enDCT,
    input clr,
    output [15:0]r00,
    output [15:0]r11,r13,r15,r17,
    output [15:0]r22,r26,
    output [15:0]r33,r37,r31,r35,
    output [15:0]r44,
    output [15:0]r55,r51,r57,r53,
    output [15:0]r66,r62,
    output [15:0]r77,r75,r73,r71,
    output done
    );
    wire [15:0]C0,C1,C2,C3,C4,C5,C6,C7;// coefficient matrix values
    wire [21:0]done_mul;
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
    temp_store TS(.Data_in(Data_in[15:0]),.mem_select(mem_select[7:0]),.clr(clr),
                  .C0(C0[15:0]),.C1(C1[15:0]),.C2(C2[15:0]),.C3(C3[15:0]),
                  .C4(C4[15:0]),.C5(C5[15:0]),.C6(C6[15:0]),.C7(C7[15:0]));
    //rpq[15:0] => rpq[15:0] contributes in finding out the value of Fp[15:0] 
    //             rpq[15:0] is obtained from multiplication of precalculated values with Cq
    // Get Y[0] = (s07341625*C4);
    Booth_Multiplier F00(.A(s07341625[15:0]),  .B(C0),.start(start),.rst(enDCT),.clk(clk),       .R(r00[15:0]),.done(done_mul[0]));
    // Get Y[1] = (s0_7*C1) + (s1_6*C3) + (s2_5*C5) + (s3_4*C7);
    Booth_Multiplier M11(.A(s0_7[15:0]),       .B(C1),.start(start),.rst(enDCT),.clk(clk),        .R(r11[15:0]),.done(done_mul[1]));
    Booth_Multiplier M13(.A(s1_6[15:0]),       .B(C3),.start(start),.rst(enDCT),.clk(clk),        .R(r13[15:0]),.done(done_mul[2]));
    Booth_Multiplier M15(.A(s2_5[15:0]),       .B(C5),.start(start),.rst(enDCT),.clk(clk),        .R(r15[15:0]),.done(done_mul[3]));
    Booth_Multiplier M17(.A(s3_4[15:0]),       .B(C7),.start(start),.rst(enDCT),.clk(clk),        .R(r17[15:0]),.done(done_mul[4]));
    // Get Y[2] = (s07_34*C2) + (s16_25*C6);
    Booth_Multiplier M22(.A(s07_34[15:0]),     .B(C2),.start(start),.rst(enDCT),.clk(clk),        .R(r22[15:0]),.done(done_mul[5]));
    Booth_Multiplier M26(.A(s16_25[15:0]),     .B(C6),.start(start),.rst(enDCT),.clk(clk),        .R(r26[15:0]),.done(done_mul[6]));
    //Get Y[3] = (s0_7*C3) - (s1_6*C7) - (s2_5*C1) - (s3_4*C5);
    Booth_Multiplier M33(.A(s0_7[15:0]),       .B(C3),.start(start),.rst(enDCT),.clk(clk),        .R(r33[15:0]),.done(done_mul[7]));
    Booth_Multiplier M37(.A(s1_6[15:0]),       .B(C7),.start(start),.rst(enDCT),.clk(clk),        .R(r37[15:0]),.done(done_mul[8]));
    Booth_Multiplier M31(.A(s2_5[15:0]),       .B(C1),.start(start),.rst(enDCT),.clk(clk),        .R(r31[15:0]),.done(done_mul[9]));
    Booth_Multiplier M35(.A(s3_4[15:0]),       .B(C5),.start(start),.rst(enDCT),.clk(clk),        .R(r35[15:0]),.done(done_mul[10]));
    // Get Y[4] = (s0734_1625*C4);
    Booth_Multiplier F04(.A(s0734_1625[15:0]), .B(C4),.start(start),.rst(enDCT),.clk(clk), .R(r44[15:0]),.done(done_mul[11]));
    // Get Y[5] = (s0_7*C5) - (s1_6*C1) + (s2_5*C7) + (s3_4*C3);
    Booth_Multiplier M55(.A(s0_7[15:0]),       .B(C5),.start(start),.rst(enDCT),.clk(clk),        .R(r55[15:0]),.done(done_mul[12]));
    Booth_Multiplier M51(.A(s1_6[15:0]),       .B(C1),.start(start),.rst(enDCT),.clk(clk),        .R(r51[15:0]),.done(done_mul[13]));
    Booth_Multiplier M57(.A(s2_5[15:0]),       .B(C7),.start(start),.rst(enDCT),.clk(clk),        .R(r57[15:0]),.done(done_mul[14]));
    Booth_Multiplier M53(.A(s3_4[15:0]),       .B(C3),.start(start),.rst(enDCT),.clk(clk),        .R(r53[15:0]),.done(done_mul[15]));
    // Get Y[6] = (s07_34*C6) - (s16_25*C2);
    Booth_Multiplier M66(.A(s07_34[15:0]),     .B(C6),.start(start),.rst(enDCT),.clk(clk),        .R(r66[15:0]),.done(done_mul[16]));
    Booth_Multiplier M62(.A(s16_25[15:0]),     .B(C2),.start(start),.rst(enDCT),.clk(clk),        .R(r62[15:0]),.done(done_mul[17]));
    // Get Y[7] = (s0_7*C7) - (s1_6*C5) + (s2_5*C3) - (s3_4*C1);
    Booth_Multiplier M77(.A(s0_7[15:0]),       .B(C7),.start(start),.rst(enDCT),.clk(clk),        .R(r77[15:0]),.done(done_mul[18]));
    Booth_Multiplier M75(.A(s1_6[15:0]),       .B(C5),.start(start),.rst(enDCT),.clk(clk),        .R(r75[15:0]),.done(done_mul[19]));
    Booth_Multiplier M73(.A(s2_5[15:0]),       .B(C3),.start(start),.rst(enDCT),.clk(clk),        .R(r73[15:0]),.done(done_mul[20]));
    Booth_Multiplier M71(.A(s3_4[15:0]),       .B(C1),.start(start),.rst(enDCT),.clk(clk),        .R(r71[15:0]),.done(done_mul[21]));
    //
    and(done,done_mul[0],done_mul[1],done_mul[2],done_mul[3],done_mul[4],done_mul[5],done_mul[6],done_mul[7],done_mul[8],done_mul[9],done_mul[10],done_mul[11],done_mul[12],done_mul[13],done_mul[14],done_mul[15],done_mul[16],done_mul[17],done_mul[18],done_mul[19],done_mul[20],done_mul[21]);
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

module temp_store(
     input [15:0]Data_in,
     input [7:0]mem_select,
     input clr,
     output [15:0]C0,C1,C2,C3,C4,C5,C6,C7
     );
PIPO_reg L0(Data_in,mem_select[0],clr,C0);
PIPO_reg L1(Data_in,mem_select[1],clr,C1);
PIPO_reg L2(Data_in,mem_select[2],clr,C2);
PIPO_reg L3(Data_in,mem_select[3],clr,C3);
PIPO_reg L4(Data_in,mem_select[4],clr,C4);
PIPO_reg L5(Data_in,mem_select[5],clr,C5);
PIPO_reg L6(Data_in,mem_select[6],clr,C6);
PIPO_reg L7(Data_in,mem_select[7],clr,C7);
endmodule