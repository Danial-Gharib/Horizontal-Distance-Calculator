module MUX2_1 (
    input wire s,
    input wire [15:0]d0,
    input wire [15:0]d1,
    output wire [15:0]data_out
);
    assign data_out = s ? d1 : d0;
endmodule
