`timescale 1ns / 1ps


module LFSR(                    //input으로 CLK와 RST를 설정하고 output으로 4bit out을 설정한다.
    input CLK,              
    input RST,
    output reg [1:4] out
    );
    
    always @(posedge CLK)       //CLK의 상승에지에서 실행되는 always문을 설정한다.
    begin
        if(!RST)                //RST가 0이라면 실행되는 if문이다.
        begin
            out<=4'b1000;       //out을 1000으로 설정한다.
        end
        else
        begin
            out<={out[1]^out[4],out[1:3]};      // out의 첫비트를 out1 xor out4로 설정하고 나머지 3비트는 out의 1~3bit를 가져온다.
        end
        
     end
        
endmodule
