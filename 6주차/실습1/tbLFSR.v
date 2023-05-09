`timescale 1ns / 1ps


module tbLFSR();                                    //input���� CLK�� RST�� �����ϰ� output���� Q�� �����Ѵ�.
    reg CLK, RST;                                   
    wire [1:4] Q;
    LFSR UUT(.CLK(CLK), .RST(RST), .out(Q));        //LFSR�� UUT�� �ҷ����µ� out�� Q�� �ҷ��;� �ϹǷ� .out(Q)�� �����.
    
    always #10 CLK=~CLK;                            // CLK�� �ֱ⸦ 20ns�� �����Ѵ�.
    
    initial
    begin
        CLK<=0;                                    // CLK�� �ʱⰪ�� 0���� �����Ѵ�.
        RST<=0;                                    // RST�� �ʱⰪ�� 0���� �����Ѵ�.
        #20 RST<=1;                                // 20ns���� RST�� 1�� �ٲ۴�.
        #500 RST<=0;                               // 500ns���� RST�� 0���� �ٲ۴�.
        #20 $finish;                               // 20ns���� �����Ѵ�.
    end
    
    initial
    begin
    $monitor("time=%0t RST=%b Q=%b", $time, RST, Q);        //monitor�� time�� RST, Q�� �� ���ֵ��� �����Ѵ�.
    end
endmodule
