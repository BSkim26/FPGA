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
    begin                                                       //Reg ��� 0���� �ʱ�ȭ, ���� �Է� ��ȣ �ʱ�ȭ (�ʱ� ����)
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
        Reg_out1 <= Reg[instruction[11:8]];                     //ù��° ���� �Է� : instruction 11~8bit ��° register�� ����� ��          
        
        if(ALU_Src == 0)                                        //ALU_Src 0 �� ���
            Reg_out2 <= Reg[instruction[7:4]];                  //�ι�° ���� �Է� : instruction 7~4bit ��° register�� ����� ��            
        else                                                    //ALU_Src 1 �� ���
            Reg_out2 <= instruction[7:4];                       //�ι�° ���� �Է� : instruction 7~4bit
        
        if(Reg_Write && Reg_Store)                              //Reg_Write(���� enable) �� Reg_Store(Register ���� ���� ��ȣ) 1�� ��
        begin
            if(instruction[3:0] != 4'b0 && Overflow != 1'b1)    //�����ؾ߉� �������Ͱ� 0�� �������Ͱ� �ƴϰų� overflow�� �߻����� �ʾ��� ��
                Reg[instruction[3:0]] <= Write_data;            //ALU ���� ��� �ش� Register�� ����
        end
    end
endmodule