`timescale 1ns / 1ps

module tb_top_mod();
    reg  clk;                           //input을 reg 타입으로 선언
    reg  rstn;    
    reg  [1:0] pattern_select;
    wire o_vs;                         //output을 wire 타입으로 선언
    wire o_hs;   
    wire [3:0] o_r_data;
    wire [3:0] o_g_data;
    wire [3:0] o_b_data;
                                       //uut 선언 후 각 input, output 연결
    top_mod UUT(clk,rstn,pattern_select,o_vs,o_hs,o_r_data,o_g_data,o_b_data);
                        
    always #4 clk=~clk;                //매 4ns마다 clk 반전 (125MHz)
    
    initial begin
            clk=0;  rstn=0;   pattern_select=2'b00;   //pattern0 출력
      #10           rstn=1; 
    end

endmodule
