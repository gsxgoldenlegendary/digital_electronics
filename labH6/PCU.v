`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 26.11.2021 17:29:42
// Design Name:
// Module Name: PCU
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


module PCU(input clk,
           rstn,
           draw,
           [3:0]dir,
           [11:0]rgb,
           output reg [14:0]waddr,
           output [11:0]wdata,
           output we);
    assign we    = draw;
    assign wdata = rgb;
    always @(posedge clk) begin
        if (!rstn)
            waddr = 15100;
        else if (dir[0]&&waddr>199)
            waddr = waddr-200;
        else if (dir[1]&&waddr<29800)
            waddr = waddr+200;
        else if (dir[2]&&waddr%200 != 0)
            waddr = waddr-1;
        else if (dir[3]&&waddr%200 != 199)
            waddr = waddr+1;
            end
            endmodule
