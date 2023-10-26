module adder_tb();
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum;
    adder add (.a(a), .b(b), .sum(sum));
    initial begin
        #10;
        a = 16'b00101_10101010101;
        b = 16'b01010_01000000001;
        #10;
        a = 16'b11001_00011111111;
        b = 16'b01001_00100100000;
        #10;
        a = 16'b01011_10001000000;
        b = 16'b00100_10001111111;
        #10;
    end



endmodule
