// 1_bit half adder

`timescale 1ns / 1ps

module HA(
    input A, 
    input B,
    output Add_Cout,
    output Sum
    );
    
    assign Sum = A + B;
    assign Add_Cout = A * B;
    
endmodule
