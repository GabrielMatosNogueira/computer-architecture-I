// -------------------------
// Guia_0806
// Nome: xxx yyy zzz
// Matricula: 999999
// -------------------------

// -------------------------
// half adder
// -------------------------
module halfAdder (
    output s1,
    output s0,
    input a,
    input b
);
    xor XOR1 (s0, a, b);
    and AND1 (s1, a, b);
endmodule

// -------------------------
// full adder
// -------------------------
module fullAdder (
    output carryOut,
    output sum,
    input a,
    input b,
    input carryIn
);
    wire s1, s2, s3;
    halfAdder HA1 (s1, s2, a, b);
    halfAdder HA2 (s3, sum, s2, carryIn);
    or OR1 (carryOut, s1, s3);
endmodule

// -------------------------
// Unidade Aritmética 6 bits
// -------------------------
module unidadeAritmetica (
    output [5:0] result,
    output igual,
    output diferente,
    input [5:0] x,
    input [5:0] y,
    input operacao,     // 0=soma, 1=subtracao
    input sel           // 0=resultado aritmetico, 1=igualdade/desigualdade
);
    wire [5:0] y_comp;      // y ou ~y
    wire [5:0] carry;
    wire [5:0] soma;
    wire carryIn;

    assign carryIn = operacao; // carryIn=0 para soma, 1 para subtração

    // Complemento de 1 condicionado
    genvar i;
    generate
        for (i=0; i<6; i=i+1) begin : comp1
            xor XOR_COMP (y_comp[i], y[i], operacao);
        end
    endgenerate

    // Somador completo de 6 bits
    fullAdder FA0 (carry[0], soma[0], x[0], y_comp[0], carryIn);
    fullAdder FA1 (carry[1], soma[1], x[1], y_comp[1], carry[0]);
    fullAdder FA2 (carry[2], soma[2], x[2], y_comp[2], carry[1]);
    fullAdder FA3 (carry[3], soma[3], x[3], y_comp[3], carry[2]);
    fullAdder FA4 (carry[4], soma[4], x[4], y_comp[4], carry[3]);
    fullAdder FA5 (carry[5], soma[5], x[5], y_comp[5], carry[4]);

    // Igualdade e desigualdade
    wire [5:0] eq_bits;
    wire all_eq;
    generate
        for (i=0; i<6; i=i+1) begin : eq_loop
            xnor XNOR_EQ (eq_bits[i], x[i], y[i]);
        end
    endgenerate
    and AND_EQ (all_eq, eq_bits[0], eq_bits[1], eq_bits[2], eq_bits[3], eq_bits[4], eq_bits[5]);
    assign igual = all_eq;
    assign diferente = ~all_eq;
    // Seleção do resultado
    assign result = (sel == 1'b0) ? soma : {5'b0, igual};

endmodule

// -------------------------
// Unidade Aritmetica
// -------------------------
module test_unidadeAritmetica;
    reg [5:0] x, y;
    reg operacao, sel;
    wire [5:0] result;
    wire igual, diferente;

    unidadeAritmetica AU (result, igual, diferente, x, y, operacao, sel);

    initial begin
        $display("Guia_0806 - Gabriel Matos Nogueira - 870863");
        $display(" x      y    op sel | result igual diferente");
        x = 6'b000101; y = 6'b000011; operacao = 0; sel = 0; #1;
        $display("%b %b %b   %b   | %b     %b     %b", x, y, operacao, sel, result, igual, diferente);
        x = 6'b000101; y = 6'b000011; operacao = 1; sel = 0; #1;
        $display("%b %b %b   %b   | %b     %b     %b", x, y, operacao, sel, result, igual, diferente);
        x = 6'b000101; y = 6'b000101; operacao = 0; sel = 1; #1;
        $display("%b %b %b   %b   | %b     %b     %b", x, y, operacao, sel, result, igual, diferente);
        x = 6'b111111; y = 6'b000000; operacao = 1; sel = 1; #1;
        $display("%b %b %b   %b   | %b     %b     %b", x, y, operacao, sel, result, igual, diferente);
    end
endmodule