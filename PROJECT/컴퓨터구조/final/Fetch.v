`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/01 16:22:43
// Design Name: 
// Module Name: Fetch
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

module Predictor(
    input reset,
    input [31:0] PC_in,
    input [31:0] instruction,
    output reg predict,
    output reg [31:0] PCimm_out
);
    reg [31:0] immediate;
    always@(*) begin
        immediate = (reset)?32'bx:(instruction[6:0]==7'b11011_11) ? {{12{instruction[31]}},instruction[31],instruction[19:12],instruction[20],instruction[30:21]}:
                                  (instruction[6:0]==7'b11001_11) ? {{20{instruction[31]}},instruction[31:20]}:32'bx;
        predict = (reset)?0:(instruction[6:0]==7'b11011_11||instruction[6:0]==7'b11001_11);   

        PCimm_out = PC_in - 4 + (immediate<<1);
    end
endmodule 

module PC(
    input clk,reset,
    input PCWrite,
    input [31:0] PC_in,
    output reg [31:0] PC_out
    
    );
    always @(posedge clk) begin
        if (reset) PC_out <= 0;
        else if (PCWrite) PC_out <=PC_out;
        else PC_out <= PC_in;
    end
endmodule

module iMEM(
    input clk, reset,
    input IF_ID_Write, PCSrc, predict,
    input [31:0] PC_in,
    output reg [31:0] instruction_out
    );
    parameter ROM_size =1024;
    reg [31:0] ROM[0:ROM_size-1];
    integer i;
    initial begin
        for (i=0; i!=ROM_size; i=i+1) begin
            ROM[i] = 32'b0;
        end
        $readmemh("darksocv.rom.mem", ROM);
    end

    //BRAM
    always @(posedge clk) begin
        if(!IF_ID_Write) begin  //not stall      
            if (reset || PCSrc || predict) instruction_out <=32'b0;
            else instruction_out <= ROM[PC_in[31:2]];
        end    
    end
endmodule

module InFetch(
    input clk,reset,PCSrc,
    input PCWrite,
    input [31:0] PCimm_in,
    output [31:0] instruction_out,
    output predict,
    output reg [31:0] PC_out
    );

    wire [31:0] PCimm_pre;
    wire [31:0] PC;
    wire [31:0] PC4 = (predict)? PCimm_pre:
                       (PCSrc)? PCimm_in:PC +4;

    Predictor B0_Predictor(.reset(reset), .PC_in(PC), .instruction(instruction_out), .predict(predict), .PCimm_out(PCimm_pre));

    PC B1_PC(.clk(clk), .reset(reset), .PCWrite(PCWrite), .PC_in(PC4), .PC_out(PC));
    iMEM B2_iMEM(.clk(clk), .reset(reset),.IF_ID_Write(PCWrite),.PCSrc(PCSrc), .predict(predict), .PC_in(PC), .instruction_out(instruction_out));
    
    
    always @(posedge clk) begin
        if(reset||PCSrc) PC_out <=0;
        else if (PCWrite) PC_out <= PC_out;
        else PC_out <= PC;
    end
endmodule
    
        