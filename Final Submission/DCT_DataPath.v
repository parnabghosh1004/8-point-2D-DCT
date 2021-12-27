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


module DCT_DataPath(clk,rstCt1,rstCt2,rstCt3,incCt1,incCt2,incCt3,setCt2,setCt3,clrReg,multiplexed_input,cs,clrRAM,enROM,enDecoder,enDCT,loadOutReg,isCt17,isCt27,isCt37,isAddr63,read,write,start2,done2,Data_tb,Addr_tb);

input clk,rstCt1,rstCt2,rstCt3,setCt2,setCt3,incCt1,incCt2,incCt3,clrReg,multiplexed_input,cs,clrRAM,enROM,enDecoder,enDCT,loadOutReg,read,write,start2;
input [15:0]Data_tb;
input [5:0]Addr_tb;
output isCt17,isCt27,isCt37,isAddr63,done2;

wire [15:0]y0,y1,y2,y3,y4,y5,y6,y7;
wire [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
wire [15:0]Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
wire [7:0]decoder_out;
wire [2:0]row,col,count;
wire [15:0]DCTOut,Coeff,Din_RAM,data_out;
wire [5:0]Addr;

assign isCt17 = &row;
assign isCt27 = &col;
assign isCt37 = &count;
assign isAddr63 = &Addr;
// Multiplexing data and address from tb and RAM
Multiplex_Addr_Bus_2  MuxAddr(Addr_tb,{row,col},multiplexed_input,Addr);
Multiplex_Data_Bus_2  MuxData(Data_tb,DCTOut,multiplexed_input,Din_RAM);
// Counters => for giving addresses
MOD_8_Counter C1(clk,rstCt1,incCt1,,row);
MOD_8_Counter C2(clk,rstCt2,incCt2,setCt2,col);

// C3 for selection of registers
MOD_8_Counter C3(clk,rstCt3,incCt3,setCt3,count);
// 3 to 8 decoder
Decoder_3_to_8 D38(count,enDecoder,decoder_out);
// RAM    
RAM ram(Addr,Din_RAM,clk,read,write,cs,clrRAM,data_out);
// input register
PIPO_reg Pin0(data_out,decoder_out[0],clrReg,y0);
PIPO_reg Pin1(data_out,decoder_out[1],clrReg,y1);
PIPO_reg Pin2(data_out,decoder_out[2],clrReg,y2);
PIPO_reg Pin3(data_out,decoder_out[3],clrReg,y3);
PIPO_reg Pin4(data_out,decoder_out[4],clrReg,y4);
PIPO_reg Pin5(data_out,decoder_out[5],clrReg,y5);
PIPO_reg Pin6(data_out,decoder_out[6],clrReg,y6);
PIPO_reg Pin7(data_out,decoder_out[7],clrReg,y7);
// DCT module
DCT_1D DCT(y0,y1,y2,y3,y4,y5,y6,y7,clrReg,clk,start2,enDCT,done2,Coeff,decoder_out,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
// ROM
ROM ROM(count,enROM,Coeff); // donot include Y
// Output Registers
PIPO_reg Pout0(Y0,loadOutReg,clrReg,Out0);
PIPO_reg Pout1(Y1,loadOutReg,clrReg,Out1);
PIPO_reg Pout2(Y2,loadOutReg,clrReg,Out2);
PIPO_reg Pout3(Y3,loadOutReg,clrReg,Out3);
PIPO_reg Pout4(Y4,loadOutReg,clrReg,Out4);
PIPO_reg Pout5(Y5,loadOutReg,clrReg,Out5);
PIPO_reg Pout6(Y6,loadOutReg,clrReg,Out6);
PIPO_reg Pout7(Y7,loadOutReg,clrReg,Out7);
//
Multiplex_Data_Bus_8 MDB8(Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,decoder_out,DCTOut);
//
endmodule
