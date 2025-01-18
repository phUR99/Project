
module counter(
    input clk, rst_n,
    input enable,
    input [4:0] value,
    output reg [4:0] out,
    output reg cout
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out <= 5'b00000;
            cout <= 0;
        end
        else if (enable) begin
            if(out == value) begin
                out <= 5'b00000;            
                cout <= 1;
            end
            else  begin
                out <= out + 1;
                cout <= 0;
            end
        end        
    end

endmodule

module counterLogic
(
    input clk, rst_n,
    input enable,    

    output [4:0] row_out, col_out,
    output reg done
);
    wire cout1, cout2;
    parameter index = 29;


    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) done <= 0;
        else if(row_out == index && col_out == index)
            done <= 1'b1;
    end    
    counter X1(.clk(clk), .rst_n(rst_n), .enable(enable), .value(index), .out(col_out), .cout(cout1));
    counter X2(.clk(clk), .rst_n(rst_n), .enable(cout1),  .value(index), .out(row_out), .cout(cout2));

endmodule