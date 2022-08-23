`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 11:40:56
// Design Name:
// Module Name: CNT_DIS
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


module CNT_DIS(input clk,
               clk2,
               rstn,
               output[3:0]an,
               output[6:0]seg);
    wire [15:0] cntd;
    CNT_16 CNT_16(.clk(clk2),
    .rstn(rstn),
    .ce(1),
    .pe(0),
    .d(0),
    .cnt(cntd));
    DIS DIS(.d0(cntd[3:0]),
    .d1(cntd[7:4]),
    .d2(cntd[11:8]),
    .d3(cntd[15:12]),
    .rst(rstn),
    .clk(clk),
    .an(an),
    .seg(seg));
endmodule
