`timescale 1ns / 1ps

module tbcomparator4bit();
    
    reg [3:0] a, b;                 // 4bit a, b�� reg�������� �����Ѵ�.
    wire a_big, b_big, equal;       // output�� ��Ÿ���� a_big, b_big, equal�� wire�� �����Ѵ�.
    
    comparator4bit uut (.a(a), .b(b), .a_big(a_big), .b_big(b_big), .equal(equal)); //comparator4bit�� uut�� ȣ���Ѵ�.
    
   initial                         // ���� �����Ͽ� ����� �ǰ� �������� Ȯ���Ѵ�.
    begin
             a = 4'h0;   b = 4'h0;
        #50  a = 4'h4;   b = 4'h3;
        #50  a = 4'h5;   b = 4'hb;
        #50  a = 4'h3;   b = 4'ha;
        #50  a = 4'ha;   b = 4'h8;
        #50  a = 4'hb;   b = 4'h1;
        #50  a = 4'h4;   b = 4'ha;
        #50  a = 4'hd;   b = 4'hd;
        #50;    $finish;
    end
    
endmodule


