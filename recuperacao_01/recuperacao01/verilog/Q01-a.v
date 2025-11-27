// Soma dos Produtos (Soma de Mintermos)
/*

Expressão:
a'b'c'd' + a'b'c'd + a'b c'd' + a'b c d' + a b'c'd' + a b c'd' + a b c d' + a b c d

Simplificação:
1. Agrupando termos comuns:
F = a'b'c'(d' + d) + a'b c'(d' + d) + a b'c'd' + a b c'(d' + d)
2. Aplicando a propriedade do complemento (x + x' = 1):
F = a'b'c' + a'b c' + a b'c'd' + a b c
3. Agrupando novamente:
F = a'b'c' + a'b c' + a b c + a bd'
Expressão final simplificada:
F = c' d' + a' b' c' + abc + bcd'
*/
module soma_dos_produtos (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire F
);
    assign F = (~a & ~b & ~c & ~d) |  
               (~a & ~b & ~c &  d) |  
               (~a &  b & ~c & ~d) |  
               (~a &  b &  c & ~d) |  
               ( a & ~b & ~c & ~d) |  
               ( a &  b & ~c & ~d) |  
               ( a &  b &  c & ~d) |  
               ( a &  b &  c &  d); 
endmodule
