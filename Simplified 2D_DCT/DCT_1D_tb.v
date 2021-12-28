`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2021 03:12:02
// Design Name: 
// Module Name: main_tb
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


module DCT_1D_tb;
    reg [15:0]y0,y1,y2,y3,y4,y5,y6,y7;
    wire [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
    //
    DCT_1D uut (.y0(y0),
              .y1(y1),
              .y2(y2),
              .y3(y3),
              .y4(y4),
              .y5(y5),
              .y6(y6),
              .y7(y7),
              .Y0(Y0),
              .Y1(Y1),
              .Y2(Y2),
              .Y3(Y3),
              .Y4(Y4),
              .Y5(Y5),
              .Y6(Y6),
              .Y7(Y7)
        );
        //
        initial
        begin
        y0 = {1'b0,11'b00000010000,4'b0000};  //16
        y1 = {1'b0,11'b00000010100,4'b0000};  //20
        y2 = {1'b0,11'b00000001111,4'b0000};  //15
        y3 = {1'b0,11'b00000011110,4'b0000};  //30
        y4 = {1'b0,11'b00000001100,4'b0000};  //12
        y5 = {1'b0,11'b00000001101,4'b0000};  //13
        y6 = {1'b0,11'b00000001100,4'b0000};  //12
        y7 = {1'b0,11'b00000001101,4'b0000};  //13
        #50;
        end
endmodule
