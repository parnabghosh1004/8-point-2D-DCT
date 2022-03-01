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


module Controller(clk,rstCt1,rstCt2,incCt1,incCt2,setCt2,clrReg,multiplexed_input,cs,enROM,enDecoder,enDCT,ldPIPOIn,load_line,loadOutReg,isCt17,isCt27,isAddr63,read,write,start2,done2,done1,start1);

    input start1,isCt17,isCt27,isAddr63,clk,done2;
    output reg rstCt1,rstCt2,incCt1,incCt2,setCt2,read,write,start2,done1,multiplexed_input,cs,enROM,clrReg,enDecoder,enDCT,loadOutReg;
    output reg [7:0] ldPIPOIn,load_line;
    reg [5:0] state;
    
    parameter S0 = 5'b00000,S1 = 5'b00001,S2 = 5'b00010,S3 = 5'b00011,S4 = 5'b00100,S5 = 5'b00101,S6 = 5'b00110,S7 = 5'b00111,S8 = 5'b01000,S9 = 5'b01001,S10 = 5'b01010,S11 = 5'b01011,S12 = 5'b01100, S13 = 5'b01101, S14 = 5'b01110, S15 = 5'b01111;
    
    always @(posedge clk)
     begin
         case(state)
         S0: if(start1) state <= S1; 
         S1: if(isAddr63) state <= S2;
            else state <= S1;
         S2: state <= S3;
         S3: if(isCt27) state <= S4;
             else state <= S2;    
         S4: if(done2) state <= S5;
            else state <= S4;
         S5: state <= S6;
         S6: if(isCt27)
                begin 
                    if(isCt17) state <= S8;
                    else state <= S7; 
                end  
             else state <= S5;
         S7: state <= S2;    
         S8: state <= S9;
         S9: state <= S10;
         S10: if(isCt17) state <= S11;
             else state <= S9; 
         S11: if(done2) state <= S12;
             else state <= S11;
         S12: state <= S13;
         S13: if(isCt17)
                begin 
                    if(isCt27) state <= S15;
                    else state <= S14; 
                end  
             else state <= S12;
         S14: state <= S9;
         S15: state <= S15; 
         default: state <= S0;
         endcase
     end 
     
    always @(state)
    begin 
        case(state)
		S0: 
			begin
				cs = 1; read = 0; write = 0; enROM = 0; clrReg = 1; enDecoder = 0; rstCt1 = 1; rstCt2 = 0; setCt2 = 1; enDCT = 0; incCt1 = 0; incCt2 = 0; loadOutReg = 0; ldPIPOIn = 8'b0; load_line = 8'b0; start2 = 0; done1 = 0;
			end
		S1: 
			begin
				write = 1; multiplexed_input = 0; clrReg = 0; rstCt1 = 0; setCt2 = 0;
			end
		S2: 
			begin
			    read = 0; write = 0; incCt1 = 0; incCt2 = 1; multiplexed_input = 1; enDecoder = 1; enROM = 1; if(!ldPIPOIn) ldPIPOIn = 8'b1; else ldPIPOIn = ldPIPOIn << 1;
			end
		S3: 
			begin
			    read = 1; incCt2 = 0;
			end	
		S4: 
			begin
				read = 0; incCt2 = 0; enDecoder = 0; enDCT = 1; start2 = 1; enROM = 0; ldPIPOIn = ldPIPOIn << 1;
			end
		S5: 
			begin
				write = 0; incCt2 = 1; enDecoder = 1; enDCT = 0; start2 = 0; loadOutReg = 1; if(!load_line) load_line = 8'b1; else load_line = load_line << 1;
			end	
		S6: 
			begin
			    write = 1; incCt2 = 0;
			end		
		S7: 
			begin
				write = 0; incCt2 = 0; enDecoder = 0; incCt1 = 1; loadOutReg = 0; load_line = load_line << 1;
			end
	    S8: 
			begin
				rstCt2 = 1; loadOutReg = 0; enDecoder = 0; incCt2 = 0; load_line = load_line << 1;
			end
	    S9: 
			begin
				read = 0; write = 0; incCt1 = 1; incCt2 = 0; rstCt2 = 0; enDecoder = 1; enROM = 1; if(!ldPIPOIn) ldPIPOIn = 8'b1; else ldPIPOIn = ldPIPOIn << 1;
			end
	    S10: 
			begin
				 read = 1; incCt1 = 0;
			end	
	    S11: 
			begin
				read = 0; incCt1 = 0; enDecoder = 0; enDCT = 1; start2 = 1; enROM = 0; ldPIPOIn = ldPIPOIn << 1;
			end
	    S12: 
			begin
				write = 0; incCt1 = 1; enDecoder = 1; enDCT = 0; start2 = 0; loadOutReg = 1; if(!load_line) load_line = 8'b1; else load_line = load_line << 1;
			end
		S13: 
			begin
			    write = 1; incCt1 = 0;
			end		
	    S14: 
			begin
				write = 0; incCt1 = 0; enDecoder = 0; incCt2 = 1; loadOutReg = 0; load_line = load_line << 1;
			end
	    S15: 
			begin
				write = 0; read = 0; incCt1 = 0; incCt2 = 0; rstCt1 = 1; rstCt2 = 1; done1 = 1; loadOutReg = 0; clrReg = 1; load_line = load_line << 1;
			end														
		default: 
			begin
                cs = 0; read = 0; write = 0; enROM = 0; clrReg = 0; enDecoder = 0; rstCt1 = 0;rstCt2 = 0; setCt2 = 0; enDCT = 0;
			end	
		endcase
    end 
       
       
        
endmodule
