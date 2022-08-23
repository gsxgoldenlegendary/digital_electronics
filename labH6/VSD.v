`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 25.11.2021 15:34:37
// Design Name:
// Module Name: VSD
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


module VSD(output reg [11:0]prgb,
           output reg hs,
           output reg vs,
           output reg[22:0]paddr,
           input [11:0]pdata,
           input pclk,
           input rstn);
parameter H0  = 120;
parameter H1  = 64;
parameter H2  = 800;
parameter H3  = 56;
parameter V0  = 6;
parameter V1  = 23;
parameter V2  = 600 ;
parameter V3  = 37;
parameter MAX = 480000;
reg[10:0] hcnt;
reg[9:0]vcnt;
reg hen;
reg ven;
initial begin
    hs    = 0;
    vs    = 0;
    paddr = 0;
    hcnt  = 0;
    vcnt  = 0;
    hen   = 0;
    ven   = 0;
end
//change hcnt
always @(posedge pclk) begin
    if (!rstn)
        hcnt <= H2+H3;
    else if (hcnt == H0+H1+H2+H3)
        hcnt <= 0;
    else
        hcnt <= hcnt+1;
end
//change vcnt
always @(posedge pclk) begin
    if (!rstn)
        vcnt <= V2+V3;
    else if (vcnt == V0+V1+V2+V3)
        vcnt <= 0;
    else if (hcnt == H2+H3)
        vcnt <= vcnt+1;
        end
        //change hs
        always @(posedge pclk) begin
            if (!rstn||hcnt == H2+H3+H0)
                hs <= 0;
            else if (hcnt == H2+H3)
                hs <= 1;
                end
                //change vs
                always @(posedge pclk) begin
                    if (!rstn||vcnt == H2+H3+H0)
                        vs <= 0;
                    else if (vcnt == V2+V3)
                        vs <= 1;
                        end
                        //change hen
                        always @(posedge pclk) begin
                            if (!rstn||hcnt == H3)
                                hen <= 0;
                            else if (hcnt == 0)
                                hen <= 1;
                                end
                                //change ven
                                always @(posedge pclk) begin
                                    if (!rstn||vcnt == V3)
                                        ven <= 0;
                                    else if (vcnt == 0)
                                        ven <= 1;
                                        end
                                        //change prgb
                                        always @(posedge pclk) begin
                                            if (hen&&ven)begin
                                                prgb <= 12'hfff;
                                                if (paddr == MAX)
                                                    paddr <= 0;
                                                else
                                                    paddr <= paddr+1;
                                            end
                                            else
                                                prgb <= 0;
                                        end
                                        endmodule
