module Q01_e (
    input a, b, c, d,
    output y
);
    wire w1, w2, w3, w4, w5, w6, w7, w8;
    wire n1, n2, n3, n4, n5, n6, n7, n8;
    
    // a'b'c'd' = NAND(NAND(a,a), NAND(b,b), NAND(c,c), NAND(d,d))
    wire na, nb, nc, nd;
    nand(na, a, a);
    nand(nb, b, b);
    nand(nc, c, c);
    nand(nd, d, d);
    
    // m0: a'b'c'd'
    wire m0_1, m0_2, m0_3;
    nand(m0_1, na, nb);
    nand(m0_2, nc, nd);
    nand(n1, m0_1, m0_1);
    nand(n2, m0_2, m0_2);
    nand(w1, n1, n2);
    
    // m1: a'b'c'd
    wire m1_1, m1_2, m1_3;
    nand(m1_1, na, nb);
    nand(m1_2, nc, d);
    nand(n3, m1_1, m1_1);
    nand(n4, m1_2, m1_2);
    nand(w2, n3, n4);
    
    // m2: a'bc'd'
    wire m2_1, m2_2, m2_3;
    nand(m2_1, na, b);
    nand(m2_2, nc, nd);
    nand(n5, m2_1, m2_1);
    nand(n6, m2_2, m2_2);
    nand(w3, n5, n6);
    
    // m4: a'bcd'
    wire m4_1, m4_2, m4_3;
    nand(m4_1, na, b);
    nand(m4_2, c, nd);
    nand(n7, m4_1, m4_1);
    nand(n8, m4_2, m4_2);
    nand(w4, n7, n8);
    
    // m8: ab'c'd'
    wire m8_1, m8_2, m8_3;
    nand(m8_1, a, nb);
    nand(m8_2, nc, nd);
    nand(w5, m8_1, m8_2);
    
    // m12: abc'd'
    wire m12_1, m12_2;
    nand(m12_1, a, b);
    nand(m12_2, nc, nd);
    nand(w6, m12_1, m12_2);
    
    // m14: abcd'
    wire m14_1, m14_2;
    nand(m14_1, a, b);
    nand(m14_2, c, nd);
    nand(w7, m14_1, m14_2);
    
    // m15: abcd
    wire m15_1, m15_2;
    nand(m15_1, a, b);
    nand(m15_2, c, d);
    nand(w8, m15_1, m15_2);
    
    // Combinando os mintermos
    wire or1, or2, or3, or4, or5, or6, or7;
    nand(or1, w1, w1);
    nand(or2, w2, w2);
    nand(or3, w3, w3);
    nand(or4, w4, w4);
    nand(or5, w5, w5);
    nand(or6, w6, w6);
    nand(or7, w7, w7);
    nand(n8, w8, w8);
    
    wire final1, final2, final3, final4;
    nand(final1, or1, or2);
    nand(final2, or3, or4);
    nand(final3, or5, or6);
    nand(final4, or7, n8);
    
    wire ff1, ff2;
    nand(ff1, final1, final1);
    nand(ff2, final2, final2);
    nand(final3, final3, final3);
    nand(final4, final4, final4);
    
    wire fff1, fff2;
    nand(fff1, ff1, ff2);
    nand(fff2, final3, final4);
    
    nand(fff1, fff1, fff1);
    nand(fff2, fff2, fff2);
    nand(y, fff1, fff2);

endmodule