module tb_sobelFilter;
    reg clk, rst_n;
    wire [15:0] convResult;
    wire endSign, enable;
    

    initial begin
        clk = 1;
        rst_n = 0;
        #10 rst_n = 1; 
    end              
    
    /*
    input clk, rst_n,
    output [15:0] convResult,
    output endSign
    */
    Top uut(.clk(clk), .rst_n(rst_n), .convResult(convResult), .endSign(endSign), .enable(enable));

    always #10 clk = ~clk;
    
    

endmodule