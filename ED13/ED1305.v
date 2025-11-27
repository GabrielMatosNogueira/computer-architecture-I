module t_ff (clk, reset, T, clr, Q);
    input  clk;
    input  reset;
    input  T;
    input  clr;
    output reg Q;

    always @(posedge clk or posedge reset) begin
        if (reset)      Q <= 1'b0;
        else if (clr)   Q <= 1'b0;
        else if (T)     Q <= ~Q;
    end
endmodule

module ED1305 (clk, reset, Q);
    input        clk;
    input        reset;
    output [2:0] Q;
    wire q0, q1, q2;
    wire t0;
    wire t1;
    wire t2;
    wire clr;

    assign t0 = 1'b1;
    assign t1 = q0;
    assign t2 = q0 & q1;
    assign clr = q2 & ~q1 & q0;

    t_ff ff0(.clk(clk), .reset(reset), .T(t0), .clr(clr), .Q(q0));
    t_ff ff1(.clk(clk), .reset(reset), .T(t1), .clr(clr), .Q(q1));
    t_ff ff2(.clk(clk), .reset(reset), .T(t2), .clr(clr), .Q(q2));

    assign Q = {q2, q1, q0};
endmodule
