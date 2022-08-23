`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 21.10.2021 18:40:15
// Design Name:
// Module Name: decoder_3cyclic_10b
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


module decoder_3cyclic_10b(input [3:0] in,
                           output reg [9:0] out);
    always @(*) begin
        case(in)
            4'd12:out   <= 10'b1000000000;
            4'd11:out   <= 10'b0100000000;
            4'd10:out   <= 10'b0010000000;
            4'd9:out    <= 10'b0001000000;
            4'd8:out    <= 10'b0000100000;
            4'd7:out    <= 10'b0000010000;
            4'd6:out    <= 10'b0000001000;
            4'd5:out    <= 10'b0000000100;
            4'd4:out    <= 10'b0000000010;
            4'd3:out    <= 10'b0000000001;
            default:out <= 10'b0000000000;
        endcase
    end
endmodule
