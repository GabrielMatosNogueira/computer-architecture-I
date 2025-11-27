module teste 
(
    input wire A,
    input wire B,
    input wire C,
    output wire S
);

assign S = (~A | C) & (A | B) & (B | C);

endmodule