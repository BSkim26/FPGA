`timescale 1ns / 1ps

module comparator4bit(      
    input [3:0] a, b,  // 4bit a, b�� input���� �����Ѵ�.
    output reg a_big, b_big, equal  // a_big�� b_big, equal�� output���� �����Ѵ�.
    );

    
    always @ (*)    // ��� �Է��� �ٲ���� ����ǵ��� *�� ���ڷ� �޴� always ���� �����Ѵ�.
    begin
        if (a == b) begin                       // a�� b ���� ���� ������ ����ȴ�.
        a_big = 0;                      
        b_big = 0;
        equal = 1;                              // ���� ����̹Ƿ� equal�� 1�� �ְ� ������ output�� 0���� �����Ѵ�.
        end
        
        else if (a > b)  begin                  // a�� b���� ũ�� ����ȴ�.
        a_big = 1;  
        b_big = 0;  
        equal = 0;                              // a�� ū ����̹Ƿ� a_big�� 1�� �ְ� ������ output�� 0���� �����Ѵ�.
        end
        
        else if (a < b)  begin                  // a�� b���� ������ ����ȴ�.
        a_big = 0;
        b_big = 1;
        equal = 0;                              //b�� ū ����̹Ƿ� b_big�� 1�� �ְ� ������ output�� 0���� �����Ѵ�
        end
  
        else begin                              // ��� ��쵵 �ش���� �ʴ� ��� ����ȴ�.
        a_big <= 1'bx;  b_big <= 1'bx;  equal <= 1'bx;      //��� output�� x�� �����Ѵ�.
        end
    end
    
endmodule

