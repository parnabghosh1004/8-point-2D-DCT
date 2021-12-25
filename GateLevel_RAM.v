`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:39 12/25/2021 
// Design Name: 
// Module Name:    GateLevel_RAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GateLevel_RAM(
    input [5:0]addr,
	 input [15:0]din,
    input clk, 
	 input write_enable,
    output [15:0]dout
    );
	 
	 wire we_bar;
	 reg [15:0]r0;
    reg [15:0]r1;
	 reg [15:0]r2; 
	 reg [15:0]r3;
    reg [15:0]r4;
    reg [15:0]r5;
	 reg [15:0]r6; 
	 reg [15:0]r7;
	 reg [15:0]r8;
	 reg [15:0]r9;
	 reg [15:0]r10;
	 reg [15:0]r11;
	 reg [15:0]r12;
	 reg [15:0]r13;
	 reg [15:0]r14;
	 reg [15:0]r15;
	 reg [15:0]r16;
	 reg [15:0]r17;
	 reg [15:0]r18;
	 reg [15:0]r19;
	 reg [15:0]r20;
	 reg [15:0]r21;
	 reg [15:0]r22;
	 reg [15:0]r23;
	 reg [15:0]r24;
	 reg [15:0]r25;
	 reg [15:0]r26;
	 reg [15:0]r27;
	 reg [15:0]r28;
	 reg [15:0]r29;
	 reg [15:0]r30;
	 reg [15:0]r31;
	 reg [15:0]r32;
	 reg [15:0]r33;
	 reg [15:0]r34;
	 reg [15:0]r35;
	 reg [15:0]r36;
	 reg [15:0]r37;
	 reg [15:0]r38;
	 reg [15:0]r39;
	 reg [15:0]r40;
    reg [15:0]r41;
	 reg [15:0]r42; 
	 reg [15:0]r43;
    reg [15:0]r44;
    reg [15:0]r45;
	 reg [15:0]r46; 
	 reg [15:0]r47;
	 reg [15:0]r48;
	 reg [15:0]r49;
	 reg [15:0]r50;
	 reg [15:0]r51;
	 reg [15:0]r52;
	 reg [15:0]r53;
	 reg [15:0]r54;
	 reg [15:0]r55;
	 reg [15:0]r56;
	 reg [15:0]r57;
	 reg [15:0]r58;
	 reg [15:0]r59;
	 reg [15:0]r60;
	 reg [15:0]r61;
	 reg [15:0]r62;
	 reg [15:0]r63;
	 reg [63:0]sel;
	 
	 not(we_bar, write_enable);
	 
	 decoder_6x64 d1(addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], 1'b1, sel);
	 
	 register_16bit R0(.din(din),.sel(sel[0]),.read_wr(we_bar),.dout(r0));
	 register_16bit R1(.din(din),.sel(sel[1]),.read_wr(we_bar),.dout(r1));
	 register_16bit R2(.din(din),.sel(sel[2]),.read_wr(we_bar),.dout(r2));
	 register_16bit R3(.din(din),.sel(sel[3]),.read_wr(we_bar),.dout(r3));
	 register_16bit R4(.din(din),.sel(sel[4]),.read_wr(we_bar),.dout(r4));
	 register_16bit R5(.din(din),.sel(sel[5]),.read_wr(we_bar),.dout(r5));
	 register_16bit R6(.din(din),.sel(sel[6]),.read_wr(we_bar),.dout(r6));
	 register_16bit R7(.din(din),.sel(sel[7]),.read_wr(we_bar),.dout(r7));
	 register_16bit R8(.din(din),.sel(sel[8]),.read_wr(we_bar),.dout(r8));
	 register_16bit R9(.din(din),.sel(sel[9]),.read_wr(we_bar),.dout(r9));
	 register_16bit R10(.din(din),.sel(sel[10]),.read_wr(we_bar),.dout(r10));
	 register_16bit R11(.din(din),.sel(sel[11]),.read_wr(we_bar),.dout(r11));
	 register_16bit R12(.din(din),.sel(sel[12]),.read_wr(we_bar),.dout(r12));
	 register_16bit R13(.din(din),.sel(sel[13]),.read_wr(we_bar),.dout(r13));
	 register_16bit R14(.din(din),.sel(sel[14]),.read_wr(we_bar),.dout(r14));
	 register_16bit R15(.din(din),.sel(sel[15]),.read_wr(we_bar),.dout(r15));
	 register_16bit R16(.din(din),.sel(sel[16]),.read_wr(we_bar),.dout(r16));
	 register_16bit R17(.din(din),.sel(sel[17]),.read_wr(we_bar),.dout(r17));
	 register_16bit R18(.din(din),.sel(sel[18]),.read_wr(we_bar),.dout(r18));
	 register_16bit R19(.din(din),.sel(sel[19]),.read_wr(we_bar),.dout(r19));
	 register_16bit R20(.din(din),.sel(sel[20]),.read_wr(we_bar),.dout(r20));
	 register_16bit R21(.din(din),.sel(sel[21]),.read_wr(we_bar),.dout(r21));
	 register_16bit R22(.din(din),.sel(sel[22]),.read_wr(we_bar),.dout(r22));
	 register_16bit R23(.din(din),.sel(sel[23]),.read_wr(we_bar),.dout(r23));
	 register_16bit R24(.din(din),.sel(sel[24]),.read_wr(we_bar),.dout(r24));
	 register_16bit R25(.din(din),.sel(sel[25]),.read_wr(we_bar),.dout(r25));
	 register_16bit R26(.din(din),.sel(sel[26]),.read_wr(we_bar),.dout(r26));
	 register_16bit R27(.din(din),.sel(sel[27]),.read_wr(we_bar),.dout(r27));
	 register_16bit R28(.din(din),.sel(sel[28]),.read_wr(we_bar),.dout(r28));
	 register_16bit R29(.din(din),.sel(sel[29]),.read_wr(we_bar),.dout(r29));
	 register_16bit R30(.din(din),.sel(sel[30]),.read_wr(we_bar),.dout(r30));
	 register_16bit R31(.din(din),.sel(sel[31]),.read_wr(we_bar),.dout(r31));
	 register_16bit R32(.din(din),.sel(sel[32]),.read_wr(we_bar),.dout(r32));
	 register_16bit R33(.din(din),.sel(sel[33]),.read_wr(we_bar),.dout(r33));
	 register_16bit R34(.din(din),.sel(sel[34]),.read_wr(we_bar),.dout(r34));
	 register_16bit R35(.din(din),.sel(sel[35]),.read_wr(we_bar),.dout(r35));
	 register_16bit R36(.din(din),.sel(sel[36]),.read_wr(we_bar),.dout(r36));
	 register_16bit R37(.din(din),.sel(sel[37]),.read_wr(we_bar),.dout(r37));
	 register_16bit R38(.din(din),.sel(sel[38]),.read_wr(we_bar),.dout(r38));
	 register_16bit R39(.din(din),.sel(sel[39]),.read_wr(we_bar),.dout(r39));
	 register_16bit R40(.din(din),.sel(sel[40]),.read_wr(we_bar),.dout(r40));
	 register_16bit R41(.din(din),.sel(sel[41]),.read_wr(we_bar),.dout(r41));
	 register_16bit R42(.din(din),.sel(sel[42]),.read_wr(we_bar),.dout(r42));
	 register_16bit R43(.din(din),.sel(sel[43]),.read_wr(we_bar),.dout(r43));
	 register_16bit R44(.din(din),.sel(sel[44]),.read_wr(we_bar),.dout(r44));
	 register_16bit R45(.din(din),.sel(sel[45]),.read_wr(we_bar),.dout(r45));
	 register_16bit R46(.din(din),.sel(sel[46]),.read_wr(we_bar),.dout(r46));
	 register_16bit R47(.din(din),.sel(sel[47]),.read_wr(we_bar),.dout(r47));
	 register_16bit R48(.din(din),.sel(sel[48]),.read_wr(we_bar),.dout(r48));
	 register_16bit R49(.din(din),.sel(sel[49]),.read_wr(we_bar),.dout(r49));
	 register_16bit R50(.din(din),.sel(sel[50]),.read_wr(we_bar),.dout(r50));
	 register_16bit R51(.din(din),.sel(sel[51]),.read_wr(we_bar),.dout(r51));
	 register_16bit R52(.din(din),.sel(sel[52]),.read_wr(we_bar),.dout(r52));
	 register_16bit R53(.din(din),.sel(sel[53]),.read_wr(we_bar),.dout(r53));
	 register_16bit R54(.din(din),.sel(sel[54]),.read_wr(we_bar),.dout(r54));
	 register_16bit R55(.din(din),.sel(sel[55]),.read_wr(we_bar),.dout(r55));
	 register_16bit R56(.din(din),.sel(sel[56]),.read_wr(we_bar),.dout(r56));
	 register_16bit R57(.din(din),.sel(sel[57]),.read_wr(we_bar),.dout(r57));
	 register_16bit R58(.din(din),.sel(sel[58]),.read_wr(we_bar),.dout(r58));
	 register_16bit R59(.din(din),.sel(sel[59]),.read_wr(we_bar),.dout(r59));
	 register_16bit R60(.din(din),.sel(sel[60]),.read_wr(we_bar),.dout(r60));
	 register_16bit R61(.din(din),.sel(sel[61]),.read_wr(we_bar),.dout(r61));
	 register_16bit R62(.din(din),.sel(sel[62]),.read_wr(we_bar),.dout(r62));
	 register_16bit R63(.din(din),.sel(sel[63]),.read_wr(we_bar),.dout(r63));
	 
	 mux_64x1 m1(r0[0], r1[0], r2[0], r3[0], r4[0], r5[0], r6[0], r7[0], r8[0], r9[0], r10[0], r11[0], r12[0], r13[0], r14[0], r15[0], r16[0], r17[0], r18[0], r19[0], r20[0], r21[0], r22[0], r23[0], r24[0], r25[0], r26[0], r27[0], r28[0], r29[0], r30[0], r31[0], r32[0], r33[0], r34[0], r35[0], r36[0], r37[0], r38[0], r39[0], r40[0], r41[0], r42[0], r43[0], r44[0], r45[0], r46[0], r47[0], r48[0], r49[0], r50[0], r51[0], r52[0], r53[0], r54[0], r56[0], r57[0], r58[0], r59[0], r60[0], r61[0], r62[0], r63[0], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[0]);
	 mux_64x1 m2(r0[1], r1[1], r2[1], r3[1], r4[1], r5[1], r6[1], r7[1], r8[1], r9[1], r10[1], r11[1], r12[1], r13[1], r14[1], r15[1], r16[1], r17[1], r18[1], r19[1], r20[1], r21[1], r22[1], r23[1], r24[1], r25[1], r26[1], r27[1], r28[1], r29[1], r30[1], r31[1], r32[1], r33[1], r34[1], r35[1], r36[1], r37[1], r38[1], r39[1], r40[1], r41[1], r42[1], r43[1], r44[1], r45[1], r46[1], r47[1], r48[1], r49[1], r50[1], r51[1], r52[1], r53[1], r54[1], r56[1], r57[1], r58[1], r59[1], r60[1], r61[1], r62[1], r63[1], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[1]);
	 mux_64x1 m3(r0[2], r1[2], r2[2], r3[2], r4[2], r5[2], r6[2], r7[2], r8[2], r9[2], r10[2], r11[2], r12[2], r13[2], r14[2], r15[2], r16[2], r17[2], r18[2], r19[2], r20[2], r21[2], r22[2], r23[2], r24[2], r25[2], r26[2], r27[2], r28[2], r29[2], r30[2], r31[2], r32[2], r33[2], r34[2], r35[2], r36[2], r37[2], r38[2], r39[2], r40[2], r41[2], r42[2], r43[2], r44[2], r45[2], r46[2], r47[2], r48[2], r49[2], r50[2], r51[2], r52[2], r53[2], r54[2], r56[2], r57[2], r58[2], r59[2], r60[2], r61[2], r62[2], r63[2], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[2]);
	 mux_64x1 m4(r0[3], r1[3], r2[3], r3[3], r4[3], r5[3], r6[3], r7[3], r8[3], r9[3], r10[3], r11[3], r12[3], r13[3], r14[3], r15[3], r16[3], r17[3], r18[3], r19[3], r20[3], r21[3], r22[3], r23[3], r24[3], r25[3], r26[3], r27[3], r28[3], r29[3], r30[3], r31[3], r32[3], r33[3], r34[3], r35[3], r36[3], r37[3], r38[3], r39[3], r40[3], r41[3], r42[3], r43[3], r44[3], r45[3], r46[3], r47[3], r48[3], r49[3], r50[3], r51[3], r52[3], r53[3], r54[3], r56[3], r57[3], r58[3], r59[3], r60[3], r61[3], r62[3], r63[3], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[3]);
	 mux_64x1 m5(r0[4], r1[4], r2[4], r3[4], r4[4], r5[4], r6[4], r7[4], r8[4], r9[4], r10[4], r11[4], r12[4], r13[4], r14[4], r15[4], r16[4], r17[4], r18[4], r19[4], r20[4], r21[4], r22[4], r23[4], r24[4], r25[4], r26[4], r27[4], r28[4], r29[4], r30[4], r31[4], r32[4], r33[4], r34[4], r35[4], r36[4], r37[4], r38[4], r39[4], r40[4], r41[4], r42[4], r43[4], r44[4], r45[4], r46[4], r47[4], r48[4], r49[4], r50[4], r51[4], r52[4], r53[4], r54[4], r56[4], r57[4], r58[4], r59[4], r60[4], r61[4], r62[4], r63[4], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[4]);
	 mux_64x1 m6(r0[5], r1[5], r2[5], r3[5], r4[5], r5[5], r6[5], r7[5], r8[5], r9[5], r10[5], r11[5], r12[5], r13[5], r14[5], r15[5], r16[5], r17[5], r18[5], r19[5], r20[5], r21[5], r22[5], r23[5], r24[5], r25[5], r26[5], r27[5], r28[5], r29[5], r30[5], r31[5], r32[5], r33[5], r34[5], r35[5], r36[5], r37[5], r38[5], r39[5], r40[5], r41[5], r42[5], r43[5], r44[5], r45[5], r46[5], r47[5], r48[5], r49[5], r50[5], r51[5], r52[5], r53[5], r54[5], r56[5], r57[5], r58[5], r59[5], r60[5], r61[5], r62[5], r63[5], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[5]);
	 mux_64x1 m7(r0[6], r1[6], r2[6], r3[6], r4[6], r5[6], r6[6], r7[6], r8[6], r9[6], r10[6], r11[6], r12[6], r13[6], r14[6], r15[6], r16[6], r17[6], r18[6], r19[6], r20[6], r21[6], r22[6], r23[6], r24[6], r25[6], r26[6], r27[6], r28[6], r29[6], r30[6], r31[6], r32[6], r33[6], r34[6], r35[6], r36[6], r37[6], r38[6], r39[6], r40[6], r41[6], r42[6], r43[6], r44[6], r45[6], r46[6], r47[6], r48[6], r49[6], r50[6], r51[6], r52[6], r53[6], r54[6], r56[6], r57[6], r58[6], r59[6], r60[6], r61[6], r62[6], r63[6], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[6]);
	 mux_64x1 m8(r0[7], r1[7], r2[7], r3[7], r4[7], r5[7], r6[7], r7[7], r8[7], r9[7], r10[7], r11[7], r12[7], r13[7], r14[7], r15[7], r16[7], r17[7], r18[7], r19[7], r20[7], r21[7], r22[7], r23[7], r24[7], r25[7], r26[7], r27[7], r28[7], r29[7], r30[7], r31[7], r32[7], r33[7], r34[7], r35[7], r36[7], r37[7], r38[7], r39[7], r40[7], r41[7], r42[7], r43[7], r44[7], r45[7], r46[7], r47[7], r48[7], r49[7], r50[7], r51[7], r52[7], r53[7], r54[7], r56[7], r57[7], r58[7], r59[7], r60[7], r61[7], r62[7], r63[7], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[7]);
	 mux_64x1 m9(r0[8], r1[8], r2[8], r3[8], r4[8], r5[8], r6[8], r7[8], r8[8], r9[8], r10[8], r11[8], r12[8], r13[8], r14[8], r15[8], r16[8], r17[8], r18[8], r19[8], r20[8], r21[8], r22[8], r23[8], r24[8], r25[8], r26[8], r27[8], r28[8], r29[8], r30[8], r31[8], r32[8], r33[8], r34[8], r35[8], r36[8], r37[8], r38[8], r39[8], r40[8], r41[8], r42[8], r43[8], r44[8], r45[8], r46[8], r47[8], r48[8], r49[8], r50[8], r51[8], r52[8], r53[8], r54[8], r56[8], r57[8], r58[8], r59[8], r60[8], r61[8], r62[8], r63[8], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[8]);
	 mux_64x1 m10(r0[9], r1[9], r2[9], r3[9], r4[9], r5[9], r6[9], r7[9], r8[9], r9[9], r10[9], r11[9], r12[9], r13[9], r14[9], r15[9], r16[9], r17[9], r18[9], r19[9], r20[9], r21[9], r22[9], r23[9], r24[9], r25[9], r26[9], r27[9], r28[9], r29[9], r30[9], r31[9], r32[9], r33[9], r34[9], r35[9], r36[9], r37[9], r38[9], r39[9], r40[9], r41[9], r42[9], r43[9], r44[9], r45[9], r46[9], r47[9], r48[9], r49[9], r50[9], r51[9], r52[9], r53[9], r54[9], r56[9], r57[9], r58[9], r59[9], r60[9], r61[9], r62[9], r63[9], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[9]);
	 mux_64x1 m11(r0[10], r1[10], r2[10], r3[10], r4[10], r5[10], r6[10], r7[10], r8[10], r9[10], r10[10], r11[10], r12[10], r13[10], r14[10], r15[10], r16[10], r17[10], r18[10], r19[10], r20[10], r21[10], r22[10], r23[10], r24[10], r25[10], r26[10], r27[10], r28[10], r29[10], r30[10], r31[10], r32[10], r33[10], r34[10], r35[10], r36[10], r37[10], r38[10], r39[10], r40[10], r41[10], r42[10], r43[10], r44[10], r45[10], r46[10], r47[10], r48[10], r49[10], r50[10], r51[10], r52[10], r53[10], r54[10], r56[10], r57[10], r58[10], r59[10], r60[10], r61[10], r62[10], r63[10], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[10]);
	 mux_64x1 m12(r0[11], r1[11], r2[11], r3[11], r4[11], r5[11], r6[11], r7[11], r8[11], r9[11], r10[11], r11[11], r12[11], r13[11], r14[11], r15[11], r16[11], r17[11], r18[11], r19[11], r20[11], r21[11], r22[11], r23[11], r24[11], r25[11], r26[11], r27[11], r28[11], r29[11], r30[11], r31[11], r32[11], r33[11], r34[11], r35[11], r36[11], r37[11], r38[11], r39[11], r40[11], r41[11], r42[11], r43[11], r44[11], r45[11], r46[11], r47[11], r48[11], r49[11], r50[11], r51[11], r52[11], r53[11], r54[11], r56[11], r57[11], r58[11], r59[11], r60[11], r61[11], r62[11], r63[11], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[11]);
	 mux_64x1 m13(r0[12], r1[12], r2[12], r3[12], r4[12], r5[12], r6[12], r7[12], r8[12], r9[12], r10[12], r11[12], r12[12], r13[12], r14[12], r15[12], r16[12], r17[12], r18[12], r19[12], r20[12], r21[12], r22[12], r23[12], r24[12], r25[12], r26[12], r27[12], r28[12], r29[12], r30[12], r31[12], r32[12], r33[12], r34[12], r35[12], r36[12], r37[12], r38[12], r39[12], r40[12], r41[12], r42[12], r43[12], r44[12], r45[12], r46[12], r47[12], r48[12], r49[12], r50[12], r51[12], r52[12], r53[12], r54[12], r56[12], r57[12], r58[12], r59[12], r60[12], r61[12], r62[12], r63[12], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[12]);
	 mux_64x1 m14(r0[13], r1[13], r2[13], r3[13], r4[13], r5[13], r6[13], r7[13], r8[13], r9[13], r10[13], r11[13], r12[13], r13[13], r14[13], r15[13], r16[13], r17[13], r18[13], r19[13], r20[13], r21[13], r22[13], r23[13], r24[13], r25[13], r26[13], r27[13], r28[13], r29[13], r30[13], r31[13], r32[13], r33[13], r34[13], r35[13], r36[13], r37[13], r38[13], r39[13], r40[13], r41[13], r42[13], r43[13], r44[13], r45[13], r46[13], r47[13], r48[13], r49[13], r50[13], r51[13], r52[13], r53[13], r54[13], r56[13], r57[13], r58[13], r59[13], r60[13], r61[13], r62[13], r63[13], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[13]);
	 mux_64x1 m15(r0[14], r1[14], r2[14], r3[14], r4[14], r5[14], r6[14], r7[14], r8[14], r9[14], r10[14], r11[14], r12[14], r13[14], r14[14], r15[14], r16[14], r17[14], r18[14], r19[14], r20[14], r21[14], r22[14], r23[14], r24[14], r25[14], r26[14], r27[14], r28[14], r29[14], r30[14], r31[14], r32[14], r33[14], r34[14], r35[14], r36[14], r37[14], r38[14], r39[14], r40[14], r41[14], r42[14], r43[14], r44[14], r45[14], r46[14], r47[14], r48[14], r49[14], r50[14], r51[14], r52[14], r53[14], r54[14], r56[14], r57[14], r58[14], r59[14], r60[14], r61[14], r62[14], r63[14], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[14]);
	 mux_64x1 m16(r0[15], r1[15], r2[15], r3[15], r4[15], r5[15], r6[15], r7[15], r8[15], r9[15], r10[15], r11[15], r12[15], r13[15], r14[15], r15[15], r16[15], r17[15], r18[15], r19[15], r20[15], r21[15], r22[15], r23[15], r24[15], r25[15], r26[15], r27[15], r28[15], r29[15], r30[15], r31[15], r32[15], r33[15], r34[15], r35[15], r36[15], r37[15], r38[15], r39[15], r40[15], r41[15], r42[15], r43[15], r44[15], r45[15], r46[15], r47[15], r48[15], r49[15], r50[15], r51[15], r52[15], r53[15], r54[15], r56[15], r57[15], r58[15], r59[15], r60[15], r61[15], r62[15], r63[15], addr[0], addr[1], addr[2], addr[3], addr[4], addr[5], dout[15]);
	 
endmodule
