`timescale 1ns / 1ps


module fulladder3(
    input   [3:0] x, y,         // input �������� 4Bit x�� y�� �����Ѵ�.
    input   cin,                // input �������� cin�� adder/substractor�� �����ϴ� as�� �����Ѵ�.
    output  cout,               // output �������� cout�� �����Ѵ�.
    output  [3:0] sum,          // input �������� 4Bit sum�� �����Ѵ�.
    output  of                  // overflow�� detection�ϴ� output of�� �����Ѵ�.

    );
    
    wire [2:0] c;               // wire �������� 3bit c�� �����Ѵ�.
    wire [3:0] f;               // wire �������� 4bit f�� �����Ѵ�.
    
    xor xor1(f[0], cin, y[0]);  // ù��° bit�� xor�� ���� substractor��� ������Ű�� adder�� �״�� ���´�.
    xor xor2(f[1], cin, y[1]);  // �ι�° bit�� xor�� ���� substractor��� ������Ű�� adder�� �״�� ���´�.
    xor xor3(f[2], cin, y[2]);  // ����° bit�� xor�� ���� substractor��� ������Ű�� adder�� �״�� ���´�.
    xor xor4(f[3], cin, y[3]);  // �׹�° bit�� xor�� ���� substractor��� ������Ű�� adder�� �״�� ���´�.
    
    assign of = (x[3]&f[3]& ~sum[3]) + (~x[3]& ~f[3]& sum[3]);  // overflow�� detection�� �� �ִ� logic�� �����Ѵ�.
    //assign of= c[2]^cout;
    
    fulladder2  u0  (.a(x[0]), .b(f[0]), .cin(cin), .cout(c[0]), .sum(sum[0]));     //1bit full adder�� instanciation �Ͽ� ������ ���ڵ��� ���� �������ش�.
    fulladder2  u1  (.a(x[1]), .b(f[1]), .cin(c[0]), .cout(c[1]), .sum(sum[1]));    //
    fulladder2  u2  (.a(x[2]), .b(f[2]), .cin(c[1]), .cout(c[2]), .sum(sum[2]));    //
    fulladder2  u3  (.a(x[3]), .b(f[3]), .cin(c[2]), .cout(cout), .sum(sum[3]));    //������ 1bit full adder�� instanciation �Ѵ�.
    
endmodule
