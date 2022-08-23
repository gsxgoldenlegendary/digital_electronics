`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 07:52:58
// Design Name:
// Module Name: ECD
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


module ECD(input[15:0]in,
           output reg [3:0]out);
    integer i;
    always @(*) begin
        for(i = 0;i<16;i = i+1)
            if (in[i])
                out = i;
                end
                endmodule
