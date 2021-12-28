`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2021 12:50:21
// Design Name: 
// Module Name: DCT_2D
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


module DCT_2D(
     input [15:0]y0,y1,y2,y3,y4,y5,y6,y7,
     input [15:0]y8,y9,y10,y11,y12,y13,y14,y15,
     input [15:0]y16,y17,y18,y19,y20,y21,y22,y23,
     input [15:0]y24,y25,y26,y27,y28,y29,y30,y31,
     input [15:0]y32,y33,y34,y35,y36,y37,y38,y39,
     input [15:0]y40,y41,y42,y43,y44,y45,y46,y47,
     input [15:0]y48,y49,y50,y51,y52,y53,y54,y55,
     input [15:0]y56,y57,y58,y59,y60,y61,y62,y63,
     //
     output [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,
     output [15:0]Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15,
     output [15:0]Y16,Y17,Y18,Y19,Y20,Y21,Y22,Y23,
     output [15:0]Y24,Y25,Y26,Y27,Y28,Y29,Y30,Y31,
     output [15:0]Y32,Y33,Y34,Y35,Y36,Y37,Y38,Y39,
     output [15:0]Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,
     output [15:0]Y48,Y49,Y50,Y51,Y52,Y53,Y54,Y55,
     output [15:0]Y56,Y57,Y58,Y59,Y60,Y61,Y62,Y63
    ); 
    
     wire [15:0]X0,X1,X2,X3,X4,X5,X6,X7;
     wire [15:0]X8,X9,X10,X11,X12,X13,X14,X15;
     wire [15:0]X16,X17,X18,X19,X20,X21,X22,X23;
     wire [15:0]X24,X25,X26,X27,X28,X29,X30,X31;
     wire [15:0]X32,X33,X34,X35,X36,X37,X38,X39;
     wire [15:0]X40,X41,X42,X43,X44,X45,X46,X47;
     wire [15:0]X48,X49,X50,X51,X52,X53,X54,X55;
     wire [15:0]X56,X57,X58,X59,X60,X61,X62,X63;
    
    DCT_1D D1(y0,y1,y2,y3,y4,y5,y6,y7,X0,X1,X2,X3,X4,X5,X6,X7);
    DCT_1D D2(y8,y9,y10,y11,y12,y13,y14,y15,X8,X9,X10,X11,X12,X13,X14,X15);
    DCT_1D D3(y16,y17,y18,y19,y20,y21,y22,y23,X16,X17,X18,X19,X20,X21,X22,X23);
    DCT_1D D4(y24,y25,y26,y27,y28,y29,y30,y31,X24,X25,X26,X27,X28,X29,X30,X31);
    DCT_1D D5(y32,y33,y34,y35,y36,y37,y38,y39,X32,X33,X34,X35,X36,X37,X38,X39);
    DCT_1D D6(y40,y41,y42,y43,y44,y45,y46,y47,X40,X41,X42,X43,X44,X45,X46,X47);
    DCT_1D D7(y48,y49,y50,y51,y52,y53,y54,y55,X48,X49,X50,X51,X52,X53,X54,X55);
    DCT_1D D8(y56,y57,y58,y59,y60,y61,y62,y63,X56,X57,X58,X59,X60,X61,X62,X63);
    
    DCT_1D  D9(X0,X8,X16,X24,X32,X40,X48,X56,Y0,Y8,Y16,Y24,Y32,Y40,Y48,Y56);
    DCT_1D D10(X1,X9,X17,X25,X33,X41,X49,X57,Y1,Y9,Y17,Y25,Y33,Y41,Y49,Y57);
    DCT_1D D11(X2,X10,X18,X26,X34,X42,X50,X58,Y2,Y10,Y18,Y26,Y34,Y42,Y50,Y58);
    DCT_1D D12(X3,X11,X19,X27,X35,X43,X51,X59,Y3,Y11,Y19,Y27,Y35,Y43,Y51,Y59);
    DCT_1D D13(X4,X12,X20,X28,X36,X44,X52,X60,Y4,Y12,Y20,Y28,Y36,Y44,Y52,Y60);
    DCT_1D D14(X5,X13,X21,X29,X37,X45,X53,X61,Y5,Y13,Y21,Y29,Y37,Y45,Y53,Y61);
    DCT_1D D15(X6,X14,X22,X30,X38,X46,X54,X62,Y6,Y14,Y22,Y30,Y38,Y46,Y54,Y62);
    DCT_1D D16(X7,X15,X23,X31,X39,X47,X55,X63,Y7,Y15,Y23,Y31,Y39,Y47,Y55,Y63);
    
endmodule

