`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2021 20:20:53
// Design Name: 
// Module Name: Controller
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


module Controller(rstCt1,rstCt2,rstCt3,incCt1,incCt2,setCt2,setCt3,incCt3,clrReg,read,write,start2,en,done1,multiplexed_input,cs,clrRAM,enROM,clrReg,enDecoder,enDCT,loadOutReg,start1,isCt17,isCt27,isCt37,isAddr63,clk,done2);

    input start1,isCt17,isCt27,isCt37,isAddr63,clk,done2;
    output reg rstCt1,rstCt2,rstCt3,incCt1,incCt2,setCt2,setCt3,incCt3,read,write,start2,en,done1,multiplexed_input,cs,clrRAM,enROM,clrReg,enDecoder,enDCT,loadOutReg;
    reg [5:0] state;
    
    parameter S0 = 5'b00000,S1 = 5'b00001,S2 = 5'b00010,S3 = 5'b00011,S4 = 5'b00100,S5 = 5'b00101,S6 = 5'b00110,S7 = 5'b00111,S8 = 5'b01000,S9 = 5'b01001,S10 = 5'b01010,S11 = 5'b01011,S12 = 5'b01100,S13 = 5'b01101,S14 = 5'b01110,S15 = 5'b01111,S16 = 5'b10000,S17 = 5'b10001,S18 = 5'b10010,S19 = 5'b10011;
    
    always @(posedge clk)
     begin
         case(state)
         S0: if(start1) state <= S1; 
         S1: if(isAddr63) state <= S2;
            else state <= S1;
         S2: if(isCt27) state <= S3;
             else state <= S2;
         S3: if(done2) state <= S4;
            else state <= S3;
         S4: if(isCt27)
                begin 
                    if(isCt17) state <= S6;
                    else state <= S5; 
                end  
             else state <= S4;
         S5: state <= S2;    
         S6: state <= S7;
         S7: if(isCt17) state <= S8;
             else state <= S7; 
         S8: if(done2) state <= S9;
             else state <= S8;
         S9: if(isCt17)
                begin 
                    if(isCt27) state <= S11;
                    else state <= S10; 
                end  
             else state <= S9;
         S10: state <= S7;
         S11: state <= S11; 
         default: state <= S0;
         endcase
     end 
     
    always @(state)
    begin 
        case(state)
		S0: 
			begin
				clrRAM = 1; cs = 1; read = 0; write = 0; enROM = 0; clrReg = 1; enDecoder = 0; rstCt1 = 1; setCt2 = 1; setCt3 = 1; enDCT = 0;
			end
		S1: 
			begin
				write = 1; multiplexed_input = 0; cs = 1; clrRAM = 0; clrReg = 0; rstCt1 = 0; setCt2 = 0; setCt3 = 0;
			end
		S2: 
			begin
			    read = 1; write = 0; incCt2 = 1; incCt3 = 1; multiplexed_input = 1; enDecoder = 1; enROM = 1;
			end
		S3: 
			begin
				read = 0; incCt2 = 0; incCt3 = 0; enDecoder = 0; enDCT = 1; start2 = 1; enROM = 0;
			end
		S4: 
			begin
				write = 1; incCt2 = 1; incCt3 = 1; enDCT = 0; start2 = 0; loadOutReg = 1;
			end	
		S5: 
			begin
				write = 0; incCt2 = 0; incCt3 = 0; incCt1 = 1; loadOutReg = 0;
			end
	    S6: 
			begin
				rstCt2 = 1; loadOutReg = 0;
			end
	    S7: 
			begin
				read = 1; incCt1 = 1; incCt3 = 1; rstCt2 = 0;
			end
	    S8: 
			begin
				read = 0; incCt1 = 0; incCt3 = 0; enDCT = 1; start2 = 1;
			end
	    S9: 
			begin
				write = 1; incCt1 = 1; incCt3 = 1; enDCT = 0; start2 = 0; loadOutReg = 1;
			end
	    S10: 
			begin
				write = 0; incCt1 = 0; incCt3 = 0; incCt2 = 1; loadOutReg = 0;
			end
	    S11: 
			begin
				incCt1 = 0; incCt3 = 0; incCt2 = 0; done1 = 1; loadOutReg = 0;
			end														
		default: 
			begin
//				ldA=0; ldQ=0; ldM=0; clrA=0; clrQ=0; clrDff=0; sftA=0; sftQ=0;addsub=0; done=0; decr=0; 
			end	
		endcase
    end 
     
       
       
       
       
       
       
       
        
endmodule
