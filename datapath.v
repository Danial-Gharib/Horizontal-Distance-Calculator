module datapath (
    input wire [15:0]v, x,
    input wire clk, reset,
    input wire ld_R1,ld_R2,ld_R4,ld_R5,ld_R6,ld_R7,
    input wire clr_R1,clr_R2,clr_R4,clr_R5,clr_R6,clr_R7,
    input wire inc_R4,
    input wire set_done, clear_done,
    input wire S0, S1, S5,
    output wire is_R4_greater_than_eight,
    output wire done,
    output wire [15:0]final_result
);
    /////////////////////////////////////////////
    wire [15:0] R1_out, R2_out,R4_out, R5_out, R6_out;
    wire [15:0] mux_0_out, mux_1_out, mux_2_out;
    wire [15:0] mult_result, adder_out;
    wire [15:0] rom_out;
    wire g,e,l;
    wire [15:0] one;
    assign one = 16'b0000100000000000;
    //registers:
    register R1 (.clk(clk), .load(ld_R1), .clr(clr_R1), .data_in(mult_result), .data_out(R1_out));
    register R2 (.clk(clk), .load(ld_R2), .clr(clr_R2), .data_in(v), .data_out(R2_out));
    register R4 (.clk(clk), .load(ld_R4), .clr(clr_R4), .inc(inc_R4), .data_out(R4_out));
    register R5 (.clk(clk), .load(ld_R5), .clr(clr_R5), .data_in(mux_0_out), .data_out(R5_out));
    register R6 (.clk(clk), .load(ld_R6), .clr(clr_R6), .data_in(adder_out), .data_out(R6_out));
    register R7 (.clk(clk), .load(ld_R7), .clr(clr_R7), .data_in(mult_result), .data_out(final_result));
    //////////////////////////
    //ROM :
    ROM rom (.address(R4_out[3:0]), .data_out(rom_out));
    //////////////////////
    //comparator :
    CMP cmp (.a(R4_out), .g(g), .e(e), .l(l));
    ////////////////////////
    //OR :
    or or_gate(is_R4_greater_than_eight, g, e);
    ////////////////////////
    //// flipflop:
    flipflop is_done (.set(set_done), .clear(clear_done), .clk(clk), .Q(done));
    //////////////////////////
    ////////adder:
    adder add (.a(R5_out), .b(R6_out), .sum(adder_out));
    //////////////////////////
    ///////multiplier:
    mult multiplier (.a(mux_1_out), .b(mux_2_out), .product(mult_result));
    //////////////////////////
    ///////////multiplexers:
    MUX2_1 mux_0 (.s(S5), .d0(one), .d1(mult_result), .data_out(mux_0_out));
    MUX4_2 mux_1 (.s1(S1), .s0(S0), .d0(x), .d1(R5_out), .d2(R5_out), .d3(R6_out), .data_out(mux_1_out));
    MUX4_2 mux_2 (.s1(S1), .s0(S0), .d0(x), .d1(rom_out), .d2(R1_out), .d3(R2_out), .data_out(mux_2_out));

endmodule
