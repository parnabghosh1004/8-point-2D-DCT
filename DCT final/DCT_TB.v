`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2021 09:17:04
// Design Name: 
// Module Name: DCT_TB
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


module DCT_TB;

reg [15:0] Data_tb;
reg [5:0] Addr_tb;
reg clk,start1;

wire rstCt1,rstCt2,setCt2,incCt1,incCt2,clrReg,cs,enROM,enDecoder,enDCT,loadOutReg,read,write,start2,isCt17,isCt27,isAddr63,done2,multiplexed_input;
wire done1;
wire [7:0] ldPIPOIn,load_line;

DCT_DataPath DP(clk,rstCt1,rstCt2,incCt1,incCt2,setCt2,clrReg,multiplexed_input,cs,enROM,enDecoder,enDCT,ldPIPOIn,load_line,loadOutReg,isCt17,isCt27,isAddr63,read,write,start2,done2,Data_tb,Addr_tb);
Controller CP(clk,rstCt1,rstCt2,incCt1,incCt2,setCt2,clrReg,multiplexed_input,cs,enROM,enDecoder,enDCT,ldPIPOIn,load_line,loadOutReg,isCt17,isCt27,isAddr63,read,write,start2,done2,done1,start1);

initial begin
    clk = 1'b0;
    start1 = 1'b0;
    #2 start1 = 1'b1;   
end

always #5 clk = ~clk;

initial 
    begin
    #17
    for(Addr_tb = 6'b000000;Addr_tb <= 6'b111111;Addr_tb = Addr_tb + 1)
    begin
        Data_tb = {Addr_tb,4'b0000};
        #10;
    end
    end
    
initial #15000 $finish;    
  
endmodule
