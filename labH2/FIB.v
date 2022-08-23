`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2021 08:50:08
// Design Name: 
// Module Name: FIB
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


module FIB(
input clk,rst,en,
output reg [3:0]fn
    );
    reg [3:0] a;
    wire [3:0] b;
    wire cf;
    wire of;
    wire zf;
    ALU alu(a,fn,0,b,cf,of,zf);
    always @(posedge clk) begin
        if(rst)begin
            fn<=0;
            a<=1;
        end
        else if(en)begin
            a<=fn;
           fn<=b; 
        end
    end
endmodule
