`timescale 1ns / 1ps


module tbbinarytoBCD(    );
        reg [7:0] A;                                       // reg �������� 8bit A�� �����Ѵ�.
        wire [1:0] hunds;                                  // wire �������� 2bit hunds�� �����Ѵ�.
        wire [3:0] tens, units;                            // wire �������� 4bit tens�� units�� �����Ѵ�.
                                                           
        binarytoBCD uut(A, hunds, tens, units);            // binarytoBCD�� uut�� �ҷ��ͼ� A, hunds, tens, units�� ��Ī���� �ҷ��´�.
                                                           
        initial                                            
        begin                                              
        A= 8'b00000000;                                    // A�� 0�� �ִ´�
        #100 A = 8'd3;                                     // A�� 3�� �ִ´�.
        #100 A = 8'd56;                                    // A�� 56�� �ִ´�.
        #100 A = 8'd125;                                   // A�� 125�� �ִ´�.
        #100 $finish;                                     
        end                                                 
endmodule                                                   
