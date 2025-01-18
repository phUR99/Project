`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 16:18:11
// Design Name: 
// Module Name: WB
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


module WB(
    input Ctl_RegWrite_in, Ctl_MemtoReg_in,
    output reg Ctl_RegWrite_out,
    
    input jal_in, jalr_in,
    input [31:0] PC_in,
    
    input [4:0] Rd_in,
    input [31:0] ReadDatafromMem_in, ALUresult_in,
    output reg [4:0] Rd_out,
    output reg [31:0] WriteDataReg_out
    );
    
    always@(*) begin
        Ctl_RegWrite_out = Ctl_RegWrite_in ;
        Rd_out = Rd_in;
        WriteDataReg_out = (Ctl_MemtoReg_in) ? ReadDatafromMem_in : (jalr_in||jal_in) ? PC_in+4: ALUresult_in;
    end
endmodule
