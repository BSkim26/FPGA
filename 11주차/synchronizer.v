`timescale 1ns / 1ps

module synchronizer(
    input       clk,                        //input���� clk, async_in ���� 
    input       async_in,
    output reg  sync_out                    //reg Ÿ������ output sync_out ����
    );
    initial begin
        sync_out<=0;
    end
    reg tmp;                                //reg Ÿ������ tmp ���� 
    
    always @(posedge clk)                   //clk�� ��� edge���� ���� �ڵ� ����
    begin
        tmp      <=  async_in;              //tmp = async_in
        sync_out <= tmp;                    //sync_out = tmp
    end
    
endmodule