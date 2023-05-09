`timescale 1ns / 1ps


module fulladder2(                                              // 1bit full adder
    input   a, b, cin,                                          // input 형식으로 a, b, cin 선언
    output  cout, sum                                           // output 형식으로 cout, sum 선언
    );
    wire s1, c1, c2;                                            // wire 형식으로 s1, c1, c2 선언
    
    fulladder1  uut (.a(a), .b(b), .sum(s1), .cout(c1));        // half adder를 uut로 instanciation 한다.
    fulladder1  uu (.a(s1), .b(cin), .sum(sum), .cout(c2));     // half adder를 uu로 instanciation 한다.
    assign cout=c1|c2;                                          // assign 형식으로 cout = c1 or c2 를 선언한다.
endmodule
