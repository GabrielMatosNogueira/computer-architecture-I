module ram_2x8 (
    input clk,
    input rw,           
    input addr,         // Seleciona Endereço 0 ou 1
    input clr,
    input [7:0] data_in, // Entrada agora tem 8 bits
    output [7:0] data_out // Saída agora tem 8 bits
);

    wire sel0, sel1;

    // --- Decodificação de Endereço ---
    not gate_inv (sel0, addr); // Ativa Linha 0 se addr=0
    buf gate_buf (sel1, addr); // Ativa Linha 1 se addr=1

    // --- LINHA 0 (Endereço 0) ---
    
    // Parte Baixa (Bits 0-3)
    ram_1x4 R0_LOW (
        .clk(clk), .rw(rw), .clr(clr),
        .addr(sel0),           // Chip Select da Linha 0
        .data_in(data_in[3:0]),
        .data_out(data_out[3:0])
    );

    // Parte Alta (Bits 4-7)
    ram_1x4 R0_HIGH (
        .clk(clk), .rw(rw), .clr(clr),
        .addr(sel0),           // Chip Select da Linha 0
        .data_in(data_in[7:4]),
        .data_out(data_out[7:4])
    );

    // --- LINHA 1 (Endereço 1) ---

    // Parte Baixa (Bits 0-3)
    ram_1x4 R1_LOW (
        .clk(clk), .rw(rw), .clr(clr),
        .addr(sel1),           // Chip Select da Linha 1
        .data_in(data_in[3:0]),
        .data_out(data_out[3:0]) // Liga no mesmo barramento de saída
    );

    // Parte Alta (Bits 4-7)
    ram_1x4 R1_HIGH (
        .clk(clk), .rw(rw), .clr(clr),
        .addr(sel1),           // Chip Select da Linha 1
        .data_in(data_in[7:4]),
        .data_out(data_out[7:4]) // Liga no mesmo barramento de saída
    );

endmodule