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
    reg [3:0] colour_now;
    wire [3:0] colour;

    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
     button=1;
     err=0;
     rst=0;

     #CLK_PERIOD
     if (colour==3'b001 && colour!=3'b010) begin
      $display("***TEST FAILED!***");
      err=1;
     end 

     if (colour==3'b010 && colour!=3'b011) begin
      $display("***TEST FAILED!***");
      err=1;
     end 
     
     if (colour==3'b011 && colour!=3'b100) begin
      $display("***TEST FAILED!***");
      err=1;
     end 
     
     if (colour==3'b100 && colour!=3'b101) begin
      $display("***TEST FAILED!***");
      err=1;
     end 
     
     if (colour==3'b101 && colour!=3'b110) begin
      $display("***TEST FAILED!***");
      err=1;
     end 

     if (colour==3'b110 && colour!=3'b001) begin
      $display("***TEST FAILED!***");
      err=1;
     end 
     
     if ((colour!=3'b000 || colour!=3'b111) & (colour!=3'b001)) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     button = 0;

     #CLK_PERIOD
     assign colour_now=
     (colour==3'b000 || colour==3'b111) ? 3'b001: colour;

     if (colour_now!=colour) begin
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
    light top (
     .rst(rst),
     .clk(clk),
     .button (button),
     .colour(colour)
     );
    
 
endmodule 
