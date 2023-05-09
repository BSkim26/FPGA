`timescale 1ns / 1ps

module Control(
	input clk,
	input [3:0] opcode,
	output reg ALU_Src, Reg_Write,
	output reg [3:0] ALU_op
);
parameter [3:0]    NOP =            4'b0000,        //각 opcode 연산 이름 선언 
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


	always @(posedge clk)                           //opcode에 따른 ALU 연산 신호, 연산 입력 선택 신호, register 쓰기 enable 신호 출력 
	begin
		if(opcode==NOP)			                    //opcode :  NOP
		begin
            ALU_op <= NOP;                          //ALU 연산신호 NOP으로 설정, Rd2 선택, 쓰기 disable         
            ALU_Src <= 0;
            Reg_Write <= 0;
		end
		
		else if(opcode==Write)			            //opcode :  Write
		begin
            ALU_op <= Write;                        //ALU 연산신호 Write로 설정, instruction 7~4bit 선택, 쓰기 enable
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==Read)                       //opcode :  Read              	           
		begin
            ALU_op <= Read;                         //ALU 연산신호 Read로 설정, Rd2 선택, 쓰기 disable        
            ALU_Src <= 0;
            Reg_Write <= 0;
		end
		
        else if(opcode==Copy)                       //opcode :  Copy   			
		begin
            ALU_op <= Copy;                         //ALU 연산신호 Copy로 설정, Rd2 선택, 쓰기 enable               
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==NOT)                        //opcode :  NOT 
		begin
            ALU_op <= NOT;                          //ALU 연산신호 NOT로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==AND)                        //opcode :  AND 
		begin
            ALU_op <= AND;                          //ALU 연산신호 AND로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==OR)                         //opcode :  OR 
		begin
            ALU_op <= OR;                           //ALU 연산신호 OR로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==XOR)                        //opcode :  XOR 
		begin
            ALU_op <= XOR;                          //ALU 연산신호 XOR로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==NAND)                       //opcode :  NAND 
		begin
            ALU_op <= NAND;                         //ALU 연산신호 NAND로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==NOR)                        //opcode :  NOR 
		begin
            ALU_op <= NOR;                          //ALU 연산신호 NOR로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==ADD)                        //opcode :  ADD 
		begin
            ALU_op <= ADD;                          //ALU 연산신호 ADD로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==SUB)                        //opcode :  SUB 
		begin
            ALU_op <= SUB;                          //ALU 연산신호 SUB로 설정, Rd2 선택, 쓰기 enable        
            ALU_Src <= 0;
            Reg_Write <= 1;
		end
		
		else if(opcode==ADDI)                       //opcode :  ADDI 
		begin
            ALU_op <= ADDI;                         //ALU 연산신호 ADDI로 설정, instruction 7~4bit 선택, 쓰기 enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==SUBI)                       //opcode :  SUBI 
		begin
            ALU_op <= SUBI;                         //ALU 연산신호 SUBI로 설정, instruction 7~4bit 선택, 쓰기 enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==Left_Shift)                 //opcode :  Left_Shift 
		begin
            ALU_op <= Left_Shift;                   //ALU 연산신호 Left_Shift로 설정, instruction 7~4bit 선택, 쓰기 enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end
		
		else if(opcode==Right_Shift)                //opcode :  Right_Shift 
		begin
            ALU_op <= Right_Shift;                  //ALU 연산신호 Right_Shift로 설정, instruction 7~4bit 선택, 쓰기 enable        
            ALU_Src <= 1;
            Reg_Write <= 1;
		end

	end

endmodule

