
module addrLogic(
    input clk, rst_n, 
    output [4:0] row, col,
    output [1:0] addr,
    output endSign, enable
);
    wire [2:0] count;    
    wire en1, en2, en3;
    assign enable = en1;
    assign endSign = ((row==5'b11101) && (col==5'b11101) && enable);

    ringCounter X1(.clk(clk), .rst_n(rst_n), .count(count));
    addrEncoder X2(.count(count), .address(addr), .en(en1));    
    counter X3(.clk(clk), .rst_n(rst_n), .en(en1), .value(5'b11101), .out(col), .cout(en2));
    counter X4(.clk(clk), .rst_n(rst_n), .en(en2), .value(5'b11101), .out(row), .cout(en3));
endmodule

module RegLogic(
    input clk, rst_n, endSign_in, enable_in, 
    input [4:0] row, col,
    input [1:0] addr_in,    
    output [7:0] Ival1, Ival2, Ival3, Fval1, Fval2, Fval3,
    output reg endSign_out, enable_out,
    output reg [1:0] addr_out
);
    wire [9:0] Iaddr1, Iaddr2, Iaddr3;
    wire [3:0] Faddr1, Faddr2, Faddr3;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin            
            endSign_out <= 0;
            enable_out  <= 0;
            addr_out <= 0;            
        end
        else begin
            endSign_out <= endSign_in;
            enable_out  <= enable_in;            
            addr_out <= addr_in;
        end
    end

    imageAddrRegister R1(.clk(clk), .rst_n(rst_n), .cnt(addr_in), .col(col), .row(row), .ad1(Iaddr1), .ad2(Iaddr2), .ad3(Iaddr3));
    image R2(.addr1(Iaddr1), .addr2(Iaddr2), .addr3(Iaddr3), .val1(Ival1), .val2(Ival2), .val3(Ival3));
    
    filterAddrRegister R3(.clk(clk), .rst_n(rst_n), .cnt(addr_in), .ad1(Faddr1), .ad2(Faddr2), .ad3(Faddr3));
    filter R4(.addr1(Faddr1), .addr2(Faddr2), .addr3(Faddr3), .val1(Fval1), .val2(Fval2), .val3(Fval3));

endmodule

module multiplicationLogic(
    input clk, rst_n, endSign_in, enable_in,
    input [1:0] addr_in,
    input [7:0] Iin1, Iin2, Iin3, 
    input [7:0] Fin1, Fin2, Fin3,
    output [15:0] dout1, dout2, dout3,
    output reg endSign_out, enable_out,
    output reg [1:0] addr_out
);
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin            
            endSign_out <= 0;
            enable_out  <= 0;
            addr_out <= 0;
        end
        else begin
            endSign_out <= endSign_in;
            enable_out  <= enable_in;            
            addr_out <= addr_in;
        end
    end

    Multiplicator m1(.clk(clk), .rst_n(rst_n), .din0(Iin1), .din1(Fin1), .dout(dout1));
    Multiplicator m2(.clk(clk), .rst_n(rst_n), .din0(Iin2), .din1(Fin2), .dout(dout2));
    Multiplicator m3(.clk(clk), .rst_n(rst_n), .din0(Iin3), .din1(Fin3), .dout(dout3));    
endmodule

module addLogic (
    input clk, rst_n, 
    input [15:0] din1, din2, din3,
    input [1:0] addr,
    input enable, endSign_in,
    output [15:0] writeData,
    output endSign_out,
    output reg enable_out
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) enable_out <= 0;
        else enable_out <= enable;
    end

    adder a1(.clk(clk), .rst_n(rst_n), .din1(din1), .din2(din2), 
    .din3(din3), .addr(addr), .enable(enable), .endSign_in(endSign_in), .writeData(writeData), .endSign_out(endSign_out));
endmodule