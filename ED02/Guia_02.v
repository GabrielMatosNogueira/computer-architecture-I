//0870863_Gabriel_Matos_Nogueira

// Questao 01
module Questao_01;

    // Variaveis da questao 01
    // letra_(base)
    real a_dec = 0.21875;
    real b_dec = 0.28125;
    real c_dec = 0.65625;
    real d_dec = 1.90625;
    real e_dec = 3.78125;

    initial begin
        $display("------------------------------------");
        $display("1. Binario para Decimal");
        $display("a. 0,00111(2)  = %.6f(10)", a_dec);
        $display("b. 0,01001(2)  = %.6f(10)", b_dec);
        $display("c. 0,10101(2)  = %.6f(10)", c_dec);
        $display("d. 1,11101(2)  = %.6f(10)", d_dec);
        $display("e. 11,11001(2) = %.6f(10)", e_dec);
    end
endmodule

// Questao 02
module Questao_02;

    // Variaveis da questao 02
    // letra_(base)
    real a_dec = 0.875000;
    real b_dec = 1.250000;
    real c_dec = 3.750000;
    real d_dec = 4.125000;
    real e_dec = 7.625000;
    
    reg [3:0] a_int = 0, a_frac = 14;
    reg [3:0] b_int = 1, b_frac = 4;
    reg [3:0] c_int = 3, c_frac = 12;
    reg [3:0] d_int = 4, d_frac = 2;
    reg [3:0] e_int = 7, e_frac = 10;

    initial begin
        $display("------------------------------------");
        $display("2.");
        $display("a. %.6f(10) = %04b.%04b(2)", a_dec, a_int, a_frac);
        $display("b. %.6f(10) = %04b.%04b(2)", b_dec, b_int, b_frac);
        $display("c. %.6f(10) = %04b.%04b(2)", c_dec, c_int, c_frac);
        $display("d. %.6f(10) = %04b.%04b(2)", d_dec, d_int, d_frac);
        $display("e. %.6f(10) = %04b.%04b(2)", e_dec, e_int, e_frac);
    end
endmodule


// ERRO
// A 3.C deveria exibir o resultado 0.A4
module Questao_03;

    real a_decimal = 0.359375;
    real b_decimal = 0.59375;
    real c_decimal = 0.640625;
    real d_decimal = 1.828125;
    real e_decimal = 11.6875;

    reg [5:0] binary_a = 6'b010110;
    reg [5:0] binary_b = 6'b100111;
    reg [5:0] binary_c = 6'b101001;
    reg [6:0] binary_d = 7'b1110101;
    reg [7:0] binary_e = 8'b10111011;

    initial begin
        $display("------------------------------------");
        $display("3.");
        $display("a. 0,010110(2) = 0.%01o%01o%01o(4)", binary_a[5:4], binary_a[3:2], binary_a[1:0]);
        $display("b. 0,100111(2) = 0.%0o(8)", binary_b);
        $display("c. 0,101001(2) = 0.%1h%1h(16)", binary_c[5:2], binary_c[1:0]<<2); // 1010 = A, 0100 = 4
        $display("d. 1,110101(2) = 1.%0o(8)", binary_d[5:0]);
        $display("e. 1011,1011(2)= %h.%h(16)", binary_e[7:4], binary_e[3:0]);
    end
endmodule


module Questao_04;

    reg [8:0] a_frac = 9'b100010011;
    reg [11:0] b_frac = 12'b010011010011;
    reg [8:0] c_frac = 9'b110101100;
    reg [2:0]  d_int  = 3'b110; 
    reg [11:0] d_frac = 12'b001100011101; 
    reg [3:0]  e_int  = 4'b1010;
    reg [11:0] e_frac = 12'b110111100101;

    initial begin
        $display("------------------------------------");
        $display("4. Conversao de outras bases");
        $display("a.) 0,213(4)    = 0,%b(2)", a_frac);
        $display("b.) 0,4D3(16)   = 0,10323(4)");
        $display("c.) 0,654(8)    = 0,%b(2)", c_frac);
        $display("d.) 6,1435(8)   = 12,03321(4)");
        $display("e.) A,DE5(16)   = 22,33211(4)");
    end

endmodule

module Questao_05;

    reg [2:0] a_int   = 3'b111;
    reg [2:0] a_frac  = 3'b101;

    reg [2:0] b_int   = 3'b101;
    reg [2:0] b_frac  = 3'b111;

    reg [3:0] c_int   = 4'b1101;
    reg [5:0] c_frac  = 6'b101010;

    reg [3:0] e_rem   = 4'b1010;

    initial begin
        $display("------------------------------------");
        $display("5.");
        $display("a.) 101,011(2) + 10,01(2)   = %b,%b(2)", a_int, a_frac);
        $display("b.) 1000,01(2) - 10,011(2)  = %b,%b(2)", b_int, b_frac);
        $display("c.) 101,110(2) * 10,011(2)  = %b,%b(2)", c_int, c_frac);
        $display("d.) 10110,01(2) / 11,101(2)  = 110.00101...(2)");
        $display("e.) 1100101(2) %% 1101(2)    = %b(2)", e_rem);
    end

endmodule
