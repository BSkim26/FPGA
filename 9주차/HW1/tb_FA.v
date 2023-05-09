`timescale 1ns / 1ps

module tb_FA();
    reg A, B, Cin;                                                  // reg로 A, B, Cin선언
    wire Sum, Cout;                                                 // wire로 Sum, Cout선언
    
    FA uut(.X(A), .Y(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));        // uut 선언후 입력과 출력 연결
    
        
    initial begin                               // A, B, Cin에 대한 모든 입력 비교
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
