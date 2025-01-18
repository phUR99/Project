`timescale 1ns / 1ps

module RegisterFile(clk, rst_n, ReadReg1, ReadReg2, ReadReg3,
WriteReg, WriteEn, WriteData, ReadEn, ReadData1, ReadData2, ReadData3);
    parameter M = 4;   // number of address bits
    parameter N = 16;  // number of words, N = 2**M
    parameter W = 8;   // number of bits in a word
    
    input   clk, rst_n;
    input   WriteEn;     
    input   [W-1:0] WriteData; 
    output reg [W-1:0] ReadData1, ReadData2, ReadData3;  
    input   ReadEn;
    input   [M-1:0] ReadReg1, ReadReg2, ReadReg3; 
    input   [M-1:0] WriteReg; 
    
    reg [W-1:0] reg_file[0:N-1];
    // READ
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ReadData1 <= reg_file[ReadReg1];
            ReadData2 <= reg_file[ReadReg2];
            ReadData3 <= reg_file[ReadReg3];
        end
        else if(ReadEn) begin
            ReadData1 <= reg_file[ReadReg1];
            ReadData2 <= reg_file[ReadReg2];
            ReadData3 <= reg_file[ReadReg3];
        end
    end
    // Write
    always @(posedge clk) begin
        if(WriteEn) reg_file[WriteReg] <= WriteData;                    
    end

    
endmodule
