// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock(output clk);
    reg clk_reg;
    assign clk = clk_reg;

    initial begin
        clk_reg = 1'b0;
    end

    always begin    
        // 12 -> 6
        #6 clk_reg = ~clk_reg;
        // Dobro da frequencia significa diminuir o tempo pela metade
        // F = 1/T -> 2F = 1/(T/2) -> T/2

    end
endmodule // clock

module Guia_0900;
    wire clk;
    clock CLK1(clk);

    initial begin
        $dumpfile("Guia_0904.vcd");
        $dumpvars;
        #120 $finish;
    end
endmodule // Guia_0900