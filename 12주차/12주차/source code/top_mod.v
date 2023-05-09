`timescale 1ns / 1ps

module top_mod(
    input  clk,                     //input으로 clk,rstn,2bit pattern_select 선언
    input  rstn,    
    input  [1:0] pattern_select,
    output o_vs,                    //output으로 o_vs, o_hs, 4bit  o_r_data, o_g_data, o_b_data 선언
    output o_hs,    
    output [3:0] o_r_data,
    output [3:0] o_g_data,
    output [3:0] o_b_data
    );
    
    wire clk_125M=clk;              //wire로 clk_125M 선언 후 clk와 연결
    wire clk_25_2M;                 //wire로 clk_25_2M선언
    
    clk_wiz_0 U0(.clk_out1(clk_25_2M), .reset(~rstn), .clk_in1(clk_125M));              //clock wiz
    pattern_gen U1(clk_25_2M,rstn,pattern_select,o_vs,o_hs,o_r_data,o_g_data,o_b_data); //pattern_gen
    
endmodule
