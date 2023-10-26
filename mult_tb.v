module mult_tb();
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] product;
    mult m (.a(a), .b(b), .product(product));
    initial begin
        #10;
        a = 16'b0000000000000001;
        b = 16'b1111110000000000;
        #20;
    end



endmodule
