module mux4_2_tb();
    reg s1;
    reg s0;
    reg [15:0] d3,d2,d1,d0;
    wire [15:0] data_out;
    MUX4_2 mux (.s1(s1), .s0(s0), .d3(d3),
    .d2(d2), .d1(d1), .d0(d0), .data_out(data_out));
    initial begin
        s1 = 0;
        s0 = 0;
        d3 = 16'd10;
        d2 = 16'd9;
        d1 = 16'd8;
        d0 = 16'd7;
        #10;
        s0 = 1;
        #10;
        s1 = 1;
        s0 = 0;
        #10;
        s0 = 1;
        #10;
        d3 = 16'd11;
        #10;
        s0 = 0;
        s1 = 0;
        #10;
    end


endmodule
