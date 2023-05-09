`timescale 1ns / 1ps



module MUX2bit(
    input   a, b,                               // a, b�� input���� �����Ѵ�.
    input   sel,                                // �Է��� ������ ����� �� �ֵ��� sel�� input���� �����Ѵ�.
    output  out                                 // out�� output���� �����Ѵ�
    );
    
    assign out =    (sel==1'b0) ? a :           // sel�� 0�̶�� a�� ����Ѵ�.
                    (sel==1'b1) ? b : 1'bx;     // sel�� 1�̶�� b�� ����ϰ� �̿��� ���� ������ x�� ����Ѵ�.
                    
endmodule
