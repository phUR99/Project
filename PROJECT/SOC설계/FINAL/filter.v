
module filterAddrRegister(
    input clk, rst_n,
    input [1:0] cnt,
    output reg [3:0] ad1, ad2, ad3
    );
    parameter colSize = 3;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            ad1 <= 0;
            ad2 <= colSize;
            ad3 <= colSize*2;
        end
        else begin
            ad1 <= cnt;
            ad2 <= cnt + colSize;
            ad3 <= cnt + 2*colSize;
        end
    end

endmodule

module filter(
    input [3:0] addr1, addr2, addr3,
    output [7:0] val1, val2, val3
);
    reg[7:0] ram[0:8];

    initial begin
        $readmemh("filter.mem", ram);
    end
    assign val1 = ram[addr1];
    assign val2 = ram[addr2];
    assign val3 = ram[addr3];
endmodule