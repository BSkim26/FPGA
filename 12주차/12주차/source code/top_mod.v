`timescale 1ns / 1ps

module top_mod(
    input  clk,                     //input���� clk,rstn,2bit pattern_select ����
    input  rstn,    
    input  [1:0] pattern_select,
    output o_vs,                    //output���� o_vs, o_hs, 4bit  o_r_data, o_g_data, o_b_data ����
    output o_hs,    
    output [3:0] o_r_data,
    output [3:0] o_g_data,
    output [3:0] o_b_data
    );
    
    wire clk_125M=clk;              //wire�� clk_125M ���� �� clk�� ����
    wire clk_25_2M;                 //wire�� clk_25_2M����
    
    clk_wiz_0 U0(.clk_out1(clk_25_2M), .reset(~rstn), .clk_in1(clk_125M));              //clock wiz
    pattern_gen U1(clk_25_2M,rstn,pattern_select,o_vs,o_hs,o_r_data,o_g_data,o_b_data); //pattern_gen
    
endmodule
