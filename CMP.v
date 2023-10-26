module CMP (
    input wire [15:0] a,
    output wire g,
    output wire e,
    output wire l
);
   assign g = (a > 16'd8);
   assign e = (a == 16'd8);
   assign l = (a < 16'd8); 
endmodule
