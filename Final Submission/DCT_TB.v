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
integer i = 10;

wire rstCt1,rstCt2,rstCt3,setCt2,setCt3,incCt1,incCt2,incCt3,clrReg,cs,clrRAM,enROM,enDecoder,enDCT,loadOutReg,read,write,start2,isCt17,isCt27,isCt37,isAddr63,done2,multiplexed_input;
wire done1;

DCT_DataPath DP(clk,rstCt1,rstCt2,rstCt3,incCt1,incCt2,incCt3,setCt2,setCt3,clrReg,multiplexed_input,cs,clrRAM,enROM,enDecoder,enDCT,loadOutReg,isCt17,isCt27,isCt37,isAddr63,read,write,start2,done2,Data_tb,Addr_tb);
Controller CP(clk,rstCt1,rstCt2,rstCt3,incCt1,incCt2,incCt3,setCt2,setCt3,clrReg,multiplexed_input,cs,clrRAM,enROM,enDecoder,enDCT,loadOutReg,isCt17,isCt27,isCt37,isAddr63,read,write,start2,done2,done1,start1);

initial begin
    clk = 1'b0;
    start1 = 1'b0;
    #2 start1 = 1'b1;   
end

always #5 clk = ~clk;

initial 
    begin
    #7
    for(Addr_tb = 6'b000000;Addr_tb <= 6'b111111;Addr_tb = Addr_tb + 1)
    begin
        Data_tb = 16'b0000000000000000+Addr_tb;
        #10;
    end
    end
    
initial #1200 $finish;    
  
endmodule
