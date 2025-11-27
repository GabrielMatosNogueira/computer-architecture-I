/*
 * Guia_0401.v
 * Implementação das expressões lógicas do exercício 01 (a-e)
 * Entradas: x, y, z
 * Saídas: s_a, s_b, s_c, s_d, s_e
 */

module Guia_0401 
(
  input  wire x,
  input  wire y,
  input  wire z,
  output wire s_a,
  output wire s_b,
  output wire s_c,
  output wire s_d,
  output wire s_e
);

// a) s_a = x & ~(~y | z)
assign s_a = x & ~(~y | z);

// b) s_b = ~(x | ~y) & ~z
assign s_b = ~(x | ~y) & ~z;

// c) s_c = ~(~x & y) & z
assign s_c = ~(~x & y) & z;

// d) s_d = ~(~x & ~y) & ~z
assign s_d = ~(~x & ~y) & ~z;

// e) s_e = (~x | y) & ~(~y | ~z)
assign s_e = (~x | y) & ~(~y | ~z);

endmodule