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
module main(
    input [15:0] y0,y1,y2,y3,y4,y5,y6,y7,
    output [15:0] Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7
    );
    //
    wire [15:0]s07,s16,s25,s34,s0_7,s1_6,s2_5,s3_4,s0734,s1625,s07_34,s16_25,s07341625,s0734_1625;//final values
    //
    wire [15:0]C0,C1,C2,C3,C4,C5,C6,C7;// coefficient matrix values
    //
    wire [15:0]r11,r13,r15,r17,sum13,sum57;
    wire [15:0]r22,r26;
    wire [15:0]r33,r37,r31,r35,sum37,sum15;
    wire [15:0]r44;
    wire [15:0]r55,r51,r57,r53,sum51,sum73;
    wire [15:0]r66,r62;
    wire [15:0]r77,r75,r73,r71,sum75,sum31;
    //
    // Taking only fractional part with positive sign bit
    //     Sign Bit      Fractional Part
    //      1-Bit     .   15-Bits
    assign C0 = 16'b0010110101000001; // 0.5 * cos(4pi/16) => 0.35355339059 => in binary => 0.0101101010000010
    assign C1 = 16'b0011111011000101; // 0.5 * cos(1pi/16) => 0.49039264020 => in binary => 0.0111110110001010
    assign C2 = 16'b0011101100100000; // 0.5 * cos(2pi/16) => 0.46193976625 => in binary => 0.0111011001000001
    assign C3 = 16'b0011010100110110; // 0.5 * cos(3pi/16) => 0.41573480615 => in binary => 0.0110101001101101
    assign C4 = 16'b0010110101000001; // 0.5 * cos(4pi/16) => 0.35355339059 => in binary => 0.0101101010000010
    assign C5 = 16'b0010001110001110; // 0.5 * cos(5pi/16) => 0.27778511651 => in binary => 0.0100011100011100
    assign C6 = 16'b0001100001111101; // 0.5 * cos(6pi/16) => 0.19134171618 => in binary => 0.0011000011111011
    assign C7 = 16'b0000110001111100; // 0.5 * cos(7pi/16) => 0.09754516101 => in binary => 0.0001100011111000
    //
    //Precalculations Started
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
    //Precalculation Completed
    //
    // Get Y[0] = (s07341625*C4);
    Multiply_Block F00(.A(s07341625[15:0]),  .B(C4),       .R(Y0[15:0]));
    // Get Y[1] = (s0_7*C1) + (s1_6*C3) + (s2_5*C5) + (s3_4*C7);
    Multiply_Block M11(.A(s0_7[15:0]),       .B(C1),       .R(r11[15:0]));
    Multiply_Block M13(.A(s1_6[15:0]),       .B(C3),       .R(r13[15:0]));
    Multiply_Block M15(.A(s2_5[15:0]),       .B(C5),       .R(r15[15:0]));
    Multiply_Block M17(.A(s3_4[15:0]),       .B(C7),       .R(r17[15:0]));
    Adder_Block A13(.A(r11[15:0]),   .B(r13[15:0]),   .operation(1'b0), .R(sum13[15:0]));
    Adder_Block A57(.A(r15[15:0]),   .B(r17[15:0]),   .operation(1'b0), .R(sum57[15:0]));
    Adder_Block F01(.A(sum13[15:0]), .B(sum57[15:0]), .operation(1'b0), .R(Y1[15:0]));
    // Get Y[2] = (s07_34*C2) + (s16_25*C6);
    Multiply_Block M22(.A(s07_34[15:0]),     .B(C2),       .R(r22[15:0]));
    Multiply_Block M26(.A(s16_25[15:0]),     .B(C6),       .R(r26[15:0]));
    Adder_Block F02(.A(r22[15:0]),   .B(r26[15:0]),   .operation(1'b0), .R(Y2[15:0]));
    //Get Y[3] = (s0_7*C3) - (s1_6*C7) - (s2_5*C1) - (s3_4*C5);
    Multiply_Block M33(.A(s0_7[15:0]),       .B(C3),       .R(r33[15:0]));
    Multiply_Block M37(.A(s1_6[15:0]),       .B(C7),       .R(r37[15:0]));
    Multiply_Block M31(.A(s2_5[15:0]),       .B(C1),       .R(r31[15:0]));
    Multiply_Block M35(.A(s3_4[15:0]),       .B(C5),       .R(r35[15:0]));
    Adder_Block A37(.A(r33[15:0]),   .B(r37[15:0]),   .operation(1'b1), .R(sum37[15:0]));
    Adder_Block A15(.A(r31[15:0]),   .B(r35[15:0]),   .operation(1'b0), .R(sum15[15:0]));
    Adder_Block F03(.A(sum37[15:0]), .B(sum15[15:0]), .operation(1'b1), .R(Y3[15:0]));
    // Get Y[4] = (s0734_1625*C4);
    Multiply_Block F04(.A(s0734_1625[15:0]), .B({1'b0,C4}),       .R(Y4[15:0]));
    // Get Y[5] = (s0_7*C5) - (s1_6*C1) + (s2_5*C7) + (s3_4*C3);
    Multiply_Block M55(.A(s0_7[15:0]),       .B(C5),       .R(r55[15:0]));
    Multiply_Block M51(.A(s1_6[15:0]),       .B(C1),       .R(r51[15:0]));
    Multiply_Block M57(.A(s2_5[15:0]),       .B(C7),       .R(r57[15:0]));
    Multiply_Block M53(.A(s3_4[15:0]),       .B(C3),       .R(r53[15:0]));
    Adder_Block A51(.A(r55[15:0]),   .B(r51[15:0]),   .operation(1'b1), .R(sum51[15:0]));
    Adder_Block A73(.A(r57[15:0]),   .B(r53[15:0]),   .operation(1'b0), .R(sum73[15:0]));
    Adder_Block F05(.A(sum51[15:0]), .B(sum73[15:0]), .operation(1'b0), .R(Y5[15:0]));
    // Get Y[6] = (s07_34*C6) - (s16_25*C2);
    Multiply_Block M66(.A(s07_34[15:0]),     .B(C6),       .R(r66[15:0]));
    Multiply_Block M62(.A(s16_25[15:0]),     .B(C2),       .R(r62[15:0]));
    Adder_Block F06(.A(r66[15:0]),   .B(r62[15:0]),   .operation(1'b1), .R(Y6[15:0]));
    // Get Y[7] = (s0_7*C7) - (s1_6*C5) + (s2_5*C3) - (s3_4*C1);
    Multiply_Block M77(.A(s0_7[15:0]),       .B(C7),       .R(r77[15:0]));
    Multiply_Block M75(.A(s1_6[15:0]),       .B(C5),       .R(r75[15:0]));
    Multiply_Block M73(.A(s2_5[15:0]),       .B(C3),       .R(r73[15:0]));
    Multiply_Block M71(.A(s3_4[15:0]),       .B(C1),       .R(r71[15:0]));
    Adder_Block A75(.A(r77[15:0]),   .B(r75[15:0]),   .operation(1'b1), .R(sum75[15:0]));
    Adder_Block A31(.A(r73[15:0]),   .B(r71[15:0]),   .operation(1'b1), .R(sum31[15:0]));
    Adder_Block F07(.A(sum75[15:0]), .B(sum31[15:0]), .operation(1'b0), .R(Y7[15:0]));
    //
    // 1D DCT ENDS HERE
endmodule
