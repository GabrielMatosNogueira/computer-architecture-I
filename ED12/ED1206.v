module ram_4x16 (
    input clk,
    input rw,           // 1 = Escrita, 0 = Leitura
    input [1:0] addr,   // 4 endereços (2 bits)
    input clr,
    input [15:0] data_in, // Entrada de 16 bits
    output [15:0] data_out // Saída de 16 bits
);

    // --- Expansão de Palavra (Paralelismo) ---
    
    // Parte Baixa (Least Significant Byte - LSB)
    // Manipula os bits [7:0]
    ram_4x8 RAM_LOW (
        .clk(clk), 
        .rw(rw), 
        .clr(clr),
        .addr(addr),           // Mesmo endereço
        .data_in(data_in[7:0]), 
        .data_out(data_out[7:0])
    );

    // Parte Alta (Most Significant Byte - MSB)
    // Manipula os bits [15:8]
    ram_4x8 RAM_HIGH (
        .clk(clk), 
        .rw(rw), 
        .clr(clr),
        .addr(addr),           // Mesmo endereço
        .data_in(data_in[15:8]), 
        .data_out(data_out[15:8])
    );

endmodule