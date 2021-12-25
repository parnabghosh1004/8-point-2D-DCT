`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:53 12/25/2021 
// Design Name: 
// Module Name:    decoder_6x64 
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
module decoder_3x8(
    input a,
	 input b,
	 input c,
	 input enable,
	 output d0,
	 output d1,
	 output d2,
	 output d3,
	 output d4,
	 output d5,
	 output d6,
	 output d7
    );
	 
	 wire not_a, not_b, not_c;
	 
	 not(not_a, a);
	 not(not_b, b);
	 not(not_c, c);
	 
	 and(d0, not_a, not_b, not_c, enable);
	 and(d1, not_a, not_b, c, enable);
	 and(d2, not_a, b, not_c, enable);
	 and(d3, not_a, b, c, enable);
	 and(d4, a, not_b, not_c, enable);
	 and(d5, a, not_b, c, enable);
	 and(d6, a, b, not_c, enable);
	 and(d7, a, b, c, enable);
	
endmodule	

module decoder_6x64(
    input i0,
	 input i1,
	 input i2,
	 input i3,
	 input i4,
	 input i5,
	 input enable,
	 output [63:0]y
    );
	 
	 wire w1, w2, w3, w4, w5, w6, w7, w8;
	 
	 decoder_3x8 d1(.a(i5), .b(i4), .c(i3), .enable(1'b1), .d0(w1), .d1(w2), .d2(w3), .d3(w4), .d4(w5), .d5(w6), .d6(w7), .d7(w8));
	 decoder_3x8 d2(.a(i2), .b(i1), .c(i0), .enable(w1), .d0(y[0]), .d1(y[1]), .d2(y[2]), .d3(y[3]), .d4(y[4]), .d5(y[5]), .d6(y[6]), .d7(y[7]));
	 decoder_3x8 d3(.a(i2), .b(i1), .c(i0), .enable(w2), .d0(y[8]), .d1(y[9]), .d2(y[10]), .d3(y[11]), .d4(y[12]), .d5(y[13]), .d6(y[14]), .d7(y[15]));
	 decoder_3x8 d4(.a(i2), .b(i1), .c(i0), .enable(w3), .d0(y[16]), .d1(y[17]), .d2(y[18]), .d3(y[19]), .d4(y[20]), .d5(y[21]), .d6(y[22]), .d7(y[23]));
	 decoder_3x8 d5(.a(i2), .b(i1), .c(i0), .enable(w4), .d0(y[24]), .d1(y[25]), .d2(y[26]), .d3(y[27]), .d4(y[28]), .d5(y[29]), .d6(y[30]), .d7(y[31]));
	 decoder_3x8 d6(.a(i2), .b(i1), .c(i0), .enable(w5), .d0(y[32]), .d1(y[33]), .d2(y[34]), .d3(y[35]), .d4(y[36]), .d5(y[37]), .d6(y[38]), .d7(y[39]));
	 decoder_3x8 d7(.a(i2), .b(i1), .c(i0), .enable(w6), .d0(y[40]), .d1(y[41]), .d2(y[42]), .d3(y[43]), .d4(y[44]), .d5(y[45]), .d6(y[46]), .d7(y[448]));
	 decoder_3x8 d8(.a(i2), .b(i1), .c(i0), .enable(w7), .d0(y[48]), .d1(y[49]), .d2(y[50]), .d3(y[51]), .d4(y[52]), .d5(y[53]), .d6(y[54]), .d7(y[55]));
    decoder_3x8 d9(.a(i2), .b(i1), .c(i0), .enable(w8), .d0(y[56]), .d1(y[57]), .d2(y[58]), .d3(y[59]), .d4(y[60]), .d5(y[61]), .d6(y[62]), .d7(y[63]));

endmodule
