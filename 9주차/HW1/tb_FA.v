`timescale 1ns / 1ps

module tb_FA();
    reg A, B, Cin;                                                  // reg�� A, B, Cin����
    wire Sum, Cout;                                                 // wire�� Sum, Cout����
    
    FA uut(.X(A), .Y(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));        // uut ������ �Է°� ��� ����
    
        
    initial begin                               // A, B, Cin�� ���� ��� �Է� ��
                A<=0; B<=0; Cin<=0;
         #10    A<=0; B<=0; Cin<=1;
         #10    A<=0; B<=1; Cin<=0;
         #10    A<=0; B<=1; Cin<=1;
         #10    A<=1; B<=0; Cin<=0;
         #10    A<=1; B<=0; Cin<=1;
         #10    A<=1; B<=1; Cin<=0;
         #10    A<=1; B<=1; Cin<=1;
         #10    $finish;
         
    end

endmodule
