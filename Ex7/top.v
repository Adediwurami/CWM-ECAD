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

wire [1:0] enable;
assign enable = 1'b1;

wire [2:0] colour;
wire [23:0] rgb;

multiplexer used(
RGB required(clk,
lights utilised(clk,rst,button,colour),enable,rgb),{255,255,255},sel,light);

endmodule 
