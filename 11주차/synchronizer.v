`timescale 1ns / 1ps

module synchronizer(
    input       clk,                        //input으로 clk, async_in 선언 
    input       async_in,
    output reg  sync_out                    //reg 타입으로 output sync_out 선언
    );
    initial begin
        sync_out<=0;
    end
    reg tmp;                                //reg 타입으로 tmp 선언 
    
    always @(posedge clk)                   //clk의 상승 edge마다 다음 코드 동작
    begin
        tmp      <=  async_in;              //tmp = async_in
        sync_out <= tmp;                    //sync_out = tmp
    end
    
endmodule