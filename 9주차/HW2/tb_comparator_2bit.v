`timescale 1ns / 1ps
module tb_comparator_2bit();

    reg [1:0] A, B;                             //reg Ÿ������ 2bit A, B ����
    
    wire    A_Big, B_Big, Equal;                //wire Ÿ������ A_Big, B_Big, Equal����

comparator_2bit uut(A,B,A_Big, B_Big, Equal);   //uut ���� �� �� �Է�, ��� ����

initial begin                                   //A = 0~3, B = 0~3���� ��� ��� ��
                A=0;    B=0;
     #10        A=1;    B=0;
     #10        A=2;    B=0;
     #10        A=3;    B=0;
     
     #10        A=0;    B=1;
     #10        A=1;    B=1;
     #10        A=2;    B=1;
     #10        A=3;    B=1;
     
     #10        A=0;    B=2;
     #10        A=1;    B=2;
     #10        A=2;    B=2;
     #10        A=3;    B=2;
     
     #10        A=0;    B=3;
     #10        A=1;    B=3;
     #10        A=2;    B=3;
     #10        A=3;    B=3;
     #10        $finish;                        //160ns �� testbench ����
end

endmodule
