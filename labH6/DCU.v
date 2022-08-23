`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.11.2021 18:33:42
// Design Name:
// Module Name: DCU
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


module DCU(input clk,
           rstn,
           output hs,
           vs,
           [11:0]prgb);
    wire hen,ven,pclk;
    wire[1:0]rdata;
    wire[5:0]raddr;
    DIR dir(.clk(clk),.pclk(pclk));
    VDT vdt(.pclk(pclk),.rstn(rstn),.hen(hen),.ven(ven),.hs(hs),.vs(vs));
    VDS vds(.hen(hen),.ven(ven),.pclk(pclk),.rstn(rstn),.rdata(rdata),.raddr(raddr),.prgb(prgb));
    blk_mem_gen_1 rom(.addra(raddr),.clka(pclk),.douta(rdata));
endmodule
