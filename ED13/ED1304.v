module ED1304 (
    input  wire clk,
    output wire [5:0] Q
);

    wire pre0_n, pre1_n, pre2_n, pre3_n, pre4_n, pre5_n;
    wire clr0_n,  clr1_n,  clr2_n,  clr3_n,  clr4_n,  clr5_n;

    wire zero = ~(Q[0] | Q[1] | Q[2] | Q[3] | Q[4] | Q[5]);

    assign pre0_n = ~zero;
    assign pre3_n = ~zero;

    assign clr1_n = ~zero;
    assign clr2_n = ~zero;
    assign clr4_n = ~zero;
    assign clr5_n = ~zero;

    assign clr0_n = 1'b1;
    assign clr3_n = 1'b1;

    assign pre1_n = 1'b1;
    assign pre2_n = 1'b1;
    assign pre4_n = 1'b1;
    assign pre5_n = 1'b1;

    jkff ff0 (.J(1'b1), .K(1'b1), .clk(clk),    .PREn(pre0_n), .CLRn(clr0_n), .Q(Q[0]));
    jkff ff1 (.J(1'b1), .K(1'b1), .clk(Q[0]),   .PREn(pre1_n), .CLRn(clr1_n), .Q(Q[1]));
    jkff ff2 (.J(1'b1), .K(1'b1), .clk(Q[1]),   .PREn(pre2_n), .CLRn(clr2_n), .Q(Q[2]));
    jkff ff3 (.J(1'b1), .K(1'b1), .clk(Q[2]),   .PREn(pre3_n), .CLRn(clr3_n), .Q(Q[3]));
    jkff ff4 (.J(1'b1), .K(1'b1), .clk(Q[3]),   .PREn(pre4_n), .CLRn(clr4_n), .Q(Q[4]));
    jkff ff5 (.J(1'b1), .K(1'b1), .clk(Q[4]),   .PREn(pre5_n), .CLRn(clr5_n), .Q(Q[5]));

endmodule

module jkff (
    input  wire J,
    input  wire K,
    input  wire clk,
    input  wire PREn,
    input  wire CLRn,
    output reg  Q
);
    always @(negedge CLRn or negedge PREn or negedge clk) begin
        if (!CLRn)
            Q <= 1'b0;
        else if (!PREn)
            Q <= 1'b1;
        else begin
            case ({J,K})
                2'b00: Q <= Q;
                2'b01: Q <= 1'b0;
                2'b10: Q <= 1'b1;
                2'b11: Q <= ~Q;
            endcase
        end
    end
endmodule
