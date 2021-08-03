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

    // FIFO depth is set as 29 here ( any value > 0 can also be given)
    FIFO #(.depth(29)) uut(.data_in(data_in),.data_out(data_out),.full(full),.empty(empty),.rd(rd),.wr(wr),.rst(rst),.clk(clk),.overflow(overflow),.underflow(underflow));
    
    initial 
        begin
           // initialization of input registers 
           clk = 1'b0;  
           rst = 1'b0;  
           wr = 1'b0;  
           rd = 1'b0;  
           data_in = 8'd0;
           #1 rst = 1'b1;  
           $monitor($time," Overflow = %b , Underflow = %b , full = %b, empty = %b data_out = %d\n",overflow,underflow,full,empty,data_out);
        end  

    // setting the clock
    always #5 clk = ~clk;

    initial begin
    
        // initially wr=1 after 4ns then after Ton = 2ns and Toff =8ns is set to match timing.
        
        #4 wr = 1'b1;
        data_in = 8'b0;  // filling in the first data
        #2 wr = 1'b0;
    
    
        // filling the entire FIF0 and at i=29 ---> overflow = 1 means value = 29 will not be stored in the FIFO  
        for (i=1;i<=29;i=i+1) 
        begin
            #8 wr = 1'b1;
            data_in = i;
            #2 wr = 1'b0;
        end
        
        // pulling 20 data out of the FIFO by giving same type of rd signal as wr signal
        for (i=1;i<=20;i=i+1) 
        begin
            #8 rd = 1'b1;
            #2 rd = 1'b0;
        end
         
        #10000 $finish;
        // after finishing we can see in the mem register in the FIFO_array.v file the data left in the FIFO
        
    end

endmodule
