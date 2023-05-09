`timescale 1ns / 1ps


module comparator4bit1(
    input [3:0] a, b,               // 4bit a, b�� input���� �����Ѵ�.
    output equal, a_big, b_big      // a_big�� b_big, equal�� output���� �����Ѵ�.
    );
    wire [1:0] eq, a_bigger, b_bigger;               //wire �������� 2bit eq, a_bigger, b_bigger�� �����Ѵ�.

    comparator2 u0 (.a(a[1:0]), .b(b[1:0]), .a_big(a_bigger[0]), .b_big(b_bigger[0]), .equal(eq[0]));   // comparator2�� u0�� �ҷ��ͼ� ���ڵ��� �־��ش�.
    comparator2 u1 (.a(a[3:2]), .b(b[3:2]), .a_big(a_bigger[1]), .b_big(b_bigger[1]), .equal(eq[1]));   // comparator2�� u1���� �ҷ��ͼ� ���ڵ��� �־��ش�.
    
    assign equal = eq[0] & eq[1];                           //  eq[0], eq[1]�� ��� 1�̸� ��� bit�� ���� �� �̹Ƿ� equal�� 1�� �ȴ�.
    assign a_big = (a_bigger[1] | (a_bigger[0] & eq[1]));     //  a�� �ι�° bit�� b���� ũ�ų� �ι�° bit�� ������ ù��° bit�� �� ū ��� a�� �� ū ���̹Ƿ� a_big�� 1�� �ȴ�.
    assign b_big = (b_bigger[1] | (b_bigger[0] & eq[1]));     //  b�� �ι�° bit�� a���� ũ�ų� �ι�° bit�� ������ ù��° bit�� �� ū ��� b�� �� ū ���̹Ƿ� b_big�� 1�� �ȴ�.
endmodule
