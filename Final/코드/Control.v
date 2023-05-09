`timescale 1ns / 1ps

module Control(
	input clk,
	input [3:0] opcode,
	output reg ALU_Src, Reg_Write,
	output reg [3:0] ALU_op
);
parameter [3:0]    NOP =            4'b0000,        //�� opcode ���� �̸� ���� 
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


	always @(posedge clk)                           //opcode�� ���� ALU ���� ��ȣ, ���� �Է� ���� ��ȣ, register ���� enable ��ȣ ��� 
	begin
		if(opcode==NOP)			                    //opcode :  NOP
		begin
            ALU_op <= NOP;                          //ALU �����ȣ NOP���� ����, Rd2 ����, ���� disable         
            ALU_Src <= 0;
            Reg_Write <= 0;
		end
		
		else if(opcode==Write)			            //opcode :  Write
		begin
            ALU_op <= Write;                        //ALU �����ȣ Write�� ����, instruction 7~4bit ����, ���� enable
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==Read)                       //opcode :  Read              	           
		begin
            ALU_op <= Read;                         //ALU �����ȣ Read�� ����, Rd2 ����, ���� disable        
            ALU_Src <= 0;
            Reg_Write <= 0;
		end
		
        else if(opcode==Copy)                       //opcode :  Copy   			
		begin
            ALU_op <= Copy;                         //ALU �����ȣ Copy�� ����, Rd2 ����, ���� enable               
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==NOT)                        //opcode :  NOT 
		begin
            ALU_op <= NOT;                          //ALU �����ȣ NOT�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==AND)                        //opcode :  AND 
		begin
            ALU_op <= AND;                          //ALU �����ȣ AND�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==OR)                         //opcode :  OR 
		begin
            ALU_op <= OR;                           //ALU �����ȣ OR�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==XOR)                        //opcode :  XOR 
		begin
            ALU_op <= XOR;                          //ALU �����ȣ XOR�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==NAND)                       //opcode :  NAND 
		begin
            ALU_op <= NAND;                         //ALU �����ȣ NAND�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==NOR)                        //opcode :  NOR 
		begin
            ALU_op <= NOR;                          //ALU �����ȣ NOR�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==ADD)                        //opcode :  ADD 
		begin
            ALU_op <= ADD;                          //ALU �����ȣ ADD�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==SUB)                        //opcode :  SUB 
		begin
            ALU_op <= SUB;                          //ALU �����ȣ SUB�� ����, Rd2 ����, ���� enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==ADDI)                       //opcode :  ADDI 
		begin
            ALU_op <= ADDI;                         //ALU �����ȣ ADDI�� ����, instruction 7~4bit ����, ���� enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==SUBI)                       //opcode :  SUBI 
		begin
            ALU_op <= SUBI;                         //ALU �����ȣ SUBI�� ����, instruction 7~4bit ����, ���� enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==Left_Shift)                 //opcode :  Left_Shift 
		begin
            ALU_op <= Left_Shift;                   //ALU �����ȣ Left_Shift�� ����, instruction 7~4bit ����, ���� enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==Right_Shift)                //opcode :  Right_Shift 
		begin
            ALU_op <= Right_Shift;                  //ALU �����ȣ Right_Shift�� ����, instruction 7~4bit ����, ���� enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end

	end

endmodule

