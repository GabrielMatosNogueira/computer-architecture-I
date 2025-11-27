// Guia_1101.v
`include "mealy_1101.v"
`include "moore_1101.v"

module Guia_1101;

    reg clk, reset, x;
    wire m1, m2;

    mealy_1101 mealy1 (m1, x, clk, reset);
    moore_1101 moore1 (m2, x, clk, reset);

    initial begin
        $display("Time | X | Mealy | Moore");

        clk = 1'b0;
        reset = 1'b0;
        x = 1'b0;

        #10 reset = 1'b1;

        // Sequência correta 1 1 0 1
        #10 x = 1'b1;
        #10 x = 1'b1;
        #10 x = 1'b0;
        #10 x = 1'b1;

        // Bits extras
        #10 x = 1'b1;
        #10 x = 1'b0;
        #10 x = 1'b1;

        #20 $finish;
    end

    always #5 clk = ~clk;

    always @(posedge clk) begin
        $display("%4d   %b     %b      %b", $time, x, m1, m2);
    end

endmodule
