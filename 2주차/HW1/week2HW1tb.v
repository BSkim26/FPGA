`timescale 1ns / 1ps                 //12181457 ����� week2HW1


module Week2HW1tb();                    //testbench�̹Ƿ� pot ������ �ʿ� ����
    reg A, B, C;                        //reg�������� input A, B, C ����
    wire Y;                             //wire�������� ouput Y ����
    Week2HW1 uut(                       //test�ϰ����ϴ� RTL Model�� uut�� ȣ��
        .A(A),                          //A
        .B(B),                          //B
        .C(C),                          //C
        .Y(Y)                           //Y
    );
    
initial begin                           //100ns���� �Է��� �ٲ� test
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
