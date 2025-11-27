// Guia_0701
// Gabriel Matos Nogueira - 870863

module f7_01 (output s, input a, input b, input sel);
wire not_sel, and1, and2;

not (not_sel, sel);
and (and1, a, not_sel);
and (and2, b, sel);
or (s, and1, and2);
endmodule

module mux (output s, input a, input b, input select);
wire not_select, sa, sb;

not (not_select, select);
and (sa, a, not_select);
and (sb, b, select);
or (s, sa, sb);
endmodule

module test_f7_01;
reg x, y, sel;
wire w1, z;

f7_01 modulo1 (w1, x, y, sel);
mux MUX1 (z, x, y, sel);

initial begin
    $display("Guia_0701");
    
    $display("x  y sel  w1  z");
    x = 0; y = 0; sel = 0;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    
    x = 0; y = 1; sel = 0;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    
    x = 1; y = 0; sel = 0;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    
    x = 1; y = 1; sel = 0;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
    sel = 1;
    #1 $display("%2b %2b  %2b  %2b  %2b", x, y, sel, w1, z);
end
endmodule