// Guia_0705
// Gabriel Matos Nogueira - 870863

module f7_05 (output s, input a, input b, input [1:0] sel);
wire not_a, not_b, and_ab, or_ab, nand_ab, nor_ab;

not (not_a, a);
not (not_b, b);
and (and_ab, a, b);
or (or_ab, a, b);
nand (nand_ab, a, b);
nor (nor_ab, a, b);

assign s = (sel == 2'b00) ? and_ab :
           (sel == 2'b01) ? or_ab :
           (sel == 2'b10) ? nand_ab :
           nor_ab;
endmodule

module test_f7_05;
reg x, y;
reg [1:0] sel;
wire w5;

f7_05 modulo5 (w5, x, y, sel);

initial begin
    $display("Guia_0705");
    
    $display("x  y sel  w5");
    x = 0; y = 0;
    sel = 0; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 1; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 2; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 3; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    
    x = 0; y = 1;
    sel = 0; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 1; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 2; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 3; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    
    x = 1; y = 0;
    sel = 0; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 1; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 2; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 3; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    
    x = 1; y = 1;
    sel = 0; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 1; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 2; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
    sel = 3; #1 $display("%2b %2b  %2b  %2b", x, y, sel, w5);
end
endmodule
module f7_05 (
    output s,
    input a,
    input b,
    input sel_00,
    input sel_01,
    input sel_02
);
// definir dados locais
wire not_a, not_b;
wire and_result, or_result, nand_result, nor_result;
wire xor_result, xnor_result;

// descrever por portas
not NOT1 (not_a, a);
not NOT2 (not_b, b);

// operações p1
and AND1 (and_result, a, b);
or OR1 (or_result, a, b);
nand NAND1 (nand_result, a, b);
nor NOR1 (nor_result, a, b);
xor XOR1 (xor_result, a, b);
xnor XNOR1 (xnor_result, a, b);


assign s = ( ~sel_02 & ~sel_01 & ~sel_00 & and_result ) |
           ( ~sel_02 & ~sel_01 &  sel_00 & or_result )  |
           ( ~sel_02 &  sel_01 & ~sel_00 & nand_result )|
           ( ~sel_02 &  sel_01 &  sel_00 & nor_result ) |
           (  sel_02 & ~sel_01 & ~sel_00 & xor_result ) |
           (  sel_02 & ~sel_01 &  sel_00 & xnor_result );

endmodule // f7_05

module test_f7_05;
// ------------------------- definir dados
reg x, y, sel_00, sel_01, sel_02;
wire w5;

f7_05 modulo5 (w5, x, y, sel_00, sel_01, sel_02);

// ------------------------- parte principal
initial begin : main
    $display("Guia_0705");
    
    $display(" x  y s2 s1 s0  w5  Operation");
    
    x = 1'b0; y = 1'b1;
    sel_02 = 1'b0; sel_01 = 1'b0; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  AND", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  OR", x, y, sel_02, sel_01, sel_00, w5);
    sel_01 = 1'b1; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  NAND", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  NOR", x, y, sel_02, sel_01, sel_00, w5);
    sel_02 = 1'b1; sel_01 = 1'b0; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  XOR", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  XNOR", x, y, sel_02, sel_01, sel_00, w5);
    
    x = 1'b1; y = 1'b1;
    sel_02 = 1'b0; sel_01 = 1'b0; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  AND", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  OR", x, y, sel_02, sel_01, sel_00, w5);
    sel_01 = 1'b1; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  NAND", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  NOR", x, y, sel_02, sel_01, sel_00, w5);
    sel_02 = 1'b1; sel_01 = 1'b0; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  XOR", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  XNOR", x, y, sel_02, sel_01, sel_00, w5);
    
    x = 1'b1; y = 1'b0;
    sel_02 = 1'b0; sel_01 = 1'b0; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  AND", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  OR", x, y, sel_02, sel_01, sel_00, w5);
    sel_01 = 1'b1; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  NAND", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  NOR", x, y, sel_02, sel_01, sel_00, w5);
    sel_02 = 1'b1; sel_01 = 1'b0; sel_00 = 1'b0;
    #1 $display("%2b %2b %2b %2b %2b  %2b  XOR", x, y, sel_02, sel_01, sel_00, w5);
    sel_00 = 1'b1;
    #1 $display("%2b %2b %2b %2b %2b  %2b  XNOR", x, y, sel_02, sel_01, sel_00, w5);
end

endmodule // test_f7_05