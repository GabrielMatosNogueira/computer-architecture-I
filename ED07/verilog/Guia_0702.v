// Guia_0702
// Gabriel Matos Nogueira - 870863

module f7_02 (output s, input a, input b, input sel);
wire not_sel, or1, nor1, and1, and2;

not (not_sel, sel);
or (or1, a, b);
nor (nor1, a, b);
and (and1, or1, not_sel);
and (and2, nor1, sel);
or (s, and1, and2);
endmodule

module test_f7_02;
reg x, y, sel;
wire w2;

f7_02 modulo2 (w2, x, y, sel);

initial begin
    $display("Guia_0702");
    
    $display("x  y sel  w2");
    x = 0; y = 0; sel = 0;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    
    x = 0; y = 1; sel = 0;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    
    x = 1; y = 0; sel = 0;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    
    x = 1; y = 1; sel = 0;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b", x, y, sel, w2);
end
endmodule