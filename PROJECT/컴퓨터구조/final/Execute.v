`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/08 16:08:51
// Design Name: 
// Module Name: Execute
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
module Forwarding_unit(
    input mem_Ctl_RegWrite_in, wb_Ctl_RegWrite_in,
    input [4:0] Rs1_in, Rs2_in, mem_Rd_in, wb_Rd_in,
    output [1:0] ForwardA_out, ForwardB_out
    );
    assign ForwardA_out = (mem_Ctl_RegWrite_in && (mem_Rd_in == Rs1_in)) ? 2'b10:
                          (wb_Ctl_RegWrite_in && (wb_Rd_in == Rs1_in)) ? 2'b01: 2'b00;
    assign ForwardB_out = (mem_Ctl_RegWrite_in && (mem_Rd_in == Rs2_in)) ? 2'b10:
                          (wb_Ctl_RegWrite_in && (wb_Rd_in == Rs2_in)) ? 2'b01: 2'b00;              
endmodule

module ALU_control(
    input[1:0] ALUop,
    input[6:0] funct7,
    input[2:0] funct3,
    output reg [3:0] ALU_ctl
    );
    
    //reg [3:0] ALU_ctl;
    always @(*) begin
        casex({ALUop,funct3,funct7})
            12'b00_xxx_xxxxxxx : ALU_ctl = 4'b0010; //lb
            12'b01_00x_xxxxxxx : ALU_ctl = 4'b0110; //beq,bne
            12'b01_100_xxxxxxx : ALU_ctl = 4'b0111; //blt
            12'b01_101_xxxxxxx : ALU_ctl = 4'b1000; //bge
            12'b10_000_0000000 : ALU_ctl = 4'b0010; //add
            12'b10_000_0100000 : ALU_ctl = 4'b0110; //sub
            12'b10_111_0000000 : ALU_ctl = 4'b0000; //and
            12'b10_110_0000000 : ALU_ctl = 4'b0001; //or
            12'b10_001_0000000 : ALU_ctl = 4'b0100; //sll 
            12'b10_101_0000000 : ALU_ctl = 4'b1011; //slr
            12'b11_000_xxxxxxx : ALU_ctl = 4'b0010; //addi,
            12'b11_111_xxxxxxx : ALU_ctl = 4'b0000; //andi
            12'b11_001_0000000 : ALU_ctl = 4'b0100; //slli
            12'b11_101_0000000 : ALU_ctl = 4'b1011; //srli
            default : ALU_ctl =4'bx;
        endcase
     end
endmodule

module ALU(
    input[3:0] ALU_ctl,
    input[31:0] in1,in2,
    output reg[31:0] out,
    output zero
);
    always @(*) begin
        case (ALU_ctl)
            4'b0000 : out = in1 & in2; //and
            4'b0001 : out = in1 | in2; //or
            4'b0010 : out = in1 + in2; //add
            4'b0110 : out = in1 - in2; //sub
            4'b0111 : out = (in1 < in2) ? 1:0; //slt           
            4'b0111 : out = (in1 < in2) ? 1:0;  //blt
            4'b1000 : out = (in1 >= in2) ?1:0; //bge            
            4'b1100 : out = ~(in1 |in2);//nor
            4'b0100 : out = in1 <<in2; //sll
            4'b1011 : out = in1 >>in2; //slr
            default : out = 32'b0;
         endcase
     end
    
    assign zero = ~|out;
endmodule

module Execution(
    input clk,reset, 
    input flush,
    input Ctl_ALUSrc_in, Ctl_MemtoReg_in, Ctl_RegWrite_in,Ctl_MemRead_in,Ctl_MemWrite_in,Ctl_branch_in,Ctl_ALUOpcode1_in,Ctl_ALUOpcode0_in,
    output reg Ctl_MemtoReg_out, Ctl_RegWrite_out,Ctl_MemRead_out,Ctl_MemWrite_out,Ctl_branch_out,
    
    input [4:0] Rd_in,
    output reg [4:0] Rd_out,
    
    input jal_in, jalr_in,
    output reg jal_out, jalr_out,
    
    input [31:0] Immediate_in, ReadData1_in, ReadData2_in, PC_in,
    input [31:0] mem_data, wb_data,
    input [6:0] funct7_in,
    input [2:0] funct3_in,
    
    input [1:0] ForwardA_in, ForwardB_in,
    
    output reg Zero_out,
    output reg [31:0] ALUresult_out, PCimm_out, ReadData2_out, PC_out
   );
   
   wire [3:0] ALU_ctl;
   wire [31:0] ALUresult;
   
   
   wire [31:0] ALU_input1= (ForwardA_in ==2'b10) ? mem_data:
                            (ForwardA_in ==2'b01) ?  wb_data : 
                                                                ReadData1_in;
   wire [31:0] ForwardB_input = (ForwardB_in ==2'b10) ? mem_data:
                                 (ForwardB_in ==2'b01) ? wb_data :                                                                
                                                                ReadData2_in;
   
   
   wire [31:0] ALU_input2= (Ctl_ALUSrc_in) ? Immediate_in : ForwardB_input ;
   
   ALU_control B0 (.ALUop({Ctl_ALUOpcode1_in,Ctl_ALUOpcode0_in}),  .funct7(funct7_in), .funct3(funct3_in), .ALU_ctl(ALU_ctl));
   ALU B1 (.ALU_ctl(ALU_ctl), .in1(ALU_input1), .in2(ALU_input2), .out(ALUresult), .zero(Zero));
    
    always @(posedge clk) begin
         Ctl_MemtoReg_out <=  (reset||flush)? 0 : Ctl_MemtoReg_in;
         Ctl_RegWrite_out  <= (reset||flush)? 0 : Ctl_RegWrite_in;
         Ctl_MemRead_out <= (reset||flush)? 0 : Ctl_MemRead_in;
         Ctl_MemWrite_out <= (reset||flush)? 0 : Ctl_MemWrite_in;
         Ctl_branch_out <= (reset||flush)? 0 : Ctl_branch_in;
         
         PC_out <= (reset) ?1'b0 :PC_in;
         jalr_out <= (reset) ? 1'b0 :jalr_in;
         jal_out <= (reset) ? 1'b0: jal_in;
         
         Rd_out <= Rd_in;
         PCimm_out <= PC_in+(Immediate_in<<1);
         ReadData2_out <= (reset)? 0:  ForwardB_input;
         ALUresult_out <= ALUresult;
         Zero_out  <= Zero;
   end
 endmodule 
    
    
    