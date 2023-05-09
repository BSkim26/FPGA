`timescale 1ns / 1ps

module Reg(
    input clk,
    input Reg_Write, ALU_Src,                    
    input Reg_Store,                                
    input Overflow,                             
    input [3:0] Write_data,
    input [11:0] instruction,
    output reg [3:0] Reg_out1, Reg_out2
    );
    
    reg [3:0] Reg [15:0];                        
    
    initial                                       
    begin                                                       //Reg 모두 0으로 초기화, 연산 입력 신호 초기화 (초기 설정)
        Reg [0] = 4'b0000;
        Reg [1] = 4'b0000;
        Reg [2] = 4'b0000;
        Reg [3] = 4'b0000;
        Reg [4] = 4'b0000;
        Reg [5] = 4'b0000;
        Reg [6] = 4'b0000;
        Reg [7] = 4'b0000;
        Reg [8] = 4'b0000;
        Reg [9] = 4'b0000;
        Reg [10] = 4'b0000;
        Reg [11] = 4'b0000;
        Reg [12] = 4'b0000;
        Reg [13] = 4'b0000;
        Reg [14] = 4'b0000;
        Reg [15] = 4'b0000;
        Reg_out1 = 0;
        Reg_out2 = 0;
    end
    
    always @(posedge clk)                                       
    begin
        Reg_out1 <= Reg[instruction[11:8]];                     //첫번째 연산 입력 : instruction 11~8bit 번째 register에 저장된 값          
        
        if(ALU_Src == 0)                                        //ALU_Src 0 일 경우
            Reg_out2 <= Reg[instruction[7:4]];                  //두번째 연산 입력 : instruction 7~4bit 번째 register에 저장된 값            
        else                                                    //ALU_Src 1 일 경우
            Reg_out2 <= instruction[7:4];                       //두번째 연산 입력 : instruction 7~4bit
        
        if(Reg_Write && Reg_Store)                              //Reg_Write(쓰기 enable) 와 Reg_Store(Register 저장 시작 신호) 1일 때
        begin
            if(instruction[3:0] != 4'b0 && Overflow != 1'b1)    //저장해야됳 레지스터가 0번 레지스터가 아니거나 overflow가 발생하지 않았을 시
                Reg[instruction[3:0]] <= Write_data;            //ALU 연산 결과 해당 Register에 저장
        end
    end
endmodule