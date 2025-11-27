module ring_counter_right (
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
            q <= 6'b100000;
        else
        begin
            q <= {q[0], q[5:1]};
        end
    end

endmodule