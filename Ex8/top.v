//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name: Adedamilola Tariuwa
// Date: 11/06/21
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
    input temperaure_0,
    input temperaure_1,
    input temperaure_2,
    input temperaure_3,
    input temperaure_4,
    output heating,
    output cooling
    );

    reg heating;
    reg cooling;
    
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here

aircon a0(clk,{temperaure_0,temperaure_1,temperaure_2,temperaure_3,temperaure_4},heating,cooling);

endmodule
