// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock ( output clk );
    reg clk;
    initial begin
        clk = 1'b0;
    end
    always begin
        #12 clk = ~clk;
    end
endmodule // clock

module pulse ( output reg p, input clk );
    always @(negedge clk) begin
        p = 1'b1;
        #3 p = 1'b0;
    end
endmodule // pulse

module Guia_0906;
    wire clk;
    wire pulse_out;

    clock CLK1 ( clk );
    pulse PULSE1 ( pulse_out, clk );

    initial begin
        $dumpfile ( "Guia_0906.vcd" );
        $dumpvars;
        #120 $finish;
    end
endmodule // Guia_0906