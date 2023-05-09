`timescale 1ns / 1ps

module tbfulladderof;                // 4Bit Adder & Substractor (overflow detection)
    reg [3:0] x, y;                  // reg �������� 4Bit x, y ����
    reg        cin;                 //  reg �������� cin ����
    wire [3:0] sum;                  // wire �������� 16Bit sum ����
    wire       cout, of;            // wire �������� cout ����
    
    
    fulladder3 uut(.x(x), .y(y), .cin(cin), .sum(sum), .cout(cout), .of(of));   // Port ����

    initial begin                            //test bench
     x = 4'd0;   y=4'd0;     cin=1'b0;
#50  x = 4'd3;   y=4'd2;     cin=1'b1;
#50  x = 4'd4;   y=4'd4;     cin=1'b0;
#50  x = 4'd7;   y=4'd1;    cin=1'b1;
#50  x = 4'd7;  y=4'd1;    cin=1'b0;
#50 $finish;                                //test bench ����
end
endmodule
