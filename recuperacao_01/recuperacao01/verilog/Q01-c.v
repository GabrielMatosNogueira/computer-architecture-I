module simplified_expression 
(
    input a,
    input b,
    input c,
    input d,
    output f
);
    assign f = (a & b) | (a & c) | (b & c) | (b & d) | (c & d);
endmodule