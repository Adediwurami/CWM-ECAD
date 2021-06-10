//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Adedamilola Tariuwa
// Date: 10/06/2021
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
 `timescale 1ns / 100ps
	
	module top_tb(
	    );
	// Parameters
	parameter CLK_PERIOD = 10;

	reg clk;
        reg sel;
        reg rst;
	reg err;
	reg button;
	wire [23:0] light;
	
	// Clock generation
	initial
	    begin
	       clk = 1'b0;
	       forever
	         #(CLK_PERIOD/2) clk=~clk;
	     end
	
	// Stimulus Logic
	
	initial begin
	       sel=0;
	       rst=1;
               err=0;
               button=0;
       
       forever begin 
         #(2*CLK_PERIOD)
           rst=0;

           if ((sel==0)&&(light!=24'hFFFFFF)) begin
	     $display("***TEST FAILED!***");
             err=1;
           end
         
         sel=1;
         button=1;
         #(2*CLK_PERIOD)
           if ((sel==1)&&(light==24'hFFFFFF)) begin
	     $display("***TEST FAILED!***");
             err=1;
           end
         
         sel=1;
         button=0;
         #(2*CLK_PERIOD)
           if ((sel==1)&&(light==24'hFFFFFF)) begin
	     $display("***TEST FAILED!***");
             err=1;
           end
         
	 end          
	 end
         
	 initial begin
	        #400
	        if (err==0)
	          $display("***TEST PASSED! :) ***");
	        $finish;
	      end
	
	     light_selector needed(clk,sel,rst,button,light);
	endmodule 
