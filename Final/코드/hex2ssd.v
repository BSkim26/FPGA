`timescale 1ns / 1ps

module hex2ssd(
    input [3:0] hex,        //�Էµ� ��.
    output reg [6:0] seg   //���� ��ȣ�� ��ȯ�Ǿ� ��µȴ�.
    );
    
    always @(*)
    begin
        case(hex)
            4'd0 : seg = 7'h3f; //0 ��ȯ
            4'd1 : seg = 7'h06; //1 ��ȯ
            4'd2 : seg = 7'h5b; //2 ��ȯ 
            4'd3 : seg = 7'h4f; //3 ��ȯ
            4'd4 : seg = 7'h66; //4 ��ȯ
            4'd5 : seg = 7'h6d; //5 ��ȯ
            4'd6 : seg = 7'h7d; //6 ��ȯ
            4'd7 : seg = 7'h07; //7 ��ȯ
            4'd8 : seg = 7'h7f; //8 ��ȯ
            4'd9 : seg = 7'h6f; //9 ��ȯ
            4'd10: seg = 7'h77; //A ��ȯ
            4'd11: seg = 7'h7C; //B ��ȯ
            4'd12: seg = 7'h39; //C ��ȯ
            4'd13: seg = 7'h5E; //D ��ȯ
            4'd14: seg = 7'h79; //E ��ȯ
            4'd15: seg = 7'h71; //F ��ȯ
          default: seg = 7'h00; //default 
        endcase
    end
endmodule
