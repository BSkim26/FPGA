`timescale 1ns / 1ps

module add3(
    input [3:0] A,                                                                      // input�� 4bit A�� �����Ѵ�.
    output [3:0] S                                                                      // output���� 4bit S�� �����Ѵ�.
    );
     assign S[0]= ((A[3])&(~A[0]))|((~A[3])&(~A[2])&(A[0]))|((A[2])&(A[1])&(~A[0]));    //S0=A3A0'+A3'A2'A0+A2A1A0'
     assign S[1]= ((A[1])&(A[0]))|((~A[2])&(A[1]))|((A[3])&(~A[0]));                    //S1=A1A0+A2'A1+A3A0'
     assign S[2]= ((A[2])&(~A[1])&(~A[0]))|((A[3])&(A[0]));                             //S2=A2A1'A0'+A3A0
     assign S[3]= (A[3])|((A[2])&(A[1]))|((A[2])&(A[0]));                               //S3=A3+A2A0+A2A1
endmodule
