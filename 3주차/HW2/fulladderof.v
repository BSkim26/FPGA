`timescale 1ns / 1ps


module fulladder1(          // half adder 생성
    input   a, b,           // input 형식 a, b 선언
    output  sum, cout       // output 형식 sum, cout 선언
    );
    
    xor u0 (sum, a, b);     // structural modeling 방식으로 sum = a ^ b 선언
    and u1 (cout, a, b);    // cout = a & b 선언
endmodule
