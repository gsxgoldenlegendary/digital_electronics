`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.10.2021 17:16:06
// Design Name:
// Module Name: CMP
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


module CMP(input[3:0]x,
           input[3:0]y,
           output reg ug,
           ul,
           eq,
           sg,
           sl);
    wire[3:0] s;
    wire cf;
    wire zf;
    wire of;
    ALU alu(x,y,1,s,cf,of,zf);
    always @(*) begin
        ug <= 0;
        ul <= 0;
        eq <= 0;
        sg <= 0;
        sl <= 0;
        if (!cf&&zf)
            eq <= 1;
        else if (!cf&&!zf)
            ug <= 1;
        else if (cf&&!zf)
            ul <= 1;
        if (!of&&zf&&s[3])
            eq <= 0;
        else if (!of&&!zf&&!s[3]||of&&!zf&&s[3])
            sg <= 1;
        else if (!of&&!zf&&s[3]||of&&!zf&&!s[3])
            sl <= 1;
    end
endmodule
