`timescale 1ns / 1ps

module timer(
    input   clk, rst, start, stop,
    output  [15:0] out
    );
    
    parameter [1:0] S0=2'b00,                                                       // State ����
                     S1=2'b01,
                     S2=2'b10;
                     
    reg       Reg_rst, count;                                                       // rst �Է��� ����, count�� ���� ���� ����
    reg [1:0] PS,NS;                                                                // ���� state�� ���� state�� �����ϴ� ���� ����
    reg [3:0] hexa, hexb, hexc, hexd;                                               // 16������ ���ϴ� ����� �����ϱ� ���� ����
    wire      Reg_stop;                                                             // count�� stop�ϴ� ���
    
    assign  Reg_stop = ((hexa==9 && hexb==9 && hexc==9 && hexd==9) || stop);        // 99:99�ų� stop�� �ԷµǾ��� �� count�� ���� �ϱ� ���� ����
    assign  out = {hexa[3:0],hexb[3:0],hexc[3:0],hexd[3:0]};                        // ����ϰ��� �ϴ� ���� �����ϱ� ���� ����
    
    initial begin                                                                   // hexa�� �ʱ�ȭ
        PS=S0;
         hexa<=4'b0000;
         hexb<=4'b0000;
         hexc<=4'b0000;
         hexd<=4'b0000; 
    end
    
    always@(posedge clk, posedge rst) begin                                        // clock�� rst�� ��¿������� trigger
        if (rst) begin    
  
        PS<=S0;
        end                                                         // rst�� 1�� ��� �ʱ� ���·� �ʱ�ȭ
        else        PS<=NS;                                                         // PS�� ���� state�� ������ ��
   end
   
   always@ (*) begin                                                     // PS�� ���� ����
        Reg_rst=0;    count=0;                                          // ���� �ʱ�ȭ
        case(PS)
            S0 : if(start) begin                                        // S0 ���� start�� 1�� ��
                  count=1;                                              // count 1�� ���ڸ� ������ ��
                                                 NS=S1;                 // ���� state�� S1���� ����
                 end
                 else begin
                  Reg_rst=1;                                            // Reg_rst�� 1�� ����
                                                 NS=S0;                 // ���� state�� S0�� ����
                 end 
            S1 : if(Reg_stop) begin                                     // S1���� Reg_stop�� 1�� �� 
                                                 NS=S2;                 // ���� state�� S2�� ����
                 end 
                 else begin 
                  count=1;                                              // count 1�� ���ڸ� ������ ��
                                                 NS=S1;                 // ���� state�� S1���� ����
                 end
            S2 : if(start && !Reg_stop) begin                           // S2���� start�� 1�̰� Reg_stop�� 0�� ��
                  count=1;                                              // count 1�� ���ڸ� ������ ��
                                                 NS=S1;                 // ���� state�� S1���� ����
                 end
                 else begin
                                                 NS=S2;                 // �̿��� ���� ���� state�� S2�� ����
                 end      
       default : begin                                                  // �������� ���� state�� �߻��ϴ� ��� �ʱ�ȭ
                  Reg_rst=1;
                                                 NS=S0;                 // ���� state�� S0�� ����            
                 end 
        endcase                              
   end 
    
    always @(posedge clk) begin                     // clk�� ��� ������ ��
        if(Reg_rst) begin                           // Reg_rst�� 1�̸�
         hexa<=4'b0000;                             // hexa,b, c, d�� 0���� �ʱ�ȭ
         hexb<=4'b0000;
         hexc<=4'b0000;
         hexd<=4'b0000;        
        end 
        if(count) begin                             // count�� 1�̸�
         hexd<=hexd+1'b1;                           // 0.01�� ����
             if(hexd==4'd9) begin                   // 0.1�ʸ��� 
              hexd<=4'b0;                           // xx,x0���� �ʱ�ȭ
              hexc<=hexc+1'b1;                      // 0.1�� ����  
                 if(hexc==4'd9) begin                // 1�ʸ���
                  hexc<=4'b0;                       // xx,00���� �ʱ�ȭ
                  hexb<=hexb+1'b1;                  // 1�� ����
                     if(hexb==4'd9) begin            // 10�ʸ���    
                      hexb<=4'b0;                   // x0,00���� �ʱ�ȭ
                      hexa<=hexa+1'b1;              // 10�� ����
                     end
                 end  
             end        
        end 
    end 
     
endmodule
