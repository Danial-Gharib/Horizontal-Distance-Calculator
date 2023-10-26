module mux2_1_tb();

reg s;
reg [15:0] d0, d1;
wire [15:0] data_out;

MUX2_1 m (.s(s), .d0(d0), .d1(d1), .data_out(data_out));

initial begin
    s = 0;
    d0 = 16'd14;
    d1 = 16'd23;
    #10;
    s = 1;
    #10;
    d0 = 16'd11;
    s = 0;
    #10;
    d0 = 16'd45;
end




endmodule
