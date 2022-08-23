`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 21.10.2021 18:47:00
// Design Name:
// Module Name: decoder_3cyclic_7b
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


module decoder_3cyclic_7b(input [3:0] in,
                          output reg [6:0] out);
always @(*) begin
    case(in)
        4'd12:out    <= ~7'b1111011;
        4'd11:out    <= ~7'b1111111;
        4'd10:out    <= ~7'b1110000;
        4'd9:out     <= ~7'b1011111;
        4'd8:out     <= ~7'b1011011;
        4'd7:out     <= ~7'b0110011;
        4'd6:out     <= ~7'b1111001;
        4'd5:out     <= ~7'b1101101;
        4'd4:out     <= ~7'b0110000;
        4'd3:out     <= ~7'b1111110;
        default: out <= ~7'b0000000;
    endcase
end
endmodule

