`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.10.2021 14:53:16
// Design Name:
// Module Name: ALU
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


module ALU (input [3:0] a,
            input [3:0] b,
            input [2:0] s,
            output reg[3:0] y,
            output reg cf,
            output reg of,
            output reg zf);
    wire [3:0]w1;
    wire[3:0]w2;
    wire of1;
    wire of2;
    wire cf1;
    wire cf2;
    adder_4b add(a,b,0,w1,cf1,of1);
    adder_4b minus(a,~b,1,w2,cf2,of2);
    always @(*) begin
        case (s)
            3'b000:begin
                y  = w1;
                of = of1;
                cf = cf1;
                zf = !y;
            end
            3'b001:begin
                y  = w2;
                of = of2;
                cf = ~cf2;
                zf = !y;
            end
            3'b100:begin
                y  = a&b;
                cf = 0;
                of = 0;
                zf = !y;
            end
            3'b101:begin
                y  = a|b;
                cf = 0;
                of = 0;
                zf = !y;
            end
            3'b110:begin
                y  = a^b;
                cf = 0;
                of = 0;
                zf = !y;
            end
            3'b111:begin
                y  = ~a;
                cf = 0;
                of = 0;
                zf = !y;
            end
            default:begin
                y  = 0;
                cf = 0;
                of = 0;
                zf = 1;
            end
        endcase
    end
endmodule
