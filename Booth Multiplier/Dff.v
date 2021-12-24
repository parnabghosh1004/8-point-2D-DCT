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


module Dff ( d,q,clk,clr);

    input d,clk,clr;
    output reg q;

    always @(posedge clk)
	   begin
		  if(clr) q <= 1'b0;
		  else q <= d;
	   end

endmodule