`timescale 1ns / 1ps



module Multiplexer(
    input   a, b, c, d,                         // a, b, c,d �� input �������� �����Ѵ�.
    input [1:0] sel,                            // �Է��� ������ ����� �� �ֵ��� 2bit sel�� �����Ѵ�.
    output  out                                 // out�� output �������� �����Ѵ�.
    );
    
    assign out =    (sel==2'b00) ? a :          // sel�� 00�̶�� a�� ����Ѵ�.
                    (sel==2'b01) ? b :          // sel�� 01�̶�� b�� ����Ѵ�.
                    (sel==2'b10) ? c :          // sel�� 10�̶�� c�� ����Ѵ�.
                    (sel==2'b11) ? d : 1'bx;    // sel�� 11�̶�� d�� ����ϰ� �� ���� ��찡 �߻��ϸ� x�� ����Ѵ�.
                    
endmodule
