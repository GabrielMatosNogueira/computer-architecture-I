// -------------------------
// Guia_0805
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
assign s0 = a ^ b ^ carryIn;
assign s1 = (a & b) | (a & carryIn) | (b & carryIn);
endmodule // fullAdder

// -------------------------
// Complemento 1 5 bits
// -------------------------
module complemento1 (
    output [4:0] s,
    input  [4:0] a
);
assign s = ~a;
endmodule

// -------------------------
// Complemento 2 5 bits
// -------------------------
module complemento2 (
    output [4:0] s,
    input  [4:0] a
);
wire [4:0] comp1;
wire [4:0] carry;

complemento1 C1 (comp1, a);

fullAdder FA0 (carry[0], s[0], comp1[0], 1'b0, 1'b1);
fullAdder FA1 (carry[1], s[1], comp1[1], 1'b0, carry[0]);
fullAdder FA2 (carry[2], s[2], comp1[2], 1'b0, carry[1]);
fullAdder FA3 (carry[3], s[3], comp1[3], 1'b0, carry[2]);
fullAdder FA4 (carry[4], s[4], comp1[4], 1'b0, carry[3]);

endmodule

// -------------------------
// Test
// -------------------------
module test_complemento2;
reg  [4:0] x;
wire [4:0] s;

complemento2 C2 (s, x);

initial begin
    $display("Guia_0805 - Gabriel Matos Nogueira - 870863");
    x = 5'b00000; #1 $display("x = %b, comp2 = %b", x, s);
    x = 5'b00001; #1 $display("x = %b, comp2 = %b", x, s);
    x = 5'b00010; #1 $display("x = %b, comp2 = %b", x, s);
    x = 5'b00101; #1 $display("x = %b, comp2 = %b", x, s);
    x = 5'b01111; #1 $display("x = %b, comp2 = %b", x, s);
    x = 5'b10000; #1 $display("x = %b, comp2 = %b", x, s);
    x = 5'b11111; #1 $display("x = %b, comp2 = %b", x, s);
end
endmodule
