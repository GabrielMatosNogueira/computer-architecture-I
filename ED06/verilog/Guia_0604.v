/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// a) f(x,y,w,z) = y' + w' . x' + w + z
module Guia_06_Q4a (output s, input x, y, w, z);
  assign s = (~y | ~w) & (~x | w | z);
endmodule

// b) f(x,y,w,z) = x' + w' . y' + w . x + y' + z'
module Guia_06_Q4b (output s, input x, y, w, z);
  assign s = (~x | ~w) & (~y | w) & (x | ~y | ~z);
endmodule

// c) f(x,y,w,z) = x + y'+ w . x' + y + w' . x' + y + z' . y' + w' + z'
module Guia_06_Q4c (output s, input x, y, w, z);
  assign s = (x | ~y | w) & (~x | y | ~w) & (~x | y | ~z) & (~y | ~w | ~z);
endmodule

// d) f(x,y,w,z) = w' + z' . x + y + w . x' + y' + z
module Guia_06_Q4d (output s, input x, y, w, z);
  assign s = (~w | ~z) & (x | y | w) & (~x | ~y | z);
endmodule

// e) f(x,y,w,z) = x' + w . y' + z . w' + z'
module Guia_06_Q4e (output s, input x, y, w, z);
  assign s = (~x | w) & (~y | z) & (~w | ~z);
endmodule