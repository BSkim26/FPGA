`timescale 1ns / 1ps

module freq_div_20(
    input clk_ref,
    input rst,
    output reg clk_div
    );
    
    reg [5:0] count;       
    
    always @ (posedge clk_ref or posedge rst)           //clk_ref가 postive edge 거나 rst이 postive edge일 때
    begin
        if(rst)                                         //rst이 1이면 (reset)
        begin
            count   <= 6'd0;                            //count, 출력 0으로 초기화
            clk_div <= 1'd0;
        end
        else
        begin
            if(count == 6'd9)                          //count 9면 (10번 count 되었다면)
            begin
                count   <=6'd0;                         //count 0으로 초기화, 출력 clock 반전
                clk_div <= ~clk_div;
            end
            else                 
            begin
                count <= count +1'b1;                   //count 1 증가
            end
        end
    end
endmodule
