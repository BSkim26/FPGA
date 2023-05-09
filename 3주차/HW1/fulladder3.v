`timescale 1ns / 1ps

module fulladder3(
    input   [15:0] x, y,                    // input 형식으로 16Bit x와 y를 선언한다. 
    input   cin,                            // input 형식으로 cin을 선언한다.
    output  cout,                           // output 형식으로 cout을 선언한다.
    output  [15:0] sum                      // input 형식으로 16Bit sum을 선언한다.
    );
   
    wire [15:0] c;                          // wire 형식으로 [15:0] c를 선언한다.
    
    fulladder2  u0  (.a(x[0]), .b(y[0]), .cin(cin), .cout(c[1]), .sum(sum[0]));         // 1bit full adder를 uut로 instanciation 하여 각각의 인자들을 서로 연결해준다.
    fulladder2  u1  (.a(x[1]), .b(y[1]), .cin(c[1]), .cout(c[2]), .sum(sum[1]));
    fulladder2  u2  (.a(x[2]), .b(y[2]), .cin(c[2]), .cout(c[3]), .sum(sum[2]));
    fulladder2  u3  (.a(x[3]), .b(y[3]), .cin(c[3]), .cout(c[4]), .sum(sum[3]));
    fulladder2  u4  (.a(x[4]), .b(y[4]), .cin(c[4]), .cout(c[5]), .sum(sum[4]));
    fulladder2  u5  (.a(x[5]), .b(y[5]), .cin(c[5]), .cout(c[6]), .sum(sum[5]));
    fulladder2  u6  (.a(x[6]), .b(y[6]), .cin(c[6]), .cout(c[7]), .sum(sum[6]));
    fulladder2  u7  (.a(x[7]), .b(y[7]), .cin(c[7]), .cout(c[8]), .sum(sum[7]));
    fulladder2  u8  (.a(x[8]), .b(y[8]), .cin(c[8]), .cout(c[9]), .sum(sum[8]));
    fulladder2  u9  (.a(x[9]), .b(y[9]), .cin(c[9]), .cout(c[10]), .sum(sum[9]));
    fulladder2  u10  (.a(x[10]), .b(y[10]), .cin(c[10]), .cout(c[11]), .sum(sum[10]));
    fulladder2  u11  (.a(x[11]), .b(y[11]), .cin(c[11]), .cout(c[12]), .sum(sum[11]));
    fulladder2  u12  (.a(x[12]), .b(y[12]), .cin(c[12]), .cout(c[13]), .sum(sum[12]));
    fulladder2  u13  (.a(x[13]), .b(y[13]), .cin(c[13]), .cout(c[14]), .sum(sum[13]));
    fulladder2  u14  (.a(x[14]), .b(y[14]), .cin(c[14]), .cout(c[15]), .sum(sum[14]));
    fulladder2  u15  (.a(x[15]), .b(y[15]), .cin(c[15]), .cout(cout), .sum(sum[15]));            // 마지막 1bit full adder를 uut로 instanciation 한다.
    
endmodule
