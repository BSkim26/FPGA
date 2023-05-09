`timescale 1ns / 1ps

module timer(
    input   clk, rst, start, stop,
    output  [15:0] out
    );
    
    parameter [1:0] S0=2'b00,                                                       // State 선언
                     S1=2'b01,
                     S2=2'b10;
                     
    reg       Reg_rst, count;                                                       // rst 입력을 연결, count를 위한 변수 선언
    reg [1:0] PS,NS;                                                                // 현재 state와 다음 state를 저장하는 변수 선언
    reg [3:0] hexa, hexb, hexc, hexd;                                               // 16진수로 원하는 출력을 전달하기 위한 변수
    wire      Reg_stop;                                                             // count를 stop하는 경우
    
    assign  Reg_stop = ((hexa==9 && hexb==9 && hexc==9 && hexd==9) || stop);        // 99:99거나 stop이 입력되었을 때 count를 중지 하기 위한 변수
    assign  out = {hexa[3:0],hexb[3:0],hexc[3:0],hexd[3:0]};                        // 출력하고자 하는 수를 전달하기 위한 변수
    
    initial begin                                                                   // hexa를 초기화
        PS=S0;
         hexa<=4'b0000;
         hexb<=4'b0000;
         hexc<=4'b0000;
         hexd<=4'b0000; 
    end
    
    always@(posedge clk, posedge rst) begin                                        // clock과 rst의 상승에지에서 trigger
        if (rst) begin    
  
        PS<=S0;
        end                                                         // rst가 1일 경우 초기 상태로 초기화
        else        PS<=NS;                                                         // PS를 다음 state로 변경해 줌
   end
   
   always@ (*) begin                                                     // PS별 동작 정의
        Reg_rst=0;    count=0;                                          // 변수 초기화
        case(PS)
            S0 : if(start) begin                                        // S0 에서 start가 1일 때
                  count=1;                                              // count 1로 숫자를 세도록 함
                                                 NS=S1;                 // 다음 state를 S1으로 설정
                 end
                 else begin
                  Reg_rst=1;                                            // Reg_rst를 1로 설정
                                                 NS=S0;                 // 다음 state를 S0로 설정
                 end 
            S1 : if(Reg_stop) begin                                     // S1에서 Reg_stop이 1일 때 
                                                 NS=S2;                 // 다음 state를 S2로 설정
                 end 
                 else begin 
                  count=1;                                              // count 1로 숫자를 세도록 함
                                                 NS=S1;                 // 다음 state를 S1으로 설정
                 end
            S2 : if(start && !Reg_stop) begin                           // S2에서 start가 1이고 Reg_stop가 0일 때
                  count=1;                                              // count 1로 숫자를 세도록 함
                                                 NS=S1;                 // 다음 state를 S1으로 설정
                 end
                 else begin
                                                 NS=S2;                 // 이외의 경우는 다음 state를 S2로 설정
                 end      
       default : begin                                                  // 예상하지 못한 state가 발생하는 경우 초기화
                  Reg_rst=1;
                                                 NS=S0;                 // 다음 state를 S0로 설정            
                 end 
        endcase                              
   end 
    
    always @(posedge clk) begin                     // clk가 상승 에지일 때
        if(Reg_rst) begin                           // Reg_rst가 1이면
         hexa<=4'b0000;                             // hexa,b, c, d를 0으로 초기화
         hexb<=4'b0000;
         hexc<=4'b0000;
         hexd<=4'b0000;        
        end 
        if(count) begin                             // count가 1이면
         hexd<=hexd+1'b1;                           // 0.01초 증가
             if(hexd==4'd9) begin                   // 0.1초마다 
              hexd<=4'b0;                           // xx,x0으로 초기화
              hexc<=hexc+1'b1;                      // 0.1초 증가  
                 if(hexc==4'd9) begin                // 1초마다
                  hexc<=4'b0;                       // xx,00으로 초기화
                  hexb<=hexb+1'b1;                  // 1초 증가
                     if(hexb==4'd9) begin            // 10초마다    
                      hexb<=4'b0;                   // x0,00으로 초기화
                      hexa<=hexa+1'b1;              // 10초 증가
                     end
                 end  
             end        
        end 
    end 
     
endmodule
