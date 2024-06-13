module Multiplicator(
    input clk, rst_n,
    input [7:0] din0,
    input [7:0] din1,
    output reg [15:0] dout
    );
    wire [15:0] extend_din0, extend_din1;

    assign extend_din0 = {{8{1'b0}}, din0};
    assign extend_din1 = {{8{din1[7]}}, din1};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) dout <= 0;
        else dout <= extend_din0 * extend_din1;
    end
    
endmodule