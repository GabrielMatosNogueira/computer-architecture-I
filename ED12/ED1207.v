module ram_8x16 (
    input clk,
    input rw,           // 1=Write, 0=Read
    input [2:0] addr,   // 3 bits de endereço
    input clr,
    input [15:0] data_in,
    output [15:0] data_out
);

    wire [7:0] sel;     // Saídas do decodificador
    wire [7:0] we;      // Write Enables individuais
    wire [7:0] re;      // Read Enables individuais
    wire [15:0] dout [7:0]; // Saídas das memórias
    wire rw_n;
    wire [2:0] addr_n;

    // Decodificador 3x8 (Por portas)
    not (addr_n[0], addr[0]);
    not (addr_n[1], addr[1]);
    not (addr_n[2], addr[2]);

    and (sel[0], addr_n[2], addr_n[1], addr_n[0]); // 000
    and (sel[1], addr_n[2], addr_n[1], addr[0]);   // 001
    and (sel[2], addr_n[2], addr[1],   addr_n[0]); // 010
    and (sel[3], addr_n[2], addr[1],   addr[0]);   // 011
    and (sel[4], addr[2],   addr_n[1], addr_n[0]); // 100
    and (sel[5], addr[2],   addr_n[1], addr[0]);   // 101
    and (sel[6], addr[2],   addr[1],   addr_n[0]); // 110
    and (sel[7], addr[2],   addr[1],   addr[0]);   // 111

    // Controle Global
    not (rw_n, rw);

    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : memory_array
            
            // Gating de Controle
            and (we[i], rw, sel[i]);    // Escreve apenas se selecionado
            and (re[i], rw_n, sel[i]);  // Lê apenas se selecionado

            // Instância (addr atua como Chip Select)
            ram_1x16 CELL (
                .clk(clk), .rw(we[i]), .clr(clr),
                .addr(sel[i]),      
                .data_in(data_in), 
                .data_out(dout[i])
            );

            // Saída Tri-state (Multiplexação)
            for (j = 0; j < 16; j = j + 1) begin : output_bus
                bufif1 (data_out[j], dout[i][j], re[i]);
            end
        end
    endgenerate

endmodule