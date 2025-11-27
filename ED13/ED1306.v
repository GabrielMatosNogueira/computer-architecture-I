module ring5 (
    input  wire clk,
    input  wire rst,    // reset assíncrono, ativa em 1 -> inicia em 00001
    output wire [4:0] q // q[4] ... q[0]
);

    wire q0, q1, q2, q3, q4;
    wire nq0, nq1, nq2, nq3, nq4;
    wire j0, j1, j2, j3, j4;
    wire k0, k1, k2, k3, k4;

    not n0 (nq0, q0);
    not n1 (nq1, q1);
    not n2 (nq2, q2);
    not n3 (nq3, q3);
    not n4 (nq4, q4);// ED1306.v
// Contador em anel 5 bits. Reset assíncrono (rst=1) inicializa em 00001.

module ring5 (
    input  wire clk,
    input  wire rst,    // reset assíncrono, ativa em 1 -> inicia em 00001
    output wire [4:0] q // q[4] ... q[0]
);

    wire q0, q1, q2, q3, q4;
    wire nq0, nq1, nq2, nq3, nq4;
    wire j0, j1, j2, j3, j4;
    wire k0, k1, k2, k3, k4;

    not n0 (nq0, q0);
    not n1 (nq1, q1);
    not n2 (nq2, q2);
    not n3 (nq3, q3);
    not n4 (nq4, q4);

    // J = Q_prev & ~Q ; K = Q & ~Q_prev
    and a_j0 (j0, q4, nq0);
    and a_k0 (k0, q0, nq4);

    and a_j1 (j1, q0, nq1);
    and a_k1 (k1, q1, nq0);

    and a_j2 (j2, q1, nq2);
    and a_k2 (k2, q2, nq1);

    and a_j3 (j3, q2, nq3);
    and a_k3 (k3, q3, nq2);

    and a_j4 (j4, q3, nq4);
    and a_k4 (k4, q4, nq3);

    // preset de q0 = rst, clear dos outros = rst (para iniciar em 00001)
    jk_ff ff0 (.clk(clk), .preset(rst),   .clear(1'b0), .J(j0), .K(k0), .Q(q0));
    jk_ff ff1 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j1), .K(k1), .Q(q1));
    jk_ff ff2 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j2), .K(k2), .Q(q2));
    jk_ff ff3 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j3), .K(k3), .Q(q3));
    jk_ff ff4 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j4), .K(k4), .Q(q4));

    assign q = {q4, q3, q2, q1, q0};

endmodule


// JK flip-flop com preset e clear assíncronos.
module jk_ff (
    input  wire clk,
    input  wire preset, // assíncrono
    input  wire clear,  // assíncrono
    input  wire J,
    input  wire K,
    output reg  Q
);
    always @(posedge clk or posedge preset or posedge clear) begin
        if (preset)
            Q <= 1'b1;
        else if (clear)
            Q <= 1'b0;
        else begin
            if (J && ~K)
                Q <= 1'b1;
            else if (~J && K)
                Q <= 1'b0;
            else if (J && K)
                Q <= ~Q;
            else
                Q <= Q;
        end
    end
endmodule


    // J = Q_prev & ~Q ; K = Q & ~Q_prev
    and a_j0 (j0, q4, nq0);
    and a_k0 (k0, q0, nq4);

    and a_j1 (j1, q0, nq1);
    and a_k1 (k1, q1, nq0);

    and a_j2 (j2, q1, nq2);
    and a_k2 (k2, q2, nq1);

    and a_j3 (j3, q2, nq3);
    and a_k3 (k3, q3, nq2);

    and a_j4 (j4, q3, nq4);
    and a_k4 (k4, q4, nq3);

    // preset de q0 = rst, clear dos outros = rst (para iniciar em 00001)
    jk_ff ff0 (.clk(clk), .preset(rst),   .clear(1'b0), .J(j0), .K(k0), .Q(q0));
    jk_ff ff1 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j1), .K(k1), .Q(q1));
    jk_ff ff2 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j2), .K(k2), .Q(q2));
    jk_ff ff3 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j3), .K(k3), .Q(q3));
    jk_ff ff4 (.clk(clk), .preset(1'b0), .clear(rst),  .J(j4), .K(k4), .Q(q4));

    assign q = {q4, q3, q2, q1, q0};

endmodule


// JK flip-flop com preset e clear assíncronos.
module jk_ff (
    input  wire clk,
    input  wire preset, // assíncrono
    input  wire clear,  // assíncrono
    input  wire J,
    input  wire K,
    output reg  Q
);
    always @(posedge clk or posedge preset or posedge clear) begin
        if (preset)
            Q <= 1'b1;
        else if (clear)
            Q <= 1'b0;
        else begin
            if (J && ~K)
                Q <= 1'b1;
            else if (~J && K)
                Q <= 1'b0;
            else if (J && K)
                Q <= ~Q;
            else
                Q <= Q;
        end
    end
endmodule
