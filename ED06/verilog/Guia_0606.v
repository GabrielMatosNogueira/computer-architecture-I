/*
870863_Gabriel_Matos_Nogueira
Guia_06.v
*/

// s(x,y,w,z) = x . z . y + w . y' + w'
module Guia_06_Q6 (output s, input x, y, w, z);
  assign s = x & z & (y | w) & (~y | ~w);
endmodule