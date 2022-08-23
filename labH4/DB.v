// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 13.11.2021 15:41:51
// Design Name:
// Module Name: DB
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


module DB(input x,
          clk,
          output reg y);
    reg [15:0]cnt;
    initial begin
        cnt = 0;
    end
    always @(*) begin
        if (cnt == 50000)
            y = x;
        // else
        //     y=y;
    end
    always @(posedge clk) begin
        if (cnt == 50000)
            cnt       <= 0;
        else  cnt <= cnt + 1;
    end
endmodule
