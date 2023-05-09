`timescale 1ns / 1ps



module MUX2bit(
    input   a, b,                               // a, b를 input으로 선언한다.
    input   sel,                                // 입력을 선택해 출력할 수 있도록 sel을 input으로 선언한다.
    output  out                                 // out을 output으로 선언한다
    );
    
    assign out =    (sel==1'b0) ? a :           // sel이 0이라면 a를 출력한다.
                    (sel==1'b1) ? b : 1'bx;     // sel이 1이라면 b를 출력하고 이외의 값이 들어오면 x를 출력한다.
                    
endmodule
