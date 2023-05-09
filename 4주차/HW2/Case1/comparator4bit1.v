`timescale 1ns / 1ps


module comparator4bit1(
    input [3:0] a, b,               // 4bit a, b를 input으로 선언한다.
    output equal, a_big, b_big      // a_big과 b_big, equal을 output으로 선언한다.
    );
    wire [1:0] eq, a_bigger, b_bigger;               //wire 형식으로 2bit eq, a_bigger, b_bigger를 선언한다.

    comparator2 u0 (.a(a[1:0]), .b(b[1:0]), .a_big(a_bigger[0]), .b_big(b_bigger[0]), .equal(eq[0]));   // comparator2를 u0로 불러와서 인자들을 넣어준다.
    comparator2 u1 (.a(a[3:2]), .b(b[3:2]), .a_big(a_bigger[1]), .b_big(b_bigger[1]), .equal(eq[1]));   // comparator2를 u1으로 불러와서 인자들을 넣어준다.
    
    assign equal = eq[0] & eq[1];                           //  eq[0], eq[1]이 모두 1이면 모든 bit가 같은 것 이므로 equal이 1이 된다.
    assign a_big = (a_bigger[1] | (a_bigger[0] & eq[1]));     //  a의 두번째 bit가 b보다 크거나 두번째 bit는 같은데 첫번째 bit가 더 큰 경우 a가 더 큰 것이므로 a_big이 1이 된다.
    assign b_big = (b_bigger[1] | (b_bigger[0] & eq[1]));     //  b의 두번째 bit가 a보다 크거나 두번째 bit는 같은데 첫번째 bit가 더 큰 경우 b가 더 큰 것이므로 b_big이 1이 된다.
endmodule
