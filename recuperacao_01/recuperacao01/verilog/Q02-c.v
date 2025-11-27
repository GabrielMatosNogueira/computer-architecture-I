// Produto das Somas (Produto de Maxtermos)
/*

Expressão:
A+B+C+D . A+B+C+D' . A+B'+C+D . A+B'+C'+D . A'+B+C+D . A'+B'+C+D . A'+B'+C'+D . A'+B'+C'+D' 

1. Agrupando termos comuns:
F = (A+B+C)(D+D') . (A+B'+C)(D+D') . (A'+B+C)(D+D') . (A'+B'+C')(D+D')

2. Aplicando a propriedade do complemento (x + x' = 1):
F = (A+B+C) . (A+B'+C) . (A'+B+C) . (A'+B'+C')

3. Agrupando novamente:
F = (C+D) . (A+B+C) . (A'+B'+C') . (B'+C'+D)

Expressão final simplificada:
F = (C + D) . (A + B + C) . (A' + B' + C') . (B' + C' + D)
*/

module produto_das_somas (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire F
);
    assign F = (A | B | C | D) &  
               (A | B | C | ~D) &  
               (A | ~B | C | D) &  
               (A | ~B | ~C | D) &  
               (~A | B | C | D) &  
               (~A | ~B | C | D) &  
               (~A | ~B | ~C | D) &  
               (~A | ~B | ~C | ~D); 
endmodule

// OBS: Identifico ao arquivo Q01-b.v