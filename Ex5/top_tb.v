//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg temperature;
    reg err;
    wire heating;
    wire cooling; 

    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
     err=0;
     
     // Testing that conditions are met in a clockwise direction from idle
     
     temperature=5'b10101;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b00) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     temperature=5'b10110;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b01) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     temperature=5'b10101;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b01) begin
      $display("***TEST FAILED!***");
      err=1;
     end

     temperature=5'b10100;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b00) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     temperature=5'b10001;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b10) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     temperature=5'b10010;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b10) begin
      $display("***TEST FAILED!***");
      err=1;
     end

     temperature=5'b10100;

     #CLK_PERIOD
     if ({heating,cooling} != 2'b00) begin
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
    aircon top (
     .clk(clk),
     .temperature (temperature),
     .heating(heating),
     .cooling(cooling)
     );
    
 
endmodule 
