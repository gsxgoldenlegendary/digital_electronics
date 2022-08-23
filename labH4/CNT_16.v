`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 11:48:56
// Design Name:
// Module Name: CNT_16
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

module CNT_16 (input clk,
               rstn,
               pe,
               ce,
               input [15:0] d,
               output reg [15:0] cnt);
    always @(posedge clk or negedge rstn) begin
        if (!rstn)  cnt   <= 0;
        else if (pe)  cnt <= d;
        else if (ce)  cnt <= cnt + 1;
    end
endmodule
