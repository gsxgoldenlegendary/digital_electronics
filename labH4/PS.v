// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 14:55:17
// Design Name:
// Module Name: PS
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


module PS(input a,
          clk,
          output reg p);
    reg r,s,in_delay;
    always @(posedge clk) begin
        if (a)r <= 1;
        else r  <= 0;
    end
    always @(posedge clk) begin
        if (r)s <= 1;
        else s  <= 0;
    end
    always @(posedge clk) begin
        in_delay <= s;
    end
    always @(*) begin
        if (s&&!in_delay)
            p <= 1;
        else
            p <= 0;
    end
endmodule
