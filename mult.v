module mult (
    input [15:0] a,
    input [15:0] b,
    output wire[15:0] product
);
    reg [31:0] tmp;
    reg sign;
    reg [15:0]a_norm;
    reg [15:0]b_norm;
    always @(*) begin
        sign = a[15] ^ b[15];
        a_norm = a;
        b_norm = b;
        if(a[15]) 
            a_norm = -a;
        if(b[15]) 
            b_norm = -b;
        tmp = a_norm * b_norm;
        if(sign) 
            tmp = -tmp;
    end
    assign product = tmp[26:11];
endmodule
