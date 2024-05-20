module fuladder( input a,b,c,
                 output sum,carry);

                 assign sum = a ^ b ^ c;
                 assign carry = (a & b) | (b & c) | (a & c);
endmodule

module tb_fuladder (
    output reg a, b, c,
    input wire sum, carry
);
 fuladder uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );

initial begin
        $monitor($time, " a=%b b=%b c=%b sum=%b carry=%b", a, b, c, sum, carry);  //format specifiers

        // Apply test vectors with correct delays
        a = 1'b0; b = 1'b0;  c = 1'b0; #5;
        a = 1'b0; b = 1'b0;  c = 1'b1; #5;
        a = 1'b0; b = 1'b1;  c = 1'b0; #5;
        a = 1'b0; b = 1'b1;  c = 1'b1; #5;
        a = 1'b1; b = 1'b0;  c = 1'b0; #5;
        a = 1'b1; b = 1'b0;  c = 1'b1; #5;
        a = 1'b1; b = 1'b1;  c = 1'b0; #5;
        a = 1'b1; b = 1'b1;  c = 1'b1; #5;

        $finish;  // Terminate the simulation
    end
endmodule
module wb;
    tb_fuladder tb();  // Instantiate the testbench
endmodule



