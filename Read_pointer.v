`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 01:58:43 PM
// Design Name: 
// Module Name: Read_pointer
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


module Read_pointer(empty,clk,rst,rd,rd_ptr,rd_en);

    input clk,rst,empty,rd;
    output rd_en;
    output reg [4:0] rd_ptr;

    assign rd_en = (~empty) & rd;    
    
    always @(posedge clk, negedge rst)
    begin
        if(~rst) rd_ptr <= 5'd0;
        else if(rd_en) rd_ptr <= rd_ptr +1;
        else rd_ptr <= rd_ptr;
    end

endmodule
