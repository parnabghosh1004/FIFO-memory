`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 03:07:01 PM
// Design Name: 
// Module Name: FIFO_array
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


module FIFO_array #(parameter depth=32)(data_in,data_out,clk,wr_en,rd_en,wr_ptr,rst);

    input [7:0] data_in;
    input clk,wr_en,rd_en,rst;
    input [5:0] wr_ptr;
    output [7:0] data_out;
    reg [7:0] mem[depth-1:0];
    integer i;

    always @(posedge clk,negedge rst)
    begin
        if(~rst) for(i=0;i<=depth-1;i=i+1) mem[i] <= 8'b0;
        if(wr_en) mem[wr_ptr] <= data_in;
        else if(rd_en) 
         begin
            for(i=0;i<depth-1;i=i+1) mem[i] = mem[i+1];
            mem[31] = 8'b0;
         end
    end
    
    assign data_out = mem[0];
    
endmodule

