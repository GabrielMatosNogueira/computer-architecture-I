module Q01_d
(
    input A,
    input B,
    input C,
    input D,
    output F
);

// Simplificação pelo mapa de Karnaugh:
// F = A + B'D + CD
assign F = A | (~B & D) | (C & D);

endmodule