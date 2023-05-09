`timescale 1ns / 1ps


module tb_vending();
    reg CLK, w100, btn;                             // 입력신호 및 출력신호 선언
    wire ret, sale;

    coffee uut(CLK, w100, btn, ret, sale);          // coffee module 호출
    
    always #10 CLK=~CLK;                            // 20ns 주기로 CLK 변경
    
    initial 
    begin
        CLK<=0; w100<=0; btn<=0;                    // CLK, w100, btn 변경
        #5 w100<=1; btn<=0;
        #20 w100<=0; btn<=1;
        
        #20 w100<=1; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=0; btn<=1;
        
        #20 w100<=1; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=0; btn<=1;
        
        #20 w100<=1; btn<=0;
        #20 w100<=0; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=0; btn<=1;
        
        #20 w100<=0; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=0; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=1; btn<=0;
        #20 w100<=0; btn<=1;
        #20 w100<=0; btn<=0;
        #40 $finish;  
    end

endmodule
