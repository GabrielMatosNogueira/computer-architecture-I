// -------------------------
// Guia_0803
// Nome: Gabriel Matos Nogueira
// Matricula: 870863
// -------------------------
// -------------------------
// Unidade Lógica (6 bits indice 0)
// -------------------------
module equality6 (
    output igual,
    input [5:0] a,
    input [5:0] b
);
    wire [5:0] xnor_out;

    // Comparação bit a bit usando XNOR
    xnor XNOR0 (xnor_out[0], a[0], b[0]);
    xnor XNOR1 (xnor_out[1], a[1], b[1]);
    xnor XNOR2 (xnor_out[2], a[2], b[2]);
    xnor XNOR3 (xnor_out[3], a[3], b[3]);
    xnor XNOR4 (xnor_out[4], a[4], b[4]);
    xnor XNOR5 (xnor_out[5], a[5], b[5]);

    // Todos os bits devem ser iguais (todas as saídas XNOR = 1)
    and AND1 (igual, xnor_out[0], xnor_out[1], xnor_out[2], xnor_out[3], xnor_out[4], xnor_out[5]);
endmodule // equality6

// -------------------------
// Teste da Unidade Lógica
// -------------------------
module test_equality6;
    reg [5:0] x;
    reg [5:0] y;
    wire igual;

    equality6 EQ1 (igual, x, y);

    initial begin
        $display("Guia_0803 - Gabriel Matos Nogueira - 870863");
        $display("Testador do comparador de igualdade 6 bits");
        $display(" x      y      igual");
        x = 6'b000000; y = 6'b000000; #1 $display("%b %b %b", x, y, igual);
        x = 6'b000000; y = 6'b000001; #1 $display("%b %b %b", x, y, igual);
        x = 6'b111111; y = 6'b111111; #1 $display("%b %b %b", x, y, igual);
        x = 6'b101010; y = 6'b101010; #1 $display("%b %b %b", x, y, igual);
        x = 6'b101010; y = 6'b010101; #1 $display("%b %b %b", x, y, igual);
        x = 6'b100100; y = 6'b100100; #1 $display("%b %b %b", x, y, igual);
        x = 6'b111000; y = 6'b111001; #1 $display("%b %b %b", x, y, igual);
    end
endmodule // test_equality6