`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.11.2021 08:24:11
// Design Name:
// Module Name: topmodule
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module topmodule(input clk,
                 rstn,
                 output [11:0]prgb,
                 output hs,
                 output vs);
    wire pclk;
    divider divider(clk,pclk);
    VSD vsd(.prgb(prgb),.hs(hs),.vs(vs),.pclk(pclk),.rstn(rstn));
endmodule
