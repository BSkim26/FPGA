`timescale 1ns / 1ps        //12181457 김범수 Week2HW2


module week2HW2(
    input A,                //input A 설정
    input B,                //input B 설정
    input C,                //input C 설정
    input P,                //input P 설정
    output Cp               //output Cp 설정
    );
    wire w1;                //wire w1 설정
    wire w2;                //wire w2 설정
    
    xor xor1 (w1, A, B);      //w1 = A xor B
    xor xor2 (w2, C, P);      //w2 = C xor P
    xor xor3 (Cp, w1, w2);     //Cp = w1 xor w2
endmodule