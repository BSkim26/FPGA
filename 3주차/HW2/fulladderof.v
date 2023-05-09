`timescale 1ns / 1ps


module fulladder1(          // half adder ����
    input   a, b,           // input ���� a, b ����
    output  sum, cout       // output ���� sum, cout ����
    );
    
    xor u0 (sum, a, b);     // structural modeling ������� sum = a ^ b ����
    and u1 (cout, a, b);    // cout = a & b ����
endmodule
