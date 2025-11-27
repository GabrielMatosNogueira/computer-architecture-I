// ED1307.v
// 5-bit Johnson (twisted ring) counter implemented with JK flip-flops.
// Ports: clk (posedge), rst (async active-high), q[4:0] output.
module ED1307 (
    input  wire clk,
    input  wire rst,
    output wire [4:0] q
);

wire [4:0] D;
wire [4:0] K;

// Próximo estado (D) e K = ~D; J = D
assign D[0] = ~q[4];
assign D[1] =  q[0];
assign D[2] =  q[1];
assign D[3] =  q[2];
assign D[4] =  q[3];

assign K = ~D;

// Instancia cinco flip-flops JK
jk_ff jk0 (.clk(clk), .rst(rst), .J(D[0]), .K(K[0]), .Q(q[0]));
jk_ff jk1 (.clk(clk), .rst(rst), .J(D[1]), .K(K[1]), .Q(q[1]));
jk_ff jk2 (.clk(clk), .rst(rst), .J(D[2]), .K(K[2]), .Q(q[2]));
jk_ff jk3 (.clk(clk), .rst(rst), .J(D[3]), .K(K[3]), .Q(q[3]));
jk_ff jk4 (.clk(clk), .rst(rst), .J(D[4]), .K(K[4]), .Q(q[4]));

endmodule


// Flip-flop JK, async reset (rst=1 -> Q=0)
// Característica usada: Qnext = J & ~Q | ~K & Q
module jk_ff (
    input  wire clk,
    input  wire rst,
    input  wire J,
    input  wire K,
    output reg  Q
);
always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= (J & ~Q) | (~K & Q);
end
endmodule
