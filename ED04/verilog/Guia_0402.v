/*
870863_Gabriel_Matos_Nogueira
Guia_0402.v
*/

// a) x' . (x + y')'
module letra_a(input x, y, output f);
    assign f = ~x & ~y;
endmodule

// b) (x + y) + (x' . y)
module letra_b(input x, y, output f);
    assign f = x | y;
endmodule

// c) (x' . y)' . (x + y)
module letra_c(input x, y, output f);
    assign f = x;
endmodule

// d) (x . y')' + (x + y)'
module letra_d(input x, y, output f);
    assign f = ~x | ~y;
endmodule

// e) (y' + x') . (y + x)'
module letra_e(input x, y, output f);
    assign f = ~x & ~y;
endmodule