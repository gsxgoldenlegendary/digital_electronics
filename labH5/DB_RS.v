`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 10:45:04
// Design Name:
// Module Name: DB_RS
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


module DB_PS(input [15:0]d,
             input bs,
             input pre,
             input nxt,
             input clk,
             input exe,
             output [15:0]d_ps,
             output bs_ps,
             output pre_ps,
             output nxt_ps,
             output exe_ps);
wire[15:0]d_db;
wire bs_db;
wire pre_db;
wire nxt_db;
wire exe_db;
DB db0(d[0],clk,d_db[0]);
DB db1(d[1],clk,d_db[1]);
DB db2(d[2],clk,d_db[2]);
DB db3(d[3],clk,d_db[3]);
DB db4(d[4],clk,d_db[4]);
DB db5(d[5],clk,d_db[5]);
DB db6(d[6],clk,d_db[6]);
DB db7(d[7],clk,d_db[7]);
DB db8(d[8],clk,d_db[8]);
DB db9(d[9],clk,d_db[9]);
DB db10(d[10],clk,d_db[10]);
DB db11(d[11],clk,d_db[11]);
DB db12(d[12],clk,d_db[12]);
DB db13(d[13],clk,d_db[13]);
DB db14(d[14],clk,d_db[14]);
DB db15(d[15],clk,d_db[15]);
DB db_bs(bs,clk,bs_db);
DB db_pre(pre,clk,pre_db);
DB db_nxt(nxt,clk,nxt_db);
DB db_exe(exe,clk,exe_db);

PS ps0(d_db[0],clk,d_ps[0]);
PS ps1(d_db[1],clk,d_ps[1]);
PS ps2(d_db[2],clk,d_ps[2]);
PS ps3(d_db[3],clk,d_ps[3]);
PS ps4(d_db[4],clk,d_ps[4]);
PS ps5(d_db[5],clk,d_ps[5]);
PS ps6(d_db[6],clk,d_ps[6]);
PS ps7(d_db[7],clk,d_ps[7]);
PS ps8(d_db[8],clk,d_ps[8]);
PS ps9(d_db[9],clk,d_ps[9]);
PS ps10(d_db[10],clk,d_ps[10]);
PS ps11(d_db[11],clk,d_ps[11]);
PS ps12(d_db[12],clk,d_ps[12]);
PS ps13(d_db[13],clk,d_ps[13]);
PS ps14(d_db[14],clk,d_ps[14]);
PS ps15(d_db[15],clk,d_ps[15]);
PS ps_bs(bs_db,clk,bs_ps);
PS ps_pre(pre_db,clk,pre_ps);
PS ps_nxt(nxt_db,clk,nxt_ps);
PS ps_exe(exe_db,clk,exe_ps);
endmodule
