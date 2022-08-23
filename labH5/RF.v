`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 18.11.2021 14:58:46
// Design Name:
// Module Name: RF
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


module RF #(parameter AW = 5,
            parameter DW = 16)
           (input clk,
            input [AW-1:0] ra0,
            ra1,
            output [DW-1:0] rd0,
            rd1,
            input [AW-1:0] wa,
            input [DW-1:0] wd,
            input we);
    reg [DW-1:0] rf [0: (1<<AW)-1];
    assign rd0 = rf[ra0], rd1 = rf[ra1];
    always  @ (posedge  clk)
        if (we)  rf[wa] <= wd;
endmodule
    
