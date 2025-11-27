// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock(output reg clk);

    initial begin
        clk = 1'b0;
    end

    always begin    
        // 12 -> 3
        #3 clk = ~clk;
        // Para a frquencia ser maior em 4 vezes, basta dividir o tempo por 4
        // porquê o período é o inverso da frequência (f = 1/T)
    end
endmodule // clock

module Guia_0900;
    wire clk;
    clock CLK1(clk);

    initial begin
        $dumpfile("Guia_0903.vcd");
        $dumpvars;
        #120 $finish;
    end
endmodule // Guia_0900