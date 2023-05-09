`timescale 1ns / 1ps

module freq_div_100(
    input       clk_ref,                            //input으로 clk_ref,rst 선언
    input       rst,
    output  reg clk_div                             //reg 타입으로 output clk_div 선언
    );
    
    reg [5:0] count;                                //reg 타입으로 6bit count 선언
    
    always @ (posedge clk_ref or posedge rst)       //clk_ref이 상승 edge일 때, rst가 상승 edge 일 때 다음 코드 동작
    begin
        if(rst)                                     //rst가 1일 때 다음 코드 동작
        begin
            count   <= 6'd0;                        //count를 0으로 설정
            clk_div <= 1'd0;                        //clk_div를 0으로 설정
        end
        else                                        //rst가 0일 때 다음 코드 동작
        begin
            if(count == 6'd49)                      //count가 49인 경우
            begin
                count   <= 6'd0;                    //count = 0
                clk_div <= ~clk_div;                //clk_div 반전
            end
            else                                    //count가 49가 아닌 경우
            begin
                count <= count + 1'b1;              //count +1
            end
        end
    end
   
endmodule