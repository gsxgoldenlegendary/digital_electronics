`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 20.11.2021 07:01:21
// Design Name:
// Module Name: DIO
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


module DIO(input [15:0]d,
           input bs,
           input pre,
           input nxt,
           input rstn,
           input clk,
           input exe,
           output[7:0]an,
           output [6:0]seg,
           output busy,
           output [15:0]delay);
wire[15:0]d_ps;
wire bs_ps;
wire pre_ps;
wire nxt_ps;
wire exe_ps;
wire[3:0]d_ecd;
wire[3:0]state;
reg we;
wire[4:0]ar_out;
wire[15:0]dr_out;
wire[15:0]rf_out;
wire[15:0]rf_out2;
wire [4:0]ra0_sort;
wire [4:0]ra1_sort;
wire [4:0]wa_sort;
wire [15:0]wd_sort;
reg[4:0]ra0;
reg[4:0]wa;
reg[15:0]wd;
wire we_sort;

SORT sort(clk,exe_ps,rf_out,rf_out2,ra0_sort,ra1_sort,wa_sort,wd_sort,busy,delay,we_sort);
DB_PS db_ps(d,bs,pre,nxt,clk,exe,d_ps,bs_ps,pre_ps,nxt_ps,exe_ps);
DR dr(clk,d_ecd,rf_out,state,dr_out);
AR ar(clk,state,ar_out);
FSM fsm(d_ps,bs_ps,pre_ps,nxt_ps,rstn,clk,busy,state);
ECD ecd(d,d_ecd);
RF rf(.clk(clk),.ra0(ra0),.rd0(rf_out),.ra1(ra1_sort),.rd1(rf_out2),.wa(wa),.wd(wd),.we(we));
DIS2 dis2(clk,rstn,dr_out,ar_out,an,seg);
//DIS2 dis2(.clk(clk),.rst(rstn),.d(d),.a(4'b1111),.an(an),.seg(seg));
always @(*) begin
    if (busy)
        we = we_sort;
    else if (state == 5||state == 7)
        we = 1;
    else
        we = 0;
        if (busy)
            ra0 = ra0_sort;
        else
            ra0 = ar_out;
            if (busy)
                wa = wa_sort;
            else
                wa = ar_out;
                if (busy)
                    wd = wd_sort;
                else
                    wd = dr_out;
end
endmodule
