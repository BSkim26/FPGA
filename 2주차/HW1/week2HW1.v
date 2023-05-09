`timescale 1ns / 1ps           //12181457 ����� Week2HW1

module Week2HW1(
    input A,                    //input A ����
    input B,                    //input B ����
    input C,                    //input C ����
    output Y                    //output Y ����
    );
    wire w1;                    //wire w1 ����
    wire w2;                    //wire w2 ����
    
    assign w1 = A & ~B & ~C;     // w1=AB'C'����
    assign w2 = B & C;           // w2=BC ����
    assign Y = w1 | w2;          // Y=AB'C' + BC ����
    
endmodule
