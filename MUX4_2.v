module MUX4_2 (
    input wire s1,
    input wire s0,
    input wire [15:0] d3,
    input wire [15:0] d2,
    input wire [15:0] d1,
    input wire [15:0] d0,
    output wire [15:0] data_out
);
    reg [15:0]tmp;
    always @(*) begin
        if (s1 == 1'b1)begin
            if (s0 == 1'b1) tmp <= d3;
            else tmp <= d2;
        end
        else begin
            if (s0 == 1'b1) tmp <= d1;
            else tmp <= d0;
        end
    end


    assign data_out = tmp;
endmodule
