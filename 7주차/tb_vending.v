`timescale 1ns / 1ps


module tb_vending();
    reg CLK, w100, btn;                             // �Է½�ȣ �� ��½�ȣ ����
    wire ret, sale;

    coffee uut(CLK, w100, btn, ret, sale);          // coffee module ȣ��
    
    always #10 CLK=~CLK;                            // 20ns �ֱ�� CLK ����
    
    initial 
    begin
        CLK<=0; w100<=0; btn<=0;                    // CLK, w100, btn ����
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
