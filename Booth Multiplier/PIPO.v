`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:06 12/27/2021 
// Design Name: 
// Module Name:    PIPO 
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
module DFF_in( // D Flip FLop
    input d,
    input clk,
    output reg q
    );
    
	 always@(negedge clk)
    q <= d;
	 
endmodule

module mux_in_2_1( // 2 to 1 Multiplexer 
	 input I0,
	 input I1,
	 input SL,
	 output Y
	 );
	 
	 wire invSL,and1,and2,or1;
	 and(and1,SL,I1);
	 not(invSL,SL);
	 and(and2,invSL,I0);
	 or(Y,and1,and2);
	 
endmodule

module reg_1_Bit_in( // 1-Bit Register with PARALLEL LOAD
    input data_in,ld,clk,
    output data_out
    );
	 wire d;
	 mux_in_2_1 mux_in(.I0(data_out),.I1(data_in),.SL(ld),.Y(d));
	 DFF_in dff_in(.d(d),.clk(clk),.q(data_out));

endmodule

module PIPO(
    input [15:0]data_in,
    input ld,
    input clk,
    output [15:0]data_out
    );
	 
	 reg_1_Bit_in Ri00(.data_in(data_in[0]), .ld(ld), .clk(clk), .data_out(data_out[0]));
	 reg_1_Bit_in Ri01(.data_in(data_in[1]), .ld(ld), .clk(clk), .data_out(data_out[1]));
	 reg_1_Bit_in Ri02(.data_in(data_in[2]), .ld(ld), .clk(clk), .data_out(data_out[2]));
	 reg_1_Bit_in Ri03(.data_in(data_in[3]), .ld(ld), .clk(clk), .data_out(data_out[3]));
	 reg_1_Bit_in Ri04(.data_in(data_in[4]), .ld(ld), .clk(clk), .data_out(data_out[4]));
	 reg_1_Bit_in Ri05(.data_in(data_in[5]), .ld(ld), .clk(clk), .data_out(data_out[5]));
	 reg_1_Bit_in Ri06(.data_in(data_in[6]), .ld(ld), .clk(clk), .data_out(data_out[6]));
	 reg_1_Bit_in Ri07(.data_in(data_in[7]), .ld(ld), .clk(clk), .data_out(data_out[7]));
	 reg_1_Bit_in Ri08(.data_in(data_in[8]), .ld(ld), .clk(clk), .data_out(data_out[8]));
	 reg_1_Bit_in Ri09(.data_in(data_in[9]), .ld(ld), .clk(clk), .data_out(data_out[9]));
	 reg_1_Bit_in Ri10(.data_in(data_in[10]), .ld(ld), .clk(clk), .data_out(data_out[10]));
	 reg_1_Bit_in Ri11(.data_in(data_in[11]), .ld(ld), .clk(clk), .data_out(data_out[11]));
	 reg_1_Bit_in Ri12(.data_in(data_in[12]), .ld(ld), .clk(clk), .data_out(data_out[12]));
	 reg_1_Bit_in Ri13(.data_in(data_in[13]), .ld(ld), .clk(clk), .data_out(data_out[13]));
	 reg_1_Bit_in Ri14(.data_in(data_in[14]), .ld(ld), .clk(clk), .data_out(data_out[14]));
	 reg_1_Bit_in Ri15(.data_in(data_in[15]), .ld(ld), .clk(clk), .data_out(data_out[15]));

endmodule
