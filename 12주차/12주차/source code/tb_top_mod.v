`timescale 1ns / 1ps

module tb_top_mod();
    reg  clk;                           //input�� reg Ÿ������ ����
    reg  rstn;    
    reg  [1:0] pattern_select;
    wire o_vs;                         //output�� wire Ÿ������ ����
    wire o_hs;   
    wire [3:0] o_r_data;
    wire [3:0] o_g_data;
    wire [3:0] o_b_data;
                                       //uut ���� �� �� input, output ����
    top_mod UUT(clk,rstn,pattern_select,o_vs,o_hs,o_r_data,o_g_data,o_b_data);
                        
    always #4 clk=~clk;                //�� 4ns���� clk ���� (125MHz)
    
    initial begin
            clk=0;  rstn=0;   pattern_select=2'b00;   //pattern0 ���
      #10           rstn=1; 
    end

endmodule
