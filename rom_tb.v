module rom_tb();
    reg [3:0]address;
    wire [15:0]data_out;

    ROM rom_test(.address(address), .data_out(data_out));
    initial begin
        address = 4'd0;
        #10;
        address = 4'd2;
        #10;
        address = 4'd5;
        #10;
        address = 4'd7;
        #10;
        address = 4'd1;
        #10;
    end
endmodule
