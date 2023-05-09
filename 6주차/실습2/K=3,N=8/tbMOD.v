`timescale 1ns / 1ps


module tbMOD();
    parameter K=3;                                              //parameter를 K=3, N=8로 설정한다.
    parameter N=8;                                              
    
    reg CLK, RST;                                                // reg형식의 CLK, RST를 설정한다.
    wire [K-1:0] counter;                                        // wire형식의 Kbit counter를 설정한다.
                                                                 
    MOD8Counter #(K,N) UUT(CLK, RST, counter);                  // MOD8Counter를 K와 N parameter를 포함하여 UUT로 호출한다.
    
    always #10 CLK=~CLK;                                        // 20ns주기의 clock을 설정한다.
    initial
    begin 
        CLK<=0;                                                 // CLk를 0으로 초기화한다.
        RST<=0;                                                 // RST를 0으로 초기화한다.
        #40 RST<=1;                                             // 40ns이후 RST를 1로 설정한다.
        #400 $finish;                                           // 400ns이후 종료한다.
        end
        
        initial
        begin
        $monitor("Time=%~%0t RST=~%b output count=~%b", $time, RST, counter);        //monitor로 time, RST, out을 표현한다.
        end
endmodule
