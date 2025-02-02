
module Top(
input clk, rst_n,
output [15:0] convResult,
output endSign, enable
    );
    /*
    input clk, rst_n, 
    output [4:0] row, col,
    output [1:0] addr,
    output endSign, enable
    */
    wire[4:0] row, col;
    wire [1:0] addr;
    wire endSign_uut1, enable_uut1;
    addrLogic uut1(
    .clk(clk), .rst_n(rst_n), 
    .row(row), .col(col), 
    .addr(addr), 
    .endSign(endSign_uut1), .enable(enable_uut1));
    /*
    input clk, rst_n, endSign_in, enable_in, 
    input [4:0] row, col,
    input [1:0] addr_in,    
    output [7:0] Ival1, Ival2, Ival3, Fval1, Fval2, Fval3,
    output reg endSign_out, enable_out,
    output reg [1:0] addr_out
    */
    wire [7:0] i1, i2, i3, f1, f2, f3;
    wire endSign_uut2, enable_uut2;
    wire [1:0] addr_uut2;
    RegLogic uut2(
    .clk(clk), .rst_n(rst_n), .endSign_in(endSign_uut1), .enable_in(enable_uut1),
    .row(row), .col(col), 
    .addr_in(addr), 
    .Ival1(i1), .Ival2(i2), .Ival3(i3), .Fval1(f1), .Fval2(f2), .Fval3(f3),
    .endSign_out(endSign_uut2), .enable_out(enable_uut2),
    .addr_out(addr_uut2)
    );
    /*
    input clk, rst_n, endSign_in, enable_in,
    input [1:0] addr_in,
    input [7:0] Iin1, Iin2, Iin3, 
    input signed [7:0] Fin1, Fin2, Fin3,
    output signed [15:0] dout1, dout2, dout3,
    output reg endSign_out, enable_out,
    output reg [1:0] addr_out
    */
    wire [15:0] d1,d2, d3;
    wire endSign_uut3, enable_uut3;
    wire [1:0] addr_uut3;
    multiplicationLogic uut3(
    .clk(clk), .rst_n(rst_n), .endSign_in(endSign_uut2), .enable_in(enable_uut2),
    .addr_in(addr_uut2),
    .Iin1(i1), .Iin2(i2), .Iin3(i3),
    .Fin1(f1), .Fin2(f2), .Fin3(f3),
    .dout1(d1), .dout2(d2), .dout3(d3),
    .endSign_out(endSign_uut3), .enable_out(enable_uut3),
    .addr_out(addr_uut3)
    );
    /*
    input clk, rst_n, 
    input [15:0] din1, din2, din3,
    input [1:0] addr,
    input enable, endSign_in,
    output [15:0] writeData,
    output endSign_out
    */
    wire [15:0] writeData;
    wire endSign_uut4, enable_uut4;
    addLogic uut4(
    .clk(clk), .rst_n(rst_n), 
    .din1(d1), .din2(d2), .din3(d3),
    .addr(addr_uut3), 
    .enable(enable_uut3), .endSign_in(endSign_uut3),
    .writeData(convResult),
    .endSign_out(endSign),    
    .enable_out(enable)
    );

endmodule
