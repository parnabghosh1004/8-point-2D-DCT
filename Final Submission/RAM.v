module RAM(
     input [5:0]address,
     input [15:0]data_in,
     input clk,
     input read,
     input write,
     input cs,
     input clr,
     output tri [15:0]data_out
     );
wire [63:0]select;
wire [15:0]data_out0,data_out1,data_out2,data_out3,data_out4,data_out5,data_out6,data_out7;
decoder_6x64 decode(.i0(address[0]),.i1(address[1]),.i2(address[2]),.i3(address[3]),.i4(address[4]),.i5(address[5]),.enable(cs),.y(select[63:0]));
select_memory_block SMB(.data_in(data_in),.select(select[63:0]),.read(read),.write(write),.clk(clk),.clr(clr),.data_out(data_out));
endmodule


module select_memory_block(
     input [15:0]data_in,
     input [63:0]select,
     input read,write,
     input clk,clr,
     output [15:0]data_out
     );
wire [15:0]mem_out[0:63];

memory_block M00(.data_in(data_in[15:0]),.select(select[0]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[0]) );
memory_block M01(.data_in(data_in[15:0]),.select(select[1]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[1]) );
memory_block M02(.data_in(data_in[15:0]),.select(select[2]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[2]) );
memory_block M03(.data_in(data_in[15:0]),.select(select[3]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[3]) );
memory_block M04(.data_in(data_in[15:0]),.select(select[4]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[4]) );
memory_block M05(.data_in(data_in[15:0]),.select(select[5]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[5]) );
memory_block M06(.data_in(data_in[15:0]),.select(select[6]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[6]) );
memory_block M07(.data_in(data_in[15:0]),.select(select[7]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[7]) );

memory_block M08(.data_in(data_in[15:0]),.select(select[8]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[8]) );
memory_block M09(.data_in(data_in[15:0]),.select(select[9]),  .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[9]) );
memory_block M10(.data_in(data_in[15:0]),.select(select[10]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[10]));
memory_block M11(.data_in(data_in[15:0]),.select(select[11]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[11]));
memory_block M12(.data_in(data_in[15:0]),.select(select[12]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[12]));
memory_block M13(.data_in(data_in[15:0]),.select(select[13]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[13]));
memory_block M14(.data_in(data_in[15:0]),.select(select[14]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[14]));
memory_block M15(.data_in(data_in[15:0]),.select(select[15]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[15]));

memory_block M16(.data_in(data_in[15:0]),.select(select[16]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[16]));
memory_block M17(.data_in(data_in[15:0]),.select(select[17]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[17]));
memory_block M18(.data_in(data_in[15:0]),.select(select[18]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[18]));
memory_block M19(.data_in(data_in[15:0]),.select(select[19]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[19]));
memory_block M20(.data_in(data_in[15:0]),.select(select[20]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[20]));
memory_block M21(.data_in(data_in[15:0]),.select(select[21]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[21]));
memory_block M22(.data_in(data_in[15:0]),.select(select[22]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[22]));
memory_block M23(.data_in(data_in[15:0]),.select(select[23]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[23]));

memory_block M24(.data_in(data_in[15:0]),.select(select[24]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[24]));
memory_block M25(.data_in(data_in[15:0]),.select(select[25]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[25]));
memory_block M26(.data_in(data_in[15:0]),.select(select[26]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[26]));
memory_block M27(.data_in(data_in[15:0]),.select(select[27]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[27]));
memory_block M28(.data_in(data_in[15:0]),.select(select[28]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[28]));
memory_block M29(.data_in(data_in[15:0]),.select(select[29]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[29]));
memory_block M30(.data_in(data_in[15:0]),.select(select[30]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[30]));
memory_block M31(.data_in(data_in[15:0]),.select(select[31]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[31]));

