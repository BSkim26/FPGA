`timescale 1ns / 1ps

module comparator2(
    input       [1:0] a, b,              // a1, a0, b1, b0를 input으로 선언한다.
    output      a_big, b_big, equal         // a_big, b_big, equal을 output으로 선언한다.
    );
    
    
    assign equal = (~a[1] & ~a[0] & ~b[1] & ~b[0])|(~a[1]& a[0] & ~b[1] & b[0])|(a[1]& a[0] & b[1] & b[0])|(a[1] & ~a[0] & b[1]& ~b[0]);     // truth table을 통해 2bit comparator에서 동일한 값을 가질 경우를 계산한다.
    assign a_big = (a[0] & ~b[1] & ~b[0])|(a[1] & ~b[1])|(a[1] & a[0] & ~b[0]);                                                             // truth table을 통해 2bit comparator에서 a가 더 큰 경우를 계산한다.
    assign b_big = (~a[1] & ~a[0] & b[0])|(~a[1] & b[1])|(~a[0] & b[1] & b[0]);                                                              // truth table을 통해 2bit comparator에서 b가 더 큰 경우를 계산한다.
endmodule