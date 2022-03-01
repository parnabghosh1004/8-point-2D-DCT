`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2021 03:27:23
// Design Name: 
// Module Name: ROM
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

module ROM(
     input [7:0]Y,
     input enb,
     output [15:0]Cn
     );
// Storing the values of 0.5*cos(n*pi/16) in ROM     ( 0 < n < 8 and n is an integer )
or(Cn[15],1'b0,1'b0);
or(Cn[14],1'b0,1'b0);
or(Cn[13],Y[0],Y[1],Y[2],Y[3],Y[4],Y[5]);
or(Cn[12],Y[1],Y[2],Y[3],Y[3],Y[6]);
or(Cn[11],Y[0],Y[1],Y[2],Y[4],Y[6],Y[7]);
or(Cn[10],Y[0],Y[1],Y[3],Y[4],Y[7]);
or(Cn[9], Y[1],Y[2],Y[5]);
or(Cn[8], Y[0],Y[2],Y[3],Y[4],Y[5]);
or(Cn[7], Y[1],Y[5]);
or(Cn[6], Y[0],Y[1],Y[4],Y[6],Y[7]);
or(Cn[5], Y[2],Y[3],Y[6],Y[7]);
or(Cn[4], Y[3],Y[6],Y[7]);
or(Cn[3], Y[5],Y[6],Y[7]);
or(Cn[2], Y[1],Y[3],Y[5],Y[6],Y[7]);
or(Cn[1], Y[3],Y[5]);
or(Cn[0], Y[0],Y[1],Y[4],Y[6]);
endmodule

