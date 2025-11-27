module ram_2x4 (
    input clk,
    input rw,           // 1 = Escrita, 0 = Leitura
    input addr,         // Bit de endereço (0 ou 1)
    input clr,
    input [3:0] data_in,
    output [3:0] data_out
);

    wire sel0, sel1;

    // Decodificação de Endereço
    not gate_inv (sel0, addr); // Ativa se addr=0
    buf gate_buf (sel1, addr); // Ativa se addr=1

    // Instância RAM 0 (Endereço 0)
    ram_1x4 RAM_0 (
        .clk(clk), 
        .rw(rw), 
        .addr(sel0),       // Chip Select derivado do endereço
        .clr(clr), 
        .data_in(data_in), 
        .data_out(data_out) // Barramento compartilhado (Tri-state)
    );

    // Instância RAM 1 (Endereço 1)
    ram_1x4 RAM_1 (
        .clk(clk), 
        .rw(rw), 
        .addr(sel1),       
        .clr(clr), 
        .data_in(data_in), 
        .data_out(data_out) 
    );

endmodule