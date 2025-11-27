// Guia_0704
// Gabriel Matos Nogueira - 870863

module f7_04 (output s, input a, input b, input c, input d);
wire and1, or1, nor1, and2;

and (and1, a, b);
or (or1, c, d);
nor (nor1, c, d);
and (and2, and1, nor1);
or (s, and2, or1);
endmodule

module test_f7_04;
reg a, b, c, d;
wire w4;

f7_04 modulo4 (w4, a, b, c, d);

initial begin
    $display("Guia_0704");
    
    $display("a  b  c  d | w4");
    a = 0; b = 0; c = 0; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 0; c = 0; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 0; c = 1; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 0; c = 1; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 1; c = 0; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 1; c = 0; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 1; c = 1; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 0; b = 1; c = 1; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 0; c = 0; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 0; c = 0; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 0; c = 1; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 0; c = 1; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 1; c = 0; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 1; c = 0; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 1; c = 1; d = 0;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
    
    a = 1; b = 1; c = 1; d = 1;
    #1 $display("%2b %2b %2b %2b  %2b", a, b, c, d, w4);
end
endmodule
module f7_04 (
    output s,
    input a,
    input b,
    input sel_a,
    input sel_b
);
// definir dados locais
wire not_a, not_b, not_sel_a, not_sel_b;
wire and1, and2, and3, and4;
wire or1, or2;

// descrever por portas
not NOT1 (not_a, a);
not NOT2 (not_b, b);
not NOT3 (not_sel_a, sel_a);
not NOT4 (not_sel_b, sel_b);

and AND1 (and1, a, sel_a);
and AND2 (and2, not_a, not_sel_a);
and AND3 (and3, b, sel_b);
and AND4 (and4, not_b, not_sel_b);

or OR1 (or1, and1, and2);
or OR2 (or2, and3, and4);
or OR3 (s, or1, or2);

endmodule // f7_04

module test_f7_04;
reg x, y, sel_a, sel_b;
wire w4;

f7_04 modulo4 (w4, x, y, sel_a, sel_b);


initial begin : main
    $display("Guia_0704");
    
    $display(" x  y sa sb  w4");
    
    x = 1'b0; y = 1'b0; sel_a = 1'b0; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_a = 1'b1; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    
    x = 1'b0; y = 1'b1; sel_a = 1'b0; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_a = 1'b1; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    
    x = 1'b1; y = 1'b0; sel_a = 1'b0; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_a = 1'b1; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    
    x = 1'b1; y = 1'b1; sel_a = 1'b0; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_a = 1'b1; sel_b = 1'b0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
    sel_b = 1'b1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_a, sel_b, w4);
end

endmodule // test_f7_04