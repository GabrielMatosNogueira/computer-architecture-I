module jk_ff (
    input  wire clk,
    input  wire j,
    input  wire k,
    input  wire rst,    // reset
    output reg  q       // registrador
);
    always @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else begin
            case ({j,k})
                2'b00: q <= q;      // mantém
                2'b01: q <= 1'b0;   // reset
                2'b10: q <= 1'b1;   // set
                2'b11: q <= ~q;     // toggle
            endcase
        end
    end
endmodule

module contador_crescente_5bit (
    input  wire clk,
    input  wire rst,
    output wire [4:0] q
);
    // Toggle '1' do JK
    wire one = 1'b1;

    jk_ff ff0(.clk(clk),    .j(one), .k(one), .rst(rst), .q(q[0]));
    jk_ff ff1(.clk(q[0]),   .j(one), .k(one), .rst(rst), .q(q[1]));
    jk_ff ff2(.clk(q[1]),   .j(one), .k(one), .rst(rst), .q(q[2]));
    jk_ff ff3(.clk(q[2]),   .j(one), .k(one), .rst(rst), .q(q[3]));
    jk_ff ff4(.clk(q[3]),   .j(one), .k(one), .rst(rst), .q(q[4]));

endmodule