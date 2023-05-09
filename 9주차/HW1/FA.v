`timescale 1ns / 1ps

module FA(                  
    input X, Y, Cin,                    //input으로 X, Y, Cin 선언
    output Sum, Cout                    //out으로 Sum, Cout 선언
    );
    
    assign Sum= X^Y^Cin;               // Sum은 세 input중에 하나만 1일때 1
    assign Cout=X&Y|Y&Cin|X&Cin;        // Cout은 XY+YCin+XCin
endmodule
