`timescale 1ns / 1ps
module tb_comparator_2bit();

    reg [1:0] A, B;                             //reg 타입으로 2bit A, B 선언
    
    wire    A_Big, B_Big, Equal;                //wire 타입으로 A_Big, B_Big, Equal선언

comparator_2bit uut(A,B,A_Big, B_Big, Equal);   //uut 선언 후 각 입력, 출력 연결

initial begin                                   //A = 0~3, B = 0~3까지 모든 경우 비교
                A=0;    B=0;
     #10        A=1;    B=0;
     #10        A=2;    B=0;
     #10        A=3;    B=0;
     
     #10        A=0;    B=1;
     #10        A=1;    B=1;
     #10        A=2;    B=1;
     #10        A=3;    B=1;
     
     #10        A=0;    B=2;
     #10        A=1;    B=2;
     #10        A=2;    B=2;
     #10        A=3;    B=2;
     
     #10        A=0;    B=3;
     #10        A=1;    B=3;
     #10        A=2;    B=3;
     #10        A=3;    B=3;
     #10        $finish;                        //160ns 후 testbench 종료
end

endmodule
