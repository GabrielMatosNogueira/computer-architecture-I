/*
870863_Gabriel_Matos_Nogueira
Guia_0404.v
*/

module Guia_0404;

// a) F(X, Y, Z) = π M (1, 3, 5, 7)
module letra_a (
    input wire X, Y, Z,
    output wire F
);
    assign F = (X | Y | Z) & (X | ~Y | Z) & (~X | Y | Z) & (~X | ~Y | Z);
endmodule

// b) F(X, Y, Z) = π M (0, 2, 4, 6)
module letra_b (
    input wire X, Y, Z,
    output wire F
);
    assign F = (X | Y | ~Z) & (X | ~Y | ~Z) & (~X | Y | ~Z) & (~X | ~Y | ~Z);
endmodule

// c) F(X, Y, W, Z) = π M (0, 1, 2, 3, 6, 7, 11, 13)
module letra_c (
    input wire X, Y, W, Z,
    output wire F
);
    assign F = (X | Y | W | ~Z) &
               (X | Y | ~W | ~Z) &
               (X | ~Y | W | ~Z) &
               (X | ~Y | ~W | ~Z) &
               (~X | Y | W | ~Z) &
               (~X | Y | ~W | ~Z) &
               (~X | ~Y | W | ~Z) &
               (~X | ~Y | ~W | ~Z);
endmodule

// d) F(X, Y, W, Z) = π M (1, 2, 4, 6, 8, 10, 14)
module letra_d (
    input wire X, Y, W, Z,
    output wire F
);
    assign F = (X | Y | ~W | Z) &
               (X | ~Y | W | Z) &
               (X | ~Y | ~W | Z) &
               (~X | Y | W | Z) &
               (~X | Y | ~W | Z) &
               (~X | ~Y | W | Z) &
               (~X | ~Y | ~W | Z);
endmodule

// e) F(X, Y, W, Z) = π M (0, 1, 2, 3, 5, 11, 15)
module letra_e (
    input wire X, Y, W, Z,
    output wire F
);
    assign F = (X | Y | W | ~Z) &
               (X | Y | ~W | ~Z) &
               (X | ~Y | W | ~Z) &
               (X | ~Y | ~W | ~Z) &
               (~X | Y | ~W | ~Z) &
               (~X | ~Y | W | ~Z) &
               (~X | ~Y | ~W | ~Z);
endmodule

endmodule