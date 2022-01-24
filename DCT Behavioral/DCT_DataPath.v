`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2021 20:38:51
// Design Name: 
// Module Name: DCT_DataPath
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

module DCT_DataPath(clk,rstCt1,rstCt2,incCt1,incCt2,setCt2,clrReg,multiplexed_input,cs,enROM,enDecoder,enDCT,ldPIPOIn,load_line,loadOutReg,isCt17,isCt27,isAddr63,read,write,start2,done2,Data_tb,Addr_tb);

input clk,rstCt1,rstCt2,setCt2,incCt1,incCt2,clrReg,multiplexed_input,cs,enROM,enDecoder,enDCT,loadOutReg,read,write,start2;
input [15:0]Data_tb;
input [5:0]Addr_tb;
input [7:0] ldPIPOIn,load_line;
output isCt17,isCt27,isAddr63,done2;

wire [15:0]y0,y1,y2,y3,y4,y5,y6,y7;
wire [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
wire [15:0]Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
wire [2:0]row,col;
wire [15:0]DCTOut,Coeff,Din_RAM,data_out;
wire [5:0]Addr;

assign isCt17 = &row;
assign isCt27 = &col;
assign isAddr63 = &Addr;
// Multiplexing data and address from tb and RAM
Multiplexed_Addr_Bus  MuxAddr(Addr_tb,{row,col},multiplexed_input,Addr);
Multiplexed_Data_Bus  MuxData(Data_tb,DCTOut,multiplexed_input,Din_RAM);
// Counters => for giving addresses
MOD_8_Counter C1(clk,rstCt1,incCt1,,row);
MOD_8_Counter C2(clk,rstCt2,incCt2,setCt2,col);
// RAM    
RAM RAM(Addr,Din_RAM,clk,read,write,cs,data_out);

PIPOIn PI(data_out,ldPIPOIn,clrReg,y0,y1,y2,y3,y4,y5,y6,y7);
// DCT module
DCT_1D DCT(y0,y1,y2,y3,y4,y5,y6,y7,clrReg,clk,start2,enDCT,done2,Coeff,ldPIPOIn,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
// ROM
ROM ROM(ldPIPOIn,enROM,Coeff);

PIPOOut PO(loadOutReg,clrReg,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7);
//
Multiplexed_DCT_Data MDD(Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,load_line,DCTOut);
//
endmodule
