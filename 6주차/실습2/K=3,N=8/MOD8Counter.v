`timescale 1ns / 1ps


module MOD8Counter#(parameter K=3, parameter N=8)(      //parameter를 K=3, N=8로 설정한다.
    input CLK,                                             //input으로 CLk와 RST를 설정한다.
    input RST,
    output reg [K-1:0] counter                              // reg형식 output으로 Kbit counter를 설정한다. 
    );
    
    always @(posedge CLK)                                  // CLK의 rising edge에서 동작하는 always문을 설정한다.
    begin                                                  
        if(!RST)                                           // RST가 0이면 동작한다.
        begin                                              
        counter <= {K{1'b0}};                              // counter를 Kbit의 0으로 만들어준다,
        end                                                
                                                          
        else                                              
        begin                                             
        if(counter==N-1)                                   // counter가 N-1이라면 conter를 Kbit의 0으로 초기화한다
            counter <= {K{1'b0}};                          // counter를 Kbit의 0으로 만들어준다,
        else                                               
            counter <= counter+1;                          // counter의 값을 1 더한다.
        end
    end
endmodule
