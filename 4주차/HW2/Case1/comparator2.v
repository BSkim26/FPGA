`timescale 1ns / 1ps

module comparator2(
    input       [1:0] a, b,              // a1, a0, b1, b0�� input���� �����Ѵ�.
    output      a_big, b_big, equal         // a_big, b_big, equal�� output���� �����Ѵ�.
    );
    
    
    assign equal = (~a[1] & ~a[0] & ~b[1] & ~b[0])|(~a[1]& a[0] & ~b[1] & b[0])|(a[1]& a[0] & b[1] & b[0])|(a[1] & ~a[0] & b[1]& ~b[0]);     // truth table�� ���� 2bit comparator���� ������ ���� ���� ��츦 ����Ѵ�.
    assign a_big = (a[0] & ~b[1] & ~b[0])|(a[1] & ~b[1])|(a[1] & a[0] & ~b[0]);                                                             // truth table�� ���� 2bit comparator���� a�� �� ū ��츦 ����Ѵ�.
    assign b_big = (~a[1] & ~a[0] & b[0])|(~a[1] & b[1])|(~a[0] & b[1] & b[0]);                                                              // truth table�� ���� 2bit comparator���� b�� �� ū ��츦 ����Ѵ�.
endmodule