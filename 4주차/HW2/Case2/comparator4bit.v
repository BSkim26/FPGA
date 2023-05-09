`timescale 1ns / 1ps

module comparator4bit(      
    input [3:0] a, b,  // 4bit a, b를 input으로 선언한다.
    output reg a_big, b_big, equal  // a_big과 b_big, equal을 output으로 선언한다.
    );

    
    always @ (*)    // 어떠한 입력이 바뀌더라도 실행되도록 *을 인자로 받는 always 문을 선언한다.
    begin
        if (a == b) begin                       // a와 b 값이 서로 같으면 실행된다.
        a_big = 0;                      
        b_big = 0;
        equal = 1;                              // 같은 경우이므로 equal에 1을 넣고 나머지 output은 0으로 설정한다.
        end
        
        else if (a > b)  begin                  // a가 b보다 크면 실행된다.
        a_big = 1;  
        b_big = 0;  
        equal = 0;                              // a가 큰 경우이므로 a_big에 1을 넣고 나머지 output은 0으로 설정한다.
        end
        
        else if (a < b)  begin                  // a가 b보다 작으면 실행된다.
        a_big = 0;
        b_big = 1;
        equal = 0;                              //b가 큰 경우이므로 b_big에 1을 넣고 나머지 output은 0으로 설정한다
        end
  
        else begin                              // 어떠한 경우도 해당되지 않는 경우 실행된다.
        a_big <= 1'bx;  b_big <= 1'bx;  equal <= 1'bx;      //모든 output을 x로 설정한다.
        end
    end
    
endmodule

