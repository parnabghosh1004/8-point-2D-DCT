`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2022 11:23:45
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
    input clk,read,write,cs,
    output reg [15:0]data_out
    );
    reg [15:0]memory[63:0];
    
always@ (negedge clk)
begin
if(!cs)
    begin
        data_out = 16'hz;
    end
else if (cs & !write & !read)
    begin
        data_out = 16'hz;
    end
else if(cs & write)
    begin
        memory[address] <= data_in;
        data_out <= 16'hz;
    end
else if(cs & read)
    begin
    data_out <= memory[address];
    end
end
    
endmodule
