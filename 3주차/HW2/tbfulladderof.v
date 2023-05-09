`timescale 1ns / 1ps

module tbfulladderof;                // 4Bit Adder & Substractor (overflow detection)
    reg [3:0] x, y;                  // reg 형식으로 4Bit x, y 선언
    reg        cin;                 //  reg 형식으로 cin 선언
    wire [3:0] sum;                  // wire 형식으로 16Bit sum 선언
    wire       cout, of;            // wire 형식으로 cout 선언
    
    
    fulladder3 uut(.x(x), .y(y), .cin(cin), .sum(sum), .cout(cout), .of(of));   // Port 연결

    initial begin                            //test bench
     x = 4'd0;   y=4'd0;     cin=1'b0;
#50  x = 4'd3;   y=4'd2;     cin=1'b1;
#50  x = 4'd4;   y=4'd4;     cin=1'b0;
#50  x = 4'd7;   y=4'd1;    cin=1'b1;
#50  x = 4'd7;  y=4'd1;    cin=1'b0;
#50 $finish;                                //test bench 종료
end
endmodule
