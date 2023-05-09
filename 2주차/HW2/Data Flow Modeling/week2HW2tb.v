`timescale 1ns / 1ps          //12181457 ����� Week2HW2


module week2HW2tb();            //testbench�̱� ������ port���� ����
    reg A, B, C, P;             //input�� reg Ÿ������ ���� A, B, C, P
    wire Cp;                    //output�� wire Ÿ������ ���� Cp
    
    week2HW2 uut(               //test�ϱ� ���� week2HW2�� uut�� ȣ��
    .A(A),
    .B(B),
    .C(C),
    .P(P),
    .Cp(Cp)
    );
    
initial begin                   //50ns ������ �Է��� ���� 
        A=0; B=0; C=0; P=0;     //0000
#50     A=0; B=0; C=0; P=1;     //0001
#50     A=0; B=0; C=1; P=0;     //0010
#50     A=0; B=0; C=1; P=1;     //0011
#50     A=0; B=1; C=0; P=0;     //0100
#50     A=0; B=1; C=0; P=1;     //0101
#50     A=0; B=1; C=1; P=0;     //0110
#50     A=0; B=1; C=1; P=1;     //0111
#50     A=1; B=0; C=0; P=0;     //1000
#50     A=1; B=0; C=0; P=1;     //1001
#50     A=1; B=0; C=1; P=0;     //1010
#50     A=1; B=0; C=1; P=1;     //1011
#50     A=1; B=1; C=0; P=0;     //1100
#50     A=1; B=1; C=0; P=1;     //1101
#50     A=1; B=1; C=1; P=0;     //1110
#50     A=1; B=1; C=1; P=1;     //1111
end

endmodule
