module adder (
    input clk, rst_n, 
    input [15:0] din1, din2, din3,
    input [1:0] addr,
    input enable, endSign_in,
    output [15:0] writeData,
    output reg endSign_out
);
    reg [15:0] temp[0:8];
    wire [15:0] result1, result2, result3;
    reg en;
    assign writeData = (en) ? result1 + result2 + result3 : 0;
    

    assign result1 = temp[0] + temp[1] + temp[2];
    assign result2 = temp[3] + temp[4] + temp[5];
    assign result3 = temp[6] + temp[7] + temp[8];
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            en <= 0;
            endSign_out <= 0;
        end
        else begin
            en <= enable;
            endSign_out <= endSign_in;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            temp[addr]   <= 0;
            temp[addr+3] <= 0;
            temp[addr+6] <= 0;          
        end
        else begin
            temp[addr]   <= din1;
            temp[addr+3] <= din2;
            temp[addr+6] <= din3;    
        end
    end
endmodule