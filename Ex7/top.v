//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Adedamilola Tariuwa
// Date: 10/06/2021
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

module light_selector(clk,sel,rst,button,light);

input clk;
input sel;
input rst;
input button;
output [23:0] light;

wire [2:0] colour;
wire [23:0] rgb;

lights l0(clk,rst,button,colour);
RGB r0(clk,colour,!rst,rgb);
multiplexer mux0({255,255,255},rgb,sel,light);


endmodule 
