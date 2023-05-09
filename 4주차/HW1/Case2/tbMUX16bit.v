`timescale 1ns / 1ps



module tbMUX16bit();
    reg [15:0] D;                   //16bit�� D�� reg �������� �����Ѵ�.
    reg [3:0] sel;                  //4bit�� sel�� reg �������� �����Ѵ�.
    wire out;                       // out�� wire �������� �����Ѵ�.
    
   MUX16bit uut(D, sel, out);       // D, sel, out�� ���ڷ� �޴� MUX16bit�� uut�� ȣ���Ѵ�.
    
    initial                         //�Է¿� ���� ����� �м��ϱ� ���Ͽ� ���� �����Ѵ�.
    begin
         sel=4'b0000;  D=16'h0000;
    #100 sel=4'b0100; D=16'h0100;
    #100 sel=4'b0100; D=16'h0110;
    #100 sel=4'b0010; D=16'h1100;
    #100 sel=4'b1001; D=16'h0100;
    #100 sel=4'b0110; D=16'h1010;
    #100 sel=4'b0101; D=16'h0110;
    #100 $finish;
    end
    
endmodule
