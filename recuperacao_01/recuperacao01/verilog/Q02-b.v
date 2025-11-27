module Q02_b (
    input a, b, c, d,
    output F
);
    wire w1, w2, w3, w4;
    wire termo1, termo2, termo3, termo4;
    wire ntermo1, ntermo2, ntermo3, ntermo4;
    
    nand(w1, c, c);                 // not C
    nand(w2, d, d);                 // not D
    nand(termo1, w1, w2);           // termo1 = c'd'
    nand(ntermo1, termo1, termo1);  // Fazendo o NOT do termo1
        
    wire na, nb, nc;
    nand(na, a, a);                 // not A
    nand(nb, b, b);                 // not B
    nand(nc, c, c);                 // not C
    nand(termo2, na, nb, nc);       // A'B'C'
    nand(ntermo2, termo2, termo2);  // Fazendo o NOT do termo2
    
    nand(termo3, a, b, c);          // termo3 = ABC
    nand(ntermo3, termo3, termo3);  // Fazendo o NOT do termo3
    
    wire nd;                        
    nand(nd, d, d);                 // not D
    nand(termo4, b, c, nd);         // termo4 = BCD'
    nand(ntermo4, termo4, termo4);  // Fazendo o NOT do termo4
    
    nand(F, ntermo1, ntermo2, ntermo3, ntermo4);    // F = (C + D) . (A + B + C) . (A' + B' + C') . (B' + C' + D)

endmodule
