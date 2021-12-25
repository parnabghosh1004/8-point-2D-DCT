`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:49 12/25/2021 
// Design Name: 
// Module Name:    register_16bit 
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
module register_16bit(
    input [15:0] din,
	 input load,
	 input read_wr,
	 output [15:0] dout
    );

	cell c0(din[0], load, read_wr, dout[0]);  //Reads when read_wr = 1, and wirtes data when read_wr = 0
	cell c1(din[1], load, read_wr, dout[1]);
	cell c2(din[2], load, read_wr, dout[2]);
	cell c3(din[3], load, read_wr, dout[3]);
	cell c4(din[4], load, read_wr, dout[4]);
	cell c5(din[5], load, read_wr, dout[5]);
	cell c6(din[6], load, read_wr, dout[6]);
	cell c7(din[7], load, read_wr, dout[7]);
	cell c8(din[8], load, read_wr, dout[8]);
	cell c9(din[9], load, read_wr, dout[9]);
	cell c10(din[10], load, read_wr, dout[10]);
	cell c11(din[11], load, read_wr, dout[11]);
	cell c12(din[12], load, read_wr, dout[12]);
	cell c13(din[13], load, read_wr, dout[13]);
	cell c14(din[14], load, read_wr, dout[14]);
	cell c15(din[15], load, read_wr, dout[15]);
	 
endmodule
