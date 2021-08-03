`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 08:28:01 PM
// Design Name: 
// Module Name: FIFO_tb
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


module fifo_tb;
    
    reg clk,rd,wr,rst;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire overflow,underflow,full,empty;
    integer i;

    FIFO uut(.data_in(data_in),.data_out(data_out),.full(full),.empty(empty),.rd(rd),.wr(wr),.rst(rst),.clk(clk),.overflow(overflow),.underflow(underflow));
    
    initial 
        begin  
           clk = 1'b0;  
           rst = 1'b0;  
           wr = 1'b0;  
           rd = 1'b0;  
           data_in = 8'd0;
           #1 rst = 1'b1;  
           $monitor($time," Overflow = %b , Underflow = %b , full = %b, empty = %b data_out = %d\n",overflow,underflow,full,empty,data_out);
        end  

    always #5 clk = ~clk;

    initial begin
    
        #4 wr = 1'b1;
        data_in = 8'b0;
        #2 wr = 1'b0;
    
    
        // filling the entire FIFO
        for (i=1;i<=32;i=i+1) 
        begin
            #8 wr = 1'b1;
            data_in = i;
            #2 wr = 1'b0;
        end
        
        // pulling data out of FIFO
        for (i=1;i<=32;i=i+1) 
        begin
            #8 rd = 1'b1;
            #2 rd = 1'b0;
        end
         
        #10000 $finish;
    end

endmodule
