module main_tb();


// we are testing regular angles including : 0, pi/6, pi/4, pi/3, pi/2, 2pi/3, 5pi/6 and pi 
// the expected result is commented below each testcase !

reg clk, start, reset;
reg [15:0] v, x;
wire done;
wire [15:0] res;
reg [15:0] expected;
wire [15:0] err;
assign err = (expected - res);
main MAIN(.clk(clk), .reset(reset), .start(start), .v(v), .x(x), .final_result(res), .done(done));
initial begin
    clk = 0;
    start = 0;
    reset = 1;
    v = 16'b0101000000000000;     // v = 10;
    x = 16'b0000000000000000;       // x = 0;
    //// expected : 10 decimal
    expected = 16'b0101000000000000;
    #20;
    start = 1;
    reset = 0;
    #10;
    start = 0;
    #500;
    $display("x = 0 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 1 ended------------------------------");
    #20;
    reset = 1;
    /////////////////////////////////////////////////////////////
    #20;
    reset = 0;
    start = 1;
    x = 16'b0000010000110000; // x is pi / 6
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  8.660254038 decimal
    expected = 16'b0100010101001000;
    #20;
    start = 0;
    #500;
    $display("x = pi/6 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 2 ended------------------------------");
    #20;
    reset = 1;
    ///////////////////////////////////////////////////////////////
     #20;
    reset = 0;
    start = 1;
    x = 16'b0000011001001000; // x is pi / 4
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  7.071067812 decimal
    expected = 16'b0011100010010001;
    #20;
    start = 0;
    #500;
    $display("x = pi/4 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 3 ended------------------------------");
    #20;
    reset = 1;
    //////////////////////////////////////////////////////////////////
     #20;
    reset = 0;
    start = 1;
    x = 16'b0000100001100000; // x is pi / 3
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  5 decimal
    expected = 16'b0010100000000000;
    #20;
    start = 0;
    #500;
    $display("x = pi/3 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 4 ended------------------------------");
    #20;
    reset = 1;
    //////////////////////////////////////////////////////////////////////////
     #20;
    reset = 0;
    start = 1;
    x = 16'b0000110010010000; // x is pi / 2
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  0 decimal
    expected = 16'b0000000000000000;
    #20;
    start = 0;
    #500;
    $display("x = pi/2 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 5 ended------------------------------");
    #20;
    reset = 1;
    /////////////////////////////////////////////////////////////////////////////////
    #20;
    reset = 0;
    start = 1;
    x = 16'b0001000011000001; // x is 2pi/3
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  -5 decimal
    expected = 16'b1101100000000000;
    #20;
    start = 0;
    #500;
    $display("x = 2pi/3 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 6 ended------------------------------");
    #20;
    reset = 1;
    ////////////////////////////////////////////////////////////////////////////////////
    #20;
    reset = 0;
    start = 1;
    x = 16'b0001001011011001; // x is 3pi/4
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  -7.071067812 decimal
    expected = -16'b0011100010010001;
    #20;
    start = 0;
    #500;
    $display("x = 3pi/4 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 7 ended------------------------------");
    #20;
    reset = 1;
    ///////////////////////////////////////////////////////////////////////////////////
    #20;
    reset = 0;
    start = 1;
    x = 16'b0001010011110001; // x is 5pi/6
    v = 16'b0101000000000000;     // v = 10;
    //// expected is :  -8.660254038 decimal
    expected = -16'b0100010101001000;
    #20;
    start = 0;
    #500;
    $display("x = 5pi/6 and v = 10");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 8 ended------------------------------");
    #20;
    reset = 1;
    //////////////////////////////////////////////////////////////////////////////////////////
    #20;
    reset = 0;
    start = 1;
    x = 16'b0001100100100001; // x is pi
    v = 16'b0001100000000000;     // v = 3;
    //// expected is :  -3 decimal
    expected = -16'b0001100000000000;
    #20;
    start = 0;
    #500;
    $display("x = pi and v = 3");
    $display("result is : %b", res);
    $display("error is : %b", err);
    $display("test 9 ended------------------------------");
    #20;
    reset = 1;
    ///////////////////////////////////////////////////////////////////////////////////////////////
    $dumpfile("MAIN_TB.vcd");
  	$dumpvars(0, main_tb);

end

always #5 clk = ~clk;

endmodule
