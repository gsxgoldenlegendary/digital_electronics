`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11.11.2021 14:57:47
// Design Name:
// Module Name: FD
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


module FD(input clk,
          rst,
          output reg out);
    parameter N = 200000;//500000
    reg [19:0]cnt;
    always @(posedge clk or negedge rst) begin
        if (!rst)  cnt <= 0;
        else if (cnt == N-1)
        cnt       <= 0;
        else  cnt <= cnt + 1;
    end
    always @(posedge clk) begin
        out <= (cnt == (N-1));
    end
endmodule
