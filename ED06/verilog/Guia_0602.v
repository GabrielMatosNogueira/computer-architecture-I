/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// a) f(x,y,z) = x + z' . y + z'
module Guia_06_Q2a (output s, input x, y, z);
  assign s = (x | ~z) & (y | ~z);
endmodule

// b) f(x,y,z) = x + z . y' + z
module Guia_06_Q2b (output s, input x, y, z);
  assign s = (x | z) & (~y | z);
endmodule

// c) f(x,y,z) = y + z' . y' + Z
module Guia_06_Q2c (output s, input x, y, z);
  assign s = (y | ~z) & (~y | z);
endmodule

// d) f(x,y,z) = x + z . x' + z'
module Guia_06_Q2d (output s, input x, y, z);
  assign s = (x | y) & (x | ~z) & (~y | ~z);
endmodule

// e) f(x,y,z) = x + z . x' + z'
module Guia_06_Q2e (output s, input x, y, z);
  assign s = (x | z) & (~x | ~z);
endmodule