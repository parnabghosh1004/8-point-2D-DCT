`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:03 12/23/2021 
// Design Name: 
// Module Name:    RAM 
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
module RAM(
    input [5:0]addr,
	 input [23:0]din,
    input clk, 
	 input write_enable,
    output [23:0]dout
    );
	 
	 reg [23:0] memory[63:0];
    reg [23:0] temp;

    always @(posedge clk)
    begin
      if(write_enable)
		   memory[addr] <= din;
    end

    always @(posedge clk)
    begin
      if(!write_enable)
		   temp <= memory[addr];
    end
	 
	 assign dout = !write_enable ? temp : 'hz;

endmodule
