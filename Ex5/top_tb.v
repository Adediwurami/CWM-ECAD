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
    reg [1:0] current_state; 
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
     temperature=5'b00001
     current_state=2'b01
     
     forever begin
     #CLK_PERIOD
     if (((current_state==2'b01)&&(temperature<5'b10100))&&({heating,cooling}!= 2'b01) begin
      $display("***TEST FAILED!***");
      err=1;
     end
      
      else if (((current_state==2'b01)&&(temperature>=5'b10100))&&({heating,cooling}!= 2'b00) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
      else if (((current_state==2'b00)&&(temperature>=5'b10110))&&({heating,cooling}!= 2'b10) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
       else if (((current_state==2'b00)&&(temperature<=5'b10010<))&&({heating,cooling}!= 2'b01) begin
      $display("***TEST FAILED!***");
      err=1;
     end

      else if (((current_state==2'b00)&&(5'b10010<temperature<5'b10110))&&({heating,cooling}!= 2'b00) begin
      $display("***TEST FAILED!***");
      err=1;
     end
      
      else if (((current_state==2'b10)&&(temperature<=5'b10100))&&({heating,cooling}!= 2'b00) begin
      $display("***TEST FAILED!***");
      err=1;
     end

     else if (((current_state==2'b10)&&(temperature>5'b10100))&&({heating,cooling}!= 2'b10) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     else if ({heating,cooling}!= 2'b00) begin
      $display("***TEST FAILED!***");
      err=1;
     end
     
     temperature=temperature+1
     current_state={heating,cooling}
     
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
     .temperature(temperature),
     .heating(heating),
     .cooling(cooling)
     );
    
 
endmodule 
