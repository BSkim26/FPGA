`timescale 1ns / 1ps

module tb_top_seg;                                          //reg형식과 wire형식으로 input, output을 연결한다.
    reg   clk, rst, start, stop;
    wire  [1:0]   seg_en;
    wire  [6:0]   seg_ab;
    wire  [6:0]   seg_cd;
    
    top_seg UUT(clk,rst,start,stop,seg_en,seg_ab,seg_cd);   //uut로 top_seg를 불러온다.
    
    always #4 clk=~clk;                                     // freq 125Mhz
    
    initial begin                                           // 변수르 바꿔가며 출력 측정
                clk=0;  rst=1;  start=0; stop=0;
        #3              rst=0;  start=1; stop=0;
    end 
    
endmodule