memory_block M32(.data_in(data_in[15:0]),.select(select[32]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[32]));
memory_block M33(.data_in(data_in[15:0]),.select(select[33]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[33]));
memory_block M34(.data_in(data_in[15:0]),.select(select[34]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[34]));
memory_block M35(.data_in(data_in[15:0]),.select(select[35]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[35]));
memory_block M36(.data_in(data_in[15:0]),.select(select[36]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[36]));
memory_block M37(.data_in(data_in[15:0]),.select(select[37]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[37]));
memory_block M38(.data_in(data_in[15:0]),.select(select[38]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[38]));
memory_block M39(.data_in(data_in[15:0]),.select(select[39]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[39]));

memory_block M40(.data_in(data_in[15:0]),.select(select[40]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[40]));
memory_block M41(.data_in(data_in[15:0]),.select(select[41]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[41]));
memory_block M42(.data_in(data_in[15:0]),.select(select[42]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[42]));
memory_block M43(.data_in(data_in[15:0]),.select(select[43]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[43]));
memory_block M44(.data_in(data_in[15:0]),.select(select[44]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[44]));
memory_block M45(.data_in(data_in[15:0]),.select(select[45]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[45]));
memory_block M46(.data_in(data_in[15:0]),.select(select[46]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[46]));
memory_block M47(.data_in(data_in[15:0]),.select(select[47]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[47]));

memory_block M48(.data_in(data_in[15:0]),.select(select[48]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[48]));
memory_block M49(.data_in(data_in[15:0]),.select(select[49]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[49]));
memory_block M50(.data_in(data_in[15:0]),.select(select[50]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[50]));
memory_block M51(.data_in(data_in[15:0]),.select(select[51]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[51]));
memory_block M52(.data_in(data_in[15:0]),.select(select[52]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[52]));
memory_block M53(.data_in(data_in[15:0]),.select(select[53]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[53]));
memory_block M54(.data_in(data_in[15:0]),.select(select[54]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[54]));
memory_block M55(.data_in(data_in[15:0]),.select(select[55]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[55]));

memory_block M56(.data_in(data_in[15:0]),.select(select[56]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[56]));
memory_block M57(.data_in(data_in[15:0]),.select(select[57]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[57]));
memory_block M58(.data_in(data_in[15:0]),.select(select[58]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[58]));
memory_block M59(.data_in(data_in[15:0]),.select(select[59]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[59]));
memory_block M60(.data_in(data_in[15:0]),.select(select[60]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[60]));
memory_block M61(.data_in(data_in[15:0]),.select(select[61]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[61]));
memory_block M62(.data_in(data_in[15:0]),.select(select[62]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[62]));
memory_block M63(.data_in(data_in[15:0]),.select(select[63]), .write(write),.read(read),.clk(clk),.clr(clr),.data_out(mem_out[63]));
//[15:0]mem_out[0:63];
assign data_out = mem_out[0]|mem_out[1]|mem_out[2]|mem_out[3]|mem_out[4]|mem_out[5]|mem_out[6]|mem_out[7]|mem_out[8]|mem_out[9]|mem_out[10]|mem_out[11]|mem_out[12]|mem_out[13]|mem_out[14]|mem_out[15]|mem_out[16]|mem_out[17]|mem_out[18]|mem_out[19]|mem_out[20]|mem_out[21]|mem_out[22]|mem_out[23]|mem_out[24]|mem_out[25]|mem_out[26]|mem_out[27]|mem_out[28]|mem_out[29]|mem_out[30]|mem_out[31]|mem_out[32]|mem_out[33]|mem_out[34]|mem_out[35]|mem_out[36]|mem_out[36]|mem_out[38]|mem_out[39]|mem_out[40]|mem_out[41]|mem_out[42]|mem_out[43]|mem_out[44]|mem_out[45]|mem_out[46]|mem_out[47]|mem_out[48]|mem_out[49]|mem_out[50]|mem_out[51]|mem_out[52]|mem_out[53]|mem_out[54]|mem_out[55]|mem_out[56]|mem_out[57]|mem_out[58]|mem_out[59]|mem_out[60]|mem_out[61]|mem_out[62]|mem_out[63];
endmodule

