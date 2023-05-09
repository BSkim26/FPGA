`timescale 1ns / 1ps                 //12181457 김범수 week2HW1


module Week2HW1tb();                    //testbench이므로 pot 선언할 필요 없음
    reg A, B, C;                        //reg형식으로 input A, B, C 선언
    wire Y;                             //wire형식으로 ouput Y 선언
    Week2HW1 uut(                       //test하고자하는 RTL Model을 uut로 호출
        .A(A),                          //A
        .B(B),                          //B
        .C(C),                          //C
        .Y(Y)                           //Y
    );
    
initial begin                           //100ns마다 입력을 바꿔 test
                A=0; B=0; C=0;          //000
        #100    A=0; B=0; C=1;          //001
        #100    A=0; B=1; C=0;          //010
        #100    A=0; B=1; C=1;          //011
        #100    A=1; B=0; C=0;          //100
        #100    A=1; B=0; C=1;          //101
        #100    A=1; B=1; C=0;          //110
        #100    A=1; B=1; C=1;          //111
end
       
endmodule
