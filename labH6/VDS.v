`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.11.2021 10:39:04
// Design Name:
// Module Name: VDS
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


module VDS(input hen,
           ven,
           pclk,
           rstn,
           [11:0]rdata,
           output reg [6:0]raddr_big_column,
           reg [5:0]raddr_big_row,
           reg [2:0]raddr_small_column,
           reg [3:0]raddr_small_row,
           reg[11:0]prgb);
    reg [19:0]cnt_general;
    reg [9:0]cnt_small_row;
    reg [2:0]cnt_big_column;
    reg [13:0]cnt_big_row;

// always @(posedge pclk) begin
//     if(hen&&ven)
//         prgb<=12'hf;
//     else
//         prgb<=0;
// end
    always @(posedge pclk) begin
        if (hen&&ven&&cnt_general>6400-1)
            prgb <= rdata;
        else
            prgb <= 0;
    end
    
    always @(posedge pclk) begin
        if (!rstn||cnt_general == 480000-1)
            cnt_general <= 0;
        else if (hen&&ven)
            cnt_general <= cnt_general+1;
            end
        
        always @(posedge pclk) begin
            if(!rstn)begin
            cnt_small_row<=0;
            raddr_small_column<=0;
            raddr_small_row<=0;
            end
            else if (hen&&ven&&cnt_general>6400-1)begin
                raddr_small_column <= raddr_small_column+1;
                if (cnt_small_row == 800-1)begin
                    cnt_small_row   <= 0;
                    raddr_small_row <= raddr_small_row+1;
                end
                else
                    cnt_small_row <= cnt_small_row+1;
            end
        end
        
        always @(posedge pclk) begin
            if (!rstn)begin
                cnt_big_column <= 0;
                cnt_big_row    <= 0;
                raddr_big_column <= 0;
                raddr_big_row    <= 0;
            end
            else if (hen&&ven&&cnt_general>6400-1)begin
                if (cnt_big_column == 8-1-2)
                    if (raddr_big_column == 100-1)
                        raddr_big_column <= 0;
                    else
                        raddr_big_column <= raddr_big_column+1;
                cnt_big_column   <= cnt_big_column+1;
                if (cnt_big_row == 12800-1)begin
                    cnt_big_row <= 0;
                    if (raddr_big_row == 37-1)
                        raddr_big_row <= 0;
                    else
                        raddr_big_row <= raddr_big_row+1;
                    end
                else
                    cnt_big_row <= cnt_big_row+1;                
        end
        end
        
        endmodule
