`timescale 1ns / 1ps

module freq_div_100(
    input       clk_ref,                            //input���� clk_ref,rst ����
    input       rst,
    output  reg clk_div                             //reg Ÿ������ output clk_div ����
    );
    
    reg [5:0] count;                                //reg Ÿ������ 6bit count ����
    
    always @ (posedge clk_ref or posedge rst)       //clk_ref�� ��� edge�� ��, rst�� ��� edge �� �� ���� �ڵ� ����
    begin
        if(rst)                                     //rst�� 1�� �� ���� �ڵ� ����
        begin
            count   <= 6'd0;                        //count�� 0���� ����
            clk_div <= 1'd0;                        //clk_div�� 0���� ����
        end
        else                                        //rst�� 0�� �� ���� �ڵ� ����
        begin
            if(count == 6'd49)                      //count�� 49�� ���
            begin
                count   <= 6'd0;                    //count = 0
                clk_div <= ~clk_div;                //clk_div ����
            end
            else                                    //count�� 49�� �ƴ� ���
            begin
                count <= count + 1'b1;              //count +1
            end
        end
    end
   
endmodule