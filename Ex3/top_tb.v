//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Adedamilola Tariuwa
// Date: 08/06/2021
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg rst;
    reg change;
    reg on_off;
    reg err;
    reg [7:0] counter_prev;
    wire [7:0] counter_out;

    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
     change=0;
     on_off=0;
     counter_prev=0;
     err=0;
     rst=1;

     #CLK_PERIOD
     if (counter_out!=0) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     #CLK_PERIOD
     rst=0;
     if (counter_out!=0) begin
      $display("***TEST FAILED!***");
      err=1;
     end

     change=1;
     assign counter_prev=
     (on_off==1) ? counter_prev+1: counter_prev-1;
     
     #CLK_PERIOD  
     if (counter_prev!=counter_out) begin
      $display("***TEST FAILED!***");
        err=1;
     end
     
     on_off=1;
     #CLK_PERIOD 
     if (counter_prev!=counter_out) begin
      $display("***TEST FAILED!***");
        err=1;
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
    monitor top (
     .rst(rst),
     .clk(clk),
     .change (change),
     .on_off (on_off),
     .counter_out (counter_out)
     );
    
 
endmodule 
