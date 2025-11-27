// -------------------------
// Guia_0802
// Nome: Gabriel Matos Nogueira
// Matricula: 870863
// -------------------------

// -------------------------
// half subtractor
// -------------------------
module halfSubtractor (
    output diff,
    output borrow,
    input a,
    input b
);
// descrever por portas
assign diff = a ^ b;
assign borrow = (~a) & b;
endmodule // halfSubtractor

// -------------------------
// full subtractor
// -------------------------
module fullSubtractor (
    output diff,
    output borrow,
    input a,
    input b,
    input bin
);
// descrever por portas
assign diff = a ^ b ^ bin;
assign borrow = ((~a) & b) | ((~a) & bin) | (b & bin);
endmodule // fullSubtractor

// -------------------------
// AU 5 bits (Subtrator Completo)
// -------------------------
module AU5bits (
    output [4:0] diff,
    output borrow_out,
    input [4:0] a,
    input [4:0] b,
    input bin
);
    wire [4:0] borrow;

    fullSubtractor FS0(diff[0], borrow[0], a[0], b[0], bin);
    fullSubtractor FS1(diff[1], borrow[1], a[1], b[1], borrow[0]);
    fullSubtractor FS2(diff[2], borrow[2], a[2], b[2], borrow[1]);
    fullSubtractor FS3(diff[3], borrow[3], a[3], b[3], borrow[2]);
    fullSubtractor FS4(diff[4], borrow_out, a[4], b[4], borrow[3]);
endmodule

// -------------------------
// Test
// -------------------------
module test_AU5bits;
reg [4:0] x, y;
reg bin;
wire [4:0] diff;
wire borrow_out;

AU5bits uut(diff, borrow_out, x, y, bin);

initial begin
    $display("Guia_0802 - Gabriel Matos Nogueira - 870863");
    bin = 0;

    x = 5'b00000; y = 5'b00000;
    #1 $display("x = %b, y = %b, x - y = %b, borrow_out = %b", x, y, diff, borrow_out);

    x = 5'b00001; y = 5'b00001;
    #1 $display("x = %b, y = %b, x - y = %b, borrow_out = %b", x, y, diff, borrow_out);

    x = 5'b00110; y = 5'b00011;
    #1 $display("x = %b, y = %b, x - y = %b, borrow_out = %b", x, y, diff, borrow_out);

    x = 5'b11111; y = 5'b00001;
    #1 $display("x = %b, y = %b, x - y = %b, borrow_out = %b", x, y, diff, borrow_out);

    x = 5'b10101; y = 5'b01010;
    #1 $display("x = %b, y = %b, x - y = %b, borrow_out = %b", x, y, diff, borrow_out);

    x = 5'b00001; y = 5'b00010;
    #1 $display("x = %b, y = %b, x - y = %b, borrow_out = %b", x, y, diff, borrow_out);

    $finish;
end
endmodule
