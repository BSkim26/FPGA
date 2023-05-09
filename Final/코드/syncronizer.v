`timescale 1ns / 1ps

module syncronizer(
    input clk,
    input async_in,
    output reg sync_out
    );
    
    reg Add_Result;
    
    always @(posedge clk)             //D Filp Flop���� clk�� �Է� ����ȭ
    begin
        Add_Result <= async_in;
        sync_out <= Add_Result;
    end
    
endmodule
