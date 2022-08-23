`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 28.10.2021 14:44:41
// Design Name:
// Module Name: adder_4b
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


module adder_4b(input [3:0] a,
                input [3:0] b,
                input cin,
                output [3:0] s,
                cout_final,
                of);
wire [2:0]cout;
full_adder adder0(a[0],b[0],cin,s[0],cout[0]);
full_adder adder1(a[1],b[1],cout[0],s[1],cout[1]);
full_adder adder2(a[2],b[2],cout[1],s[2],cout[2]);
full_adder adder3(a[3],b[3],cout[2],s[3],cout_final);
assign of=cout_final^cout[2];
endmodule
