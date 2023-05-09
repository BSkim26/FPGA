`timescale 1ns / 1ps

module hex2ssd(
    input [3:0] hex,        //입력된 수.
    output reg [6:0] seg   //수는 신호로 변환되어 출력된다.
    );
    
    always @(*)
    begin
        case(hex)
            4'd0 : seg = 7'h3f; //0 변환
            4'd1 : seg = 7'h06; //1 변환
            4'd2 : seg = 7'h5b; //2 변환 
            4'd3 : seg = 7'h4f; //3 변환
            4'd4 : seg = 7'h66; //4 변환
            4'd5 : seg = 7'h6d; //5 변환
            4'd6 : seg = 7'h7d; //6 변환
            4'd7 : seg = 7'h07; //7 변환
            4'd8 : seg = 7'h7f; //8 변환
            4'd9 : seg = 7'h6f; //9 변환
            4'd10: seg = 7'h77; //A 변환
            4'd11: seg = 7'h7C; //B 변환
            4'd12: seg = 7'h39; //C 변환
            4'd13: seg = 7'h5E; //D 변환
            4'd14: seg = 7'h79; //E 변환
            4'd15: seg = 7'h71; //F 변환
          default: seg = 7'h00; //default 
        endcase
    end
endmodule
