`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 06.11.2021 10:49:27
// Design Name:
// Module Name: FLS
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


module FLS (input clk,
            rstn,
            en,
            input [7:0] d,
            output reg [7:0] f,
            output err);
    reg [8:0]f0;
    reg [8:0]f1;
    reg[1:0]c_state;
    reg[1:0]n_state;
    assign err = f1[8];
    initial begin
        c_state = 0;
        n_state = 0;
        f0      = 0;
        f1      = 0;
    end
    always @(posedge clk) begin
        if (rstn)c_state    <= 0;
        else if (en)c_state <= n_state;
    end
    
    always @(*) begin
        if (err)
            n_state = 2'd3;
        else
            case (c_state)
                2'd0:n_state = 2'd1;
                2'd1:n_state = 2'd2;
                2'd2:n_state = 2'd2;
                2'd3:n_state = 2'd3;
            endcase
    end
    
    always @(posedge clk) begin
        if (rstn)begin f <= 0; f0 <= 0;f1 <= 0;end
        else if (en&&~err)case (c_state)
        2'd0:begin f0 <= d;f <= d;end
        2'd1:begin f1 <= d;f <= d;end
        2'd2:begin f <= f1+f0;f1 <= f1+f0;f0 <= f1;end
        default:;
        endcase
    end
endmodule
