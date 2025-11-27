module piso_6bit (
    output serial_out,
    output reg [5:0] q_parallel_out,
    
    input [5:0] p_in,
    input load_shift,
    input clk,
    input clear
);

    assign serial_out = q_parallel_out[0];

    always @(posedge clk or posedge clear)
    begin
        if (clear)
            q_parallel_out <= 6'b0;
        else if (load_shift)
            q_parallel_out <= p_in;
        else
        begin
            q_parallel_out <= {1'b0, q_parallel_out[5:1]};
        end
    end
    
endmodule