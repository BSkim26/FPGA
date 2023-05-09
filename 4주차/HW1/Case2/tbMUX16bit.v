`timescale 1ns / 1ps



module tbMUX16bit();
    reg [15:0] D;                   //16bit의 D를 reg 형식으로 선언한다.
    reg [3:0] sel;                  //4bit의 sel을 reg 형식으로 선언한다.
    wire out;                       // out을 wire 형식으로 선언한다.
    
   MUX16bit uut(D, sel, out);       // D, sel, out을 인자로 받는 MUX16bit를 uut로 호출한다.
    
    initial                         //입력에 따른 결과를 분석하기 위하여 값을 대입한다.
    begin
         sel=4'b0000;  D=16'h0000;
    #100 sel=4'b0100; D=16'h0100;
    #100 sel=4'b0100; D=16'h0110;
    #100 sel=4'b0010; D=16'h1100;
    #100 sel=4'b1001; D=16'h0100;
    #100 sel=4'b0110; D=16'h1010;
    #100 sel=4'b0101; D=16'h0110;
    #100 $finish;
    end
    
endmodule
