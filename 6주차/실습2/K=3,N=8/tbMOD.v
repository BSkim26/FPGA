`timescale 1ns / 1ps


module tbMOD();
    parameter K=3;                                              //parameter�� K=3, N=8�� �����Ѵ�.
    parameter N=8;                                              
    
    reg CLK, RST;                                                // reg������ CLK, RST�� �����Ѵ�.
    wire [K-1:0] counter;                                        // wire������ Kbit counter�� �����Ѵ�.
                                                                 
    MOD8Counter #(K,N) UUT(CLK, RST, counter);                  // MOD8Counter�� K�� N parameter�� �����Ͽ� UUT�� ȣ���Ѵ�.
    
    always #10 CLK=~CLK;                                        // 20ns�ֱ��� clock�� �����Ѵ�.
    initial
    begin 
        CLK<=0;                                                 // CLk�� 0���� �ʱ�ȭ�Ѵ�.
        RST<=0;                                                 // RST�� 0���� �ʱ�ȭ�Ѵ�.
        #40 RST<=1;                                             // 40ns���� RST�� 1�� �����Ѵ�.
        #400 $finish;                                           // 400ns���� �����Ѵ�.
        end
        
        initial
        begin
        $monitor("Time=%~%0t RST=~%b output count=~%b", $time, RST, counter);        //monitor�� time, RST, out�� ǥ���Ѵ�.
        end
endmodule
