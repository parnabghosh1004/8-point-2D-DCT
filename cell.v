`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:29 12/23/2021 
// Design Name: 
// Module Name:    cell 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sr_ff(
    input s,
	 input r,
	 output q,
	 output qbar
	 );
	 
	 nor(q, r, qbar);
	 nor(qbar, s, q);

endmodule	 

module cell(
    input in,
	 input sel,
	 input read_wr,
	 output out
    );
	 
	 wire w1, w2, w3, w4, q, qbar;
	 not(w4, read_wr);
	 not(w3, in);
	 and(w1, w3, w4, sel);
	 and(w2, in, read_wr, sel);
	 
    sr_ff s1(w2, w1, q, qbar);
	 
    and(out, sel, q, read_wr);
	 
endmodule
