`timescale 1ns / 1ps

module top_seg(
    input   clk_ref, rst, start, stop,                                              //input���� clk_ref, rst,en, up, down ����
    (*mark_debug=1*)output  [1:0]   seg_en,                                         // output���� 2bit seg_en ����
   (*mark_debug=1*)output  [6:0]   seg_ab,                                          // output���� seg_ab ����
   (*mark_debug=1*)output  [6:0]   seg_cd                                           // output���� seg_cd ����
    );
    
    wire    clk_125M = clk_ref;                                                      // wire Ÿ������ clk_125M ����, clk_125M = clk_ref 
    wire    clk_100M,clk_1M,clk_10K,clk_100;                                         // wire Ÿ������ clk_100M, clk_1M, clk_10k, clk_100 ����
    //wire    s_start, s_stop, d_start,d_stop;                                         // wire Ÿ������ s_start, s_stop, d_start,d_stop ����
    wire    [15:0] time_data;                                                       // wire Ÿ������ 16bit time_data ����
    wire    [3:0] hexa,hexb,hexc,hexd;                                               // wire Ÿ������ 4bit hexa,hexb,hexc,hexd ����
    wire    [6:0] sega,segb,segc,segd;                                               // wire Ÿ������ 7bit sega,segb,segc,segd ����
        
    clk_wiz_0        u0 (.clk_out1(clk_100M), .reset(rst), .clk_in1(clk_125M));        //clk_wiz_0�� �̿��� 100MHz ��ȣ clk_100M�� ����
    freq_div_100     f_d1 (clk_100M, rst, clk_1M);                                    //frequency Divider�� 1MHz ��ȣ clk_1M�� ����
    freq_div_100     f_d2 (clk_1M, rst, clk_10K);                                     //frequency Divider�� 10kHz ��ȣ clk_10K�� ����
    freq_div_100     f_d3 (clk_10K, rst, clk_100);                                    //frequency Divider�� 100Hz ��ȣ clk_100�� ����
    
    //synchronizer     s_c1 (.clk(clk_100),.async_in(start),.sync_out(s_start));                                    // synchronizer�� start, clk_100�� ����ȭ ���� s_start�� ����
    //synchronizer     s_c2 (.clk(clk_100),.async_in(stop),.sync_out(s_stop));                                      // synchronizer�� stop, clk_100�� ����ȭ ���� s_stop�� ����
    //    
    //debouncer        d_b1(.clk(clk_100),.noisy(s_start), .debounced(d_start));                                   //debouncer�� s_start��ȣ debounce�Ͽ� d_start�� ����
    //debouncer        d_b2 (.clk(clk_100),.noisy(s_stop), .debounced(d_stop));                                     //debouncer�� s_stop��ȣ debounce�Ͽ� d_stop�� ����
    
    timer timer1(.clk(clk_100), .rst(rst), .start(start), .stop(stop), .out(time_data));  // timer�� clk_100, rst, d_start, d_stop, time_data ����
    
    hex hex0(.hex(hexa), .seg(sega));                   // hex�� hexa, sega ����
    hex hex1(.hex(hexb), .seg(segb));                   // hex�� hexb, segb ����
    hex hex2(.hex(hexc), .seg(segc));                   // hex�� hexc, segc ����
    hex hex3(.hex(hexd), .seg(segd));                   // hex�� hexd, segd ����
    
    assign  {hexa,hexb,hexc,hexd}=time_data;            // time_data�� 4���� ������ hexa, hexb, hexc, hexd�� �Է�
    assign  seg_en=clk_1M ? 2'b11:2'b00;                // seg_en�� clk_1M���� ���� ����
    assign  seg_ab=clk_1M ? sega:segb;                  // seg_ab�� clk_1M���� ���� ����
    assign  seg_cd=clk_1M ? segc:segd;                  //  seg_cd�� clk_1M���� ���� ����
    
endmodule
