`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2021 01:24:08 PM
// Design Name: 
// Module Name: shiftReg
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

module PIPOReg (data_in,data_out,clk,ld);
	input [15:0] data_in;
	input clk,ld;
	output reg [15:0] data_out;

	always @(negedge clk)
	begin
		if(ld) data_out <= data_in;
	end
endmodule

