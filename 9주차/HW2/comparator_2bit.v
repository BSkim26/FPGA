`timescale 1ns / 1ps

module comparator_2bit(
    input [1:0] A, B,                   //input���� 2bit A,B ���� 
    output A_Big, B_Big, Equal          //output���� A_Big, B_Big, Equal ����
    );
    
    assign Equal = (A==B) ? 1:0;        //���� �����ڸ� ����Ͽ� A�� B�� ���� ��� Equal = 1, �ƴ� ��� Equal = 0 ����
    assign A_Big = (A>B)  ? 1:0;        //���� �����ڸ� ����Ͽ� A�� B���� ū ��� A_Big = 1, �ƴ� ��� A_Big = 0 ����
    assign B_Big = (A<B)  ? 1:0;        //���� �����ڸ� ����Ͽ� B�� A���� ū ��� B_Big = 1, �ƴ� ��� B_Big = 0 ����
    
endmodule
