`timescale 1ns / 1ps

module tbfulladder;                
    reg [15:0] x, y;                // reg 형식으로 16Bit x, y 선언
    reg        cin;                 // reg 형식으로 cin 선언
    wire [15:0] sum;                  // wire 형식으로 16Bit sum 선언
    wire       cout;                    // wire 형식으로 cout 선언
    
    
    fulladder3 uut(.x(x), .y(y), .cin(cin), .sum(sum), .cout(cout));   // Port 연결

    initial begin                 
     x = 16'h0000;   y=16'h0000;     cin=1'b0;  
#50  x = 16'h3000;   y=16'hf002;     cin=1'b1;  
#50  x = 16'h0400;   y=16'h04f0;     cin=1'b0;  
#50  x = 16'h0070;   y=16'h0010;     cin=1'b1;   
#50  x = 16'h0007;   y=16'h0001;     cin=1'b0;    
#50 $finish;
end
endmodule

