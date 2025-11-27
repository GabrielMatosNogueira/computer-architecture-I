// -------------------------
// Guia_0806 - UNIDADE ARITMÉTICA 6 BITS
// Nome: Gabriel Matos Nogueira
// Matricula: 870863
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
    xor XOR1 ( s0, a, b );
    and AND1 ( s1, a, b );
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
    halfAdder HA2 (carryOut, sum, s2, carryIn);
    or OR1 (carryOut, s1, carryOut);
endmodule

// -------------------------
// Unidade Aritmética 6 bits (sem generate)
// -------------------------
module arithUnit6 (
    output [5:0] result,
    output eq,
    output neq,
    input [5:0] x,
    input [5:0] y,
    input carryIn,   // 0: soma, 1: subtração
    input sel        // 0: resultado aritmético, 1: igualdade/desigualdade
);
    wire [5:0] y_mod;
    wire [5:0] sum;
    wire [6:0] carry;
    assign carry[0] = carryIn;

    // Inverte y para subtração (complemento de 1)
    xor XOR_INV0 (y_mod[0], y[0], carryIn);
    xor XOR_INV1 (y_mod[1], y[1], carryIn);
    xor XOR_INV2 (y_mod[2], y[2], carryIn);
    xor XOR_INV3 (y_mod[3], y[3], carryIn);
    xor XOR_INV4 (y_mod[4], y[4], carryIn);
    xor XOR_INV5 (y_mod[5], y[5], carryIn);

    // Somador completo de 6 bits
    fullAdder FA0 (carry[1], sum[0], x[0], y_mod[0], carry[0]);
    fullAdder FA1 (carry[2], sum[1], x[1], y_mod[1], carry[1]);
    fullAdder FA2 (carry[3], sum[2], x[2], y_mod[2], carry[2]);
    fullAdder FA3 (carry[4], sum[3], x[3], y_mod[3], carry[3]);
    fullAdder FA4 (carry[5], sum[4], x[4], y_mod[4], carry[4]);
    fullAdder FA5 (carry[6], sum[5], x[5], y_mod[5], carry[5]);

    // Igualdade e desigualdade
    wire [5:0] eq_bits;
    xnor XNOR_EQ0 (eq_bits[0], x[0], y[0]);
    xnor XNOR_EQ1 (eq_bits[1], x[1], y[1]);
    xnor XNOR_EQ2 (eq_bits[2], x[2], y[2]);
    xnor XNOR_EQ3 (eq_bits[3], x[3], y[3]);
    xnor XNOR_EQ4 (eq_bits[4], x[4], y[4]);
    xnor XNOR_EQ5 (eq_bits[5], x[5], y[5]);
    assign eq  = &eq_bits;
    assign neq = ~eq;

    // Seleção do resultado
    assign result = (sel == 1'b0) ? sum : {5'b0, eq}; // Se sel=1, mostra igualdade no bit 0

endmodule

// -------------------------
// Testbench
// -------------------------
module test_arithUnit6;
    reg [5:0] x, y;
    reg carryIn, sel;
    wire [5:0] result;
    wire eq, neq;

    arithUnit6 AU (
        .result(result),
        .eq(eq),
        .neq(neq),
        .x(x),
        .y(y),
        .carryIn(carryIn),
        .sel(sel)
    );

    initial begin
        $display("Guia_0806 - Gabriel Matos Nogueira - 870863");
        $display(" x      y    carryIn sel | result  eq neq");
        x = 6'b000101; y = 6'b000011; carryIn = 0; sel = 0; #1;
        $display("%b %b   %b      %b   | %b     %b   %b", x, y, carryIn, sel, result, eq, neq);
        x = 6'b000101; y = 6'b000011; carryIn = 1; sel = 0; #1;
        $display("%b %b   %b      %b   | %b     %b   %b", x, y, carryIn, sel, result, eq, neq);
        x = 6'b111111; y = 6'b111111; carryIn = 0; sel = 1; #1;
        $display("%b %b   %b      %b   | %b     %b   %b", x, y, carryIn, sel, result, eq, neq);
        x = 6'b101010; y = 6'b010101; carryIn = 0; sel = 1; #1;
        $display("%b %b   %b      %b   | %b     %b   %b", x, y, carryIn, sel, result, eq, neq);
    end
endmodule
