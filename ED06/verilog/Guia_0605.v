/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// f(x,y,w,z) = x' + w . y' + z . w' + z'
module Guia_06_Q5 (output s, input x, y, w, z);
  assign s = (~x) | (w & ~y) | (z & ~w) | (~z);
endmodule