
module ringCounter(
    input clk, rst_n,
    output reg [2:0] count
);

always @(posedge clk, negedge rst_n) begin
    if (!rst_n)
        count <= 3'b001;
    else
        count <= {count[1:0], count[2]};
end

endmodule

module addrEncoder(
    input [2:0] count, 
    output reg [1:0] address,
    output en
    );
    assign en = (count == 3'b100) ? 1 : 0;
    always @(*) begin
        case(count)
            3'b001 :  address = 2'b00;
            3'b010 :  address = 2'b01;
            3'b100 :  address = 2'b10;
            default : address = 2'b11;
        endcase
    end

endmodule

module counter(
    input clk, rst_n,
    input en,
    input [4:0] value,
    output reg [4:0] out,
    output reg cout
);

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            out <= 5'b00000;
            cout <= 0;
        end
        else if (en) begin
            if(out == value) begin
                out <= 5'b00000;            
                cout <= 1;
            end
            else  begin
                out <= out + 1;
            end
        end
        else cout <= 0;
    end

endmodule
