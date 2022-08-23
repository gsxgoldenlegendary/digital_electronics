`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.11.2021 10:05:44
// Design Name:
// Module Name: PNT
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


module PNT(input clk,
           rstn,
           input up,
           input down,
           input left,
           input right,
           input [3:0] red,
           input [3:0] green,
           input [3:0] blue,
           input draw,
           output [3:0] pred,
           output [3:0] pgreen,
           output [3:0] pblue,
           output hs,
           output vs);
    wire[14:0]waddr,raddr;
    wire[11:0]wdata,rdata;
    wire we,pclk,hen,ven,up_tb,down_tb,left_tb,right_tb,up_ps,down_ps,left_ps,right_ps;
    DB db0(up,clk,up_tb);
    PS ps0(up_tb,clk,up_ps);
    DB db1(down,clk,down_tb);
    PS ps1(down_tb,clk,down_ps);
    DB db2(left,clk,left_tb);
    PS ps2(left_tb,clk,left_ps);
    DB db3(right,clk,right_tb);
    PS ps3(right_tb,clk,right_ps);
    DIR dir(clk,pclk);
    PCU pcu(clk,rstn,draw,{right_ps,left_ps,down_ps,up_ps},{red,green,blue},waddr,wdata,we);
    blk_mem_gen_0 vram(.addra(waddr),.clka(clk),.dina(wdata),.addrb(raddr),.clkb(pclk),.ena(we),.wea(we),.doutb(rdata));
    VDS vds(hen,ven,pclk,rstn,rdata,raddr,{pred,pgreen,pblue});
    VDT vdt(pclk,rstn,hen,ven,hs,vs);
endmodule
