module DCT_DataPath(
     
    );
wire [15:0]y0,y1,y2,y3,y4,y5,y6,y7;
wire [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
wire [15:0]Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;
wire [7:0]decoder_out;
wire [2:0]row,col,count;
wire [15:0]Dout,
wire multiplexed_input,

// Counters => for giving addresses
MOD_8_Counter C1(clk,clr,hold,row);
MOD_8_Counter C2(clk,clr,hold,col);

// C3 for selection of registers
MOD_8_Counter C3(clk,clr,hold,count);
// 3 to 8 decoder
Decoder_3_to_8(count,enb,decoder_out);
// RAM    
RAM ram({row,col},Dout,clk,read,write,cs,clr,data_out);
// input register
PIPO_reg Pin0(data_in,decoder_out[0],enb,clk,clr,y0);
PIPO_reg Pin1(data_in,decoder_out[1],enb,clk,clr,y1);
PIPO_reg Pin2(data_in,decoder_out[2],enb,clk,clr,y2);
PIPO_reg Pin3(data_in,decoder_out[3],enb,clk,clr,y3);
PIPO_reg Pin4(data_in,decoder_out[4],enb,clk,clr,y4);
PIPO_reg Pin5(data_in,decoder_out[5],enb,clk,clr,y5);
PIPO_reg Pin6(data_in,decoder_out[6],enb,clk,clr,y6);
PIPO_reg Pin7(data_in,decoder_out[7],enb,clk,clr,y7);
// DCT module
DCT_1D dct(y0,y1,y2,y3,y4,y5,y6,y7,clk,start,enb,done,Data_in,deoder_out,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
// ROM
ROM (address,enb,Cn); // donot include Y
// Output Registers
PIPO_reg Pout0(Y0,load,enb,clk,clr,Out0);
PIPO_reg Pout1(y1,load,enb,clk,clr,Out1);
PIPO_reg Pout2(Y2,load,enb,clk,clr,Out2);
PIPO_reg Pout3(Y3,load,enb,clk,clr,Out3);
PIPO_reg Pout4(Y4,load,enb,clk,clr,Out4);
PIPO_reg Pout5(Y5,load,enb,clk,clr,Out5);
PIPO_reg Pout6(Y6,load,enb,clk,clr,Out6);
PIPO_reg Pout7(Y7,load,enb,clk,clr,Out7);
//
Multiplex_Data_Bus(Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,decoder_out,Dout);
//
endmodule
