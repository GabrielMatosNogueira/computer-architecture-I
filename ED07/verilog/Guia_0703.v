// Guia_0703
// Gabriel Matos Nogueira - 870863

module f7_03 (output s, input a, input b, input sel_group, input sel_op);
wire not_a, not_b, and1, nand1, or1, nor1;
wire mux1_out, mux2_out;

not (not_a, a);
not (not_b, b);

and (and1, a, b);
nand (nand1, a, b);
or (or1, a, b);
nor (nor1, a, b);


assign mux1_out = (~sel_op & and1) | (sel_op & nand1);

assign mux2_out = (~sel_op & or1) | (sel_op & nor1);

assign s = (~sel_group & mux2_out) | (sel_group & mux1_out);
endmodule

module test_f7_03;
reg x, y, sel_group, sel_op;
wire w3;

f7_03 modulo3 (w3, x, y, sel_group, sel_op);

initial begin
    $display("Guia_0703");
    
    $display("x  y sg so  w3");
    
    x = 0; y = 0; 
    sel_group = 0; sel_op = 0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_op = 1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_group = 1; sel_op = 0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_op = 1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);

    x = 1; y = 1; 
    sel_group = 0; sel_op = 0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_op = 1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_group = 1; sel_op = 0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_op = 1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    
    x = 0; y = 1; 
    sel_group = 0; sel_op = 0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_op = 1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_group = 1; sel_op = 0;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
    sel_op = 1;
    #1 $display("%2b %2b %2b %2b  %2b", x, y, sel_group, sel_op, w3);
end
endmodule