`timescale 1ns / 1ps

module FA(                  
    input X, Y, Cin,                    //input���� X, Y, Cin ����
    output Sum, Cout                    //out���� Sum, Cout ����
    );
    
    assign Sum= X^Y^Cin;               // Sum�� �� input�߿� �ϳ��� 1�϶� 1
    assign Cout=X&Y|Y&Cin|X&Cin;        // Cout�� XY+YCin+XCin
endmodule
