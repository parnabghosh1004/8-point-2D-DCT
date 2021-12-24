`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2021 01:33:32 PM
// Design Name: 
// Module Name: Counter
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

module Counter(count,clk,ld,decr);
	input decr,ld,clk;
	output reg [4:0] count;
	always @(negedge clk)
	begin
		if(ld) count <= 5'd16;
		else if (decr) count <= count-1;
	end
endmodule

