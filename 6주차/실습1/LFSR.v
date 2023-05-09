`timescale 1ns / 1ps


module LFSR(                    //input���� CLK�� RST�� �����ϰ� output���� 4bit out�� �����Ѵ�.
    input CLK,              
    input RST,
    output reg [1:4] out
    );
    
    always @(posedge CLK)       //CLK�� ��¿������� ����Ǵ� always���� �����Ѵ�.
    begin
        if(!RST)                //RST�� 0�̶�� ����Ǵ� if���̴�.
        begin
            out<=4'b1000;       //out�� 1000���� �����Ѵ�.
        end
        else
        begin
            out<={out[1]^out[4],out[1:3]};      // out�� ù��Ʈ�� out1 xor out4�� �����ϰ� ������ 3��Ʈ�� out�� 1~3bit�� �����´�.
        end
        
     end
        
endmodule
