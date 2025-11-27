module ring_counter_left_5bit_load (
    output reg [4:0] q,
    input [4:0] p_in,
    input ld,
    input clk,
    input clear
);

    always @(posedge clk or posedge clear)
    begin
        if (clear)
            q <= 5'b0;
        else if (ld)
            q <= p_in;
        else
        begin
            q[4:1] <= q[3:0];
            q[0]   <= q[4];
        end
    end

endmodule