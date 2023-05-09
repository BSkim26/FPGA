`timescale 1ns / 1ps


module fourbitMUX(
    input [15:0] D,                     // 16bit의 D를 input으로 선언한다.
    input [3:0] sel,                    // 4bit의 sel을 input으로 선언한다.
    output out                          // out을 output으로 선언한다.
    );      
    wire Y1, Y2, Y3, Y4;                // Y1, Y2, Y3, Y4를 wire로 선언한다.
    
    
    Multiplexer u0 (.a(D[0]), .b(D[1]), .c(D[2]), .d(D[3]), .sel(sel[1:0]), .out(Y1));          // D를 4bit씩, sel은 공통, output은 Y1로 받아 각 MUX의 입력과 출력을 매칭한다. 
    Multiplexer u1 (.a(D[4]), .b(D[5]), .c(D[6]), .d(D[7]), .sel(sel[1:0]), .out(Y2));          // D를 4bit씩, sel은 공통, output은 Y2로 받아 각 MUX의 입력과 출력을 매칭한다.
    Multiplexer u2 (.a(D[8]), .b(D[9]), .c(D[10]), .d(D[11]), .sel(sel[1:0]), .out(Y3));        // D를 4bit씩, sel은 공통, output은 Y3로 받아 각 MUX의 입력과 출력을 매칭한다.
    Multiplexer u3 (.a(D[12]), .b(D[13]), .c(D[14]), .d(D[15]), .sel(sel[1:0]), .out(Y4));      // D를 4bit씩, sel은 공통, output은 Y4로 받아 각 MUX의 입력과 출력을 매칭한다.
    
    Multiplexer u4 (.a(Y1), .b(Y2), .c(Y3), .d(Y4), .sel(sel[3:2]), .out(out));                 // 앞선 단에서 나온 출력 Y1, Y2, Y3, Y4를 입력으로 사용하고 sel의 2bit를 이용해 out을 출력해낸다.
endmodule
