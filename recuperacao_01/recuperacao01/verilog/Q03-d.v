module mux(output s, input a, input b, input c);
    wire b_not, c_not;
    wire mux1_out, mux2_out;

    not NOT_b(b_not, b);
    not NOT_c(c_not, c);

    mux mux1(mux1_out, a, b_not, a);
    mux mux2(mux2_out, a, c_not, a);

    mux mux_final(s, mux1_out, mux2_out, b);
endmodule