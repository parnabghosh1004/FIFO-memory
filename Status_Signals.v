`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 03:21:41 PM
// Design Name: 
// Module Name: Status_Signals
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


module Status_Signals #(parameter depth=32) (full,empty,overflow,underflow,clk,wr_ptr,wr,rd,rd_en);

    input clk,wr,rd;
    input [31:0] wr_ptr;
    output full,empty,overflow,underflow,rd_en;
    
    assign full = (wr_ptr == depth) ? 1:0;
    assign empty = (wr_ptr == 0) ? 1:0;
    assign rd_en = (~empty & rd);
    
    assign overflow = (wr & full)? 1:0;
    assign underflow = (rd & empty)? 1:0;
    
endmodule
