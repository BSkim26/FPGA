`timescale 1ns / 1ps

module IO(
    input clk, clk_1M,
    input clk_10,
    input Overflow,
    input [3:0] sw,
    input [3:0] btn,
    input [3:0] result,
    output [1:0] seg_en,          
    output [6:0] seg_ab, seg_cd,  
    output reg Execute_St , Overflow_St, Reg_Store,
    output reg [3:0] led,
    output reg [15:0] instruction
    );
    
    
    parameter [3:0] IDLE =         4'b0000,                     //�� state ���� �̸� ����
                    Instruction1 =  4'b0001,
                    Instruction2 =  4'b0010,
                    Instruction3 =  4'b0011,
                    Instruction4 =  4'b0100,
                    Execute1 =       4'b0101,
                    Execute2 =       4'b0110,
                    Execute3 =       4'b0111,
                    Done =          4'b1000;
                    
    reg [3:0] hex_1, hex_2, hex_3, hex_4;                    
    reg [3:0] state;
    reg [3:0] Overflow_LED;
    wire [6:0] sega, segb, segc, segd;  
    reg cnt;
    
    initial                                                     //���۽� �� wire reg �ʱ�ȭ (�ʱ� ����)
    begin
        led = 0;
        hex_1 = 0; 
        hex_2 = 0;
        hex_3 = 0;
        hex_4 = 0;
        instruction = 0;
        state = 0;
        Overflow_LED = 4'b1100;
        Execute_St = 0;
        Overflow_St = 0;
        Reg_Store = 0;
        cnt =1'b0;
    end
    
    always @(posedge clk)                                       //state�� �Ǻ��ϰ� ��� ��ȣ ����, ���� state ����
    begin
        
        case(state)                         
            IDLE:                                               //state : IDLE
            begin       
                led <= 0;                                       //�� ��ȣ 0���� �ʱ�ȭ
                hex_1 <= 0;
                hex_2 <= 0;
                hex_3 <= 0;
                hex_4 <= 0;
                instruction <= 0;
                if(btn[0])                                          //0�� ��ư �Է½� Instruction1�� �̵�     
                                        state <= Instruction1;  
                else if(btn[3])                                 //3�� ��ư �Է½� IDLE state�� �̵�
                                        state <= IDLE;
                else                                            //������ ��� ���� ���� ����
                                        state <= IDLE;
            end
            
            Instruction1:                                       //state : Instruction1
            begin                                               
                instruction[15:12] <= sw[3:0];                  //����ġ�� �Էµ� �� ��ɾ� 15~12 bit�� ����, 3�� led�� on 
                hex_1 <= sw[3:0];
                led <= 4'b1000;
                
                if(btn[0])                                          //0�� ��ư �Է½� Instruction2�� �̵� 
                                        state <= Instruction2;
                else if(btn[3])                                 //3�� ��ư �Է½� IDLE state�� �̵�
                                        state <= IDLE;
                else                                            //������ ��� ���� ���� ����
                                        state <= Instruction1;
            end
            
            Instruction2:                                       //state : Instruction2
            begin
                instruction[11:8] <= sw[3:0];                   //����ġ�� �Էµ� �� ��ɾ� 11~8 bit�� ����, 2�� led�� on
                hex_2 <= sw[3:0];
                led <= 4'b0100;
                if(btn[0])                                          //0�� ��ư �Է½� Instruction3�� �̵� 
                                        state <= Instruction3;
                else if(btn[3])                                 //3�� ��ư �Է½� IDLE state�� �̵�
                                        state <= IDLE;
                else                                            //������ ��� ���� ���� ����
                                        state <= Instruction2;
            end
            
            Instruction3:                                       //state : Instruction3                        
            begin
                instruction[7:4] <= sw[3:0];                    //����ġ�� �Էµ� �� ��ɾ� 7~4 bit�� ����, 1�� led�� on      
                hex_3 <= sw[3:0];
                led <= 4'b0010;
                if(btn[0])                                          //0�� ��ư �Է½� Instruction4�� �̵�                   
                                        state <= Instruction4;
                else if(btn[3])                                 //3�� ��ư �Է½� IDLE state�� �̵�                     
                                        state <= IDLE;
                else                                            //������ ��� ���� ���� ����                              
                                        state <= Instruction3;                                
            end
              
            Instruction4:                                       //state : Instruction4                         
            begin
                instruction[3:0] <= sw[3:0];                    //����ġ�� �Էµ� �� ��ɾ� 3~0 bit�� ����, 0�� led�� on      
                hex_4 <= sw[3:0];
                led <= 4'b0001;
                if(btn[0])                                          //0�� ��ư �Է½� Execute1�� �̵�                   
                                        state <= Execute1;
                else if(btn[3])                                 //3�� ��ư �Է½� IDLE state�� �̵�                     
                                        state <= IDLE;
                else                                            //������ ��� ���� ���� ����                              
                                        state <= Instruction4;                               
            end                                                                             
            
            Execute1:                                           //state :  Execute1   
            begin
                Execute_St <= 1;                                //ALU ����
                                        state <= Execute2;      //Execute2�� �̵�  
            end 
            
            Execute2:                                           //state :  Execute2   
            begin
                Execute_St <= 0;                                //Overflow Ȯ��
                Overflow_St <= 1;
                                        state <= Execute3;      //Execute3�� �̵� 
            end
            
            Execute3:                                           //state :  Execute3   
            begin
                Overflow_St <= 0;                               //Register�� ALU ��� ����
                Reg_Store <= 1;
                                        state <= Done;          //Done�� �̵� 
            end
            
            Done:                                               //state :  Done
            begin
                Reg_Store <= 0;
                if(btn[1])                                      //1�� ��ư �Է½� seven segment�� ��ɾ� ���
                begin
                    hex_1 <= instruction[15:12];
                    hex_2 <= instruction[11:8];
                    hex_3 <= instruction[7:4];
                    hex_4 <= instruction[3:0];
                    if(Overflow) led[3:0] <= Overflow_LED[3:0]; //overflow �� led ��� on
                    else led <= 4'b1111;
                end
                else                                            //1�� ��ư �Է����� ���� ��� seven segment�� ���� ��� ���
                begin
                    hex_1 <= result[3];
                    hex_2 <= result[2];
                    hex_3 <= result[1];
                    hex_4 <= result[0];
                    if(Overflow) led[3:0] <= Overflow_LED[3:0]; //overflow �� led ��� on
                    else led <= 4'b1111;
                    
                    if(btn[0])                                      //0�� ��ư �Է½� IDLE�� �̵�
                                        state <= IDLE;
                    else if(btn[3])                             //3�� ��ư �Է½� IDLE state�� �̵�           
                                        state <= IDLE;
                    else                                        //������ ��� ���� ���� ����         
                                        state <= Done;
                end      
            end
        endcase
    end

    always @(posedge clk_10)                                    //over flow �� 0.1s ���� LED 0011 -> 1100 -> 0011 ������ ���� on
    begin
        Overflow_LED[3:0] <= ~Overflow_LED[3:0];
    end
    
    hex2ssd h0 (.hex(hex_1), .seg(sega));                       
    hex2ssd h1 (.hex(hex_2), .seg(segb));
    hex2ssd h2 (.hex(hex_3), .seg(segc));
    hex2ssd h3 (.hex(hex_4), .seg(segd));
    
    assign seg_en = clk_1M ? 2'b11 : 2'b00;                     //seg_en�� clk_1M�� ���� ����
    assign seg_ab = clk_1M ? sega : segb;                       //seg_ab�� clk_1M�� ���� a�� b�� ����
    assign seg_cd = clk_1M ? segc : segd;                       //seg_cd�� clk_1M�� ���� c�� d�� ����
    
endmodule
