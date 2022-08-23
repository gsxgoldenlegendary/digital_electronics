`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11.11.2021 14:52:23
// Design Name:
// Module Name: DIS
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

module DIS (input clk,
            rst,
            input [3:0]d0,
            d1,
            d2,
            d3,
            output[3:0]an,
            output[6:0]seg);
    wire clkd;
    wire[1:0]cntd;
    wire[3:0]muxd;
    
    FD FD(.clk(clk),
    .rst(rst),
    .out(clkd));
    
    CNT_2 CNT(.clk(clkd),
    .rstn(rst),
    .pe(0),
    .ce(1),
    .d(0),
    .cnt(cntd));
    
    decoder_2_4 decoder(.in(cntd),
    .out(an));
    
    MUX_4_4 MUX(.c(cntd),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d(muxd));
    
    decoder_4_7 decoder2(.in(muxd),
    .out(seg));
    
endmodule
