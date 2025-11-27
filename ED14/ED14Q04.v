module left_ring (
    output reg [5:0] q,
    input ld,
    input clk,
    input clear
);

    always @(posedge clk or posedge clear)
    begin
        if (clear)
            q <= 6'b0;
        else if (ld)
            q <= 6'b000001;
        else
        begin
            q[5:1] <= q[4:0];
            q[0]   <= ~q[5];
        end
    end

endmodule