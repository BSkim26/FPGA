`timescale 1ns / 1ps

module ALU(
    input clk,
    input Execute_St,
    input Overflow_St,
    input [3:0] ALU_op,
    input [3:0] Reg_out1,
    input [3:0] Reg_out2,
    output reg [3:0] result,
    output reg Overflow
    );
   
   parameter [3:0]      NOP =           4'b0000,                //ALU ���� �̸� ����
                         Write =         4'b0001,
                         Read =          4'b0010,
                         Copy =          4'b0011,
                         NOT =           4'b0100,
                         AND =           4'b0101,
                         OR =            4'b0110,
                         XOR =           4'b0111,
                         NAND =          4'b1000,
                         NOR =           4'b1001,
                         ADD =           4'b1010,
                         SUB =           4'b1011,
                         ADDI =          4'b1100,
                         SUBI =          4'b1101,
                         Left_Shift =    4'b1110,
                         Right_Shift =   4'b1111;
                                        
    wire [3:0] Add_Result;
    wire Add_Sub;                     
    wire Add_Cout;
    wire Overflow_Result;
    
    assign Add_Sub = (ALU_op == ADD | ALU_op == ADDI) ? 0 : 1;  //Add_Sub�� ������ ��� 0, ������ ��� 1
    
    Adder_Subtractor a0 (.A(Reg_out1), .B(Reg_out2), .Add_Sub(Add_Sub), .Add_Cout(Add_Cout), .Overflow(Overflow_Result), .Sum(Add_Result));

    initial                                                     //�ʱ� ����
    begin
        result = 0;
        Overflow = 0;
    end
    
    always @(posedge clk)                                                           
    begin
    if(Overflow_St == 1)                                                            //Overflow Ȯ�� ��ȣ �Է� ��
    begin
            if((ALU_op == ADD | ALU_op == ADDI | ALU_op == SUB | ALU_op == SUBI))   //���� or ���� ������ ���
            begin
                Overflow <= Overflow_Result;                                        //Overflow ����� overflow�� ���
            end
            else                                                                    //�ٸ� ��� Overflow = 0
                Overflow <= 0;
        end
    end
    
    always @(posedge clk)
    begin
    if(Execute_St == 1)                                                             //���� ���� �Է� ��
    begin
        case(ALU_op)                
            NOP : result[3:0] <= 0;                                                 //ALU ���� �ڵ忡 ���� �ش� ���� ����
            Write : result[3:0] <= Reg_out2[3:0];                        
            Read, Copy : result[3:0] <= Reg_out1[3:0];                   
            NOT: result[3:0] <= ~Reg_out1[3:0];                          
            AND: result[3:0] <= Reg_out1[3:0] & Reg_out2[3:0];           
            OR: result[3:0] <= Reg_out1[3:0] | Reg_out2[3:0];            
            XOR: result[3:0] <= Reg_out1[3:0] ^ Reg_out2[3:0];           
            NAND: result[3:0] <= ~(Reg_out1[3:0] & Reg_out2[3:0]);       
            NOR: result[3:0] <= ~(Reg_out1[3:0] | Reg_out2[3:0]);        
            ADD, ADDI: result[3:0] <= Add_Result[3:0];                   
            SUB, SUBI: result[3:0] <= Add_Result[3:0];                   
            Left_Shift:                                                             //ALU ���� �ڵ� Left_Shift �� ��                                        
            begin
                if(Reg_out2 == 0) result[3:0] <= Reg_out1[3:0];                     //shift ������ ���� �ش� �� Left Shift
                else if(Reg_out2 == 1)
                begin
                    result[3:1] <= Reg_out1[2:0];
                    result[0] <= 1'b0;
                end
                else if(Reg_out2 == 2)
                begin
                    result[3:2] <= Reg_out1[1:0];
                    result[1:0] <= 2'b00;
                end
                else if(Reg_out2 == 3)
                begin
                    result[3] <= Reg_out1[0];
                    result[2:0] <= 3'b000;
                end
                else result[3:0] <= 0;
            end
            
            Right_Shift:                                                            //ALU ���� �ڵ� Right_Shift �� ��                                                  
            begin
                if(Reg_out2 == 0) result[3:0] <= Reg_out1[3:0];                     //shift ������ ���� �ش� �� Right Shift
                else if(Reg_out2 == 1)
                begin
                    result[3] <= 1'b0;
                    result[2:0] <= Reg_out1[3:1];
                end
                else if(Reg_out2 == 2)
                begin
                    result[3:2] <= 2'b00;
                    result[1:0] <= Reg_out1[3:2];
                end
                else if(Reg_out2 == 3)
                begin
                    result[3:1] <= 3'b000;
                    result[0] <= Reg_out1[3];
                end
                else result[3:0] <= 0;
            end
        endcase
        end
    end
    
    
endmodule
