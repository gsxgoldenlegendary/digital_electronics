`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 08:37:54
// Design Name:
// Module Name: CNT_2
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



module CNT_3 (input clk,
              rstn,
              pe,
              ce,
              input [1:0] d,
              output reg [2:0] cnt);
    
    always @(posedge clk or negedge rstn) begin
        if (!rstn)  cnt   <= 0;
        else if (pe)  cnt <= d;
        else if (ce)  cnt <= cnt + 1;
    end
endmodule
