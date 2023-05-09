// 1_bit full adder

`timescale 1ns / 1ps

module FA(
       input A,
       input B,
       input Cin,
       output Add_Cout,
       output Sum
    );
    wire S;
    wire [1:0] C;
    
    HA    u0  (.A(A),     .B(B),      .Sum(S),   .Add_Cout(C[0]));
    HA    u1  (.A(S),    .B(Cin),    .Sum(Sum),  .Add_Cout(C[1]));
    assign Add_Cout = C[0] | C[1];  
    
endmodule
