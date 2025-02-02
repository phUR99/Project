module Top(
    input clk, rst_n, enable

);
    wire [4:0] row_1, col_1;
    wire done_1;
    counterLogic #(29) c1(
    .clk(clk), .rst_n(rst_n), 
    .enable(enable), 
    .row_out(row_1), .col_out(col_1),
    .done(done_1)
    );

    wire [4:0] row_2, col_2;
    wire done_2;
    wire [9:0]  i1_ad11, i1_ad12, i1_ad13, 
                i1_ad21, i1_ad22, i1_ad23, 
                i1_ad31, i1_ad32, i1_ad33;
    imageAddrRegister #(32) i1(
        .clk(clk), .rst_n(rst_n),
        .col_in(col_1), .row_in(row_1),
        .done_in(done_1),
        .done_out(done_2),
        .col_out(col_2), .row_out(row_2),
        .ad11(i1_ad11), .ad12(i1_ad12), .ad13(i1_ad13), 
        .ad21(i1_ad21), .ad22(i1_ad22), .ad23(i1_ad23), 
        .ad31(i1_ad31), .ad32(i1_ad32), .ad33(i1_ad33)
    );
    wire [7:0]  i1_val11, i1_val12, i1_val13, 
                i1_val21, i1_val22, i1_val23, 
                i1_val31, i1_val32, i1_val33;

    image #(8) i2(
        .addr11(i1_ad11), .addr12(i1_ad12), .addr13(i1_ad13), 
        .addr21(i1_ad21), .addr22(i1_ad22), .addr23(i1_ad23), 
        .addr31(i1_ad31), .addr32(i1_ad32), .addr33(i1_ad33),
            
        .val11(i1_val11), .val12(i1_val12), .val13(i1_val13), 
        .val21(i1_val21), .val22(i1_val22), .val23(i1_val23), 
        .val31(i1_val31), .val32(i1_val32), .val33(i1_val33)
    );

    wire [3:0] f1_ad11, f1_ad12, f1_ad13,
               f1_ad21, f1_ad22, f1_ad23,
               f1_ad31, f1_ad32, f1_ad33;
    wire [7:0]  f1_val11, f1_val12, f1_val13, 
                f1_val21, f1_val22, f1_val23, 
                f1_val31, f1_val32, f1_val33;
    filterAddrRegister f1(clk, rst_n,
            f1_ad11, f1_ad12, f1_ad13,
            f1_ad21, f1_ad22, f1_ad23,
            f1_ad31, f1_ad32, f1_ad33
    );
    filter f2(
            f1_ad11, f1_ad12, f1_ad13,
            f1_ad21, f1_ad22, f1_ad23,
            f1_ad31, f1_ad32, f1_ad33,

            f1_val11, f1_val12, f1_val13, 
            f1_val21, f1_val22, f1_val23, 
            f1_val31, f1_val32, f1_val33
    );

    wire done_3;
    wire [4:0] row_3, col_3;
    wire [15:0]       m1_d11, m1_d12, m1_d13, 
                      m1_d21, m1_d22, m1_d23, 
                      m1_d31, m1_d32, m1_d33;
    multiLogic #(8, 8) m1(row_2, col_2,
        done_2, clk, rst_n,
        
        f1_val11, f1_val12, f1_val13, 
        f1_val21, f1_val22, f1_val23, 
        f1_val31, f1_val32, f1_val33,

        i1_val11, i1_val12, i1_val13, 
        i1_val21, i1_val22, i1_val23, 
        i1_val31, i1_val32, i1_val33,

        done_3,
        row_3, col_3,

        m1_d11, m1_d12, m1_d13, 
        m1_d21, m1_d22, m1_d23, 
        m1_d31, m1_d32, m1_d33    
    );

    wire [15:0] conv1_result;
    wire done_4;
    wire [4:0] row, col;
    adder #(16) a1(clk, rst_n,
        row_3, col_3,
        m1_d11, m1_d12, m1_d13, 
        m1_d21, m1_d22, m1_d23, 
        m1_d31, m1_d32, m1_d33,    
        done_3,
        conv1_result,
        done_4,
        row, col
    );
    wire [4:0] row_5, col_5;
    wire done_5;

    counterLogic #(26) c2(
    .clk(clk), .rst_n(rst_n), 
    .enable(done_4), 
    .row_out(row_5), .col_out(col_5),
    .done(done_5)
    );
    wire [4:0] row_6, col_6;
    wire done_6;
    wire [9:0]  i3_ad11, i3_ad12, i3_ad13, 
                i3_ad21, i3_ad22, i3_ad23, 
                i3_ad31, i3_ad32, i3_ad33;

    imageAddrRegister #(30) i3(
        .clk(clk), .rst_n(rst_n),
        .col_in(col_5), .row_in(row_5),
        .done_in(done_5),
        .done_out(done_6),
        .col_out(col_6), .row_out(row_6),
        .ad11(i3_ad11), .ad12(i3_ad12), .ad13(i3_ad13), 
        .ad21(i3_ad21), .ad22(i3_ad22), .ad23(i3_ad23), 
        .ad31(i3_ad31), .ad32(i3_ad32), .ad33(i3_ad33)
    );
    wire [15:0] i3_val11, i3_val12, i3_val13, 
                i3_val21, i3_val22, i3_val23, 
                i3_val31, i3_val32, i3_val33;

    image_2 #(16) i4(
        .done(done_5), .clk(clk), .rst_n(rst_n),
        .col_in(col), .row_in(row),
        .writeData(conv1_result),

        .addr11(i3_ad11), .addr12(i3_ad12), .addr13(i3_ad13), 
        .addr21(i3_ad21), .addr22(i3_ad22), .addr23(i3_ad23), 
        .addr31(i3_ad31), .addr32(i3_ad32), .addr33(i3_ad33),
            
        .val11(i3_val11), .val12(i3_val12), .val13(i3_val13), 
        .val21(i3_val21), .val22(i3_val22), .val23(i3_val23), 
        .val31(i3_val31), .val32(i3_val32), .val33(i3_val33)
    );

    wire [3:0]  f3_ad11, f3_ad12, f3_ad13,
                f3_ad21, f3_ad22, f3_ad23,
                f3_ad31, f3_ad32, f3_ad33;
    wire [7:0]  f3_val11, f3_val12, f3_val13, 
                f3_val21, f3_val22, f3_val23, 
                f3_val31, f3_val32, f3_val33;

    filterAddrRegister f3(clk, rst_n,
                f3_ad11, f3_ad12, f3_ad13,
                f3_ad21, f3_ad22, f3_ad23,
                f3_ad31, f3_ad32, f3_ad33
    );
    filter f4(
                f3_ad11, f3_ad12, f3_ad13,
                f3_ad21, f3_ad22, f3_ad23,
                f3_ad31, f3_ad32, f3_ad33,

                f3_val11, f3_val12, f3_val13, 
                f3_val21, f3_val22, f3_val23, 
                f3_val31, f3_val32, f3_val33
    );

    wire done_7;
    wire [4:0] row_7, col_7;
    wire [31:0]       m3_d11, m3_d12, m3_d13, 
                      m3_d21, m3_d22, m3_d23, 
                      m3_d31, m3_d32, m3_d33;
    multiLogic_2 #(8, 16) m3(row_6, col_6,
        done_6, clk, rst_n,
        
        f3_val11, f3_val12, f3_val13, 
        f3_val21, f3_val22, f3_val23, 
        f3_val31, f3_val32, f3_val33,

        i3_val11, i3_val12, i3_val13, 
        i3_val21, i3_val22, i3_val23, 
        i3_val31, i3_val32, i3_val33,

        done_7,
        row_7, col_7,

        m3_d11, m3_d12, m3_d13, 
        m3_d21, m3_d22, m3_d23, 
        m3_d31, m3_d32, m3_d33    
    );
    wire done_8;
    wire [31:0] conv2_result;
    wire [4:0] row2, col2;
    adder #(32) a2(clk, rst_n,
        row_7, col_7,
        m3_d11, m3_d12, m3_d13, 
        m3_d21, m3_d22, m3_d23, 
        m3_d31, m3_d32, m3_d33,    
        done_7,
        conv2_result,
        done_8,
        row2, col2
    );

endmodule