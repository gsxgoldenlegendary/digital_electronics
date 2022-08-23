`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.11.2021 16:45:16
// Design Name:
// Module Name: test
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


module test(input clk,
            rstn,
            output reg[11:0] prgb,
            output hs,
            output vs);
    wire hen,ven;
    DIR dir(.clk(clk),.pclk(pclk));
    VDT vdt(.pclk(pclk),.rstn(rstn),.hen(hen),.ven(ven),.hs(hs),.vs(vs));
    always @(*) begin
        if (hen&&ven)
            prgb <= 12'hfff;
        else
            prgb <= 0;
    end
endmodule
