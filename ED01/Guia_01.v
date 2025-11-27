/**
Guia_0101.v
870863 - Gabriel Matos Nogueira
*/
module Guia_01;
    integer x = 29; // Decimal
    reg [7:0] b = 0; // binario (bits - little endian)

    // acoes
    initial begin
        // Questao 01
        $display ( "----------------------------------------" );
        $display ( "Guia_01 - Questao 01" );
        $display ( "\n01.a." );
        $display ( "Decimal = %0d", x );
        $display ( "Binario = %08b", x[7:0] );

        x = 53;
        $display ( "\n01.b." );
        $display ( "Decimal = %0d", x );
        $display ( "Binario = %08b", x[7:0] );

        x = 751;
        $display ( "\n01.c." );
        $display ( "Decimal = %0d", x );
        $display ( "Binario = %08b", x[7:0] );

        x = 312;
        $display ( "\n01.d." );
        $display ( "Decimal = %0d", x );
        $display ( "Binario = %08b", x[7:0] );

        x = 365;
        $display ( "\n01.e." );
        $display ( "Decimal = %0d", x );
        $display ( "Binario = %08b", x[7:0] );

        // Questao 02
        $display ( "----------------------------------------" );
        $display ( "Questao 02" );
        x = 29;
        $display ( "\na." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Decimal = %8d", x );

        x = 53;
        $display ( "\nb." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Decimal = %8d", x );

        x = 751;
        $display ( "\nc." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Decimal = %8d", x );

        x = 312;
        $display ( "\nd." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Decimal = %8d", x );

        x = 365;
        $display ( "\ne." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Decimal = %8d", x );

        // Questao 03
        $display ( "----------------------------------------" );
        $display ( "Questao 03" );
        x = 45;
        $display ( "\na." );
        $display ( "Decimal = %0d", x );
        $display ( "Quaternario = %0d", x );

        x = 66;
        $display ( "\nb." );
        $display ( "Decimal = %0d", x );
        $display ( "Octal = %0o", x );

        x = 79;
        $display ( "\nc." );
        $display ( "Decimal = %0d", x );
        $display ( "Hexadecimal = %0h", x );

        x = 151;
        $display ( "\nd." );
        $display ( "Decimal = %0d", x );
        $display ( "Hexadecimal = %0h", x );

        x = 781;
        $display ( "\ne." );
        $display ( "Decimal = %0d", x );
        $display ( "Hexadecimal = %0h", x );

        // Questao 04
        $display ( "----------------------------------------" );
        $display ( "Questao 04" );

        x = 8'b00010100;
        $display ( "\na." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Quaternario = %0d", x );

        x = 8'b00011001;
        $display ( "\nb." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Octal = %0o", x );

        x = 8'b00100101;
        $display ( "\nc." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Hexadecimal = %0h", x );

        x = 8'b00101001;
        $display ( "\nd." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Octal = %0o", x );

        x = 8'b00100101;
        $display ( "\ne." );
        $display ( "Binario = %08b", x[7:0] );
        $display ( "Quaternario = %0d", x );

        // Questao 05
        $display ( "----------------------------------------" );
        $display ( "Questao 05" );

        $display ( "\na." );
        $display ( "'PUC-MG' em hexadecimal: %h", "PUC-MG" );

        $display ( "\nb." );
        $display ( "'2025-02 'em hexadecimal: %h", "2025-02" );

        $display ( "\nc." );
        $display ( "'Belo Horizonte' em binario: %b", "Belo Horizonte" );

        $display ( "\nd." );
        $display ( "'Tarde' em hexadecimal: %h", "Tarde" );

        $display ( "\ne." );
        $display ( "'Noite' em hexadecimal: %h", "Noite" );

    end
endmodule // Guia_0101