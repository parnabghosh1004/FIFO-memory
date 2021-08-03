`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 01:36:09 PM
// Design Name: 
// Module Name: Write_pointer
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


module Write_pointer(full,clk,rst,wr,wr_ptr,wr_en,rd_en);
    
    input clk,rst,full,wr,rd_en;
    output wr_en;
    output reg [5:0] wr_ptr;
    
    assign wr_en = (~full) & wr;    
    
    always @(posedge clk, negedge rst)
    begin
        if(~rst) wr_ptr <= 6'd0;
        else if(wr_en) wr_ptr <= wr_ptr + 6'd1;
        else if(rd_en) wr_ptr <= wr_ptr - 6'd1;
        else wr_ptr <= wr_ptr;
    end
    
endmodule


