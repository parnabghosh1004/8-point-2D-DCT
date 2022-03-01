`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//
//
//
module PIPOIn(data_out,ldPIPOIn,clrReg,y0,y1,y2,y3,y4,y5,y6,y7);

    input [15:0] data_out;
    input [7:0] ldPIPOIn;
    input clrReg;
    output [15:0]y0,y1,y2,y3,y4,y5,y6,y7;

    // input register
    PIPO_reg Pin0(data_out,ldPIPOIn[0],clrReg,y0);
    PIPO_reg Pin1(data_out,ldPIPOIn[1],clrReg,y1);
    PIPO_reg Pin2(data_out,ldPIPOIn[2],clrReg,y2);
    PIPO_reg Pin3(data_out,ldPIPOIn[3],clrReg,y3);
    PIPO_reg Pin4(data_out,ldPIPOIn[4],clrReg,y4);
    PIPO_reg Pin5(data_out,ldPIPOIn[5],clrReg,y5);
    PIPO_reg Pin6(data_out,ldPIPOIn[6],clrReg,y6);
    PIPO_reg Pin7(data_out,ldPIPOIn[7],clrReg,y7);

endmodule

module PIPOOut(loadOutReg,clrReg,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7);

    input clrReg,loadOutReg;
    input [15:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
    output [15:0]Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7;

    // Output Registers
    PIPO_reg Pout0(Y0,loadOutReg,clrReg,Out0);
    PIPO_reg Pout1(Y1,loadOutReg,clrReg,Out1);
    PIPO_reg Pout2(Y2,loadOutReg,clrReg,Out2);
    PIPO_reg Pout3(Y3,loadOutReg,clrReg,Out3);
    PIPO_reg Pout4(Y4,loadOutReg,clrReg,Out4);
    PIPO_reg Pout5(Y5,loadOutReg,clrReg,Out5);
    PIPO_reg Pout6(Y6,loadOutReg,clrReg,Out6);
    PIPO_reg Pout7(Y7,loadOutReg,clrReg,Out7);

endmodule

module PIPO_reg( // 16-Bit Register with PARALLEL LOAD  or PIPO_out with Load
    input [15:0]data_in,
    input load,
    input clr,
    output [15:0]data_out
    );
Reg_1_Bit_out Ro00(.data_in(data_in[0]),  .load(load), .clr(clr), .data_out(data_out[0]));
Reg_1_Bit_out Ro01(.data_in(data_in[1]),  .load(load), .clr(clr), .data_out(data_out[1]));
Reg_1_Bit_out Ro02(.data_in(data_in[2]),  .load(load), .clr(clr), .data_out(data_out[2]));
Reg_1_Bit_out Ro03(.data_in(data_in[3]),  .load(load), .clr(clr), .data_out(data_out[3]));
Reg_1_Bit_out Ro04(.data_in(data_in[4]),  .load(load), .clr(clr), .data_out(data_out[4]));
Reg_1_Bit_out Ro05(.data_in(data_in[5]),  .load(load), .clr(clr), .data_out(data_out[5]));
Reg_1_Bit_out Ro06(.data_in(data_in[6]),  .load(load), .clr(clr), .data_out(data_out[6]));
Reg_1_Bit_out Ro07(.data_in(data_in[7]),  .load(load), .clr(clr), .data_out(data_out[7]));
Reg_1_Bit_out Ro08(.data_in(data_in[8]),  .load(load), .clr(clr), .data_out(data_out[8]));
Reg_1_Bit_out Ro09(.data_in(data_in[9]),  .load(load), .clr(clr), .data_out(data_out[9]));
Reg_1_Bit_out Ro10(.data_in(data_in[10]), .load(load), .clr(clr), .data_out(data_out[10]));
Reg_1_Bit_out Ro11(.data_in(data_in[11]), .load(load), .clr(clr), .data_out(data_out[11]));
Reg_1_Bit_out Ro12(.data_in(data_in[12]), .load(load), .clr(clr), .data_out(data_out[12]));
Reg_1_Bit_out Ro13(.data_in(data_in[13]), .load(load), .clr(clr), .data_out(data_out[13]));
Reg_1_Bit_out Ro14(.data_in(data_in[14]), .load(load), .clr(clr), .data_out(data_out[14]));
Reg_1_Bit_out Ro15(.data_in(data_in[15]), .load(load), .clr(clr), .data_out(data_out[15]));
endmodule

module Reg_1_Bit_out( // 1-Bit Register with PARALLEL LOAD
    input data_in,load,clr,
    output reg data_out
    );
always@(data_in,load,clr)
    begin
        if(clr) data_out <= 1'b0;
        else if(!load) data_out <= data_out;
        else if(load) data_out <= data_in;
    end
endmodule
//
//
//**************************************      PIPO ENDS HERE    *******************************************
//
//
module Multiplexed_DCT_Data(
     input [15:0]Buf_In_0,Buf_In_1,Buf_In_2,Buf_In_3,Buf_In_4,Buf_In_5,Buf_In_6,Buf_In_7,
     input [7:0]ctrl,
     output tri [15:0]Dout
     );
Buffer_16_Bit B0(.Data_in(Buf_In_0[15:0]),.ctrl(ctrl[0]),.Data_out(Dout[15:0]));
Buffer_16_Bit B1(.Data_in(Buf_In_1[15:0]),.ctrl(ctrl[1]),.Data_out(Dout[15:0]));
Buffer_16_Bit B2(.Data_in(Buf_In_2[15:0]),.ctrl(ctrl[2]),.Data_out(Dout[15:0]));
Buffer_16_Bit B3(.Data_in(Buf_In_3[15:0]),.ctrl(ctrl[3]),.Data_out(Dout[15:0]));
Buffer_16_Bit B4(.Data_in(Buf_In_4[15:0]),.ctrl(ctrl[4]),.Data_out(Dout[15:0]));
Buffer_16_Bit B5(.Data_in(Buf_In_5[15:0]),.ctrl(ctrl[5]),.Data_out(Dout[15:0]));
Buffer_16_Bit B6(.Data_in(Buf_In_6[15:0]),.ctrl(ctrl[6]),.Data_out(Dout[15:0]));
Buffer_16_Bit B7(.Data_in(Buf_In_7[15:0]),.ctrl(ctrl[7]),.Data_out(Dout[15:0]));
endmodule

module Multiplexed_Data_Bus( // for test bench
     input [15:0]Buf_In_0,Buf_In_1,
     input ctrl,
     output tri [15:0]Dout
     );
wire comp_ctrl;
not(comp_ctrl,ctrl);
Buffer_16_Bit B0(.Data_in(Buf_In_0[15:0]),.ctrl(comp_ctrl),.Data_out(Dout[15:0]));
Buffer_16_Bit B1(.Data_in(Buf_In_1[15:0]),.ctrl(ctrl),.Data_out(Dout[15:0]));
endmodule

module Multiplexed_Addr_Bus(
     input [5:0]Addr_In_0,Addr_In_1,
     input ctrl,
     output tri [5:0]Addrout
     );
wire comp_ctrl;
not(comp_ctrl,ctrl);
Buffer_6_Bit B0(.Data_in(Addr_In_0[5:0]),.ctrl(comp_ctrl),.Data_out(Addrout[5:0]));
Buffer_6_Bit B1(.Data_in(Addr_In_1[5:0]),.ctrl(ctrl),.Data_out(Addrout[5:0]));
endmodule

module Buffer_6_Bit(
     input [5:0]Data_in,
     input ctrl,
     output [5:0]Data_out
     );
bufif1(Data_out[0],  Data_in[0],  ctrl);     
bufif1(Data_out[1],  Data_in[1],  ctrl);     
bufif1(Data_out[2],  Data_in[2],  ctrl);     
bufif1(Data_out[3],  Data_in[3],  ctrl);     
bufif1(Data_out[4],  Data_in[4],  ctrl);     
bufif1(Data_out[5],  Data_in[5],  ctrl);
endmodule

module Buffer_16_Bit(
     input [15:0]Data_in,
     input ctrl,
     output [15:0]Data_out
     );
bufif1(Data_out[0],  Data_in[0],  ctrl);     
bufif1(Data_out[1],  Data_in[1],  ctrl);     
bufif1(Data_out[2],  Data_in[2],  ctrl);     
bufif1(Data_out[3],  Data_in[3],  ctrl);     
bufif1(Data_out[4],  Data_in[4],  ctrl);     
bufif1(Data_out[5],  Data_in[5],  ctrl);     
bufif1(Data_out[6],  Data_in[6],  ctrl);     
bufif1(Data_out[7],  Data_in[7],  ctrl);     
bufif1(Data_out[8],  Data_in[8],  ctrl);     
bufif1(Data_out[9],  Data_in[9],  ctrl);     
bufif1(Data_out[10], Data_in[10], ctrl);     
bufif1(Data_out[11], Data_in[11], ctrl);     
bufif1(Data_out[12], Data_in[12], ctrl);     
bufif1(Data_out[13], Data_in[13], ctrl);     
bufif1(Data_out[14], Data_in[14], ctrl);     
bufif1(Data_out[15], Data_in[15], ctrl); 
endmodule
//
//
//************************************  MULTIPLEXED BUSES ENDS HERE  ****************************************
//
//
module MOD_8_Counter(
    input clk,clr,inc,set,
    output reg [2:0]q
    );
    wire temp;
    // qa => LSB
    // qc => MSB
    always @(negedge clk)
    begin 
        if(clr) q <= 3'b000;
        else if (inc) q<= q+1;
        else if (set) q<= 3'b111;
        else q <= q;
    end
endmodule

module AddSub(out,in1,in2,oper);
input oper;
input [15:0] in1,in2;
output reg [15:0] out;

always @(*)
begin 
if(oper) out = in1 - in2;
else out = in1 + in2; 
end

endmodule

module Dff ( d,q,clk,clr);
    input d,clk,clr;
    output reg q;

    always @(posedge clk)
	   begin
		  if(clr) q <= 1'b0;
		  else q <= d;
	   end

endmodule

module Counter(count,clk,ld,decr);
	input decr,ld,clk;
	output reg [4:0] count;
	always @(negedge clk)
	begin
		if(ld) count <= 5'd16;
		else if (decr) count <= count-1;
	end
endmodule

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

module PIPOReg (data_in,data_out,clk,ld);
	input [15:0] data_in;
	input clk,ld;
	output reg [15:0] data_out;

	always @(negedge clk)
	begin
		if(ld) data_out <= data_in;
	end
endmodule
