`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 07:35:08
// Design Name:
// Module Name: FSM
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


module FSM(input [15:0]d,
           input bs,
           input pre,
           input nxt,
           input rstn,
           input clk,
           input busy,
           output reg [3:0]state);
always @(posedge clk or negedge rstn) begin
    if (!rstn||busy)
        state <= 0;
        else
    case(state)
        0:state <= 1;
        1:state <= 2;
        2:if (d != 0)state <= 3;else if (bs)state <= 4;else if (nxt)state <= 5;else if (pre)state <= 7;
        3:state <= 2;
        4:state <= 2;
        5:state <= 6;
        6:state <= 1;
        7:state <= 8;
        8:state <= 1;
        default;
    endcase
end
endmodule
