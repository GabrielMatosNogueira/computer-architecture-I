module Q01_f (
    input A, B, C, D,
    output F
);
    wire w1, w2, w3, w4, w5, w6, w7, w8;
    wire n1, n2, n3, n4, n5, n6, n7, n8;
    wire out;
    
    // (A+B+C+D)' usando NORs de 2 entradas
    nor(w1, A, B);
    nor(w2, C, D);
    nor(n1, w1, w2);
    
    // (A+B+C+D')' 
    nor(w3, C, D);
    nor(n2, w1, w3);
    
    // (A+B'+C+D)'
    nor(w4, B, B);  // B'
    nor(w5, A, w4);
    nor(w6, C, D);
    nor(n3, w5, w6);
    
    // (A+B'+C'+D)'
    nor(w7, C, C);  // C'
    nor(n4, w5, w7);
    nor(n4, n4, D);
    
    // (A'+B+C+D)'
    nor(w8, A, A);  // A'
    nor(n5, w8, B);
    nor(n5, n5, C);
    nor(n5, n5, D);
    
    // (A'+B'+C+D)'
    nor(n6, w8, w4);
    nor(n6, n6, C);
    nor(n6, n6, D);
    
    // (A'+B'+C'+D)'
    nor(n7, w8, w4);
    nor(n7, n7, w7);
    nor(n7, n7, D);
    
    // (A'+B'+C'+D')'
    nor(n8, D, D);  // D'
    nor(n8, w8, w4);
    nor(n8, n8, w7);
    nor(n8, n8, n8);
    
    nor(out, n1, n1);  // NOT n1
    assign F = out;
    
endmodule