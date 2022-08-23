`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 18.11.2021 15:02:22
// Design Name:
// Module Name: DIS2
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

module DIS2 (input clk,
             rst,
             input [15:0]d,
             input [4:0]a,
             output[7:0]an,
             output[6:0]seg);
    wire clkd;
    wire[2:0]cntd;
    wire[3:0]muxd;
    FD FD(.clk(clk),
    .rst(rst),
    .out(clkd));
    
    CNT_3 CNT(.clk(clkd),
    .rstn(rst),
    .pe(0),
    .ce(1),
    .d(0),
    .cnt(cntd));
    
    decoder_3_8 decoder(.in(cntd),
    .out(an));
    
    MUX_8_4 MUX(.c(cntd),
    .d0(d[3:0]),
    .d1(d[7:4]),
    .d2(d[11:8]),
    .d3(d[15:12]),
    .d4(a[3:0]),
    .d5({3'b0,a[4]}),
    .d(muxd));
    
    decoder_4_7 decoder2(.in(muxd),
    .out(seg));
    
endmodule
