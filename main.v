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


module main(
    // 1Bit sign, 8Bit for integeral part, 7Bit for fractional part
    input [7:0] y0,
    input [7:0] y1,
    input [7:0] y2,
    input [7:0] y3,
    input [7:0] y4,
    input [7:0] y5,
    input [7:0] y6,
    input [7:0] y7,
    // 1Bit sign, 8Bit for integeral part, 7Bit for fractional part
    output [15:0] Y0,
    output [15:0] Y1,
    output [15:0] Y2,
    output [15:0] Y3,
    output [15:0] Y4,
    output [15:0] Y5,
    output [15:0] Y6,
    output [15:0] Y7
    );
    //
//    reg [8:0]f0,f1,f2,f3,f4,f5,f6,f7;
    wire [9:0]compy4,compy5,compy6,compy7,comps34,comps25,comps1625; //complemented values for subtraction
    wire [9:0]t0_7,t1_6,t2_5,t3_4,t07_34,t16_25,t0734_1625; //temp values
    wire c0_7,c1_6,c2_5,c3_4,c07_34,c16_25,c0734_1625; //carry bits after subtraction
    wire [9:0]compt0_7,compt1_6,compt2_5,compt3_4,compt07_34,compt16_25,compt0734_1625; //complemented temp values
    wire p0_7,p1_6,p2_5,p3_4,p07_34,p16_25,p0734_1625; //sign/polarity bits after subtraction
    wire [9:0]s07,s16,s25,s34,s0_7,s1_6,s2_5,s3_4,s0734,s1625,s07_34,s16_25,s07341625,s0734_1625;//final values
    //
    wire [7:0]C0,C1,C2,C3,C4,C5,C6,C7;
    //
    wire [22:0]R0,R1,R2,R3,R4,R5,R6,R7;
    //
    assign C0 = 8'b10110101;
    assign C1 = 8'b11111011;
    assign C2 = 8'b11101100;
    assign C3 = 8'b11010100;
    assign C4 = 8'b10110101;
    assign C5 = 8'b10001110;
    assign C6 = 8'b11000011;
    assign C7 = 8'b11000111;
    //
    //Precalculations Started
    //ADDITION s07,s16,s25,s34
    adder10 S07(.a({2'b00,y0[7:0]}),  .b({2'b00,y7[7:0]}), .cin(1'b0),  .sum(s07[9:0]), .carry());
    adder10 S16(.a({2'b00,y1[7:0]}),  .b({2'b00,y6[7:0]}), .cin(1'b0),  .sum(s16[9:0]), .carry());
    adder10 S25(.a({2'b00,y2[7:0]}),  .b({2'b00,y5[7:0]}), .cin(1'b0),  .sum(s25[9:0]), .carry());
    adder10 S34(.a({2'b00,y3[7:0]}),  .b({2'b00,y4[7:0]}), .cin(1'b0),  .sum(s34[9:0]), .carry());
    //ADDITION completed
    //
    //SUBTRACTION s0_7,s1_6,s2_5,s3_4
    complement (.I({2'b00,y4[7:0]}),.X(1'b1),.O(compy4[9:0]));
    complement (.I({2'b00,y5[7:0]}),.X(1'b1),.O(compy5[9:0]));
    complement (.I({2'b00,y6[7:0]}),.X(1'b1),.O(compy6[9:0]));
    complement (.I({2'b00,y7[7:0]}),.X(1'b1),.O(compy7[9:0]));
    adder10 T0_7(.a({2'b00,y0[7:0]}),  .b(compy7[9:0]), .cin(1'b1),  .sum(t0_7[9:0]), .carry(c0_7));
    adder10 T1_6(.a({2'b00,y1[7:0]}),  .b(compy6[9:0]), .cin(1'b1),  .sum(t1_6[9:0]), .carry(c1_6));
    adder10 T2_5(.a({2'b00,y2[7:0]}),  .b(compy5[9:0]), .cin(1'b1),  .sum(t2_5[9:0]), .carry(c2_5));
    adder10 T3_4(.a({2'b00,y3[7:0]}),  .b(compy4[9:0]), .cin(1'b1),  .sum(t3_4[9:0]), .carry(c3_4));
    //Result can be negative
    not(p0_7,c0_7);
    not(p1_6,c1_6);
    not(p2_5,c2_5);
    not(p3_4,c3_4);
    complement (.I({t0_7[9:0]}),.X(p0_7),.O(compt0_7[9:0]));
    complement (.I({t1_6[9:0]}),.X(p1_6),.O(compt1_6[9:0]));
    complement (.I({t2_5[9:0]}),.X(p2_5),.O(compt2_5[9:0]));
    complement (.I({t3_4[9:0]}),.X(p3_4),.O(compt3_4[9:0]));
    adder10 S0_7(.a(compt0_7[9:0]),  .b(10'd0), .cin(p0_7),  .sum(s0_7[9:0]), .carry());
    adder10 S1_6(.a(compt1_6[9:0]),  .b(10'd0), .cin(p1_6),  .sum(s1_6[9:0]), .carry());
    adder10 S2_5(.a(compt2_5[9:0]),  .b(10'd0), .cin(p2_5),  .sum(s2_5[9:0]), .carry());
    adder10 S3_4(.a(compt3_4[9:0]),  .b(10'd0), .cin(p3_4),  .sum(s3_4[9:0]), .carry());
    //SUBTRACTION completed
    //
    //ADDITION s0734,s1625
    adder10 S0734(.a(s07[9:0]),  .b(s34[9:0]), .cin(1'b0),  .sum(s0734[9:0]), .carry());
    adder10 S1625(.a(s16[9:0]),  .b(s25[9:0]), .cin(1'b0),  .sum(s1625[9:0]), .carry());
    //ADDITION completed
    //
    //SUBTRACTION s07_34,s16_25
    complement (.I(s34[9:0]),.X(1'b1),.O(comps34[9:0]));
    complement (.I(s25[9:0]),.X(1'b1),.O(comps25[9:0]));
    adder10 T07_34(.a(s07[9:0]),  .b(comps34[9:0]), .cin(1'b1),  .sum(t07_34[9:0]), .carry(c07_34));
    adder10 T16_25(.a(s16[9:0]),  .b(comps25[9:0]), .cin(1'b1),  .sum(t16_25[9:0]), .carry(c16_25));
    //Result can be negative
    not(p07_34,c07_34);
    not(p16_25,c16_25);
    complement (.I(t07_34[9:0]),.X(p07_34),.O(compt07_34[9:0]));
    complement (.I(t16_25[9:0]),.X(p16_25),.O(compt16_25[9:0]));
    adder10 S07_34(.a(compt07_34[9:0]),  .b(10'd0), .cin(p07_34),  .sum(s07_34[9:0]), .carry());
    adder10 S16_25(.a(compt16_25[9:0]),  .b(10'd0), .cin(p16_25),  .sum(s16_25[9:0]), .carry());
    //SUBTRACTION completed
    //
    //ADDITION s07341625
    adder10 S07341625 (.a(s0734[9:0]),  .b(s1625[9:0]), .cin(1'b0),  .sum(s07341625[9:0]),  .carry());
    //SUBTRACTION s0734_1625
    complement (.I(s1625[9:0]),.X(1'b1),.O(comps1625[9:0]));
    adder10 T0734_1625(.a(s0734[9:0]),  .b(comps1625[9:0]), .cin(1'b1),  .sum(t0734_1625[9:0]), .carry(c0734_1625));
    //Result can be negative
    not(p0734_1625,c0734_1625);
    complement (.I(t0734_1625[9:0]),.X(p0734_1625),.O(compt0734_1625[9:0]));
    adder10 S0734_1625(.a(compt0734_1625[9:0]),  .b(10'd0), .cin(p0734_1625),  .sum(s0734_1625[9:0]), .carry());
    //SUBTRACTION completed
    //Precalculation Completed
    //
    //Multiplication with coefficients
    multiply M1(.A(),.B(),.R(),.signR());
    assign R1 = (s0_7*C1) + (s1_6*C3) + (s2_5*C5) + (s3_4*C7);
    assign R2 = (s07_34*C2) + (s16_25*C6);
    assign R3 = (s0_7*C3) - (s1_6*C7) - (s2_5*C1) - (s3_4*C5);
    assign R4 = (s0734_1625*C4);
    assign R5 = (s0_7*C5) - (s1_6*C1) - (s2_5*C7) - (s3_4*C3);
    assign R6 = (s07_34*C6) - (s16_25*C2);
    assign R7 = (s0_7*C7) - (s1_6*C5) + (s2_5*C3) - (s3_4*C1);
    //
//    assign F0 = R0>>2'b11;
//    assign F1 = R1>>2'b11;
//    assign F2 = R2>>2'b11;
//    assign F3 = R3>>2'b11;
//    assign F4 = R4>>2'b11;
//    assign F5 = R5>>2'b11;
//    assign F6 = R6>>2'b11;
//    assign F7 = R7>>2'b11;
    
endmodule
