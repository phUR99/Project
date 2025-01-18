`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:04 05/12/2022 
// Design Name: 
// Module Name:    RISCVpipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RISCVpipeline(
    input 	key,
	output 	[ 7:0] digit,
	output 	[ 7:0] fnd,
	output 	[15:0] LED,
	input clk, reset
	);
	wire rst;
	assign rst = ~reset;
	wire c;
	wire [2:0] LED_clk;
	wire [31:0] pc, ins;
	wire ind_ctl_0, ind_ctl_1, ind_ctl_2, ind_ctl_3, ind_ctl_4, ind_ctl_5, ind_ctl_6, ind_ctl_7;
	wire exe_ctl_0, exe_ctl_1, exe_ctl_2, exe_ctl_3, exe_ctl_4, exe_ctl_5, exe_ctl_6, exe_ctl_7;
	wire mem_ctl_0, mem_ctl_1, mem_ctl_2, mem_ctl_3, mem_ctl_4, mem_ctl_5, mem_ctl_6, mem_ctl_7;
	wire wb_ctl_0,  wb_ctl_1,  wb_ctl_2,  wb_ctl_3,  wb_ctl_4,  wb_ctl_5,  wb_ctl_6,  wb_ctl_7;
	
	wire hzd_stall;
	wire [ 1:0]  fwd_A, fwd_B;
	
	wire [31:0]  ind_pc, ind_data1, ind_data2, ind_imm;
    wire [31:0]	 exe_pc, exe_data2, exe_addr, exe_result;
    wire [31:0]  mem_pc, mem_addr, mem_result, mem_data;		
    wire [31:0]  wb_data;
	wire [4:0]	 ind_rd, ind_rs1, ind_rs2;	
	wire [4:0]   exe_rd;	
	wire [4:0]   mem_rd;	
	wire [4:0]   wb_rd;
	wire [6:0]	 ind_funct7;
	wire [2:0]	 ind_funct3;
	wire 		 ind_jal, ind_jalr;		
	wire         exe_jalr, exe_jal, exe_zero;	
	wire         mem_jalr, mem_jal, mem_PCSrc;

	wire	[31:0] clk_address, clk_count;
	wire 	[31:0] data = (key)? mem_data : clk_count;
	wire 	[31:0] RAM_address = (key) ? (clk_address<<2) : exe_result;
	assign LED =  (key) ? 16'b1000_0000_0000_0000 : 16'b0;

	wire predict;
//////////////////////////////////////////////////////////////////////////////////////
LED_channel LED0(
	.data(data),							.digit(digit),
	.LED_clk(LED_clk),					.fnd(fnd));
//////////////////////////////////////////////////////////////////////////////////////
counter A0_counter(
	.key1(key),
	.mem_data(mem_data),
	.clk_address(clk_address),
	.indrs1(ind_rs1),
	.inddata1(ind_data1),
	.clk(clk),								.LED_clk(LED_clk),
	.rst(rst),								.clk_out(c),
	.pc_in(pc),						        
	.clk_count_out(clk_count));
//////////////////////////////////////////////////////////////////////////////////////	
	InFetch A1_InFetch(.clk(c), .reset(rst), .PCSrc(mem_PCSrc), .PCWrite(hzd_stall), .PCimm_in(mem_addr), .instruction_out(ins),.predict(predict), .PC_out(pc)	
		
	);
				
	InDecode A3_InDecode(.clk(c), .reset(rst), .stall(hzd_stall), .flush(mem_PCSrc), .predict(predict), 
	.Ctl_RegWrite_in(wb_ctl_0), 
	.Ctl_ALUSrc_out(ind_ctl_0),     .Ctl_MemtoReg_out(ind_ctl_1), 
	.Ctl_RegWrite_out(ind_ctl_2),   .Ctl_MemRead_out(ind_ctl_3), 
	.Ctl_MemWrite_out(ind_ctl_4),   .Ctl_Branch_out(ind_ctl_5), 
	.Ctl_ALUOpcode1_out(ind_ctl_6), .Ctl_ALUOpcode0_out(ind_ctl_7),
	.WriteReg(wb_rd), 
	.PC_in(pc), 
	.instruction_in(ins),           .WriteData(wb_data), 
	.Rd_out(ind_rd),  .Rs1_out(ind_rs1),           .Rs2_out(ind_rs2),  
	.PC_out(ind_pc),  .ReadData1_out(ind_data1),   .ReadData2_out(ind_data2), .Immediate_out(ind_imm), 
	.funct7_out(ind_funct7),	
	.funct3_out(ind_funct3),	
	.jalr_out(ind_jalr), .jal_out(ind_jal)							
	);
    Hazard_detection_unit A3_Hazard (.exe_Ctl_MemRead_in(ind_ctl_3), .Rd_in(ind_rd), .instruction_in(ins[24:15]), .stall_out(hzd_stall)
					
	);	
	Execution A4_Execution( .clk(c), .reset(rst),
	.flush(mem_PCSrc),
	.Ctl_ALUSrc_in(ind_ctl_0),     .Ctl_MemtoReg_in(ind_ctl_1), 
	.Ctl_RegWrite_in(ind_ctl_2),   .Ctl_MemRead_in(ind_ctl_3),
	.Ctl_MemWrite_in(ind_ctl_4),   .Ctl_branch_in(ind_ctl_5),
	.Ctl_ALUOpcode1_in(ind_ctl_6), .Ctl_ALUOpcode0_in(ind_ctl_7),
	
	.Ctl_MemtoReg_out(exe_ctl_0),  .Ctl_RegWrite_out(exe_ctl_1),
	.Ctl_MemRead_out(exe_ctl_2),   .Ctl_MemWrite_out(exe_ctl_3),
	.Ctl_branch_out(exe_ctl_4),    .Rd_in(ind_rd), 
	.Rd_out(exe_rd),   .jal_in(ind_jal),   .jalr_in(ind_jalr),
	.jal_out(exe_jal),     .jalr_out(exe_jalr),
	.Immediate_in(ind_imm), .ReadData1_in(ind_data1), .ReadData2_in(ind_data2), 
	.PC_in(ind_pc), .mem_data(exe_result), .wb_data(wb_data),
	.funct7_in(ind_funct7),    .funct3_in(ind_funct3),
	.ForwardA_in(fwd_A),   .ForwardB_in(fwd_B),
	.Zero_out(exe_zero),   .ALUresult_out(exe_result), 
	.PCimm_out(exe_addr),  .ReadData2_out(exe_data2), .PC_out(exe_pc)
		
	);
	Forwarding_unit A5_Forwarding (
	.mem_Ctl_RegWrite_in(exe_ctl_1),   .wb_Ctl_RegWrite_in(mem_ctl_1),
	.Rs1_in(ind_rs1),  .Rs2_in(ind_rs2), 
	.mem_Rd_in(exe_rd),    .wb_Rd_in(wb_rd),
	.ForwardA_out(fwd_A),  .ForwardB_out(fwd_B)	
	);
	
	Memory A6_Memory(
	.reset(rst),   .clk(c),
	.Ctl_MemtoReg_in(exe_ctl_0),   .Ctl_RegWrite_in(exe_ctl_1), 
	.Ctl_MemRead_in(exe_ctl_2),    .Ctl_MemWrite_in(exe_ctl_3), 
	.Ctl_Branch_in(exe_ctl_4),     .Ctl_MemtoReg_out(mem_ctl_0),
	.Ctl_RegWrite_out(mem_ctl_1),
	.Rd_in(exe_rd),    .Rd_out(mem_rd),
	.jal_in(exe_jal),  .jalr_in(exe_jalr),
	.Zero_in(exe_zero),    .Write_Data(exe_data2), 
	.ALUresult_in(RAM_address),     .PCimm_in(exe_addr), 
	.PC_in(exe_pc),    .PCSrc(mem_PCSrc),
	.jal_out(mem_jal), .jalr_out(mem_jalr),
	.Read_data(mem_data), .ALUresult_out(mem_result), .PC_out(mem_pc),
	.PCimm_out(mem_addr)
		
	);
	WB A7_WB(
	.Ctl_RegWrite_in(mem_ctl_1),   .Ctl_MemtoReg_in(mem_ctl_0),
	.Ctl_RegWrite_out(wb_ctl_0),
	.jal_in(mem_jal),  .jalr_in(mem_jalr),
	.PC_in(mem_pc),    .Rd_in(mem_rd), 
	.ReadDatafromMem_in(mem_data),     .ALUresult_in(mem_result),
	.Rd_out(wb_rd),    .WriteDataReg_out(wb_data)
		
	);

endmodule
