module register_tb();
    reg clk, load, inc, clear;
    reg [15:0] data_in;
    wire [15:0] data_out;

    register r (.clk(clk), .load(load)
    , .inc(inc), .clr(clear), .data_in(data_in),
    .data_out(data_out));

    initial begin
        clk = 1;
        clear = 1;
        load = 0;
        inc = 0;
        #12;
        clear = 0;
        data_in = 16'd13;
        load = 1;
        inc = 0;
        #12;
        load = 0;
        inc = 1;
        #20;
        inc = 0;
        data_in = 13'd22;
        load = 1;
        #10;
        inc = 1;
        load = 0;
    end

    always #5 clk = ~clk;

endmodule
