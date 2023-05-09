`timescale 1ns / 1ps


module debouncer#(parameter N=10,                   //parameter로 N=10, K=4 선언
                  parameter K=4)(
    input       clk,                                //input으로 clk,noisy 선언
    input       noisy,
    output      debounced                           //output으로 debounced선언
    );
    
    
    reg [K-1:0] count;                              //reg 타입 Kbit count 선언 
    
    
    always @(posedge clk)                           //clk의 상승 edge마다 다음 코드 동작
    begin
        if(noisy) count <= count + 1'b1;            //noisy=1인 경우 count +1
        else      count <=0;                        //noisy=0인 경우 count = 0
    end
    
    assign debounced = (count == N) ? 1'b1 : 1'b0;  //debounced는 count가 N일 경우 1 아닐 경우 0
    
endmodule