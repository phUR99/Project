module Multiplicator #(
    parameter N1 = 8,
    parameter N2 = 8
)
(
    input clk, rst_n,
    input [N1-1:0] din0,
    input [N2-1:0] din1,
    output reg [2*N1-1:0] dout
    );
    wire [2*N1-1:0] extend_din0, extend_din1;

    assign extend_din0 = {{N1{1'b0}}, din0};
    assign extend_din1 = {{(2*N1-N2){din1[N2-1]}}, din1};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) dout <= 0;
        else dout <= extend_din0 * extend_din1;
    end
    
endmodule

module multiLogic #(
    parameter N = 8,
    parameter M = 8
)
(
    input [4:0] row_in, col_in,
    input done_in, clk, rst_n,
    input [N-1:0]
          f11, f12, f13,
          f21, f22, f23,
          f31, f32, f33,

    input [M-1:0]
          i11, i12, i13,
          i21, i22, i23,
          i31, i32, i33,

    output reg done_out,    
    output reg [4:0] row_out, col_out,    
    output [2*M-1:0]     d11, d12, d13, 
                         d21, d22, d23, 
                         d31, d32, d33
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin        
            col_out <= 0; row_out <= 0; done_out <= 0;
        end
        else begin   
            col_out <= col_in; row_out <= row_in; done_out <= done_in;
        end
    end
    Multiplicator #(M, N) m1(.clk(clk), .rst_n(rst_n), .din0(i11), .din1(f11), .dout(d11));
    Multiplicator #(M, N) m2(.clk(clk), .rst_n(rst_n), .din0(i12), .din1(f12), .dout(d12));
    Multiplicator #(M, N) m3(.clk(clk), .rst_n(rst_n), .din0(i13), .din1(f13), .dout(d13));
    Multiplicator #(M, N) m4(.clk(clk), .rst_n(rst_n), .din0(i21), .din1(f21), .dout(d21));
    Multiplicator #(M, N) m5(.clk(clk), .rst_n(rst_n), .din0(i22), .din1(f22), .dout(d22));
    Multiplicator #(M, N) m6(.clk(clk), .rst_n(rst_n), .din0(i23), .din1(f23), .dout(d23));
    Multiplicator #(M, N) m7(.clk(clk), .rst_n(rst_n), .din0(i31), .din1(f31), .dout(d31));
    Multiplicator #(M, N) m8(.clk(clk), .rst_n(rst_n), .din0(i32), .din1(f32), .dout(d32));
    Multiplicator #(M, N) m9(.clk(clk), .rst_n(rst_n), .din0(i33), .din1(f33), .dout(d33));

endmodule

module Multiplicator_2 #(
    parameter N1 = 8,
    parameter N2 = 8
)
(
    input clk, rst_n,
    input [N1-1:0] din0,
    input [N2-1:0] din1,
    output reg [2*N1-1:0] dout
    );
    wire [2*N1-1:0] extend_din0, extend_din1;

    assign extend_din0 = {{N1{din0[N1-1]}}, din0};
    assign extend_din1 = {{(2*N1-N2){din1[N2-1]}}, din1};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) dout <= 0;
        else dout <= extend_din0 * extend_din1;
    end
    
endmodule

module multiLogic_2 #(
    parameter N = 8,
    parameter M = 8
)
(
    input [4:0] row_in, col_in,
    input done_in, clk, rst_n,
    input [N-1:0]
          f11, f12, f13,
          f21, f22, f23,
          f31, f32, f33,

    input [M-1:0]
          i11, i12, i13,
          i21, i22, i23,
          i31, i32, i33,

    output reg done_out,    
    output reg [4:0] row_out, col_out,    
    output [2*M-1:0]     d11, d12, d13, 
                         d21, d22, d23, 
                         d31, d32, d33
);
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin        
            col_out <= 0; row_out <= 0; done_out <= 0;
        end
        else begin   
            col_out <= col_in; row_out <= row_in; done_out <= done_in;
        end
    end
    Multiplicator_2 #(M, N) m1(.clk(clk), .rst_n(rst_n), .din0(i11), .din1(f11), .dout(d11));
    Multiplicator_2 #(M, N) m2(.clk(clk), .rst_n(rst_n), .din0(i12), .din1(f12), .dout(d12));
    Multiplicator_2 #(M, N) m3(.clk(clk), .rst_n(rst_n), .din0(i13), .din1(f13), .dout(d13));
    Multiplicator_2 #(M, N) m4(.clk(clk), .rst_n(rst_n), .din0(i21), .din1(f21), .dout(d21));
    Multiplicator_2 #(M, N) m5(.clk(clk), .rst_n(rst_n), .din0(i22), .din1(f22), .dout(d22));
    Multiplicator_2 #(M, N) m6(.clk(clk), .rst_n(rst_n), .din0(i23), .din1(f23), .dout(d23));
    Multiplicator_2 #(M, N) m7(.clk(clk), .rst_n(rst_n), .din0(i31), .din1(f31), .dout(d31));
    Multiplicator_2 #(M, N) m8(.clk(clk), .rst_n(rst_n), .din0(i32), .din1(f32), .dout(d32));
    Multiplicator_2 #(M, N) m9(.clk(clk), .rst_n(rst_n), .din0(i33), .din1(f33), .dout(d33));

endmodule