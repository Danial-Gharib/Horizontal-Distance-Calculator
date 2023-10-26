module flipflop_tb();
    reg clk, set, clear;
    wire Q;
    flipflop f (.clk(clk), .set(set), .clear(clear),
    .Q(Q));

    initial begin
        clk = 0;
        set = 0;
        clear = 0;
        #7;
        set = 1;
        #20;
        set = 0;
        clear = 1;
        #20;
        clear = 0;
        #20;
        set = 1;
        #20;
    end

    always #10 clk = ~clk;


endmodule
