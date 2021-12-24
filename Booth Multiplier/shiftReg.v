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

module shiftReg(data_in,data_out,SR_in,clk,ld,clr,sft);

    input clk,SR_in,ld,clr,sft;
    input [15:0] data_in;
    output reg [15:0] data_out;

    always @(negedge clk)
	   begin
		  if(clr) data_out<=0;
		  else if(ld) data_out <= data_in;
		  else if(sft) data_out <= {SR_in,data_out[15:1]};
	   end
endmodule


