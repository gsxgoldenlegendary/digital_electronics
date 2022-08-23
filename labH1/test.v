`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2021 21:53:58
// Design Name: 
// Module Name: test
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


module test(
input a2,a1,a0,
output reg y0,y1,y2,y3,y4,y5,y6,y7);
always@(*)
begin
y0=~a2&~a1&~a0;
y1=~a2&~a1&a0;
y2=~a2&a1&~a0;
y3=~a2&a1&a0;
y4=a2&~a1&~a0;
y5=a2&~a1&a0;
y6=a2&a1&~a0;
y7=a2&a1&a0;
end
endmodule
