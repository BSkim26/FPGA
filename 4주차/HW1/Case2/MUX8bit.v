`timescale 1ns / 1ps



module MUX8bit(
    input [7:0] a,      // 8bit의 입력을 받기 위해 8bit a를 input으로 선언한다.
    input [2:0] sel,    // 입력을 선택해 출력할 수 있도록 3bit sel을 선언한다.
    output  out         // out을 output 형식으로 선언한다.
    );
    
    assign out =    (sel==3'b000) ? a[0] :          // sel이 000이라면 a[0]을 출력한다.
                    (sel==3'b001) ? a[1] :          // sel이 001이라면 a[1]을 출력한다.
                    (sel==3'b010) ? a[2] :          // sel이 010이라면 a[2]을 출력한다.
                    (sel==3'b011) ? a[3] :          // sel이 011이라면 a[3]을 출력한다.
                    (sel==3'b100) ? a[4] :          //sel이 100이라면 a[4]을 출력한다.
                    (sel==3'b101) ? a[5] :          //sel이 000이라면 a[5]을 출력한다.
                    (sel==3'b110) ? a[6] :          //sel이 110이라면 a[6]을 출력한다.
                    (sel==3'b111) ? a[7] : 1'bx;    //sel이 111이라면 a[7]을 출력하고 그 이외의 값이 입력되면 x를 출력한다.
endmodule