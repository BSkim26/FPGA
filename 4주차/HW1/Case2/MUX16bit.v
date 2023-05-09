`timescale 1ns / 1ps


module MUX16bit(
    input [15:0] D,                                        // 16bit�� D�� input���� �����Ѵ�.
    input [3:0] sel,                                       //4bit�� sel�� input���� �����Ѵ�.
    output out                                             //out�� output���� �����Ѵ�.
    );
    wire Y1, Y2;                                           //Y1, Y2�� wire�� �����Ѵ�.

    
    MUX8bit u1(.a(D[7:0]), .sel(sel[2:0]), .out(Y1));       // D�� 8bit��, sel�� ����, output�� Y1�� �޾� �� MUX�� �Է°� ����� ��Ī�Ѵ�. 
    MUX8bit u2(.a(D[15:8]), .sel(sel[2:0]), .out(Y2));      // D�� 8bit��, sel�� ����, output�� Y2�� �޾� �� MUX�� �Է°� ����� ��Ī�Ѵ�. 
    
    MUX2bit u3(.a(Y1), .b(Y2), .sel(sel[3]), .out(out));    // �ռ� �ܿ��� ���� ��� Y1, Y2�� �Է����� ����ϰ� sel�� �̿��� out�� ����س���.
endmodule
