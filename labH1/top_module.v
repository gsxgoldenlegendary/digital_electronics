`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 21.10.2021 18:49:43
// Design Name:
// Module Name: top_module
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


module top_module(input[9:0]in,
                  output[7:0]AN,
                  output [9:0]out_10b,
                  output [6:0]out_7b);
wire [3:0]mid;
encoder_3cyclic encoder1(in,mid);
decoder_3cyclic_10b decoder1(mid,out_10b);
decoder_3cyclic_7b decoder2(mid,out_7b);
assign AN = 8'b11111110;
endmodule
