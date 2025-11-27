module f ( output s, input a, input b, input c );
    wire w1, w2, w3, w4;
    not NOT_1 (w1, b);
    not NOT_2 (w2, c);
    and AND_1 (w3, a, w2);
    and AND_2 (w4, a, w1, c);
    or OR_1 (s, w3, w4);
endmodule 
// F = b' c' + a b' c
module teste;
    reg a, b, c;
    wire s;

    f funcao (s, a, b, c);

    initial begin
        $display("a b c s");
        $monitor("%b %b %b %b", a, b, c, s);
        
        a = 0; b = 0; c = 0; #1;
        a = 0; b = 0; c = 1; #1;
        a = 0; b = 1; c = 0; #1;
        a = 0; b = 1; c = 1; #1;
        a = 1; b = 0; c = 0; #1;
        a = 1; b = 0; c = 1; #1;
        a = 1; b = 1; c = 0; #1;
        a = 1; b = 1; c = 1; #1;
    end
endmodule
/* s = ac' + ab'c

s = a(c' + b'c)
s = a(c' + b')


a  b  c  s
0  0  0  0
0  0  1  0
0  1  0  0
0  1  1  0
1  0  0  1
1  0  1  1
1  1  0  1
1  1  1  0

*/