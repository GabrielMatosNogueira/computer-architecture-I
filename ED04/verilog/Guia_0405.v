/*
870863_Gabriel_Matos_Nogueira
Guia_0405.v
*/

module letra_a(input x, y, output sop, pos);
    // SoP: x & ~y
    assign sop = x & ~y;
    // PoS: (x' + y') . (x' + y) . (x + y)
    assign pos = (~x | ~y) & (~x | y) & (x | y);
endmodule

module letra_b(input x, y, output sop, pos);
    // SoP: x' y + x y
    assign sop = (~x & y) | (x & y);
    // PoS: (x' + y') . (x + y')
    assign pos = (~x | ~y) & (x | ~y);
endmodule

module letra_c(input x, y, z, output sop, pos);
    // SoP: x'y'z' + x'y'z + x'yz + xy'z' + xyz' + xyz
    assign sop = (~x & ~y & ~z) | (~x & ~y & z) | (~x & y & z) |
                 (x & ~y & ~z) | (x & y & ~z) | (x & y & z);
    // PoS: (x' + y' + z) . (x + y + z')
    assign pos = (~x | ~y | z) & (x | y | ~z);
endmodule

module letra_d(input x, y, z, output sop, pos);
    // SoP: x'y'z' + x'yz' + xy'z' + xy'z + xyz'
    assign sop = (~x & ~y & ~z) | (~x & y & ~z) | (x & ~y & ~z) |
                 (x & ~y & z) | (x & y & ~z);
    // PoS: (x' + y' + z') . (x' + y + z') . (x + y + z)
    assign pos = (~x | ~y | ~z) & (~x | y | ~z) & (x | y | z);
endmodule

module letra_e(input x, y, w, z, output sop, pos);
    // SoP: x'y'w'z' + x'y'w'z + x'y'wz + x'yw'z + x'ywz' +
    //      xy'w'z' + xy'wz' + xy'wz + xywz' + xywz
    assign sop = (~x & ~y & ~w & ~z) | (~x & ~y & ~w & z) |
                 (~x & ~y & w & z) | (~x & y & ~w & z) |
                 (~x & y & w & ~z) | (x & ~y & ~w & ~z) |
                 (x & ~y & w & ~z) | (x & ~y & w & z) |
                 (x & y & w & ~z) | (x & y & w & z);
    // PoS: (x' + y' + w + z') . (x' + y + w' + z') . (x' + y + w + z) .
    //      (x + y' + w' + z) . (x + y + w' + z') . (x + y + w' + z)
    assign pos = (~x | ~y | w | ~z) & (~x | y | ~w | ~z) &
                 (~x | y | w | z) & (x | ~y | ~w | z) &
                 (x | y | ~w | ~z) & (x | y | ~w | z);
endmodule