`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 15:36:33
// Design Name:
// Module Name: DPCD
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


module DPCD(input x,
            rstn,
            clk,
            output[3:0]an,
            output[6:0]seg);
    wire y,ce;
    wire[15:0]q;
    DB DB (x,rstn,clk,y);
    PS PS(y,clk,ce);
    CNT_16 CNT_16(clk,rstn,0,ce,0,q);
    DIS DIS(clk,rstn,q[3:0],q[7:4],q[11:8],q[15:12],an,seg);
endmodule
