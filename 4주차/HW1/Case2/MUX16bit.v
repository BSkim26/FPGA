`timescale 1ns / 1ps


module MUX16bit(
    input [15:0] D,                                        // 16bit의 D를 input으로 선언한다.
    input [3:0] sel,                                       //4bit의 sel을 input으로 선언한다.
    output out                                             //out을 output으로 선언한다.
    );
    wire Y1, Y2;                                           //Y1, Y2를 wire로 선언한다.

    
    MUX8bit u1(.a(D[7:0]), .sel(sel[2:0]), .out(Y1));       // D를 8bit씩, sel은 공통, output은 Y1로 받아 각 MUX의 입력과 출력을 매칭한다. 
    MUX8bit u2(.a(D[15:8]), .sel(sel[2:0]), .out(Y2));      // D를 8bit씩, sel은 공통, output은 Y2로 받아 각 MUX의 입력과 출력을 매칭한다. 
    
    MUX2bit u3(.a(Y1), .b(Y2), .sel(sel[3]), .out(out));    // 앞선 단에서 나온 출력 Y1, Y2를 입력으로 사용하고 sel를 이용해 out을 출력해낸다.
endmodule
