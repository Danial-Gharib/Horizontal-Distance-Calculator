// PRE1 = 000
// PRE2 = 001
// INIT = 010
// CALC1 = 011
// CALC2 = 100
// FIN = 101
module control_unit (
    input wire reset,
    input wire clk,
    input wire start,
    input wire is_R4_greater_than_eight,
    output wire set_done, clear_done,
    output wire ld_R1, clr_R1,
    output wire ld_R2, clr_R2,
    output wire ld_R4, clr_R4, inc_R4,
    output wire ld_R5, clr_R5,
    output wire ld_R6, clr_R6,
    output wire ld_R7, clr_R7,
    output wire S0, S1, S5
    );

    parameter PRE1 = 3'b000;
    parameter PRE2 = 3'b001;
    parameter INIT = 3'b010;
    parameter CALC1 = 3'b011;
    parameter CALC2 = 3'b100;
    parameter FIN = 3'b101;
    //////////////////////////////////

    reg [2:0]next_state;
    reg [2:0]state = 3'b000;
    ////////////////////////////////////////////////////

    assign set_done = (state == FIN);
    assign clear_done = (state == INIT);
    assign ld_R1 = (state == INIT);
    assign clr_R1 = (reset);
    assign ld_R2 = (state == INIT);
    assign clr_R2 = reset;
    assign ld_R4 = 0;
    assign clr_R4 = ((state == INIT) || reset);
    assign inc_R4 = (state == CALC2);
    assign ld_R5 = ((state == INIT) || (state == CALC1) || (state == CALC2));
    assign clr_R5 = reset;
    assign ld_R6 = (state == CALC1);
    assign clr_R6 = ((state == INIT) || reset);
    assign ld_R7 = (state == FIN);
    assign clr_R7 = reset;
    /////////////////////////
    assign S1 = ((state == CALC2) || (state == FIN));
    assign S0 = ((state == CALC1) || (state == FIN));
    assign S5 = (state != INIT);

    always @(posedge clk, posedge reset) begin
        if (reset) next_state = PRE1;
        else begin
            case (state)
            PRE1:begin
                if(start) next_state =  PRE2;
                else next_state = PRE1;
            end 
            PRE2:begin
                if(start) next_state = PRE2;
                else next_state = INIT;
            end
            INIT: next_state = CALC1;
            CALC1: begin
                if (is_R4_greater_than_eight) next_state = FIN;
                else next_state = CALC2;
            end
            CALC2: next_state = CALC1;
            FIN : next_state = PRE1;
            default: next_state = PRE1;
        endcase
        end
    end
    always @(posedge clk) begin
        state <= next_state;
    end
endmodule
