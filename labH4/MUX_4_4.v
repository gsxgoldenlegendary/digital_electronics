`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 08:40:12
// Design Name:
// Module Name: MUX_4_4
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

module MUX_8_4 (input[3:0]d0,
                d1,
                d2,
                d3,
                d4,
                d5,
                input [2:0]c,
                output reg [3:0]d);
always @(*) begin
    case(c)
        0:d       = d0;
        1:d       = d1;
        2:d       = d2;
        3:d       = d3;
        4:d       = d4;
        5:d       = d5;
        default:d = 0;
    endcase
end
endmodule
