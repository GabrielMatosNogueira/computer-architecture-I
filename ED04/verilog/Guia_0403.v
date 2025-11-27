/*
870863_Gabriel_Matos_Nogueira
Guia_0403.v
*/

module Guia_0403;

// a) f(x, y, z) = ∑m(1, 2, 5, 6)
function automatic logic f_a(input logic x, y, z);
    f_a = (~x & ~y &  z) | (~x &  y & ~z) | ( x & ~y &  z) | ( x &  y & ~z);
endfunction

// b) f(x, y, z) = ∑m(1, 3, 5, 7)
function automatic logic f_b(input logic x, y, z);
    f_b = (~x & ~y &  z) | (~x &  y &  z) | ( x & ~y &  z) | ( x &  y &  z);
endfunction

// c) f(x, y, w, z) = ∑m(1, 2, 5, 6, 7, 13, 15)
function automatic logic f_c(input logic x, y, w, z);
    f_c = (~x & ~y & ~w &  z) | 
          (~x & ~y &  w & ~z) |
          (~x &  y & ~w &  z) |
          (~x &  y &  w & ~z) |
          (~x &  y &  w &  z) |
          ( x &  y & ~w &  z) |
          ( x &  y &  w &  z);
endfunction

// d) f(x, y, w, z) = ∑m(0, 2, 6, 8, 10, 12, 14)
function automatic logic f_d(input logic x, y, w, z);
    f_d = (~x & ~y & ~w & ~z) |
          (~x & ~y &  w & ~z) |
          (~x &  y &  w & ~z) |
          ( x & ~y & ~w & ~z) |
          ( x & ~y &  w & ~z) |
          ( x &  y & ~w & ~z) |
          ( x &  y &  w & ~z);
endfunction

// e) f(x, y, w, z) = ∑m(0, 1, 6, 9, 13)
function automatic logic f_e(input logic x, y, w, z);
    f_e = (~x & ~y & ~w & ~z) |
          (~x & ~y & ~w &  z) |
          (~x &  y &  w & ~z) |
          ( x & ~y & ~w &  z) |
          ( x &  y &  w & ~z);
endfunction

endmodule