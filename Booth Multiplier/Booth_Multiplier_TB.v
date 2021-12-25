`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2021 15:09:19
// Design Name: 
// Module Name: Booth_Multiplier_TB
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


module Booth_Multiplier_TB;

    reg [15:0] in1,in2;
    reg clk,start;
    wire done;
    wire [31:0] out;

    Booth_Multiplier uut(in1,in2,start,clk,out,done);

    initial begin 
        clk = 1'b0;
        start = 1'b0;
        #2 start = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin 
        #3 in1 = -16'd45;
        in2 = -16'd78;
    end





endmodule
