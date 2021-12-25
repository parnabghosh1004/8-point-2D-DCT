`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:36:12 12/26/2021 
// Design Name: 
// Module Name:    mux_32bit 
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
module mux_2x1(
	 input fi,
	 input si,
	 input SL,
	 output Y
	 );
	 
    wire invSL,and1,and2,or1;
    and(and1,SL,si);
    not(invSL,SL);
    and(and2,invSL,fi);
    or(Y,and1,and2);

endmodule

module mux_4x1(
    input [3:0]din,
	 input sl1,
	 input sl2,
	 output y
	 );
	 wire w1, w2;
	 
	 mux_2x1 m1(din[0], din[1], sl1, w1);
	 mux_2x1 m2(din[2], din[3], sl1, w2);
	 mux_2x1 m3(w1, w2, sl2, y);
	 
endmodule

module mux_8x1(
    input [7:0]din,
	 input [2:0]sl,
	 output y
	 );
	 wire w1, w2;
	 
	 mux_4x1 m1(din[0], din[1], din[2], din[3], sl[0], sl[1], w1);
	 mux_4x1 m2(din[4], din[5], din[6], din[7], sl[0], sl[1], w2);
	 mux_2x1 m3(w1, w2, sl[2], y);
	 
endmodule

module mux_16x1(
    input [15:0]din,
	 input [3:0]sl,
	 output y
	 );
	 wire w1, w2;
	 
	 mux_8x1 m1(din[0], din[1], din[2], din[3], din[4], din[5], din[6], din[7], sl[0], sl[1], sl[2], w1);
	 mux_8x1 m2(din[8], din[9], din[10], din[11], din[12], din[13], din[14], din[15], sl[0], sl[1], sl[2], w1);
	 mux_2x1 m3(w1, w2, sl[3], y);
	 
endmodule

module mux_32x1(
    input [31:0]din,
	 input [4:0]sl,
	 output y
	 );
	 wire w1, w2;
	 
	 mux_16x1 m1(din[0], din[1], din[2], din[3], din[4], din[5], din[6], din[7], din[8], din[9], din[10], din[11], din[12], din[13], din[14], din[15], sl[0], sl[1], sl[2], sl[3], w1);
	 mux_15x1 m2(din[16], din[17], din[18], din[19], din[20], din[21], din[22], din[23], din[24], din[25], din[26], din[27], din[28], din[29], din[30], din[31], sl[0], sl[1], sl[2], sl[3], w2);
	 mux_2x1 m3(w1, w2, sl[4], y);
	 
endmodule	

module mux_64x1(
    input [63:0] din,
	 input [5:0] sl,
	 output y
	 );
	 wire w1, w2;
	 
	 mux_32x1 m1(din[0], din[1], din[2], din[3], din[4], din[5], din[6], din[7], din[8], din[9], din[10], din[11], din[12], din[13], din[14], din[15], din[16], din[17], din[18], din[19], din[20], din[21], din[22], din[23], din[24], din[25], din[26], din[27], din[28], din[29], din[30], din[31], sl[0], sl[1], sl[2], sl[3], sl[4], w1);
	 mux_32x1 m2(din[32], din[33], din[34], din[35], din[36], din[37], din[38], din[39], din[40], din[41], din[42], din[43], din[44], din[45], din[46], din[47], din[48], din[49], din[50], din[51], din[52], din[53], din[54], din[55], din[56], din[57], din[58], din[59], din[60], din[61], din[62], din[63], sl[0], sl[1], sl[2], sl[3], sl[4], w2);
    mux_2x1 m3(w1, w2, sl[5], y);

endmodule
