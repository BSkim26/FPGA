`timescale 1ns / 1ps


module fulladder3(
    input   [3:0] x, y,         // input 형식으로 4Bit x와 y를 선언한다.
    input   cin,                // input 형식으로 cin와 adder/substractor를 구분하는 as를 선언한다.
    output  cout,               // output 형시으로 cout을 선언한다.
    output  [3:0] sum,          // input 형식으로 4Bit sum을 선언한다.
    output  of                  // overflow를 detection하는 output of를 선언한다.

    );
    
    wire [2:0] c;               // wire 형식으로 3bit c를 선언한다.
    wire [3:0] f;               // wire 형식으로 4bit f를 선언한다.
    
    xor xor1(f[0], cin, y[0]);  // 첫번째 bit를 xor을 통해 substractor라면 반전시키고 adder면 그대로 놓는다.
    xor xor2(f[1], cin, y[1]);  // 두번째 bit를 xor을 통해 substractor라면 반전시키고 adder면 그대로 놓는다.
    xor xor3(f[2], cin, y[2]);  // 세번째 bit를 xor을 통해 substractor라면 반전시키고 adder면 그대로 놓는다.
    xor xor4(f[3], cin, y[3]);  // 네번째 bit를 xor을 통해 substractor라면 반전시키고 adder면 그대로 놓는다.
    
    assign of = (x[3]&f[3]& ~sum[3]) + (~x[3]& ~f[3]& sum[3]);  // overflow를 detection할 수 있는 logic을 생성한다.
    //assign of= c[2]^cout;
    
    fulladder2  u0  (.a(x[0]), .b(f[0]), .cin(cin), .cout(c[0]), .sum(sum[0]));     //1bit full adder를 instanciation 하여 각각의 인자들을 서로 연결해준다.
    fulladder2  u1  (.a(x[1]), .b(f[1]), .cin(c[0]), .cout(c[1]), .sum(sum[1]));    //
    fulladder2  u2  (.a(x[2]), .b(f[2]), .cin(c[1]), .cout(c[2]), .sum(sum[2]));    //
    fulladder2  u3  (.a(x[3]), .b(f[3]), .cin(c[2]), .cout(cout), .sum(sum[3]));    //마지막 1bit full adder를 instanciation 한다.
    
endmodule
