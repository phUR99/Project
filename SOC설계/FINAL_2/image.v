

module imageAddrRegister(
    input clk, rst_n,
    input [4:0] col_in, row_in,
    input done_in,
    
    output reg done_out,
    output reg [4:0] col_out, row_out,    
    output reg [9:0] ad11, ad12, ad13, 
                     ad21, ad22, ad23, 
                     ad31, ad32, ad33
);
    parameter colSize = 32;

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin        
    ad11 <= 0;     ad12 <= 1;     ad13 <= 2;
    ad21 <= (colSize); ad22 <= (colSize) + 1; ad23 <= (colSize) +2;
    ad31 <= (colSize*2); ad32 <= (colSize*2) + 1; ad33 <= (colSize*2) +2;
    col_out <= 0; row_out <= 0; done_out <= 0;
    end
    else begin
    ad11 <= col_in + row_in * colSize;     ad12 <= col_in + row_in * colSize + 1;     ad13 <= col_in + row_in * colSize +2;
    ad21 <= col_in + (row_in+1) * (colSize); ad22 <= col_in + (row_in+1) * (colSize) + 1; ad23 <= col_in + (row_in+1) * (colSize) +2;
    ad31 <= col_in + (row_in+2) * (colSize); ad32 <= col_in + (row_in+2) * (colSize) + 1; ad33 <= col_in + (row_in+2) * (colSize) +2;
    col_out <= col_in; row_out <= row_in; done_out <= done_in;
    end
end

endmodule

module image #(
    parameter N = 8
)
(
    input [9:0] addr11, addr12, addr13, 
                addr21, addr22, addr23, 
                addr31, addr32, addr33,
                
    output [N-1:0]  val11, val12, val13, 
                    val21, val22, val23, 
                    val31, val32, val33
);
    reg[N-1:0] ram[0:1023];

    initial begin
        $readmemh("input.mem", ram);
    end
    assign val11 = ram[addr11]; assign val12 = ram[addr12]; assign val13 = ram[addr13];
    assign val21 = ram[addr21]; assign val22 = ram[addr22]; assign val23 = ram[addr23];
    assign val31 = ram[addr31]; assign val32 = ram[addr32]; assign val33 = ram[addr33];
endmodule

module image_2 #(
    parameter N = 8,
    parameter S = 30
)
(
    input [9:0] addr11, addr12, addr13, 
                addr21, addr22, addr23, 
                addr31, addr32, addr33,
    input done, clk, rst_n,
    input [4:0] col_in, row_in,
    input [N-1:0] writeData,
                
    output [N-1:0]  val11, val12, val13, 
                    val21, val22, val23, 
                    val31, val32, val33
);
    reg[N-1:0] ram[0:1023];

    wire [9:0] writeAddr;
    assign writeAddr = row_in * S + col_in;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
        end
        else begin            
            if(!done) ram[writeAddr] <= writeData;
        end
    end
    
    assign val11 = ram[addr11]; assign val12 = ram[addr12]; assign val13 = ram[addr13];
    assign val21 = ram[addr21]; assign val22 = ram[addr22]; assign val23 = ram[addr23];
    assign val31 = ram[addr31]; assign val32 = ram[addr32]; assign val33 = ram[addr33];
endmodule