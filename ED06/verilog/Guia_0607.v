/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// simplificado: s(x,y,z) = x'.z + x.z' + x.y
module Guia_06_Q7 (output s, input x, y, z);
  assign s = (~x & z) | (x & ~z) | (x & y);
endmodule