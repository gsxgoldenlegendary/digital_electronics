`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 19:01:21
// Design Name:
// Module Name: SORT
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


module SORT(input clk,
            exe,
            [15:0]data0,
            [15:0]data1,
            output reg[4:0]add0,
            reg[4:0]add1,
            reg [4:0]wa,
            reg [15:0]wd,
            reg busy,
            reg [15:0]delay,
            reg we);
    reg[2:0] state;
    reg[15:0]temp0;
    reg[15:0]temp1;
    
    always @(posedge clk) begin
        if (busy)
            delay <= delay+1;
            case(state)
                0:if(exe)begin
                    delay <= 0;state <= 1;busy <= 1;add0<=0;add1<=1;
                end
                1:begin
                    if (data0<data1)state <= 3;else state <= 2;
                end
            2:if (add0 == 5'b11111)
            state<= 7;
            else if (add1 == 5'b11111) begin
                 add1<= add0+1;add0<= add0+1;state<= 1;end else begin add1<= add1+1;state<= 1;end
            3:begin
                temp0 <= data0;temp1 <= data1;state <= 4;
            end
            4:begin
                state <= 5;we <= 1;wa <= add0;wd <= temp1;
            end
            5:begin
                state <= 6;we <= 1;wa <= add1;wd <= temp0;
            end
            6:begin
            we <= 0;state <= 2;
            end
            7:begin
            busy <= 0;state <= 0;
            end
            endcase
    end
            // always @(posedge clk) begin
            //     if (busy)
            //         delay = delay+1;
            //         case(state)
            //         0:if(exe)begin delay = 0;   state = 2;busy = 1;end
            //         1:if(data0<data1)state = 3;else state = 2;
            //         2:if(add0 == 5'b11111)state              = 7;else state              = 1;
            //         3:state                = 4;
            //         4:state                = 5;
            //         5:state                = 6;
            //         6:state                = 2;
            //         7:state                = 0;
            //         endcase
            //         end
        
        //     always @(*) begin
        //         case(state)
        //             0:;
        //             1:;
        //             2:if(add1 == 5'b11111)begin add1          = add0+2;add0          = add0+1;end else add1          = add1+1;
        //             3:            temp = data0;
        //             4:begin
        //                 we = 1;
        //                 wa = add0;
        //                 wd = data1;
        //             end
        //             5:begin
        //                 wa = add1;
        //                 wd = temp;
        //             end
        //             6:we   = 0;
        //             7:busy = 0;
        //         endcase
        //     end
        endmodule
