`timescale 1ns / 1ps


module tbbinarytoBCD(    );
        reg [7:0] A;                                       // reg 형식으로 8bit A를 선언한다.
        wire [1:0] hunds;                                  // wire 형식으로 2bit hunds를 선언한다.
        wire [3:0] tens, units;                            // wire 형식으로 4bit tens와 units를 선언한다.
                                                           
        binarytoBCD uut(A, hunds, tens, units);            // binarytoBCD를 uut로 불러와서 A, hunds, tens, units를 매칭시켜 불러온다.
                                                           
        initial                                            
        begin                                              
        A= 8'b00000000;                                    // A에 0을 넣는다
        #100 A = 8'd3;                                     // A에 3을 넣는다.
        #100 A = 8'd56;                                    // A에 56을 넣는다.
        #100 A = 8'd125;                                   // A에 125를 넣는다.
        #100 $finish;                                     
        end                                                 
endmodule                                                   
