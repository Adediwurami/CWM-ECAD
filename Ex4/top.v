//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Adedamilola Tariuwa
// Date: 08/06/21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

module lights(clk,rst,button,colour);

input clk,rst,button;
output colour;

rst=0;
wire [2:0] colour;

always@(posedge clk)
 if (colour==3'b000 || colour==3'b111)
  colour=3'b001;
 else if (colour==3'b001 && button ==1)
  colour=3'b010;
 else if (colour==3'b010 && button ==1)
  colour=3'b011;
 else if (colour==3'b011 && button ==1)
  colour=3'b100;
 else if (colour==3'b100 && button ==1)
  colour=3'b101;
 else if (colour==3'b101 && button ==1)
  colour=3'b110;
 else if (colour==3'b110 && button ==1)
  colour=3'b001;
 else 
 colour=colour



