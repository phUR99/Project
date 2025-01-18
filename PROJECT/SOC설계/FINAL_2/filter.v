
module filterAddrRegister(
    input clk, rst_n,
    output reg [3:0] ad11, ad12, ad13, 
                     ad21, ad22, ad23, 
                     ad31, ad32, ad33
    );
    parameter colSize = 3;
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            ad11 <= 0;          ad12 <= 1;          ad13 <= 2;
            ad21 <= colSize;    ad22 <=colSize +1;  ad23 <=colSize +2;
            ad31 <= colSize*2;  ad32 <=colSize*2+1; ad33 <=colSize*2+2;
        end
        else begin
            ad11 <= 0;          ad12 <= 1;          ad13 <= 2;
            ad21 <= colSize;    ad22 <=colSize +1;  ad23 <=colSize +2;
            ad31 <= colSize*2;  ad32 <=colSize*2+1; ad33 <=colSize*2+2;
        end
    end

endmodule

module filter(
    input [3:0] addr11, addr12, addr13, 
                addr21, addr22, addr23, 
                addr31, addr32, addr33,
                
    output [7:0] val11, val12, val13, 
                 val21, val22, val23, 
                 val31, val32, val33
);
    reg[7:0] ram[0:8];

    initial begin
        $readmemh("filter.mem", ram);
    end
    assign val11 = ram[addr11]; assign val12 = ram[addr12]; assign val13 = ram[addr13];
    assign val21 = ram[addr21]; assign val22 = ram[addr22]; assign val23 = ram[addr23];
    assign val31 = ram[addr31]; assign val32 = ram[addr32]; assign val33 = ram[addr33];
endmodule