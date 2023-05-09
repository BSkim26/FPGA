`timescale 1ns / 1ps


module debouncer#(parameter N=10,                   //parameter�� N=10, K=4 ����
                  parameter K=4)(
    input       clk,                                //input���� clk,noisy ����
    input       noisy,
    output      debounced                           //output���� debounced����
    );
    
    
    reg [K-1:0] count;                              //reg Ÿ�� Kbit count ���� 
    
    
    always @(posedge clk)                           //clk�� ��� edge���� ���� �ڵ� ����
    begin
        if(noisy) count <= count + 1'b1;            //noisy=1�� ��� count +1
        else      count <=0;                        //noisy=0�� ��� count = 0
    end
    
    assign debounced = (count == N) ? 1'b1 : 1'b0;  //debounced�� count�� N�� ��� 1 �ƴ� ��� 0
    
endmodule