`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/05/18 17:53:14
// Design Name:
// Module Name: tb_RISCVpipeline
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


module tb_Advanced_RISCV;

reg clk,  rst;

RISCVpipeline uut(.key(0),.clk(clk), .reset(rst));

initial begin
    rst= 0;
    #54 rst =1;
end

initial begin
    clk=0;
    forever #5 clk=~clk;
end

endmodule

