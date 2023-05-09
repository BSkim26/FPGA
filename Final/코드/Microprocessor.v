`timescale 1ns / 1ps

module Microprocessor(                  
    input clk,
    input [3:0] sw,         
    input [3:0] btn,         
    output [3:0] led,            
    output [1:0] seg_en,          
    output [6:0] seg_ab, seg_cd     
    );
 
    wire clk_125M = clk;
    wire clk_100M, clk_1M, clk_10K, clk_100, clk_10;
    wire ALU_Src, Reg_Write, Execute_St, Overflow_St, Reg_Store;     //ALU_Src : ALU 입력 선택 신호,      Reg_Write : Register 쓰기 enable 신호
    wire Overflow;                                                   //Execute_St : ALU 연산 시작 신호,   Overflow_St : Overflow 확인 시작 신호
    wire [3:0] ALU_op;                                               //Reg_Store : ALU 연산 결과 Register 저장 시작 신호   
    wire [3:0] Reg_out1, Reg_out2;     
    wire [3:0] s_btn;      
    wire [3:0] d_btn;          
    wire [3:0] top_result;                             
    wire [15:0] instruction;                   

     clk_wiz_0 clk_gen(clk_100M, btn[2], clk_125M);                                     
    
    freq_div_100 u0(.clk_ref(clk_100M), .rst(btn[2]), .clk_div(clk_1M));                        //100MHz -> 1MHz
    freq_div_100 u1(.clk_ref(clk_1M), .rst(btn[2]), .clk_div(clk_10K));                         //1MHz   -> 10kHz
    freq_div_100 u2(.clk_ref(clk_10K), .rst(btn[2]), .clk_div(clk_100));                        //10kHz  -> 100Hz
    freq_div_20 u3(.clk_ref(clk_100), .rst(btn[2]), .clk_div(clk_10));                          //100Hz  -> 10Hz
   
    syncronizer sync0 (.clk(clk_100M), .async_in(btn[0]),   .sync_out(s_btn[0]));               //0번 버튼 syncronize
    syncronizer sync1 (.clk(clk_100M), .async_in(btn[1]),   .sync_out(d_btn[1]));               //1번 버튼 syncronize
    syncronizer sync2 (.clk(clk_100M), .async_in(btn[2]),   .sync_out(s_btn[2]));               //2번 버튼 syncronize
    syncronizer sync3 (.clk(clk_100M), .async_in(btn[3]),   .sync_out(s_btn[3]));               //3번 버튼 syncronize
    
    debouncer debouncer0 (.clk(clk_100M), .noisy(s_btn[0]),     .debounced(d_btn[0]));          //0번 버튼 debounce
    debouncer debouncer1 (.clk(clk_100M), .noisy(s_btn[2]),     .debounced(d_btn[2]));          //1번 버튼 debounce
    debouncer debouncer2 (.clk(clk_100M), .noisy(s_btn[3]),     .debounced(d_btn[3]));          //2번 버튼 debounce
   
    IO IO (.clk(clk_100M), .clk_1M(clk_1M) , .clk_10(clk_10), .Overflow(Overflow), .sw(sw), .btn(d_btn), .result(top_result), .led(led),
     .seg_en(seg_en), .seg_ab(seg_ab), .seg_cd(seg_cd)  ,.Execute_St(Execute_St), .Overflow_St(Overflow_St), .Reg_Store(Reg_Store), .instruction(instruction));
     
    Control Control (.clk(clk_100M), .opcode(instruction[15:12]), .ALU_Src(ALU_Src), .Reg_Write(Reg_Write), .ALU_op(ALU_op));

    Reg Reg (.clk(clk_100M),  .Reg_Write(Reg_Write), .ALU_Src(ALU_Src), .Reg_Store(Reg_Store), .Overflow(Overflow), 
     .Write_data(top_result), .instruction(instruction[11:0]), .Reg_out1(Reg_out1), .Reg_out2(Reg_out2));
    
    ALU ALU (.clk(clk_100M), .Execute_St(Execute_St), .Overflow_St(Overflow_St), .ALU_op(ALU_op), .Reg_out1(Reg_out1), .Reg_out2(Reg_out2), 
    .result(top_result), .Overflow(Overflow));
endmodule
