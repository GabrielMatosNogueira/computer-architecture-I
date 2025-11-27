// -----------------------
// --- Mealy FSM (1101) ---
// -----------------------
// Reconhece a sequência 1101 em um fluxo de bits
// Saída: '1' quando a sequência 1101 é detectada (Mealy)

`define found     1
`define notfound  0

module mealy_1101 (y, x, clk, reset);
    output reg y;
    input x;
    input clk;
    input reset;

    // --- Identificadores dos estados ---
    parameter 
        start = 2'b00,
        id1   = 2'b01,
        id11  = 2'b11,
        id110 = 2'b10;

    reg [1:0] E1; // estado atual
    reg [1:0] E2; // próximo estado

    // --- Lógica combinacional: próximo estado e saída ---
    always @(x or E1) begin
        y = `notfound;
        case (E1)
            start:
                if (x)
                    E2 = id1;
                else
                    E2 = start;

            id1:
                if (x)
                    E2 = id11;
                else
                    E2 = start;

            id11:
                if (x)
                    E2 = id11;
                else
                    E2 = id110;

            id110:
                if (x) begin
                    E2 = id1;
                    y  = `found;
                end else begin
                    E2 = start;
                    y  = `notfound;
                end

            default:
                E2 = 2'bxx;
        endcase
    end

    // --- Lógica sequencial: atualização de estado ---
    always @(posedge clk or negedge reset) begin
        if (!reset)
            E1 <= start;   // reset ativo em nível baixo
        else
            E1 <= E2;      // atualização de estado
    end

endmodule
