`timescale 1ns / 1ps

module ADDER(
clk, rst_n, data1, data2, data3, out
    );

    input clk;
    input rst_n;
    // 8비트 data
    input [7 : 0] data1, data2, data3;
    // 10비트 out
    output reg [9 : 0] out;
    
    //async reset
    always @(posedge clk or negedge rst_n) begin
        //init
        if (!rst_n) begin
            out <= 10'b0;
        end
        //3개의 합을 FF에 저장
        else begin
            out <= data1 + data2 + data3;
        end

    end
    
endmodule
