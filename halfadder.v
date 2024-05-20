module halfadder (input x,y,
                  output s,c);

        assign s = x ^ y;
        assign c = x & y;
endmodule

module tb_halfadder(
    output reg x, y,     // Inputs to the half adder
    input s, c);    // Outputs from the half adder

    // Instantiate the halfadder
    halfadder uut (
        .x(x),
        .y(y),
        .s(s),
        .c(c)
    );

    initial begin
        $monitor($time, " x=%b y=%b s=%b c=%b", x, y, s, c);  //format specifiers

        // Apply test vectors with correct delays
        x = 1'b0; y = 1'b0; #5;
        x = 1'b1; y = 1'b0; #5;
        x = 1'b0; y = 1'b1; #5;
        x = 1'b1; y = 1'b1; #5;

        $finish;  // Terminate the simulation
    end
endmodule
module wb;
    tb_halfadder tb();  // Instantiate the testbench
endmodule





