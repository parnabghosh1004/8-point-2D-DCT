module DCT_DataPath(addrTB);

input clk,rstCt1,rstCt2,rstCt3,setCt2,setCt3,incCt1,incCt2,incCt3,isCt17,isCt27,isCt37,clrReg,multiplexed_input,cs,clrRAM,enROM,enDecoder,enDCT,loadOutReg;
output start1,isCt17,isCt27,isCt37,isAddr63;

wire [15:0]y0,y1,y2,y3,y4,y5,y6,y7;
wire [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
wire [15:0]Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
wire [7:0]decoder_out;
wire [2:0]row,col,count;
wire [15:0]DCTOut,Coeff;
wire [5:0]addr;

assign isCt17 = &row;
assign isCt27 = &col;
assign isCt37 = &count;
assign isAddr63 = &addr;

// Counters => for giving addresses
MOD_8_Counter C1(clk,rstCt2,incCt1,,row);
MOD_8_Counter C2(clk,rstCt2,incCt2,setCt2,col);

// C3 for selection of registers
MOD_8_Counter C3(clk,rstCt3,incCt3,setCt3,count);
// 3 to 8 decoder
Decoder_3_to_8(count,enDecoder,decoder_out);
// RAM    
RAM ram({row,col},DCTOut,clk,read,write,cs,clrRAM,data_out);
// input register
PIPO_reg Pin0(data_in,decoder_out[0],1'b1,clrReg,y0);
PIPO_reg Pin1(data_in,decoder_out[1],1'b1,clrReg,y1);
PIPO_reg Pin2(data_in,decoder_out[2],1'b1,clrReg,y2);
PIPO_reg Pin3(data_in,decoder_out[3],1'b1,clrReg,y3);
PIPO_reg Pin4(data_in,decoder_out[4],1'b1,clrReg,y4);
PIPO_reg Pin5(data_in,decoder_out[5],1'b1,clrReg,y5);
PIPO_reg Pin6(data_in,decoder_out[6],1'b1,clrReg,y6);
PIPO_reg Pin7(data_in,decoder_out[7],1'b1,clrReg,y7);
// DCT module
DCT_1D dct(y0,y1,y2,y3,y4,y5,y6,y7,clk,start,enDCT,done,Coeff,decoder_out,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
// ROM
ROM (count,enROM,Coeff); // donot include Y
// Output Registers
PIPO_reg Pout0(Y0,loadOutReg,1'b1,clrReg,Out0);
PIPO_reg Pout1(Y1,loadOutReg,1'b1,clrReg,Out1);
PIPO_reg Pout2(Y2,loadOutReg,1'b1,clrReg,Out2);
PIPO_reg Pout3(Y3,loadOutReg,1'b1,clrReg,Out3);
PIPO_reg Pout4(Y4,loadOutReg,1'b1,clrReg,Out4);
PIPO_reg Pout5(Y5,loadOutReg,1'b1,clrReg,Out5);
PIPO_reg Pout6(Y6,loadOutReg,1'b1,clrReg,Out6);
PIPO_reg Pout7(Y7,loadOutReg,1'b1,clrReg,Out7);
//
Multiplex_Data_Bus(Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,decoder_out,DCTOut);
//
endmodule