module memory_block(
     input [15:0]data_in,
     input select,
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

module decoder_6x64(
     input i0, // MSB of j
	input i1,
	input i2, // MSB of j
	input i3, // LSB of i   => For row selection
	input i4,
	input i5, // MSB of i
	input enable,
	output [63:0]y
     );
	wire w1, w2, w3, w4, w5, w6, w7, w8;
	 
	decoder_3x8 d1(.a(i5), .b(i4), .c(i3), .enable(1),  .d0(w1),    .d1(w2),    .d2(w3),    .d3(w4),    .d4(w5),    .d5(w6),    .d6(w7),    .d7(w8)); // row selection
	decoder_3x8 d2(.a(i2), .b(i1), .c(i0), .enable(w1), .d0(y[0]),  .d1(y[1]),  .d2(y[2]),  .d3(y[3]),  .d4(y[4]),  .d5(y[5]),  .d6(y[6]),  .d7(y[7]));
	decoder_3x8 d3(.a(i2), .b(i1), .c(i0), .enable(w2), .d0(y[8]),  .d1(y[9]),  .d2(y[10]), .d3(y[11]), .d4(y[12]), .d5(y[13]), .d6(y[14]), .d7(y[15]));
	decoder_3x8 d4(.a(i2), .b(i1), .c(i0), .enable(w3), .d0(y[16]), .d1(y[17]), .d2(y[18]), .d3(y[19]), .d4(y[20]), .d5(y[21]), .d6(y[22]), .d7(y[23]));
	decoder_3x8 d5(.a(i2), .b(i1), .c(i0), .enable(w4), .d0(y[24]), .d1(y[25]), .d2(y[26]), .d3(y[27]), .d4(y[28]), .d5(y[29]), .d6(y[30]), .d7(y[31]));
	decoder_3x8 d6(.a(i2), .b(i1), .c(i0), .enable(w5), .d0(y[32]), .d1(y[33]), .d2(y[34]), .d3(y[35]), .d4(y[36]), .d5(y[37]), .d6(y[38]), .d7(y[39]));
	decoder_3x8 d7(.a(i2), .b(i1), .c(i0), .enable(w6), .d0(y[40]), .d1(y[41]), .d2(y[42]), .d3(y[43]), .d4(y[44]), .d5(y[45]), .d6(y[46]), .d7(y[48]));
	decoder_3x8 d8(.a(i2), .b(i1), .c(i0), .enable(w7), .d0(y[48]), .d1(y[49]), .d2(y[50]), .d3(y[51]), .d4(y[52]), .d5(y[53]), .d6(y[54]), .d7(y[55]));
     decoder_3x8 d9(.a(i2), .b(i1), .c(i0), .enable(w8), .d0(y[56]), .d1(y[57]), .d2(y[58]), .d3(y[59]), .d4(y[60]), .d5(y[61]), .d6(y[62]), .d7(y[63]));

endmodule

module decoder_3x8(
     input a, // LSB
	input b,
	input c, // MSB
	input enable,
	output d0,
	output d1,
	output d2,
	output d3,
	output d4,
	output d5,
	output d6,
	output d7
     ); 
	wire not_a, not_b, not_c;
	 
	not(not_a, a);
	not(not_b, b);
	not(not_c, c);
	 
	and(d0, not_a, not_b, not_c, enable);
	and(d1, not_a, not_b, c, enable);
	and(d2, not_a, b, not_c, enable);
	and(d3, not_a, b, c, enable);
	and(d4, a, not_b, not_c, enable);
	and(d5, a, not_b, c, enable);
	and(d6, a, b, not_c, enable);
	and(d7, a, b, c, enable);
	
endmodule	