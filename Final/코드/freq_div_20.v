`timescale 1ns / 1ps

module freq_div_20(
    input clk_ref,
    input rst,
    output reg clk_div
    );
    
    reg [5:0] count;       
    
    always @ (posedge clk_ref or posedge rst)           //clk_ref�� postive edge �ų� rst�� postive edge�� ��
    begin
        if(rst)                                         //rst�� 1�̸� (reset)
        begin
            count   <= 6'd0;                            //count, ��� 0���� �ʱ�ȭ
            clk_div <= 1'd0;
        end
        else
        begin
            if(count == 6'd9)                          //count 9�� (10�� count �Ǿ��ٸ�)
            begin
                count   <=6'd0;                         //count 0���� �ʱ�ȭ, ��� clock ����
                clk_div <= ~clk_div;
            end
            else                 
            begin
                count <= count +1'b1;                   //count 1 ����
            end
        end
    end
endmodule
