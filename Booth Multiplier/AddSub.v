`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2021 01:24:08 PM
// Design Name: 
// Module Name: shiftReg
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

//module Complement8bit(input [7:0] in,output [7:0] out);
//	not(out[0],in[0]);
//	not(out[1],in[1]);
//	not(out[2],in[2]);
//	not(out[3],in[3]);
//	not(out[4],in[4]);
//	not(out[5],in[5]);
//	not(out[6],in[6]);
//	not(out[7],in[7]);
//endmodule

//module Complement24bit(input [23:0] in,output [23:0] out);
//	Complement8bit C01(.in(in[7:0]),.out(out[7:0]));
//	Complement8bit C02(.in(in[15:8]),.out(out[15:8]));
//	Complement8bit C03(.in(in[23:16]),.out(out[23:16]));
//endmodule

//module Mux_1Bit(input in0,input in1 ,input sl,output out);
//	wire w1,w2,invSL;
//	not(invSL,sl);
//	and(w1,in0,invSL);
//	and(w2,in1,sl);
//	or(out,w1,w2);
//endmodule

//module Mux_8Bit(input [7:0] in0,input [7:0] in1 ,input sl,output [7:0] out);
//	Mux_1Bit M01(.in0(in0[0]),.in1(in1[0]) ,.sl(sl),.out(out[0]));
//	Mux_1Bit M02(.in0(in0[1]),.in1(in1[1]) ,.sl(sl),.out(out[1]));
//	Mux_1Bit M03(.in0(in0[2]),.in1(in1[2]) ,.sl(sl),.out(out[2]));
//	Mux_1Bit M04(.in0(in0[3]),.in1(in1[3]) ,.sl(sl),.out(out[3]));
//	Mux_1Bit M05(.in0(in0[4]),.in1(in1[4]) ,.sl(sl),.out(out[4]));
//	Mux_1Bit M06(.in0(in0[5]),.in1(in1[5]) ,.sl(sl),.out(out[5]));
//	Mux_1Bit M07(.in0(in0[6]),.in1(in1[6]) ,.sl(sl),.out(out[6]));
//	Mux_1Bit M08(.in0(in0[7]),.in1(in1[7]) ,.sl(sl),.out(out[7]));
//endmodule

//module Mux_24Bit(input [23:0] in0,input [23:0] in1 ,input sl,output [23:0] out);
//	Mux_8Bit M01(.in0(in0[7:0]),.in1(in1[7:0]) ,.sl(sl),.out(out[7:0]));
//	Mux_8Bit M02(.in0(in0[15:8]),.in1(in1[15:8]) ,.sl(sl),.out(out[15:8]));
//	Mux_8Bit M03(.in0(in0[23:16]),.in1(in1[23:16]) ,.sl(sl),.out(out[23:16]));
//endmodule

//module Adder4bit(input [3:0] a,input [3:0] b,input cin,output [3:0]sum,output cout);
//	wire g0,g1,g2,g3,p0,p1,p2,p3,c2,c1,c0;
//	assign g0 = a[0]&b[0];
//	assign g1 = a[1]&b[1];
//	assign g2 = a[2]&b[2];
//	assign g3 = a[3]&b[3];
//	assign p0 = a[0]^b[0];
//	assign p1 = a[1]^b[1];
//	assign p2 = a[2]^b[2];
//	assign p3 = a[3]^b[3];
//	assign c0 = g0 |( p0 & cin);
//	assign c1 = g1 | (p1&g0)| (p1&p0&cin);
//	assign c2 = g2 | (p2&g1) | (p2&p1&g0) | (p2&p1&p0&cin);
//	assign cout = g3 | (p3&g2) | (p3&p2&g1) | (p3&p2&p1&g0) | (p3&p2&p1&p0&cin);

//	xor(sum[0],p0,cin);
//	xor(sum[1],p1,c0);
//	xor(sum[2],p2,c1);
//	xor(sum[3],p3,c2);

//endmodule

//module Adder8bit(input [7:0] a,input [7:0] b,input cin,output [7:0]sum,output cout);
//    wire ctemp;
//	Adder4bit ADD01(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(ctemp));
//	Adder4bit ADD02(.a(a[7:4]),.b(b[7:4]),.cin(ctemp),.sum(sum[7:4]),.cout(cout));
//endmodule

//module Adder24bit(input [23:0] a,input [23:0] b,input cin,output [23:0]sum,output cout);
//    wire ctemp1,ctemp2;
//	Adder8bit ADD01(.a(a[7:0]),.b(b[7:0]),.cin(cin),.sum(sum[7:0]),.cout(ctemp1));
//	Adder8bit ADD02(.a(a[15:8]),.b(b[15:8]),.cin(ctemp1),.sum(sum[15:8]),.cout(ctemp2));
//	Adder8bit ADD03(.a(a[23:16]),.b(b[23:16]),.cin(ctemp2),.sum(sum[23:16]),.cout(cout));
//endmodule

//module AddSub(out,in1,in2,oper);
//	input [23:0] in1,in2;
//	input oper;
//	output [23:0] out;
//	wire [23:0] t1,t2;
//	Complement24bit C01(.in(in2),.out(t1));
//	Mux_24Bit M01(.in0(in2),.in1(t1),.sl(oper),.out(t2));
//	Adder24bit ADD02(.a(in1),.b(t2),.cin(oper),.sum(out),.cout());
//endmodule


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



