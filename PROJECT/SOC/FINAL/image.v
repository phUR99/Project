

module imageAddrRegister(
    input clk, rst_n,
    input [1:0] cnt,
    input [4:0] col,
    input [4:0] row,
    output reg [9:0] ad1, ad2, ad3
    );
    parameter colSize = 32;

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        ad1 <= 0;
        ad2 <= 32;
        ad3 <= 64;
    end
    else begin
        ad1 <= cnt + col + colSize * row;
        ad2 <= cnt + col + colSize * (row + 1);
        ad3 <= cnt + col + colSize * (row + 2);
    end
end

endmodule

module image(
    input [9:0] addr1, addr2, addr3,
    output [7:0] val1, val2, val3
);
    reg[7:0] ram[0:1023];

    initial begin
        $readmemh("input.mem", ram);
    end
    assign val1 = ram[addr1];
    assign val2 = ram[addr2];
    assign val3 = ram[addr3];
endmodule