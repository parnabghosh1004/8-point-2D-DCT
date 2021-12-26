`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2021 16:35:47
// Design Name: 
// Module Name: RAM
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


module RAM(
     input [5:0]address,
     input [15:0]data_in,
     input clk,
     input read,
     input write,
     input cs,
     input clr,
     output [15:0]data_out
    );
wire [7:0]Yi,Yj;
wire [63:0]select;
//wire [15:0]buf_data_out,buf_data_in;
Decoder_3to8_i decoder3to8_i(.I(address[5:3]),.enb(cs),.Y(Yi[7:0]));
Decoder_3to8_j decoder3to8_j(.I(address[2:0]),.enb(cs),.Y(Yj[7:0]));
select_word_among_64 SWA64(.Yi(Yi[7:0]),.Yj(Yj[7:0]),.select(select[63:0]));
memory_block_array MBA(.data_in(data_in[15:0]),.select(select[63:0]),.read(read),.write(write),.clk(clk),.clr(clr),.data_out(data_out[15:0]));


endmodule

module Decoder_3to8_i(
     input [2:0]I,
     input enb,
     output [7:0]Y
     );
wire [2:0]comp_I;

not(comp_I[0],I[0]);
not(comp_I[1],I[1]);
not(comp_I[2],I[2]);

and(Y[0],  comp_I[0],  comp_I[1],  comp_I[2]  ,enb);
and(Y[1],  I[0],       comp_I[1],  comp_I[2]  ,enb);
and(Y[2],  comp_I[0],  I[1],       comp_I[2]  ,enb);
and(Y[3],  I[0],       I[1],       comp_I[2]  ,enb);
and(Y[4],  comp_I[0],  comp_I[1],  I[2]       ,enb);
and(Y[5],  I[0],       comp_I[1],  I[2]       ,enb);
and(Y[6],  comp_I[0],  I[1],       I[2]       ,enb);
and(Y[7],  I[0],       I[1],       I[2]       ,enb);

endmodule

module Decoder_3to8_j(
     input [2:0]I,
     input enb,
     output [7:0]Y
     );
wire [2:0]comp_I;

not(comp_I[0],I[0]);
not(comp_I[1],I[1]);
not(comp_I[2],I[2]);

and(Y[0],  comp_I[0],  comp_I[1],  comp_I[2]  ,enb);
and(Y[1],  I[0],       comp_I[1],  comp_I[2]  ,enb);
and(Y[2],  comp_I[0],  I[1],       comp_I[2]  ,enb);
and(Y[3],  I[0],       I[1],       comp_I[2]  ,enb);
and(Y[4],  comp_I[0],  comp_I[1],  I[2]       ,enb);
and(Y[5],  I[0],       comp_I[1],  I[2]       ,enb);
and(Y[6],  comp_I[0],  I[1],       I[2]       ,enb);
and(Y[7],  I[0],       I[1],       I[2]       ,enb);

endmodule

module select_word_among_64(
     input [7:0]Yi,Yj,
     output [63:0]select
     );
select_word_among_8 SW1(.Yi(Yi[0]), .Yj(Yj[7:0]), .select(select[7:0]));
select_word_among_8 SW2(.Yi(Yi[1]), .Yj(Yj[7:0]), .select(select[15:8]));
select_word_among_8 SW3(.Yi(Yi[2]), .Yj(Yj[7:0]), .select(select[23:16]));
select_word_among_8 SW4(.Yi(Yi[3]), .Yj(Yj[7:0]), .select(select[31:24]));
select_word_among_8 SW5(.Yi(Yi[4]), .Yj(Yj[7:0]), .select(select[39:32]));
select_word_among_8 SW6(.Yi(Yi[5]), .Yj(Yj[7:0]), .select(select[47:40]));
select_word_among_8 SW7(.Yi(Yi[6]), .Yj(Yj[7:0]), .select(select[55:48]));
select_word_among_8 SW8(.Yi(Yi[7]), .Yj(Yj[7:0]), .select(select[63:56]));
endmodule

module select_word_among_8(
     input Yi,
     input [7:0]Yj,
     output [7:0]select
     );
and(select[0],Yi,Yj[0]);
and(select[1],Yi,Yj[1]);
and(select[2],Yi,Yj[2]);
and(select[3],Yi,Yj[3]);
and(select[4],Yi,Yj[4]);
and(select[5],Yi,Yj[5]);
and(select[6],Yi,Yj[6]);
and(select[7],Yi,Yj[7]);
endmodule

module memory_block_array(
     input [15:0]data_in,
     input [63:0]select,
     input read,write,
     input clk,clr,
     output [15:0]data_out
     );
//data_out[15:0]
memory_block M00(.data_in(data_in[15:0]),.select(select[0]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M01(.data_in(data_in[15:0]),.select(select[1]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M02(.data_in(data_in[15:0]),.select(select[2]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M03(.data_in(data_in[15:0]),.select(select[3]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M04(.data_in(data_in[15:0]),.select(select[4]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M05(.data_in(data_in[15:0]),.select(select[5]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M06(.data_in(data_in[15:0]),.select(select[6]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M07(.data_in(data_in[15:0]),.select(select[7]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M08(.data_in(data_in[15:0]),.select(select[8]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M09(.data_in(data_in[15:0]),.select(select[9]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M10(.data_in(data_in[15:0]),.select(select[10]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M11(.data_in(data_in[15:0]),.select(select[11]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M12(.data_in(data_in[15:0]),.select(select[12]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M13(.data_in(data_in[15:0]),.select(select[13]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M14(.data_in(data_in[15:0]),.select(select[14]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M15(.data_in(data_in[15:0]),.select(select[15]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M16(.data_in(data_in[15:0]),.select(select[16]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M17(.data_in(data_in[15:0]),.select(select[17]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M18(.data_in(data_in[15:0]),.select(select[18]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M19(.data_in(data_in[15:0]),.select(select[19]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M20(.data_in(data_in[15:0]),.select(select[20]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M21(.data_in(data_in[15:0]),.select(select[21]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M22(.data_in(data_in[15:0]),.select(select[22]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M23(.data_in(data_in[15:0]),.select(select[23]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M24(.data_in(data_in[15:0]),.select(select[24]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M25(.data_in(data_in[15:0]),.select(select[25]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M26(.data_in(data_in[15:0]),.select(select[26]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M27(.data_in(data_in[15:0]),.select(select[27]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M28(.data_in(data_in[15:0]),.select(select[28]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M29(.data_in(data_in[15:0]),.select(select[29]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M30(.data_in(data_in[15:0]),.select(select[30]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M31(.data_in(data_in[15:0]),.select(select[31]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M32(.data_in(data_in[15:0]),.select(select[32]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M33(.data_in(data_in[15:0]),.select(select[33]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M34(.data_in(data_in[15:0]),.select(select[34]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M35(.data_in(data_in[15:0]),.select(select[35]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M36(.data_in(data_in[15:0]),.select(select[36]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M37(.data_in(data_in[15:0]),.select(select[37]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M38(.data_in(data_in[15:0]),.select(select[38]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M39(.data_in(data_in[15:0]),.select(select[39]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M40(.data_in(data_in[15:0]),.select(select[40]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M41(.data_in(data_in[15:0]),.select(select[41]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M42(.data_in(data_in[15:0]),.select(select[42]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M43(.data_in(data_in[15:0]),.select(select[43]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M44(.data_in(data_in[15:0]),.select(select[44]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M45(.data_in(data_in[15:0]),.select(select[45]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M46(.data_in(data_in[15:0]),.select(select[46]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M47(.data_in(data_in[15:0]),.select(select[47]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M48(.data_in(data_in[15:0]),.select(select[48]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M49(.data_in(data_in[15:0]),.select(select[49]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M50(.data_in(data_in[15:0]),.select(select[50]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M51(.data_in(data_in[15:0]),.select(select[51]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M52(.data_in(data_in[15:0]),.select(select[52]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M53(.data_in(data_in[15:0]),.select(select[53]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M54(.data_in(data_in[15:0]),.select(select[54]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M55(.data_in(data_in[15:0]),.select(select[55]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
memory_block M56(.data_in(data_in[15:0]),.select(select[56]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M57(.data_in(data_in[15:0]),.select(select[57]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M58(.data_in(data_in[15:0]),.select(select[58]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M59(.data_in(data_in[15:0]),.select(select[59]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M60(.data_in(data_in[15:0]),.select(select[60]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M61(.data_in(data_in[15:0]),.select(select[61]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M62(.data_in(data_in[15:0]),.select(select[62]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
memory_block M63(.data_in(data_in[15:0]),.select(select[63]),.write(write),.read(read),.clk(clk),.clr(clr),.data_out(data_out[15:0]));
//
endmodule

module memory_block(
     input [15:0]data_in,select,
     input read,write,
     input clk,clr,
     output [15:0]data_out
     );
memory_cell M00(.data_in(data_in[0]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[0]));
memory_cell M01(.data_in(data_in[1]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[1]));
memory_cell M02(.data_in(data_in[2]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[2]));
memory_cell M03(.data_in(data_in[3]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[3]));
memory_cell M04(.data_in(data_in[4]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[4]));
memory_cell M05(.data_in(data_in[5]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[5]));
memory_cell M06(.data_in(data_in[6]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[6]));
memory_cell M07(.data_in(data_in[7]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[7]));
memory_cell M08(.data_in(data_in[8]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[8]));
memory_cell M09(.data_in(data_in[9]), .select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[9]));
memory_cell M10(.data_in(data_in[10]),.select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[10]));
memory_cell M11(.data_in(data_in[11]),.select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[11]));
memory_cell M12(.data_in(data_in[12]),.select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[12]));
memory_cell M13(.data_in(data_in[13]),.select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[13]));
memory_cell M14(.data_in(data_in[14]),.select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[14]));
memory_cell M15(.data_in(data_in[15]),.select(select), .read(read), .write(write), .clk(clk),.clr(clr),.data_out(data_out[15]));
endmodule

module memory_cell(
     input data_in,select,read,write,
     input clk,clr,
     output data_out
     );
wire comp_data_in,S,R,Q;
not(comp_data_in,data_in);
and(S,data_in,write,select);
and(R,comp_data_in,write,select);
SR_FF SRFF(.S(S),.R(R),.clk(clk),.clr(clr),.Q(Q));
and(data_out,select,Q,read);
endmodule

module SR_FF(
    input S,R,clk,clr,
    output reg Q
    );
always@(posedge clk)
    begin
        if(clr) Q<=1'b0;
        else if(S == 1)
        begin
            Q <= 1'b1;
//            Qbar <= 0;
        end

        else if(R == 1)
        begin
            Q <= 1'b0;
//            Qbar <= 1;
        end

        else if(S == 0 & R == 0)
        begin
            Q <= Q;
//            Qbar = Qbar;
        end
    end
endmodule
