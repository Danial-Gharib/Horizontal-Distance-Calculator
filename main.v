module main (
    input wire [15:0] v, x,
    input wire clk, reset, start,
    output wire done,
    output wire [15:0]final_result
);
    wire ld_R1, ld_R2, ld_R4, ld_R5, ld_R6, ld_R7;
    wire clr_R1, clr_R2, clr_R4, clr_R5, clr_R6, clr_R7;
    wire inc_R4;
    wire set_done, clear_done;
    wire S0, S1, S5;
    wire is_R4_greater_than_eight;
    wire [2:0] next_state;
    ////////////////////////////////////////////////////
    datapath dp(.v(v), .x(x), .clk(clk), .reset(reset),
    .ld_R1(ld_R1), .ld_R2(ld_R2), .ld_R4(ld_R4), .ld_R5(ld_R5), .ld_R6(ld_R6), .ld_R7(ld_R7)
    , .clr_R1(clr_R1), .clr_R2(clr_R2), .clr_R4(clr_R4),
    .clr_R5(clr_R5), .clr_R6(clr_R6), .clr_R7(clr_R7),
    .inc_R4(inc_R4), .set_done(set_done), .clear_done(clear_done),
    .S0(S0), .S1(S1), .S5(S5), .is_R4_greater_than_eight(is_R4_greater_than_eight),
    .done(done), .final_result(final_result));

    /////////////////////////////////////////////////

    control_unit cu(.reset(reset),
    .clk(clk), .start(start), .is_R4_greater_than_eight(is_R4_greater_than_eight),
    .set_done(set_done), .clear_done(clear_done),
    .ld_R1(ld_R1), .ld_R2(ld_R2), .ld_R4(ld_R4), .ld_R5(ld_R5),
    .ld_R6(ld_R6), .ld_R7(ld_R7),
    .clr_R1(clr_R1), .clr_R2(clr_R2), .clr_R4(clr_R4),
    .clr_R5(clr_R5), .clr_R6(clr_R6), .clr_R7(clr_R7),
    .inc_R4(inc_R4),
    .S0(S0), .S1(S1), .S5(S5));
endmodule
