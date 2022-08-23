`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 26.11.2021 17:50:56
// Design Name:
// Module Name: SRA
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


module SRA(input [18:0]paddr,
           [11:0]rdata,
           output [14:0]raddr,
           [11:0]pdata);
assign pdata = rdata;
assign raddr = paddr[18:4];
endmodule
