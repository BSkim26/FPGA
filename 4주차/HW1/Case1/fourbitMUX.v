`timescale 1ns / 1ps


module fourbitMUX(
    input [15:0] D,                     // 16bit�� D�� input���� �����Ѵ�.
    input [3:0] sel,                    // 4bit�� sel�� input���� �����Ѵ�.
    output out                          // out�� output���� �����Ѵ�.
    );      
    wire Y1, Y2, Y3, Y4;                // Y1, Y2, Y3, Y4�� wire�� �����Ѵ�.
    
    
    Multiplexer u0 (.a(D[0]), .b(D[1]), .c(D[2]), .d(D[3]), .sel(sel[1:0]), .out(Y1));          // D�� 4bit��, sel�� ����, output�� Y1�� �޾� �� MUX�� �Է°� ����� ��Ī�Ѵ�. 
    Multiplexer u1 (.a(D[4]), .b(D[5]), .c(D[6]), .d(D[7]), .sel(sel[1:0]), .out(Y2));          // D�� 4bit��, sel�� ����, output�� Y2�� �޾� �� MUX�� �Է°� ����� ��Ī�Ѵ�.
    Multiplexer u2 (.a(D[8]), .b(D[9]), .c(D[10]), .d(D[11]), .sel(sel[1:0]), .out(Y3));        // D�� 4bit��, sel�� ����, output�� Y3�� �޾� �� MUX�� �Է°� ����� ��Ī�Ѵ�.
    Multiplexer u3 (.a(D[12]), .b(D[13]), .c(D[14]), .d(D[15]), .sel(sel[1:0]), .out(Y4));      // D�� 4bit��, sel�� ����, output�� Y4�� �޾� �� MUX�� �Է°� ����� ��Ī�Ѵ�.
    
    Multiplexer u4 (.a(Y1), .b(Y2), .c(Y3), .d(Y4), .sel(sel[3:2]), .out(out));                 // �ռ� �ܿ��� ���� ��� Y1, Y2, Y3, Y4�� �Է����� ����ϰ� sel�� 2bit�� �̿��� out�� ����س���.
endmodule
