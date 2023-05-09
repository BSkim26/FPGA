`timescale 1ns / 1ps           //12181457 김범수 Week2HW1

module Week2HW1(
    input A,                    //input A 설정
    input B,                    //input B 설정
    input C,                    //input C 설정
    output Y                    //output Y 설정
    );
    wire w1;                    //wire w1 설정
    wire w2;                    //wire w2 설정
    
    assign w1 = A & ~B & ~C;     // w1=AB'C'설정
    assign w2 = B & C;           // w2=BC 설정
    assign Y = w1 | w2;          // Y=AB'C' + BC 설정
    
endmodule
