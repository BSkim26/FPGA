
`timescale 1ns / 1ps

module Adder_Subtractor(
    input [3:0] A,            
    input [3:0] B,
    input Add_Sub,
    output Add_Cout,
    output Overflow,               
    output [3:0] Sum          
    );

    wire [2:0] C;
    wire [3:0] Not_B;        
                                       
                                       
    assign Not_B[0] = B[0] ^ Add_Sub ;                          //Add_Sub 1�� ��� B ���� ���� Not_B�� ����
    assign Not_B[1] = B[1] ^ Add_Sub ;                          //        0�� ��� �������� �ʰ� Not_B�� ����
    assign Not_B[2] = B[2] ^ Add_Sub ;
    assign Not_B[3] = B[3] ^ Add_Sub ;
    
    assign Overflow = (C[2] != Add_Cout) ? 1:0;                 //���� ��ȣ ���� or �ٸ� ��ȣ �������� ��� ��� ��ȣ�� �ٸ��� overflow
    
    FA u0 (.A(A[0]),  .B(Not_B[0]),    .Cin(Add_Sub),  .Add_Cout(C[0]),   .Sum(Sum[0]));   
    FA u1 (.A(A[1]),  .B(Not_B[1]),    .Cin(C[0]),  .Add_Cout(C[1]),   .Sum(Sum[1]));
    FA u2 (.A(A[2]),  .B(Not_B[2]),    .Cin(C[1]),  .Add_Cout(C[2]),   .Sum(Sum[2]));
    FA u3 (.A(A[3]),  .B(Not_B[3]),    .Cin(C[2]),  .Add_Cout(Add_Cout), .Sum(Sum[3]));
    
endmodule
