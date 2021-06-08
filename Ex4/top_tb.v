//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Adedamilola Tariuwa
// Date: 08/06/2020
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg rst;
    reg button;
    reg err;
    reg [2:0] colour_now;
    wire [2:0] colour;

    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
     button=0;
     err=0;
     rst=1;
     colour_now=3'b001;

     #CLK_PERIOD
     if (colour!=3'b001) begin
      $display("***TEST FAILED!***");
      err=1;
     end

     rst=0;
     #CLK_PERIOD
     if (colour!=3'b001) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     button=1;
     forever begin
     #CLK_PERIOD
     if (button==1)
      colour_now=(colour_now==3'b110 || colour_now==3'b111)?3'b001: colour_now+1;
     
     if (colour_now!=colour) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     end
     end

    
          
      //Finish simulation and check for success
      initial begin
        #100 
        if (err==0) 
          $display("***TEST PASSED! :) ***");
        $finish;

      end

    //User's module
    lights top (
     .rst(rst),
     .clk(clk),
     .button (button),
     .colour(colour)
     );
    
 
endmodule 
