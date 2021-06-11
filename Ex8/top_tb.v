//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Adedamilola Tariuwa
// Date: 11/06/21
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk_p;
    wire clk_n;
    reg temperature_0;
    reg temperature_1;
    reg temperature_2;
    reg temperature_3;
    reg temperature_4;
    reg [4:0] temperature;
    reg err;
    reg [1:0] current_state; 
    wire heating;
    wire cooling; 

    //Clock generation
    initial
    begin
      clk_p=1'b1;
       
       forever
     #(CLK_PERIOD/2) clk_p=~clk_p;
     end
     
    assign clk_n=~clk_p;
   
    
     //Stimulus logic
     initial begin
     err=0;
     temperature_0=0;
     temperature_1=0;
     temperature_2=0;
     temperature_3=0;
     temperature_4=0;
     temperature={temperature_0,temperature_1,temperature_2,temperature_3,temperature_4};
     current_state=2'b10;
     
         
     forever begin
     #CLK_PERIOD
     current_state={heating,cooling};
     if (((current_state==2'b10)&&(temperature<5'b10100))&&({heating,cooling}!= 2'b10)) begin
      $display("***TEST FAILED!***");
      err=1;
     end
      
      else if (((current_state==2'b10)&&(temperature>=5'b10100))&&({heating,cooling}!= 2'b00)) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
      else if (((current_state==2'b00)&&(temperature>=5'b10110))&&({heating,cooling}!= 2'b01)) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
       else if (((current_state==2'b00)&&(temperature<=5'b10010))&&({heating,cooling}!= 2'b10))begin
      $display("***TEST FAILED!***");
      err=1;
     end

      else if (((current_state==2'b00)&&(5'b10010<temperature<5'b10110))&&({heating,cooling}!= 2'b00)) begin
      $display("***TEST FAILED!***");
      err=1;
     end
      
      else if (((current_state==2'b01)&&(temperature<=5'b10100))&&({heating,cooling}!= 2'b00)) begin
      $display("***TEST FAILED!***");
      err=1;
     end

     else if (((current_state==2'b01)&&(temperature>5'b10100))&&({heating,cooling}!= 2'b01)) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     
     temperature=temperature+1;
     
     
     end 
     end
          
      //Finish simulation and check for success
      initial begin
        #400 
        if (err==0) 
          $display("***TEST PASSED! :) ***");
        $finish;
        end
     
     

    //User's module
    top top(
     .clk_p(clk_p),
     .clk_n(clk_n),
     .temperature_0(temperature_0),
     .temperature_1(temperature_1),
     .temperature_2(temperature_2),
     .temperature_3(temperature_3),
     .temperature_4(temperature_4),
     .heating(heating),
     .cooling(cooling)
     );
    
 
endmodule 
