module CMP_tb();
    reg [15:0] a;
    wire g,e,l;
    CMP cmp (.a(a), .g(g), .e(e), .l(l));
    initial begin
        a = 16'd8;
        #10;
        a = 16'd10;
        #10;
        a = 16'd30;
        #10;
        a = 16'd7;
        #10;
        a = 16'd8;
    end


endmodule
