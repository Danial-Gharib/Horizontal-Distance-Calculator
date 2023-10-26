module ROM (
    input wire [3:0]address,
    output wire [15:0] data_out
);
    reg [15:0]tmp;
    
    always @(*) begin
        case (address)
            0 : tmp <= -16'd1024;
            1 : tmp <= -16'd170;
            2 : tmp <= -16'd68;
            3 : tmp <= -16'd36;
            4 : tmp <= -16'd23;
            5 : tmp <= -16'd16;
            6 : tmp <= -16'd11;
            7 : tmp <= 16'b0;
            8 : tmp <= 16'b0;
            9 : tmp <= 16'b0;
            10 : tmp <= 16'b0;
            11 : tmp <= 16'b0;
            12 : tmp <= 16'b0;
            13 : tmp <= 16'b0;
            14 : tmp <= 16'b0;
            15 : tmp <= 16'b0;
            default: tmp <= 0;
        endcase
    end
    assign data_out = tmp;
endmodule
