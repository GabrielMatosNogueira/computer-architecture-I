module ram_8x8 (
    input clk,
    input rw,           // 1 = Escrita, 0 = Leitura
    input [2:0] addr,   // addr[2]=Banco, addr[1:0]=Linha
    input clr,
    input [7:0] data_in,
    output [7:0] data_out
);

    wire sel0, sel1;
    wire rw0, rw1;
    wire [7:0] out0, out1;
    wire re0, re1, rw_n;

    // --- Decodificação de Endereço (MSB) ---
    // addr[2] é o bit de seleção de banco
    not gate_sel0 (sel0, addr[2]); // Banco 0 (Endereços 0-3)
    buf gate_sel1 (sel1, addr[2]); // Banco 1 (Endereços 4-7)

    // --- Controle de Escrita (Gated Write) ---
    // O sinal de escrita só chega no banco se ele estiver selecionado
    and gate_wr0 (rw0, rw, sel0);
    and gate_wr1 (rw1, rw, sel1);

    // --- Instâncias das Memórias RAM 4x8 ---
    // Note que passamos apenas addr[1:0] (2 bits) para os sub-módulos
    
    ram_4x8 BANK0 (
        .clk(clk), .rw(rw0), .clr(clr),
        .addr(addr[1:0]),      
        .data_in(data_in), 
        .data_out(out0)
    );

    ram_4x8 BANK1 (
        .clk(clk), .rw(rw1), .clr(clr),
        .addr(addr[1:0]),      
        .data_in(data_in), 
        .data_out(out1)
    );

    // --- Controle de Saída (Tri-state Bus) ---
    // Precisamos isolar a saída do banco que não está sendo lido
    
    not inv_rw (rw_n, rw); // Inverte RW para criar sinal de Read
    
    // Habilita saída apenas se: (Banco Selecionado) E (É uma leitura)
    and gate_re0 (re0, sel0, rw_n); 
    and gate_re1 (re1, sel1, rw_n); 

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : bus_mux
            bufif1 b0 (data_out[i], out0[i], re0);
            bufif1 b1 (data_out[i], out1[i], re1);
        end
    endgenerate

endmodule