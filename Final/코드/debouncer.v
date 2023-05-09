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
        if(noisy)   cnt <= cnt + 1'b1;              //입력 high 시 count 1 증가 
        else        cnt <= 0;                       //입력 low시 count 0으로 초기화
    end
    
    assign debounced = (cnt == N) ? 1'b1 : 1'b0;    //count N(100000)일 경우 1 출력
endmodule


