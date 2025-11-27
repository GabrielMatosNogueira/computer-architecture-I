// Guia_1102_tb.v
`timescale 1ns/1ps
module tb;
    reg clk;
    reg reset;
    reg x;
    wire y;

    // instância do DUT
    Guia_1102 uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    initial begin
        $display("time\tclk reset x y");
        $monitor("%0t\t%b   %b     %b %b", $time, clk, reset, x, y);
    end

    // clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // período 10
    end

    // estímulos
    initial begin
        // reset inicial
        reset = 1;
        x = 0;
        #12;
        reset = 0;
        #8;

        // sequência para testar detecção 0101 (sem interseção)
        x = 0; #10; // ciclo 1
        x = 1; #10; // ciclo 2
        x = 0; #10; // ciclo 3
        x = 1; #10; // ciclo 4 -> saída Mealy deve disparar aqui

        // mais casos
        x = 0; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;

        #20;
        $finish;
    end
endmodule
