`timescale 1ns / 1ps

module binarytoBCD(
    input [7:0] A,                                  // input�� 8bit A�� �����Ѵ�.
    output [1:0] hunds,                             // output�� 2bit A�� �����Ѵ�.
    output [3:0] tens, units                        // output�� 4bit A�� �����Ѵ�.
    );
    wire [3:0] C1, C2, C3, C4, C5, C6, C7;          // wire �������� 4bit C1~C7 �� �����Ѵ�. Cn�� �Է��� ��Ÿ����.
    wire [3:0] W1, W2, W3, W4, W6;                  // wire �������� 4bit W1~W6 �����Ѵ�. Cn�� ����� ��Ÿ����.
    wire [9:0] S;
    
    assign C1= {0, A[7: 5]};                        // C1~C7, S[9], S[0] �Է��� ��Ī�Ѵ�.
    assign C2 = {W1[2:0], A[4]};                    
    assign C3 = {W2[2:0], A[3]};                    
    assign C4 = {W3[2:0], A[2]};                    
    assign C5 = {W4[2:0], A[1]};                    
    assign C6 = {0, W1[3], W2[3], W3[3]};           
    assign C7 = {W6[2:0], W4[3]};                   
    assign S[9] = W6[3];                             
    assign S[0] = A[0];                              
                                                    
    add3 C_1 (.A(C1), .S(W1));                      //add3 ����� �ҷ��ͼ� Cn�� ����� �Է°� ����� ��Ī�Ѵ�.
    add3 C_2 (.A(C2), .S(W2));                      
    add3 C_3 (.A(C3), .S(W3));                      
    add3 C_4 (.A(C4), .S(W4));                      
    add3 C_5 (.A(C5), .S(S[4:1]));                  
    add3 C_6 (.A(C6), .S(W6));                      
    add3 C_7 (.A(C7), .S(S[8:5]));                  
                                                   
    assign hunds = S[9:8];                          // ���� �ڸ��� ��Ÿ���� hunds�� S�� ���� 2bit�� �Է��Ѵ�. 
    assign tens = S[7:4];                           // ���� �ڸ��� ��Ÿ���� tens�� S�� ���� 4bit�� �Է��Ѵ�.
    assign units = S[3:0];                          // ���� �ڸ��� ��Ÿ���� units�� S�� ���� 4bit�� �Է��Ѵ�.
    
endmodule
