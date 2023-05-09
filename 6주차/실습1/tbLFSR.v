`timescale 1ns / 1ps


module tbLFSR();                                    //input으로 CLK와 RST를 설정하고 output으로 Q를 설정한다.
    reg CLK, RST;                                   
    wire [1:4] Q;
    LFSR UUT(.CLK(CLK), .RST(RST), .out(Q));        //LFSR을 UUT로 불러오는데 out을 Q로 불러와야 하므로 .out(Q)로 만든다.
    
    always #10 CLK=~CLK;                            // CLK의 주기를 20ns로 설정한다.
    
    initial
    begin
        CLK<=0;                                    // CLK의 초기값을 0으로 설정한다.
        RST<=0;                                    // RST의 초기값을 0으로 설정한다.
        #20 RST<=1;                                // 20ns이후 RST를 1로 바꾼다.
        #500 RST<=0;                               // 500ns이후 RST를 0으로 바꾼다.
        #20 $finish;                               // 20ns이후 종료한다.
    end
    
    initial
    begin
    $monitor("time=%0t RST=%b Q=%b", $time, RST, Q);        //monitor로 time과 RST, Q를 볼 수있도록 설정한다.
    end
endmodule
