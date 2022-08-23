`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.11.2021 10:30:59
// Design Name:
// Module Name: VDT
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


module VDT(input pclk,
           rstn,
           output hen,
           ven,
           reg hs,
           reg vs);
    parameter HSW = 120;
    parameter HBP = 64;
    parameter HEN = 800;
    parameter HFP = 56;
    parameter VSW = 6;
    parameter VBP = 23;
    parameter VEN = 600 ;
    parameter VFP = 37;
    reg[10:0] hcnt;
    reg[9:0]vcnt;
    //change hcnt
    always @(posedge pclk) begin
        if (!rstn)
            hcnt <= HEN+HFP;
        else if (hcnt == HSW+HBP+HEN+HFP-1)
            hcnt <= 0;
        else
            hcnt <= hcnt+1;
    end
    //change vcnt
    always @(posedge pclk) begin
        if (!rstn)
            vcnt <= VEN+VFP;
        else if (vcnt == VSW+VBP+VEN+VFP-1)
            vcnt <= 0;
        else if (hcnt == HEN+HFP-1)
            vcnt <= vcnt+1;
            end
            //change hs
            always @(posedge pclk) begin
                if (!rstn||hcnt == HEN+HFP+HSW-1)
                    hs <= 0;
                else if (hcnt == HEN+HFP-1)
                    hs <= 1;
                    end
                    //change vs
                    always @(posedge pclk) begin
                        if (!rstn||vcnt == VEN+VFP+VSW-1)
                            vs <= 0;
                        else if (vcnt == VEN+VFP-1)
                            vs <= 1;
                            end
                            assign hen = hcnt<HEN;
                            assign ven = vcnt<VEN;
                            endmodule
