module shift_left_preset_all (
    output reg [5:0] q,
    input sin,
    input ld,
    input clk,
    input clear
);

    always @(posedge clk or posedge clear or posedge ld)
    begin
        if (clear)
            q <= 6'b0;
        else if (ld)
            q <= 6'b111111;
        else
        begin
            q[5:1] <= q[4:0];
            q[0] <= sin;
        end
    end

endmodule