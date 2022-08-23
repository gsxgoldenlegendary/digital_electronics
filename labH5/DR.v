`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 09:00:14
// Design Name:
// Module Name: DR
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


module DR(input clk,
          [3:0]rd0,
          [15:0]rd1,
          [3:0]state,
          output reg [15:0] out);
    initial begin
        out = 0;
    end
    always @(posedge clk) begin
        case (state)
            1:out <= rd1;
            3:out <= {out[11:0],rd0};
            4:out <= {4'b0000,out[15:4]};
            default: ;
        endcase
    end
endmodule
