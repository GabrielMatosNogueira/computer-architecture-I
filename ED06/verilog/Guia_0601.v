/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// a) f(x,y,z) = x' . z + y . z
module Guia_06_Q1a (output s, input x, y, z);
  assign s = (~x & z) | (y & z);
endmodule

// b) f(x,y,z) = x' . z' + y . z'
module Guia_06_Q1b (output s, input x, y, z);
  assign s = (~x & ~z) | (y & ~z);
endmodule

// c) f(x,y,z) = y' . z + y . z'
module Guia_06_Q1c (output s, input x, y, z);
  assign s = (~y & z) | (y & ~z);
endmodule

// d) f(x,y,z) = x'. y' . z + y . z' + x . z'
module Guia_06_Q1d (output s, input x, y, z);
  assign s = (~x & ~y & z) | (y & ~z) | (x & ~z);
endmodule

// f(x,y,z) = x' . y + y . z + x' . z'
module Guia_06_Q1e (output s, input x, y, z);
  assign s = (~x & y) | (y & z) | (~x & ~z);
endmodule