module jk_ff (
    input j,
    input k,
    input clk,
    input clr,
    output reg q
);
    // Borda de subida do clock para escrita
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            q <= 1'b0;
        end else begin
            case ({j, k})
                2'b00: q <= q;    // Mantém estado
                2'b01: q <= 1'b0; // Rese (0)
                2'b10: q <= 1'b1; // Set (1)
                2'b11: q <= ~q;   // Toggle
            endcase
        end
    end
endmodule

// 2. Módulo Principal: Memória RAM 1x4
// Descrição estrutural ("por portas")
module ram_1x4 (
    input clk,          // Clock
    input rw,           // 1 = Escrita (Write), 0 = Leitura (Read)
    input addr,         // Seleção do endereço (Chip Select)
    input clr,          // Clear/Reset
    input [3:0] data_in,// Entrada de dados (4 bits)
    output [3:0] data_out // Saída de dados (4 bits)
);

    // Fios internos
    wire write_enable;
    wire read_enable;
    wire rw_inv;
    
    // Fios para as entradas J e K de cada bit
    wire [3:0] j_val;
    wire [3:0] k_val;
    wire [3:0] data_inv;
    wire [3:0] q_out;

    and gate_oe (read_enable, addr, rw_inv);
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : memory_bit
            
            // 1. Inicialização
            not inv_d (data_inv[i], data_in[i]);

            // 2. Escrita
            and gate_j (j_val[i], data_in[i], addr, rw);
            
            // Se (ADDR=1 e RW=1 e Dado=0) -> K=1 (pois Dado_inv será 1)
            and gate_k (k_val[i], data_inv[i], addr, rw);

            // Se ADDR=0 ou RW=0 (leitura), J e K serão 0, mantendo o estado (Hold).

            // 3. O Flip-Flop
            jk_ff bit_storage (
                .j(j_val[i]), 
                .k(k_val[i]), 
                .clk(clk), 
                .clr(clr), 
                .q(q_out[i])
            );
            
            bufif1 buffer_out (data_out[i], q_out[i], read_enable);
            
        end
    endgenerate

endmodule