`timescale 1ns / 1ps

module comparator_2bit(
    input [1:0] A, B,                   //input으로 2bit A,B 선언 
    output A_Big, B_Big, Equal          //output으로 A_Big, B_Big, Equal 선언
    );
    
    assign Equal = (A==B) ? 1:0;        //조건 연산자를 사용하여 A와 B가 같은 경우 Equal = 1, 아닌 경우 Equal = 0 선언
    assign A_Big = (A>B)  ? 1:0;        //조건 연산자를 사용하여 A가 B보다 큰 경우 A_Big = 1, 아닌 경우 A_Big = 0 선언
    assign B_Big = (A<B)  ? 1:0;        //조건 연산자를 사용하여 B가 A보다 큰 경우 B_Big = 1, 아닌 경우 B_Big = 0 선언
    
endmodule
