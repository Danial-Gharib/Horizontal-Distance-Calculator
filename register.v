module register (
    input wire clk,
    input wire load,
    input wire inc,
    input wire clr,
    input wire [15:0] data_in,
    output wire [15:0] data_out
);

reg [15:0] tmp;

always @(posedge clk) begin
    if (clr) tmp <= 16'b0;
    else if (load) tmp <= data_in;
    else if (inc) tmp <= tmp + 1;
    else tmp <= tmp;
end

assign data_out = tmp;
endmodule
