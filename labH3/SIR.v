`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04.10.2021 15:01:52
// Design Name:
// Module Name: SIR
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

module SIR (input clk,
            rstn,
            input x,
            output reg y,
            output reg [7:0]rx,
            ry);
    reg[3:0]state;
    initial begin
        state = 0;
    end
    always@(posedge clk)begin
        if (rstn)begin
            y     <= 0;
            rx    <= 0;
            ry    <= 0;
            state <= 0;
        end
        else begin
            case (state)
            4'd0:   begin if (x)   state <= 4'd1;  else state <= 4'd2; end
            
        4'd1:   begin if (x)   state <= 4'd3;  else state <= 4'd2; end
    4'd3:   begin if (x)   state <= 4'd5;  else state <= 4'd2; end
4'd5:   begin if (x)   state <= 4'd7;  else state <= 4'd2; end
4'd7:   begin if (x)   state <= 4'd9;  else state <= 4'd2; end
4'd9:   begin if (x)   y <= 1;         else state <= 4'd2; end

4'd2:   begin if (~x)  state <= 4'd4;  else state <= 4'd1; end
4'd4:   begin if (~x)  state <= 4'd6;  else state <= 4'd1; end
4'd6:   begin if (~x)  state <= 4'd8;  else state <= 4'd1; end
4'd8:   begin if (~x)  state <= 4'd10; else state <= 4'd1; end
4'd10:  begin if (~x)  y <= 0;         else state <= 4'd1; end
default:state <= 4'd11;
            endcase
            rx    <= rx<<1;
            rx[0] <= x;
            ry    <= ry<<1;
            ry[0] <= y;
        end
        
    end
    
endmodule
