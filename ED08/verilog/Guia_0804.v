// -------------------------
// Guia_0804
// Nome: Gabriel Matos Nogueira
// Matricula: 870863
// -------------------------

// -------------------------
// inequidade
// -------------------------
module inequalityComparator (
    output diff,
    input  [4:0] a,
    input  [4:0] b
);
    wire [4:0] neq;
    xor XOR0 (neq[0], a[0], b[0]);
    xor XOR1 (neq[1], a[1], b[1]);
    xor XOR2 (neq[2], a[2], b[2]);
    xor XOR3 (neq[3], a[3], b[3]);
    xor XOR4 (neq[4], a[4], b[4]);
    or  OR1  (diff, neq[0], neq[1], neq[2], neq[3], neq[4]);
endmodule

// -------------------------
// UL
// -------------------------
module logicUnit (
    output diff,
    input  [4:0] a,
    input  [4:0] b
);
    inequalityComparator IC1 (diff, a, b);
endmodule

// -------------------------
// Test
// -------------------------
module test_logicUnit;
    reg  [4:0] x;
    reg  [4:0] y;
    wire diff;

    logicUnit LU1 (diff, x, y);

    initial begin
        $display("Guia_0804 - xxx yyy zzz - 999999");
        $display(" a     b    diff");
        x = 5'b00000; y = 5'b00000; #1 $display("%b %b %b", x, y, diff);
        x = 5'b00001; y = 5'b00000; #1 $display("%b %b %b", x, y, diff);
        x = 5'b11111; y = 5'b11110; #1 $display("%b %b %b", x, y, diff);
        x = 5'b10101; y = 5'b10101; #1 $display("%b %b %b", x, y, diff);
        x = 5'b01010; y = 5'b10101; #1 $display("%b %b %b", x, y, diff);
        x = 5'b10000; y = 5'b00001; #1 $display("%b %b %b", x, y, diff);
    end
endmodule