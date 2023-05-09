`timescale 1ns / 1ps


module MOD2#(parameter K=4, parameter N=10)(      //parameter�� K=4, N=10�� �����Ѵ�.
    input CLK,                                             //input���� CLk�� RST�� �����Ѵ�.
    input RST,
    output reg [K-1:0] counter                              // reg���� output���� Kbit counter�� �����Ѵ�. 
    );
    
    always @(posedge CLK)                                  // CLK�� rising edge���� �����ϴ� always���� �����Ѵ�.
    begin                                                  
        if(!RST)                                           // RST�� 0�̸� �����Ѵ�.
        begin                                              
        counter <= {K{1'b0}};                              // counter�� Kbit�� 0���� ������ش�,
        end                                                
                                                          
        else                                              
        begin                                             
        if(counter==N-1)                                   // counter�� N-1�̶�� conter�� Kbit�� 0���� �ʱ�ȭ�Ѵ�
            counter <= {K{1'b0}};                          // counter�� Kbit�� 0���� ������ش�,
        else                                               
            counter <= counter+1;                          // counter�� ���� 1 ���Ѵ�.
        end
    end
endmodule