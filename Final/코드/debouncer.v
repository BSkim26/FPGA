`timescale 1ns / 1ps

module debouncer(
    input clk,
    input noisy,
    output debounced
    );
    parameter N = 100000; 
    parameter K = 32;
    
    reg [K-1:0] cnt;
    
    always @(posedge clk)                           
    begin
        if(noisy)   cnt <= cnt + 1'b1;              //�Է� high �� count 1 ���� 
        else        cnt <= 0;                       //�Է� low�� count 0���� �ʱ�ȭ
    end
    
    assign debounced = (cnt == N) ? 1'b1 : 1'b0;    //count N(100000)�� ��� 1 ���
endmodule


