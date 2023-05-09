`timescale 1ns / 1ps



module Multiplexer(
    input   a, b, c, d,                         // a, b, c,d 를 input 형식으로 선언한다.
    input [1:0] sel,                            // 입력을 선택해 출력할 수 있도록 2bit sel을 선언한다.
    output  out                                 // out을 output 형식으로 선언한다.
    );
    
    assign out =    (sel==2'b00) ? a :          // sel이 00이라면 a를 출력한다.
                    (sel==2'b01) ? b :          // sel이 01이라면 b를 출력한다.
                    (sel==2'b10) ? c :          // sel이 10이라면 c를 출력한다.
                    (sel==2'b11) ? d : 1'bx;    // sel이 11이라면 d를 출력하고 이 외의 경우가 발생하면 x로 출력한다.
                    
endmodule
