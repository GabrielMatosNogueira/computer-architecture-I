/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// a) f(x,y,w,z) = x' . w' . z + y . w' . z + x' . y' . w. z' + x . y' . w' . z' + x . y . w . z'
module Guia_06_Q3a (output s, input x, y, w, z);
  assign s = (~x & ~w & z) | (y & ~w & z) | (~x & ~y & w & ~z) | (x & ~y & ~w & ~z) | (x & y & w & ~z);
endmodule

// b) f(x,y,w,z) = y' . w' + x' . y'. z + x . y . w
module Guia_06_Q3b (output s, input x, y, w, z);
  assign s = (~y & ~w) | (~x & ~y & z) | (x & y & w);
endmodule

// c) f(x,y,w,z) = x' . y' . w' + y' . w . z' + y . w . z + x . y . w + x . z . w
module Guia_06_Q3c (output s, input x, y, w, z);
  assign s = (~x & ~y & ~w) | (~y & w & ~z) | (y & w & z) | (x & y & w) | (x & z & w);
endmodule

// d) f(x,y,w,z) = w . z' + y . w' . z' + x' . y . w'
module Guia_06_Q3d (output s, input x, y, w, z);
  assign s = (w & ~z) | (y & ~w & ~z) | (~x & y & ~w);
endmodule

// e) f(x,y,w,z) = w' . z + y' . w . z + x' . w . z + x' . y' . w'
module Guia_06_Q3e (output s, input x, y, w, z);
  assign s = (~w & z) | (~y & w & z) | (~x & w & z) | (~x & ~y & ~w);
endmodule