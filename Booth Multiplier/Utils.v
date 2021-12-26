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
