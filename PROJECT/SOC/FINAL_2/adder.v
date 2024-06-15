module adder #(
    parameter N = 16
)
(
    input clk, rst_n, 
    input [4:0] row_in, col_in,
    input [N-1:0] din11, din12, din13, 
                  din21, din22, din23, 
                  din31, din32, din33,
    input done_in,
    output reg [N-1:0] writeData,
    output reg done_out,
    output reg [4:0] row_out, col_out
);    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            done_out <= 0; row_out <= 0;  col_out <= 0;
        end
        else begin
            done_out <= done_in; row_out <= row_in; col_out <= col_in;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            writeData <= 0;
        end
        else begin
            writeData <=  din11 + din12 + din13 +
                          din21 + din22 + din23 +
                          din31 + din32 + din33 ;
        end
    end
endmodule