`timescale 1ns / 1ps


module fulladder2(                                              // 1bit full adder
    input   a, b, cin,                                          // input �������� a, b, cin ����
    output  cout, sum                                           // output �������� cout, sum ����
    );
    wire s1, c1, c2;                                            // wire �������� s1, c1, c2 ����
    
    fulladder1  uut (.a(a), .b(b), .sum(s1), .cout(c1));        // half adder�� uut�� instanciation �Ѵ�.
    fulladder1  uu (.a(s1), .b(cin), .sum(sum), .cout(c2));     // half adder�� uu�� instanciation �Ѵ�.
    assign cout=c1|c2;                                          // assign �������� cout = c1 or c2 �� �����Ѵ�.
endmodule
