module ram_4x8 (
    input clk,
    input rw,           // 1 = Escrita, 0 = Leitura
    input [1:0] addr,   // addr[1] = Banco, addr[0] = Linha
    input clr,
    input [7:0] data_in,
    output [7:0] data_out
);

    wire sel0, sel1;
    wire rw0, rw1;
    wire [7:0] out0, out1;
    wire re0, re1, rw_n;

    // Decodificação de Banco (MSB)
    not gate_sel0 (sel0, addr[1]); // Banco 0 (Endereços 0-1)
    buf gate_sel1 (sel1, addr[1]); // Banco 1 (Endereços 2-3)

    // Controle de Escrita (Gated Write)
    and gate_wr0 (rw0, rw, sel0);
    and gate_wr1 (rw1, rw, sel1);

    // Instâncias dos Bancos
    ram_2x8 BANK0 (
        .clk(clk), .rw(rw0), .clr(clr),
        .addr(addr[0]),       // LSB
        .data_in(data_in), 
        .data_out(out0)       // Saída intermediária
    );

    ram_2x8 BANK1 (
        .clk(clk), .rw(rw1), .clr(clr),
        .addr(addr[0]),       // LSB
        .data_in(data_in), 
        .data_out(out1)       // Saída intermediária
    );

    // Controle de Saída (Tri-state Bus)
    not inv_rw (rw_n, rw);
    and gate_re0 (re0, sel0, rw_n); // Habilita saída se Banco 0 selecionado e Leitura
    and gate_re1 (re1, sel1, rw_n); // Habilita saída se Banco 1 selecionado e Leitura

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : bus_mux
            bufif1 b0 (data_out[i], out0[i], re0);
            bufif1 b1 (data_out[i], out1[i], re1);
        end
    endgenerate

endmodule