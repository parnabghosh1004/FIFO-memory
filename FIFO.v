`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 03:04:39 PM
// Design Name: 
// Module Name: FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO(data_in,data_out,full,empty,rd,wr,rst,clk,overflow,underflow);
    input[7:0] data_in;
    input clk,rst,rd,wr;
    output [7:0] data_out;
    output full,empty,overflow,underflow; 
    wire [5:0] wr_ptr;
    wire wr_en,rd_en;
    
    Write_pointer WP(.full(full),.clk(clk),.rst(rst),.wr(wr),.wr_ptr(wr_ptr),.wr_en(wr_en),.rd_en(rd_en));
    FIFO_array FA (.data_in(data_in),.data_out(data_out),.clk(clk),.wr_en(wr_en),.rd_en(rd_en),.wr_ptr(wr_ptr),.rst(rst));   
    Status_Signals SS(.full(full),.empty(empty),.overflow(overflow),.underflow(underflow),.clk(clk),.wr_ptr(wr_ptr),.wr(wr),.rd(rd),.rd_en(rd_en));
    
endmodule
