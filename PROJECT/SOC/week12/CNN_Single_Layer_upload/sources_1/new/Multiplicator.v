`timescale 1ns / 1ps

module Multiplicator(Start, din0, din1, dout);

    input Start;
    input [3:0] din0;
    input [3:0] din1;
    output [7:0] dout;
    
    // Start 신호가 입력될 때 din과 din의 곱을 전달
    assign dout = (Start) ? din0 * din1 : 8'b0;

endmodule