`timescale 1ns / 1ps


module coffee(                              // 입력신호 및 출력신호 선언
        input CLK, w100, btn,               // 클럭, 100원 입력, button
        output reg ret, sale                // 반환, 판매
    );
    parameter [2:0]     S0=3'b000,          // state를 paraemter로 설정하여 always문 안에서 직관적으로 이해할 수 있게 함
                          S1=3'b001,
                          S2=3'b010,
                          S3=3'b011,
                          S4=3'b100,
                          S5=3'b101;
                          
                          
     reg [3:0] PS, NS;                      //present state, next counter  
     
     initial
     begin
        PS = S0;                             //모든 변수 초기화
        NS = 0;                              
        ret=0;                               
        sale=0;                              
     end
     
     
    always @(posedge CLK)                                    // CLK 동기화
    begin
           PS <= NS;                                        // next state를 present state에 넣는다.
           
    end
        always @(*)                     
    begin
            ret=0;                                           // ret=0
            sale=0;                                          // sale=0
            case(PS)                                        
                S0 :begin                                    // PS=S0
                        if(w100==1)                          // w100=1일 때
                                            NS <= S1;         // next state = S1
                        else                                 
                                            NS <= S0;         // next state = S0
                    end                                      
                                                             
                S1 :begin                                    
                        if((btn==1)&&(w100==0))              // btn=1, w100=0일 떄
                                            NS <= S5;         // next state = S5
                                                             
                        else if((btn==0)&&(w100==0))         // btn=0, w100=0일 떄
                                            NS <= S1;         // next state = S1
                        else                                 
                                            NS <= S2;         // next state = S2
                    end                                      
                S2 :begin                                    
                        if(w100==1)                          // w100=1일 떄
                                            NS <= S3;         //next state = S3
                        else if((btn==0)&&(w100==0))         // btn=0, w100=0일 떄
                                            NS <= S2;         // next state = S2
                        else                                 
                                            NS <= S5;         //next state = S5
                    end                                     
                                                            
                S3 :begin                                   
                        if(w100==1)                          // w100=1일 떄
                                            NS <= S5;         //next state = S5
                        else if((btn==1)&&(w100==0))         // btn=1, w100=0일 떄
                                            NS <= S4;         //next state = S4
                        else                                
                                            NS <= S3;         //next state = S3
                    end                                     
                                                            
                S4 :begin                                   
                        sale=1;                              // sale=1
                                            NS <= S0;         // next state = S0
                    end                                     
                                                            
                S5 :begin                                   
                     ret=1;                                  // ret =1
                        if(w100==1)                             // w100이 1일 때 
                                            NS <= S1;         // next state = S1
                        else                                
                                            NS <= S0;         // next state = S0
                        end                                  
            default:                        NS <= S0;         // next state = S0
            endcase
    end                 
            
endmodule
