`timescale 1ns / 1ps

module AddressCounter(
clk, rst_n, Start, WriteReg, ReadEn, ReadReg1, ReadReg2, ReadReg3
    );
    
    input clk, rst_n;
    input Start;    
    input ReadEn;   
    output [3:0] WriteReg;      
    output [3:0] ReadReg1, ReadReg2, ReadReg3;  
        
    //module ReadAddressCounter(clk, rst_n, ReadEn, ReadReg);
    //read addr을 count. parameter를 다르게 주어서 rst_n이 들어올 시 초깃값을 다르게 주었음
    ReadAddressCounter #(14) Readaddress1(clk, rst_n, ReadEn, ReadReg1);
    ReadAddressCounter #(0) Readaddress2(clk, rst_n, ReadEn, ReadReg2);
    ReadAddressCounter #(1) Readaddress3(clk, rst_n, ReadEn, ReadReg3);

    //module WriteAddressCounter(clk, rst_n, Start, WriteReg);
    //write addr을 count. 
    WriteAddressCounter WriteAddress(clk, rst_n, Start, WriteReg);




endmodule
