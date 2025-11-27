module ring_right_5bit (

    output reg [4:0] q,
    input [4:0] p_in,
    input load,
    input clk,
    input clear
);



    always @(posedge clk or posedge clear)
    begin
        if (clear)
            q <= 5'b0;

        else if (load)
            q <= p_in;
        else

        begin
            q <= {~q[0], q[4:1]};
        end
    end

endmodule