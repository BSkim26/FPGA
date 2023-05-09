`timescale 1ns / 1ps        //12181457 ����� Week2HW2


module week2HW2(
    input A,                //input A ����
    input B,                //input B ����
    input C,                //input C ����
    input P,                //input P ����
    output Cp               //output Cp ����
    );
    wire w1;                //wire w1 ����
    wire w2;                //wire w2 ����
    
    xor xor1 (w1, A, B);      //w1 = A xor B
    xor xor2 (w2, C, P);      //w2 = C xor P
    xor xor3 (Cp, w1, w2);     //Cp = w1 xor w2
endmodule