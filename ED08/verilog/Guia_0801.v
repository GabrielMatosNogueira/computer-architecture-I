// -------------------------
// Guia_0800
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
// descrever por portas
assign s0 = a ^ b;
assign s1 = a & b;
endmodule // halfAdder

// -------------------------
// full adder
// -------------------------
module fullAdder (
    output s1,    // carry out
    output s0,    // sum
    input a,
    input b,
    input carryIn
);
// descrever por portas e/ou modulos

assign s0 = a ^ b ^ carryIn;
assign s1 = (a & b) | (a & carryIn) | (b & carryIn);

endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] carry; // “vai-um”
wire [4:0] soma;

// halfAdder HA0 ( carry[0], soma[0], x[0], y[0] );
fullAdder FA0 ( carry[0], soma[0], x[0], y[0], 1'b0 );

initial begin
    $display("Guia_0801 - Gabriel Matos Nogueira - 870863");
    $display("Test ALU’s full adder");
    // projetar testes do somador completo
    x = 4'b0000; y = 4'b0000;
    #1 $display("x = %b, y = %b, soma[0] = %b, carry[0] = %b", x[0], y[0], soma[0], carry[0]);
    x = 4'b0001; y = 4'b0001;
    #1 $display("x = %b, y = %b, soma[0] = %b, carry[0] = %b", x[0], y[0], soma[0], carry[0]);
    x = 4'b0010; y = 4'b0001;
    #1 $display("x = %b, y = %b, soma[0] = %b, carry[0] = %b", x[0], y[0], soma[0], carry[0]);
    x = 4'b1111; y = 4'b0001;
    #1 $display("x = %b, y = %b, soma[0] = %b, carry[0] = %b", x[0], y[0], soma[0], carry[0]);
    x = 4'b1010; y = 4'b0101;
    #1 $display("x = %b, y = %b, soma[0] = %b, carry[0] = %b", x[0], y[0], soma[0], carry[0]);
end
endmodule // test_fullAdder
