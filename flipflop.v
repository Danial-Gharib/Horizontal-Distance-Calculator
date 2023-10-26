module flipflop (
    input wire set,
    input wire clear,
    input wire clk,
    output wire Q
);
    reg tmp;
    always @(posedge clk) begin
        if (set) tmp <= 1'b1;
        else if (clear) tmp <= 1'b0;
        else tmp <= tmp;
    end
    assign Q = tmp;
endmodule
