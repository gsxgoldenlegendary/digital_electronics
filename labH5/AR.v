`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 10:53:12
// Design Name:
// Module Name: AR
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


module AR(input clk,
          [3:0]state,
          output reg [4:0]out);
    always @(posedge clk) begin
        case (state)
            0 :out <= 0;
            6:out  <= out+1;
            8:out  <= out-1;
            default:;
        endcase
    end
endmodule
