module shift_left_preset (
    output reg [5:0] q,
    input sin,
    input ld,
    input clk,
    input clear
);

    always @(posedge clk or posedge clear or posedge ld)
    begin
        if (clear)
            q[0] <= 1'b0;
        else if (ld)
            q[0] <= 1'b1;
        else
            q[0] <= sin;
    end

    always @(posedge clk or posedge clear)
    begin
        if (clear)
            q[5:1] <= 5'b0;
        else
            q[5:1] <= q[4:0];
    end

endmodule