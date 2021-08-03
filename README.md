# FIFO MEMORY

Block Diagram

![fifo](https://user-images.githubusercontent.com/67265356/127986902-62fdf494-3bba-4266-9d02-3be8a3c1d347.png)

<br>

**INPUTS**
    
    data_in  =>   8-bit Data input
      
    rd       =>   1 if we want the data to be taken out and 0 otherwise 
      
    wr       =>   1 if we want to push data into the FIFO and 0 otherwise
    
    rst      =>   Active low signal ---> 0 if we want to clear the FIFO and 1 otherwise

    clk      =>   clock signal
    
<br>    

**OUTPUTS**
    
    data_out   =>   8-bit Data output
    
    full       =>   1 is the output if the FIFO is full and 0 otherwise
    
    empty      =>   1 is the output if the FIFO is empty and 0 otherwise

    overflow   =>   1 is the output if FIFO is full and still the data is being written ( means wr is set to 1 and data_in is set with some input ) and 0 otherwise
    
    underflow  =>   1 is the output if FIFO is empty and still the data is being popped ( means rd is set to 1 ) and 0 otherwise
    
<br>    
    
**Timing Digrams**

    Write (push) opertion ===> filling the entire FIFO ( 0ns - 285ns )
    
   ![Screenshot (159)](https://user-images.githubusercontent.com/67265356/128027037-79371945-9eeb-4c92-8531-1bf75199010a.png)


<br>

    Read (pop) opertion ===> Taking first 20 data out of FIFO ( 305ns - 495ns )
    
   ![Screenshot (160)](https://user-images.githubusercontent.com/67265356/128027430-6f24e1fc-7a24-48ea-9556-61182636936b.png)


     
